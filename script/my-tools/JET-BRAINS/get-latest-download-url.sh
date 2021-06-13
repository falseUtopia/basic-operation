
#  Copyright (c) 2021. falseUtopia All rights reserved.
#  Licensed under BSD license
#
#  https://github.com/falseUtopia/basic-operation
#

#   支持的选项
#            allProductsPack: "ALL",
#            appcode: "AC",
#            clion: "CL",
#            dotcover: "DC",
#            dotcoverCommandLineTools: "DCCLT",
#            dotmemory: "DM",
#            dotmemoryUnit: "DMU",
#            dotmemoryCommandLineProfiler: "DMCLP",
#            dotpeek: "DPK",
#            dottrace: "DP",
#            dottraceCommandLineTools: "DPCLT",
#            dottraceProfilingSDK: "DPPS",
#            goland: "GO",
#            hub: "HB",
#            intellijIdea: "II",
#            intellijIdeaUltimate: "IIU",
#            intellijIdeaCommunity: "IIC",
#            intellijIdeaCommunityEducational: "IIE",
#            mps: "MPS",
#            mpsIntellijIdeaPlugin: "MPSIIP",
#            pycharm: "PC",
#            pycharmProfessional: "PCP",
#            pycharmCommunity: "PCC",
#            pycharmEdu: "PCE",
#            phpstorm: "PS",
#            rider: "RD",
#            rubymine: "RM",
#            resharper: "RS",
#            resharper_salesCode: "RS0",
#            resharperCommandLineTools: "RSCLT",
#            ReSharperCheckedBuilds: "RSCHB",
#            resharperCpp: "RC",
#            resharperUltimate: "RSU",
#            resharperUltimateRider: "RRR",
#            teamcity: "TC",
#            toolbox: "TBA",
#            webstorm: "WS",
#            youtrack: "YT",
#            youtrackStandAlone: "YTD",
#            youtrackInCloud: "YTI",
#            youtrackWorkflowEditor: "YTWE",
#            upsource: "US",
#            datagrip: "DG"

# 配合jq解析json， 这是jq的安装方式 > https://stedolan.github.io/jq/download/

curl -s 'https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&_=1623607052641' | jq '.IIU[0].downloads.linux.link'