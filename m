Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA548180D6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 06:11:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77C6E87;
	Tue, 19 Dec 2023 06:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77C6E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702962659;
	bh=rfVKHBQm+NtAm+6jwbUjqMj4uWupzXeiv73rWdaj9tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZzYdTJRAm+q3Xle2Ewt1IhAowUTXRU9W64NGe6IHmjou4S2fppGAlA7BQ1OHYAEtw
	 8vxvqAO/QPjMLWR2TftbhgMjbXRjynY0/ZI3E5rYLujbgTCmcYU2jMtKIb9aIT/t1X
	 cGN0z+mfkzvgCo7ERvMbEs5gYOGnUYyivHgfv71U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71FF7F80588; Tue, 19 Dec 2023 06:10:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C933F8056F;
	Tue, 19 Dec 2023 06:10:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEDA0F805A9; Tue, 19 Dec 2023 06:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CAADF80580
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 06:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CAADF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=klc03IGI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZ31f1UrTxemPCpxBUIr/CWG8Es+JGGeqAjMabU10s3HoTLvsl3+MPO0KzxSo0m0upKT8whrB+MUpAMjkY+Yfx6bBPYAk0xUU1EpBrUlM7PWt3OK6XCShHSfsZ0Y0zLUkR1b5MiOIN2xS7ExarsfD07XLFPkNIu77veZFkXJYmSH1fIR4QX6qmceW63eB/poFe0ZgX28xMNeywGb2MdnpaVuqB9J664cTHnYi2a8JTZJ/41qg6aSabI/tz4yeOnnUQAH8cBjcbLrNqVno0V4gY90e+3mvuVz+XxNetfufCDT5ar5O+MnRV/ldwgtK5l+K8P5dAws5cFFfQbgL+bY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox+x5ZO7KFS8nh3Ga+svuF7cigmX7JbnmkjgSHDqRB0=;
 b=nCn/rmpjMfoSToDhC6rdoIfmFa43682N3zqP1vQhHnWnrzX21+D0aXI0uOIEKbQGOjRI9zWw9ZtTZBSvBeBAA/4SHHGoCPU1aq7kas6CfNmfJC6wEp3LHuVmCY0INDbLEU9KVgbSNrI5YjPKItqpl+Z+N+FEq14IZV2PWSAsB8SuhhECjjc66Rm2ZvrofgN4fujjS0i4GKkD2JEKGgj4VXNH+P8YN4mR9n05gvW17NopzxbbW4mK/4qfYLWN9+S+5b2JnmEsT8JZxn6BeWhaj01Qcx2530X+lmrVhlficZqtN2ZgR5yeg1bPzSlYtjbF4fk8Z+idKQmmV7vVIEMgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ox+x5ZO7KFS8nh3Ga+svuF7cigmX7JbnmkjgSHDqRB0=;
 b=klc03IGIRNR2ZW4QlbekidWUb9Ryb9RApYQRBJM5HrDvPAw5q9bjvIWTdW26k/wG6PDM5uPJhgVaT0IZgb4AM1Oh8C81gNPpaAvB384TIRHMdFlyGspsYQrFHl7MBX0BiNU0tsvAOyQJvBmeB8BGVh/91BGhN78kJtWvRLR0uDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10094.jpnprd01.prod.outlook.com
 (2603:1096:400:1dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Tue, 19 Dec
 2023 05:10:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::6d8e:5f2:f206:6fd4%7]) with mapi id 15.20.7113.016; Tue, 19 Dec 2023
 05:10:02 +0000
Message-ID: <875y0u93rq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/5] ASoC: samsung: odroid: don't need DUMMY Platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Dec 2023 05:10:02 +0000
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1ceac4-bf49-40bd-c64f-08dc0050c175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w1ksoLap0PPbDiDNDRkQ18gKFzLpp3L81riqi/nhsRinbkJvW6ZKDsqw9IXgmuj7mhk/ne6D4QkGRMjYy4Fw5JhLXqSpZWgtHR2n02+wP5FcJpo8at2XDUHkI3AxLpEdjekanCginIz4BpYO/7iX7JSMk3YVZ6PIEsM56EXcRq+4yYwMPNsEsADpN92qKRfljVCuHgC2UKNvpDnOhf4dFJxPQvLesuIFypuSCUDXRaH0von97WYbrEW93cQ40WBhppsLEtQSjiWeRKuKnNBofHq/cZe/xLWK+FTaHNvafrg6HgQo02ovwUUPvH4I2hNFNupDPdszFrrIF5RDxkcaAeFgn7sLZJCSHd+0eLAnXKQYMdRPJ7bWTs++B0wPpqIl+z2q+ayK7qr+Bt33gaNZXQRQNO1lnLf1Sggh4C6CtMIBBwUL/vcGVGgpqtiVf/m9BfviPsWRoMUAdt4OraAgUhZ3AV4urYlOhpw5pRxUdgwr5kglGE6+cNKb0c7TWMV777zR18S3CK1BCRrrckL9H1Jif9FRxInTzcltsbh/Z+TsMQbn3ZqmrZFrFPAjhfYgFVDuJwM9vgAH6DDTT19XZ5IoJwhiLRkIO2jXVpwExdP53hmygtpThD2AXqi4U1gQ/l3ZbseXlO0fPMGk10NE8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66556008)(36756003)(66946007)(110136005)(66476007)(54906003)(316002)(2616005)(26005)(6512007)(6506007)(478600001)(38350700005)(41300700001)(6486002)(921008)(8676002)(7416002)(8936002)(5660300002)(2906002)(4744005)(52116002)(86362001)(38100700002)(4326008)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tu7Y9D6cfDJIdVOUdr7dLO2pXA7NocXJjQ+aAFgHoEGDPxd9v/xF1AbUbSzZ?=
 =?us-ascii?Q?LmKBOGs/BWmKLyMuUC5v5wpA7CcLPK7OVfC0iEpLDJjQoWeX4xg+Y0Bu5VLx?=
 =?us-ascii?Q?fbEkdmQeuwzZgIQofqOE8sFZ7AZTs9bJdqv0pheLbG4xHConUp0GtnxhZk5k?=
 =?us-ascii?Q?bQpscsanzMU8AXzQWwhBHrY+jY+KHCMpEMWrulxXkkNcScgm90yxeKorO/FF?=
 =?us-ascii?Q?LKtvLQVUBwftfeKnvu1Xhzo0jR0++CorPwC9lFRklYBu3DavRmXo94DZsFMW?=
 =?us-ascii?Q?oC5u9eG61ifJhvvc/vaiAJzLFt5JgMsuhWNK3+/2EkwG1XLSvuR6y5YBGBAa?=
 =?us-ascii?Q?FAH1ZOLNrhWq5IhjLGpo9s29LH0f2OXp2cM77rq0wC88HYsNxChxsZ/G6RT7?=
 =?us-ascii?Q?Ke0NxWOH0ZYFbD8kmo4XVzv71vw0ypZLDHKJWw9H5G13zRBAKv2DhsZyvX27?=
 =?us-ascii?Q?cd0p5kUMsZNW3U+uZlh67A8RQtj1LrzmhniZnj444wJnzRmwOP1oebsD/UmD?=
 =?us-ascii?Q?2UvWo23bHzg631XFdx2lNh1qLYjmF8c2OpzAK0XfTVIyUP84sDOjN7saMTVR?=
 =?us-ascii?Q?hh/tASmrQQBFgGrNxGVBLLeDy0AIoLCdHbg41K+mBKIdiX2xlkcVBAavlguB?=
 =?us-ascii?Q?OI/yz6Pcby188kLnA7M1H/mCUVDGBMAZaVCEmAKtuPEDIXPROJFcYBoxSC6M?=
 =?us-ascii?Q?ThAdK6N0qkMI+qIFbc1z9hMO4/sP6ba+u/o9g4kQjjyshV/Mf3uQOBjY5dAN?=
 =?us-ascii?Q?40WPAK+Sws5UrLve3cXwn4Qp9eRJNVE5mp4QDtr/rZuzHXrvbW4j5Lu6zHmA?=
 =?us-ascii?Q?Kr64U2WGEmH07MCn2UGq8xUgELvN25llIjy2CfEoSu/FcJMDrHis7z+kXIC1?=
 =?us-ascii?Q?20VtRlyZBHdO6WM4F7wuR6Em+HTDl8NEt7wydTBGafNmNcGK8F6/VJRzz7U3?=
 =?us-ascii?Q?2KqsbclWKumlbqQXU8LimyejJVRps0AoApwlcaW3pQn1A+BD+ax0Vjeht1cU?=
 =?us-ascii?Q?1RXYILzImgAtD9sQhWlmXyLEucgsmPeAEKNVZGMbEt8vmIQJ3KH1tYrxZweO?=
 =?us-ascii?Q?swS40xmzFeleCnzq77dmXT30nhtLK8OzgjLi0xJZbL83LcXFuyoq/Hu5Cb0p?=
 =?us-ascii?Q?VW2s++S5zAom7ij54tGeKjmZqIDYnz8AbSbk+lpmzDgoXCF05PRLIBRwIjBm?=
 =?us-ascii?Q?fvmAadFzBiwsomxkSH7Htcjlu1jBo5pMMvKUwQMMJ3c3DOag8tM0j83PpSBs?=
 =?us-ascii?Q?5FXD09SIQ5YvvRkIL/7ske5SSheXp3yIGM6yNltVgJVx7Re4TpkdNTd2QkAB?=
 =?us-ascii?Q?FA9Bset9En64zrV8pnaOl6w2XbCm4p8hHD63P9/g0Kod/OQHubpbzd1LQSNe?=
 =?us-ascii?Q?zdVcQGQ7TfuTkW9yBIWBYLAAEuJRLiC8N3hFT/Wi+1c1vfFBDoqMvhe4BJxZ?=
 =?us-ascii?Q?sT/3u60fx4OX/jkK0sCU1lWfRP6KKY0QLImsbQlObq9aH6hruukXv+7brh9t?=
 =?us-ascii?Q?SaHOp3fTU8MF0Jb/j8Gi88HZqtTSqWqM4Pc0AEDQibtVylJ9xD/Ni8ILfAdj?=
 =?us-ascii?Q?tdXJm7Whb43DVFYOHpr5ISz/qeRjcDXbyzCS9mWFrdJ4HX9Rw6mXBXagvnbF?=
 =?us-ascii?Q?Y2lrK76d3CXL+wkrAmQBesA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb1ceac4-bf49-40bd-c64f-08dc0050c175
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 05:10:02.4083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mw9/0dn8Zj3vCkuSRCYN6PC7L5OxgZLxTqg0mfgAeleKQ+A6bSeaknLjA0I4F3LysMtq8VY/jQAtIVVbfEusp84Om9LTVB0ZyElqhK0SiOA33PRdZyTz/aRdbmZMCcrF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10094
Message-ID-Hash: PR5SPGBGV55HR765ZSLP4UZO3KENSEZA
X-Message-ID-Hash: PR5SPGBGV55HR765ZSLP4UZO3KENSEZA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PR5SPGBGV55HR765ZSLP4UZO3KENSEZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use SND_SOC_DAILINK_REG() with 2 parameter.
DUMMY Platform is not needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/odroid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e95f3d3f0401..110ae14dd7ea 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -157,8 +157,7 @@ SND_SOC_DAILINK_DEFS(primary,
 
 SND_SOC_DAILINK_DEFS(mixer,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()));
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(secondary,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-- 
2.25.1

