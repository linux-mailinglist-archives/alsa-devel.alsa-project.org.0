Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852E6143E1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 05:22:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4B32168B;
	Tue,  1 Nov 2022 05:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4B32168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667276546;
	bh=hVijTB5nhfh0/vFR/TvCliVvP2qTpSClUH7YgqBrzSE=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aHxwXwemikSNvyQfo71Y1Mhaam51KvHCmwxekgmcVHkvLh/wc22/9yJtTdU9SGAdP
	 +9SU17+1E6tE1go+3mT0etCV7UizAFMjYSyYaMqN0Yda4+X6X2MtW1B2UqzML+BAT1
	 clnrS8SReNoMmu39eyn8MF2zZRMxDvhcn6e/+Z7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBA8F80249;
	Tue,  1 Nov 2022 05:21:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 408C3F80423; Tue,  1 Nov 2022 05:21:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7854F80249
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 05:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7854F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="mEvFzIsL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjrkgVyZkVEC/MDaJ8Fs6BpWS9Vm39OKsOHVyVw91ry6sX/uZvyvgiqLAHTpyz2/c/fHRJwOyT72/BfM+v/cT5znsIbiM68+SxzBck2lB5GO6EFG7jxXbHKc8gqKjvrT6P8Gcd+w4GBXHEBlLD8TK56LiIDinY20JnnskNP699ivABpvfwbisk/e0gKm9nD8DmAGaNv1gH3ZX9r0JExNRZhkootSzeORBC//LTdAYormdD9B0Ca5wpNnq/2kA3AhSmCfitbwk+3JQb5n0mghAwUzJs/LcrspX9OQnMIzJiVM9RkTD24R0esiCFkOvPtBgc2wk/5iZIGK6Dyptzw4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwG3ErrEiRoF1o7nlpTjtgI4mINthQbmzJIqYZwgaH4=;
 b=FZtFH7HKQ5O9WtlAAITu+YDkuK4mr+Ay+Bvf7pFtbIHEYCtAn8TMloWFYV+OctXp81BOqmo/YD5U3BP1ygPmqQSS/m/5acgzAFOXZPiWYZjDfn88D5VY5yKxk0XxqT7OewOVGSAydd1AGBI2sz18z4ffkjnI8R5oIVK+yp6jiYRQDMBeQWK5TjQBsPXyEXI4BJpnSnguadG/hzLr6NzEq0WRADNm6L/zuk0DHPZ+1u2/USrb2R1ml6qld+j3PCXEcC3Dh78luMgGIkNAPjyRXOToBwcY/+3osrA2Q0kx0vyYZgL6s60x2ORaT3ccYwulR7Z+hMsqmtLvCuP5iiPuKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IwG3ErrEiRoF1o7nlpTjtgI4mINthQbmzJIqYZwgaH4=;
 b=mEvFzIsLpUzwilSLj7XM/4lhOnU+qSKci7l4A5pRzmu5BqGdIzCqXGMr0vgx5fzD5ZQIQDecDiNw8F2uRcTHxZCyoyAR48od6/5gcS74UrdnYeo9YGCZfPSk/9CLqLnzCKHRZ0lapC1z6w6U1Nsus7bsJgcU5d1UYZ8E+Q8D80s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10885.jpnprd01.prod.outlook.com (2603:1096:400:2a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 04:21:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::851d:9051:287:bac1%6]) with mapi id 15.20.5769.018; Tue, 1 Nov 2022
 04:21:19 +0000
Message-ID: <875yfz8fuq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: simpe-card/audio-graph fixups
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Nov 2022 04:21:18 +0000
X-ClientProxiedBy: TY2PR0101CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::24) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10885:EE_
X-MS-Office365-Filtering-Correlation-Id: 86fc7e76-4fb9-4253-9b80-08dabbc0862c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3j7rgOSAE3L/EM7fnlPRgWtlsCMudx2IKJ7Uk8NwYq+tw4Vrbhg4DMT2STQ90Qpoj+8SOJaLcjispZvaJMPJ65ZHxYi7R3RKuk2A6Qw+w1ZRkkOxcBaSc0IOGh76JrKMHmab4Vw9f7IrzgTSz5yI8w7kwPiiI35OKeriV8I1Vdg/MbtuzFSUgFcWLkfJ8gewlPAbMFvZQYnsjhP3zw6vEI0LAfw+o9U0PQcdyreFWmse14JJX01v9UT9ObQnuifsH/pbO+Wa+vEIdCwcB+BJ7fqgW6wREMV/5vLLldr84bq89DF38eRQT1ds2WSoxpRWza+mEmVFvpqfzoEJueoDxc1DlxNn2Opb5aE16rc77voerAtkT+dQyPnr++m6PlsIlCv4keL3B7Je9+Oib8WoLxfRqKboeBw/XXCZgAeoFbJXXKTv6ZnzJr7Za53ufuVounEKiqd5/XyCJB166abulOM9npaQMPwOQY0t6YTsJEiKUoIAXKBU9n3K1YcHQBAdhnvXaawN3uB0legtJaEktrHL9vJh4ZfxzXJLC9TPiblfEZOWQtvpuI46VYSAWvK3f9IWq4y4EONmiTE1K8aYrykATyoqj44aWoyaVApHo/ZYeXoeodp92EnC9Dmg+00cH8SEUSMR7t8HDNNIqKeMCHYgW6MVPpuBv3jqyU+2XB4idBWOJTrmxCQ1HwUm9/G8uq2PObt31pzOfklrg9sSGNcKu74qFGhnpbYWBtj5FkL8DtTCGMAj2Fp7J+NZqw2Oh5JTEgojk5JuCvDmH/stk3CUyJqBpceH17BkonsJd8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(38350700002)(2906002)(38100700002)(86362001)(41300700001)(6506007)(52116002)(8936002)(26005)(8676002)(6512007)(66556008)(66476007)(4326008)(478600001)(6486002)(4744005)(66946007)(83380400001)(186003)(5660300002)(2616005)(6916009)(316002)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4twa7hwF4LeBskRO4Lo8L2pMwLLTViW5SsWejy9ZLopq6QnwLTL36hYCL8+Y?=
 =?us-ascii?Q?eU0N3t8gzH2ccqQ4gbFVsjTd1mu6R/j5dU/D4XX7yIzQ4PecmB6sceM3cHyE?=
 =?us-ascii?Q?+CGPMP0xh+oA9zot0g72Gbfa87ZJSG5fyG//PKZ8vJsZcXlaED1y/ANNmCYX?=
 =?us-ascii?Q?/+JOzYeC7nvsi0V7APm70omaIE4rsaIQFd0jiJj4GmRULZLeuAhgmWV11l1Q?=
 =?us-ascii?Q?OR5akxlksHJaSBqE3ZSXv8yXBrF3q6nmMB3jvuZl6k1Wid/HVPyRZGlwNKwM?=
 =?us-ascii?Q?plfDDk4UabiXszEALsrUF3/pwEw/x1ld4onZGLwgIlSW6eq1eg42wGFNFaor?=
 =?us-ascii?Q?XjnPOPIdai864J1VA5FlwdANdAU1PJ763dPWZot6Vlq+6PZBS+HL2GMLNggd?=
 =?us-ascii?Q?56wal2I5G9YjOzEvhnX12AetbZcm4Alw6jbCIy9XHhKR00bIM1ozzYrP6Pjo?=
 =?us-ascii?Q?wVY6f9H7FXfNbtBqs8ixU8Cm2w9nrVjCIkCs2/uu+LWG2ztCxfdK/nv4mjmn?=
 =?us-ascii?Q?iRsMODJuucMkoV5eVDnKXMwmhIebLnP2j3Ivb6Ed2VsEUeqTvFde1abFb4+d?=
 =?us-ascii?Q?76eWdrpnsVdMQIcDPyCPyAftK1yTjmDQJX0qniLBlA79T+XDrpEUyMYrAmLR?=
 =?us-ascii?Q?K1vOOeNcOr+8xfOBzqqadQxUotGt1seeAviq4vbBzl9w3jYs/oEDXNIA+TxC?=
 =?us-ascii?Q?Lavd9Bb6X6U2/nvsr7EeAWangYTafA23+EGzkEpd90mPme1MBOS+Mt1AQJJZ?=
 =?us-ascii?Q?Wwd0xjaSdd4OM+PkSnK5fWRFFFassRUv5HAP09/zjHdHn0Om6+eOVrU8gyoa?=
 =?us-ascii?Q?ielysanIQMRdrFXTAYFHVLMwYhi3gV1fbLBFd8P92CJq0lj5OJKQj0WfNHiR?=
 =?us-ascii?Q?1Ivgbp69qy3TZQonVKIkns2poaVfOx4eEekNT1tJ6F6SNUPVvSIrSk7euRrJ?=
 =?us-ascii?Q?+/X8xMqfqHP867sssJo85pTy8pl+FPg8/W59B/AVp2OB7hRY7H4slMJ1B1i/?=
 =?us-ascii?Q?ff0CBL+fSVIKkzBC4ZduBwpOIwKRIj71PUgFOIwUp3wyO7yuj+1JFiFuUsCQ?=
 =?us-ascii?Q?MOIMnFDUR0xCXVZQ+CN1jgkVDNH0tItikrDxmbkOjk6OwTnRuVVc20lFizuI?=
 =?us-ascii?Q?8yXULMDX1fZy2WDIDFopVXG5EFJG3rA3NVZjI0bQuAqYBu2icckSc8pFBIYO?=
 =?us-ascii?Q?hrPNzhgrXtIYKwcA4FDlgB15DeM3NeTFCZ3rHlP35O6e0cJBTSIHkwB9U9AG?=
 =?us-ascii?Q?pmvEMErge6BpLp5BKvfFojyyKRJskffDmVjLUYsfIDGXKlZ2QGP2Gh9zva+P?=
 =?us-ascii?Q?9v0+cLQfMOznh6EMVwsmskJf/oeYite4PMlHqVIk8OmU1qApCswGPSy9K+cL?=
 =?us-ascii?Q?BwZjp+S1IMmmCTQNUBlilaT9WinbCXRC7b1gLxxYTW9Z/eXuk/hGV+jmt20L?=
 =?us-ascii?Q?CXC3AcI7RZpAoT5EXylQHJn37nwIe8VUUzZaD6TwSK2BBENkTq3z95mdGvVB?=
 =?us-ascii?Q?UGtRnEb6s2NRLxxzZEFqXS+vvVYLLnuwiqv8qs2Y/18GGyFnuDYSLA0E0uWG?=
 =?us-ascii?Q?tEpUNzcKPzqVe2m3RVIhN1Ipn2TrQqRDyjKqFCPB930lRS8/P+Mtk8epyi4y?=
 =?us-ascii?Q?PVKGI79PQH54jQOaiAz+nqE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86fc7e76-4fb9-4253-9b80-08dabbc0862c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 04:21:19.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp4iQCvBbKFGTJFNtEBl1pliNIfcxyBS0mnRicAt/FIUBMUqzfNSAOhJjn/fLha6vbU0HB/FPp5fan030pJ3Wb5c++qHbxlRnZAC4vUrqW2ZvcebIH8ZJK7CzAUhDGum
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10885
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

These are simpe-card/audio-graph fixup patches.

Kuninori Morimoto (3):
  ASoC: simple-card-utils: remove asoc_simple_convert_fixup()
  ASoC: audio-graph-card2-custom-sample.dtsi: add convert-rate for DPCM (MIXer)
  ASoC: audio-graph-card2: check also dpcm node for convert-xxx

 include/sound/simple_card_utils.h             |  2 --
 .../audio-graph-card2-custom-sample.dtsi      | 10 ++++--
 sound/soc/generic/audio-graph-card2.c         |  3 +-
 sound/soc/generic/simple-card-utils.c         | 35 +++++++------------
 4 files changed, 23 insertions(+), 27 deletions(-)

-- 
2.25.1

Thank you for your help !!

Best regards
---
Kuninori Morimoto
