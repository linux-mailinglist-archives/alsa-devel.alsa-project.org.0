Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9E4562ACE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 060BB84C;
	Fri,  1 Jul 2022 07:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 060BB84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652747;
	bh=yy+03c0W3MrnRyUK6Ld9Etm22RFTlAdTYGXyF6FVm0U=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Elmt8reanc8BBTAVaXXpj7CaavzHD3mL6gIT4NvBmk2YVTiZZS/epxzTxb+enyqMW
	 pls00eT9LEIKeQoAoTkCLAHCXMoGyb1FTkURSWCT5cGuK95hChe7PUv7pPSf5/ZpD+
	 Fa5FCHKXD6X7uoo8Z8TDcmGPbNkUTeg9bdLHPBvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72339F80256;
	Fri,  1 Jul 2022 07:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5298EF80155; Fri,  1 Jul 2022 07:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB943F80107
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB943F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="jQXqY2z0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5d7VvKSkPffrfSsftgXJUhukkds/O/GyX7ZB902e660ZzJb3DeNS4wJE6hTttvTZ5ECfmBaavw65jcnTSOIJ5Mb4XSqxPy53MXaDlCgvNhuF9oro0Fiv/d2tzJ1Yc9eTtXZ10cvvP7adosNXothP57gZhcW/2Jc2+HiX0MxfnFpK0YdVu+CpXI3Bi4GPR15eG38OqsJF4i6PYa6rjrUX4ppPoaRfus3ov+Ncru6pvyyEptEGbLcFRQ12qvdHSZqN0GOR6EieD2AKvRdbKjDSqFkgwbH+L/JgPUfaL0zlkuTw31c8Ts0HoYHPClpXIeqsUQ3AAtb/HKERqpPbr1cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49aNHrSpcqVvmP+Yp8NGtT3Spxe7l5dbivMNAIrs5Jc=;
 b=TrXpQF7tCxHAJsHOxuegkigzreimWBjboHEt+l4pLc+j9ASPXuwXavcB64/znsB9Q2Zs0jEZDELW+vuIhM5J8FHCjVnY1JuGUh3Ic3TgQbdCtvlbCNx+OIVqpnjNLHuDit34Dzlr2cZ7JCRHK0f54DNcPuDGk4gRpE1kGHhN3yabYigLYNZ408kNVP3tKXen2M4xAnnj2fyGEfcBoWjOLJu2F/mFQOzIcxlQ23SLYtDq5rW9ra86ku5yUYtJV7j4ITVE6Zxe1wI8W4idxmYs4dpx35Cnw6K225ZFDjVYKX+DUJBj+dGzMVrsfojvBkND/7v+KYfaEdymwDK+4fArNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49aNHrSpcqVvmP+Yp8NGtT3Spxe7l5dbivMNAIrs5Jc=;
 b=jQXqY2z0itntIUiPs9830Me6dnEBINaVAG8NDw0pm9QM9/2LlL2eJF0dLjBomkr87bC94W+nd0TSf+ePqipK52f5/2WThZbKvS3vpBwrokO0RRxxlV4ptZSOp10EDYh2+u9n7zJ6LfTplkLMUlBIoIrhlQfHgonb6e63/wbL+QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8838.jpnprd01.prod.outlook.com (2603:1096:400:17c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 05:17:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:17:53 +0000
Message-ID: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] ASoC: audio-graph-card2.c: make Codec2Codec settings
 optional
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:17:51 +0000
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a236bd22-2149-49e5-d023-08da5b210bd3
X-MS-TrafficTypeDiagnostic: TYWPR01MB8838:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGJJD1t3hWNRZ8/oRuQcSvDLRjwMhS6WtRLLhlav7jIJ577ZhmkP4BxstqV0XUFljFJL0iTXxSpMjjVEuqBeIu0LuNdMyM5ojwhKh+brMSS4NeUFoHH0v3zDgulqm7evxXaXvWmUYQvx9XqUeWb0No3QghaBeMjMnn5hnYi2mVh7enqaOyokdIRU5XXuKil4GiuliWTtQ8oAJISBx9ntOWtEpps9NZXFAOgTZAqZ72K1THy3kiT7PBKj6nGv20epwXDwDpN7DBcpSbJSdsRAkXXVF1no5qlfe9O1qLNFK8xSClF5BBx2Cv+3+a/ixPO1Ej8HnFThH19wxYyXHKhxeUeNLvXUgC0yOec9hEH/eKPF0xF/Qbft6Gy4UHOOP/2dppBc4Cqgkq1kO7zTNyYMfjTRNotV7NkLy/F6Epa3hfGTCDFYcQAyr+SxROnZXQ8rW8ADBQWY04GGONIHJBJ9d0uvholZFxL6dj9w8wbj9GjU92wq/CS18hnZdNWYzIhxHmh1nct71UWvJbCo1fm33ot42ftzRG7XYEY1nqFTNsnzQB9U2XR+1xsW6SG5VmJoI0Co2FVRR0fm2BmhARH8iDwmio7nBszWgRLwvj2oHQsM35A6y/5OxkcbTAv1DdIe4uAfZQY/AUYoxu2WzXfospMHt7RqHXfvIXMc4VsjitgLqpMNR9nb1bdVekWmQwq6/o3XN5tyVfUheiFzD+25cQci4YMxCL/7dvY5bJzX4glCT6FiPc71nvRytUDPM5OVhWtP4ebXHRN59nWTfsDMNZRq5s1To75AVBx6ANm9LpuQGTkGuVwRztmXAFI1llRV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(186003)(2616005)(2906002)(6486002)(478600001)(83380400001)(36756003)(8936002)(26005)(5660300002)(6916009)(316002)(66476007)(6512007)(38350700002)(8676002)(66946007)(38100700002)(86362001)(4326008)(66556008)(41300700001)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7ZO2tzPTF8BMLkyG0i1/GN1JYT+HIszUHF3CSqeB6cxsDX0d3UNyHB2InGR?=
 =?us-ascii?Q?jkWvmR5ia3GTKel8NYrqBf7EHMBRsWKFkmUFXFSY329ccmQL08khiOjkHWk2?=
 =?us-ascii?Q?tWt5uYpeKhLIx/2fVKihwEsOWHZj66+oT9M88CNfT1qfs3Tz2+JE/5+yCJMF?=
 =?us-ascii?Q?vHfJY93Tk6zN6/Y4iY2ictqAwysy8ZmbeLSdQsk88VJO9SOlHnnPmC0fE9VW?=
 =?us-ascii?Q?V4264uq6GxdHImcH7IIgtHLus2E9YQKiKd/AZmEXZb5NYFId0wuFYb9F15Jv?=
 =?us-ascii?Q?SKgDTbSAOYZBol18qqwEfe+nO5nN0dzb2u2h2hR5cPv05DjdqNrMMOBs1hj4?=
 =?us-ascii?Q?2GzQPaHG9kWvYMEciZpuOA/InesLaC4siDY4XXNzysNXLlyAHEX2ORJZ61lq?=
 =?us-ascii?Q?f/P17uuo+8tKeP2TDwa+HTzH9bJB+JuASsfpjo/bIdINWJkEfPnVR+z6C5pQ?=
 =?us-ascii?Q?WNZOb+GamnMMmaeF4yv+pO4cUl2pYJCoGQP9BfWhx/zO8C7wkbJxqYs/7+SJ?=
 =?us-ascii?Q?6Wi/tjDal+Sno2CspAg5gukQia0vOChFOIGhVMXzrSMv57Mpm+2Vyau1oPXx?=
 =?us-ascii?Q?NKqH8EFwZk864q+RnAn6TwAPdaiGZ5UoVorbZJgFRenUEjchEDh3Dj4DDXEg?=
 =?us-ascii?Q?p8KVUxCtJB2p2/PO8YKWsG+5kq9PS5lWpkMXwwwvwt+XdcApxOdxSgd7eM+v?=
 =?us-ascii?Q?cj9ogzFyNogJRRQcMkqdLmzzHRwxPN5CFpAqO+n6SirPq9Mxc/gk/ixvln8+?=
 =?us-ascii?Q?arOJzSnRImnFs4C9CW3PArKyxF4vYrXe94ffqVyo/nyWNkM5GgmSCJTiHUOO?=
 =?us-ascii?Q?ns5gLBcaWQ8JyB48jtJVpf/NxN7Xk3u4rmVpYY4eFbMJQTYLpI+9YL+4RVmK?=
 =?us-ascii?Q?4zIN73J1CfDT8cFhZFQIP6V6qeUurrhKlgrD3lUMBeRYr/qLiJugsrOKTF+t?=
 =?us-ascii?Q?hLKU1tquBOn07LxFaLZgl82MOI3a6VUIwnJ9Rt9Xoy8xVyy74I9q8lx2k0wa?=
 =?us-ascii?Q?8emGwnpVPnci6H0OKtP80+MEHkWtpsCtswEgmCCLro04yqPjzVorSic7AqQp?=
 =?us-ascii?Q?h51HxWX6XQzFR++ZLOLJIoexWvwHRA/ZbyDZoTnHKz0Nb0zRYeux3hVMG01x?=
 =?us-ascii?Q?oIjapy+CCEU4PKPny6h21qi+nj8IHTSplggTLv4Tr7T9Xgl/qerUMP9a+Bcn?=
 =?us-ascii?Q?IeUIifm9PsKmx0ApSP8QTHL35x0TagODNMgHJgsq3Y1Lx1jim2gcUCTdX6Mc?=
 =?us-ascii?Q?sR/YD4FdYo1qpItq2P5rb8AMLcgf8fMQBAxeYZFtidp735nrxYdMrSGasTFi?=
 =?us-ascii?Q?Y+8j0nbq+2zkjU++Ss2LVtArmmt1SGAQXBQ5YF0sXNdrHAnyMxljpXrLD6h9?=
 =?us-ascii?Q?u05cMliou5LrEa2bBEmQlTOfFvIoaTHGY4tcBUp7oYXkC/aRqQbYb0e6S1W6?=
 =?us-ascii?Q?MIELS54bmptbshbDuwHOIM6UShC/GdvrYqlPoQkcKMJMDx1Dr7AW93gp4y4l?=
 =?us-ascii?Q?ymblpRkyBaTRkb7VRfY8Qu/ScwDuLYcDMuCZRCZ8ptr1mTaLcFYTVBflbVL3?=
 =?us-ascii?Q?DRwrC8cAQu8shQSr5/COyaTKbOZR892EtVpzXI5XV5LQr2/mRH6YfyzxPtng?=
 =?us-ascii?Q?MTQvpD5aUkS1jhVCawHNyYc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a236bd22-2149-49e5-d023-08da5b210bd3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:17:53.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lrmt4bjhwBhhD4SYSwA5HAd0bJBSaQdDt5sTBlaWsPAJvbsYt1ozJOWXYQNNCdMu69Be3f+Vr3DVHahZB0wuiWg4EJAesrWPgpZSZld7snker8EFcy/ACUTd79t1blwb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8838
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

Audio Graph Card2 has Codec2Codec support, but I noticed
 - Current Codec2Codec setting value is not correct
   because it is using of_get_property().
 - simple-card-utils has default Codec2Codec settings
   and it is overwriting Card2 settings
 - This default settings works for non Codec2Codec case
   (= DPCM::BE case) too.

This patch-set solve these issues.

Kuninori Morimoto (6):
  ASoC: audio-graph-card2.c: use of_property_read_u32() for rate
  ASoC: audio-graph-card2.c: make Codec2Codec settings optional
  ASoC: audio-graph-card2.c: remove pre-alloced Codec2Codec space
  ASoC: audio-graph-card2-custom-sample.dtsi: add verbose explanation
  ASoC: simple-card-utils.c: ignore Codec2Codec setting if it already have
  ASoC: simple-card-utils.c: care Codec2Codec vs DPCM:BE

 include/sound/simple_card_utils.h             |   3 -
 .../audio-graph-card2-custom-sample.dtsi      | 101 ++++++++++++++++--
 sound/soc/generic/audio-graph-card2.c         |  39 ++++---
 sound/soc/generic/simple-card-utils.c         |  26 ++---
 4 files changed, 126 insertions(+), 43 deletions(-)

-- 
2.25.1

