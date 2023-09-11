Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3279B213
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A008EE7C;
	Tue, 12 Sep 2023 01:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A008EE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476680;
	bh=7VG7C+owGqMZsuzQ2xwN5+ek1x5S0lS+o0vjdw4Bv+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JsbR/R4SUqIyPPsl/4KB9Bw+OWi5o77qxvoUmrMKRuNXY5FxvDPEFl9GWpxsB9Wfm
	 5k2K1anpAjKv6gcHwjF9jZWX+YaR39/DG34PLY3QQnkSXgJVGi8GVM9bEdGlNccKT4
	 iiVCu+O1BYiFio3+JRG47ZIjNkzz5Bo47X9A4AZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87DB2F806C6; Tue, 12 Sep 2023 01:52:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5480F806C3;
	Tue, 12 Sep 2023 01:52:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF8ADF80603; Tue, 12 Sep 2023 01:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CD71F8057F
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CD71F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=R5aG7bR1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2jE3InQ6xbd+cLulFArGXYTavDsR51g0ngdFXj0uRZj8qqMt00ZGNN7iqqXVdkUrmRK9PFttQKLKPmrBNjbqbHE1N26aShKdXyZeNLqrvwR6hroKAI/A7IOXOzMpsWIEEKJrydNB8sqGTOuxAeXG2O1VGCXDXxqMDThNoAbx1ZOJQrJ24t11jwsabOQ/jYURiAzswEpxohGtNWATjbg1BeYoced2IgCMUZnJ9OANbVrjygQGzLrP5iB1UHrIUMo724WnFceSgWSLcG1pNW+uPQxhcEQSrL5Abi+5bULwHZf3uAVUn/fRxrWlvVLy/rnDvGPERbYH7bxg18MdoV9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT6azurZlOhBxIy93FZ+Zjg/oC75TCXc//lc2adlE24=;
 b=hf+ZCoasrF+fWHjtJeubZuJi3dAFvCom31uEVfDOkTTK2mra5k8TR8y+zOX6KZXFKa949X/3+d+3J2OEpbRQSR5f7vczezFBvKd9hOAoh0XAiqbseOaZ4WCq8Fy1dP4vwspkxtTKFs/MsGhZQOXKh6C0X5VoXdTSPoTbJPhXXdZTfFLCycChAcvOc64QY9ZYfCh6V7EMU8MADYv8zRwM8pOzxbks71fU0FLGlr+t1FaLmig4tU60EJHLu9/fmShKz1FDLnkWkzvDaq9QKpI7OziIx+dmH/ANakyew8PNJVj4I/31pT324X6HDUbb+jjQNnzWKxLxhnU1smEzC6lkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT6azurZlOhBxIy93FZ+Zjg/oC75TCXc//lc2adlE24=;
 b=R5aG7bR15ivUQj3Z4U2wFGyFSLgF8bpHUce1dD7IRu28tw3leDHasiNSRTT5zndUpg7Tut9g+XhHZkGW0RXJgnwL8F0MEcr63k1phJ8oZQFb4AQzbaGB3xaWvHARQreELqSGeo5gpnaXk+YZqjXchcsEIoRIk6Itw9Df6D1qbWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:30 +0000
Message-ID: <874jk0qnga.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org
Subject: [PATCH 34/54] ASoC: soundwire: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:29 +0000
X-ClientProxiedBy: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cad44f7-0e0a-490b-d371-08dbb321e16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DdUepjM9FYhx1qIe2Ss4HUSmfuo++C8W+llogGfnATiT4H3LpQdjucJ2FIWW3EVnQGv/R+y7lVhgMeEP/TSMAPxwpW/XVwkPIb+7bCv2Zi6+8DvzfRNS8YXvd7UMgc5GytLHj9i4MWTMqlMWdDyClfvRsuHLmf0tKMETsKUy6Aivjt/1nf9eFBnzcEld4aoXdHFE/rXZZ1duJSpKCZRNyn7kxqhbog3hwL6K5wOhbWg6kjMjS4MeaBR+WjhDaVUgjUHHDRJOXkOv3aG+lWT9RZh6t/ZqBgYgmMqwazuPwvkvsUJcno+dhiy0Yb22y8g5wrJBAusIyQMy8kUZRRoqusZvTCcnGJv9QFRiR6PS2QarnrdhZHOxRbWIf4cIkq5RbhyedLQYaNfaTRir2dl4Yw2HLcV69yDa39A0/Gsd5j/K4h4QibZDH8zJuK2+omkV8k0JblVjmzQIdWqqOlYYZ3aOFcbGDuq6Q10dNyqIUd/EKbU6hLe/TI+7UHg72/tgguiG0zstAo+nuJFY9Jd513DGjiXm/25VMLax5XDjYOKWuPo6vQ0voFueVrQ0aCYmIhPwCXuSgoWQHYXaz9XmKLAkKIQqgqLxqmCKf8VMYXEVfRbTYVNTfVzSHC13e5Vm8raVFaXZrtimeFFO765X5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V9u7ZB3upbTYDiox0/2NhLGb8Pn4FfTkylhuLlfNl57PefOmj1+ysIpibKpl?=
 =?us-ascii?Q?2yPTqWSkDcM5XlNWj9QtDI56q4jwMlw3MBJ25JTnAWMwe9RTbl4A6n91LCIK?=
 =?us-ascii?Q?DykUuENKcp+w7qXAe1+9vDuvdGOLFZaiWQAqO94SC7H9mlXmbGZgJOq1HGtQ?=
 =?us-ascii?Q?mjTKX4f3bFD8CcJIyKH+yFfkzXJi7nkiE0dst4c0FXBXQdXuzeSHx4LDQiQh?=
 =?us-ascii?Q?toRMh7q0wAzHaEMIbzmeyv8G6YT4tZA3ImH6wHUY3rUx/9oAPV790WKpkRV6?=
 =?us-ascii?Q?CAGb+RM4sHZUnqCKI6zW6s7J/rvuMc4i36lj/l4CBOx45H5Mw7mGV1pfm6vR?=
 =?us-ascii?Q?LYUJvzLxZpauDxh6CjBoWADnyrsSHHf3F3ovHRcHOKWhf+X04YeUCthEKPuX?=
 =?us-ascii?Q?Fx6l0FolLNQb30SoEGBjDQ3AWmSGLUFDXUXuPSE1Js9fW8WYkF5JPRj9U78f?=
 =?us-ascii?Q?dPKxnyWXd8Zl4qpsg22fC9y6wmz34FzP+LGvc/H+SvQWXFIXlNuFC4v/KJGn?=
 =?us-ascii?Q?tn3HcRVGY9YEuc9R1/FgKL4kvbr5B5xakrW2EYtGo41boap7en0AwRG1iKI5?=
 =?us-ascii?Q?Z28XBqtyaAjzQCq8230Fi42bpkFM4+dvT/OIcCzgfOZ5ahve48b0ddTyyfFT?=
 =?us-ascii?Q?0xGb3AigTz8fO1Dnd8cBu7nSnU6vZOta3qxWi4lO0mmNmYDMhQ3R4ZOzc/Ip?=
 =?us-ascii?Q?ymNgP0qurmfCxDsdI6MSsKPk2SK9O2kmsOpiuJ4pQ3qJKCJ6yTywSoLG4Klr?=
 =?us-ascii?Q?Cg6wW1kGJMREJ8t6z/ojKBK7ZWVpDuEKuu44UNeyA3FTeNkJXDlzzgwCbjvy?=
 =?us-ascii?Q?Ve0Ih5f+ro1faQ/oPbAeemctTSx+i6jmdw+9DGr0rKwYjuhGYO33XDN1u8xr?=
 =?us-ascii?Q?jxBjgc7QtSXtiSr3CundDQWBqrjzioTnKvXnsRntRlX6yPfZfEIatpcYzmGt?=
 =?us-ascii?Q?9xNDyK15VyfviKZCrtfBEyxw7vYQEtj/lF8y46+e+N3Oh++FPsaEDUH/iTC9?=
 =?us-ascii?Q?VHCbVl/3vvmkH1bETjhmXS5gCc8+bqPN6dAs27aeptkxQY+6OoC996FMTWCk?=
 =?us-ascii?Q?1t5+YQ68PCIarAV5URI0DGNiaOchrjMEPtna2hOsrN0GyWFwwGNeElXRfFa/?=
 =?us-ascii?Q?wPLJ+g/dKScAd1lxm46kJ5cWKH3DYnCx3/KXE2LIapIAOrxpCMPZ2WcyCvxO?=
 =?us-ascii?Q?mhAcv9FnEcNurzNenUU7q79fUZWyuUF2wMnZf9Rjdwna+LYKr+ED/su0+jGc?=
 =?us-ascii?Q?g1ccaD9q203R1ee5F1KHLVMhLoDEJfYKzCelvdNBviqJ5kafbPnxvqT9AUp9?=
 =?us-ascii?Q?OHZBbkrVY+QNaUynW2k8PT7oHyUquy1g7UlX/zRd8E3wl1mzYiHQAFzxbhKU?=
 =?us-ascii?Q?gTgpyOP7sKmud+pSJI4AdCj/NuMMcG1w0H5vqV7ju+8dNuaFyZP20lifA4eg?=
 =?us-ascii?Q?24ZFXQSp+SRJr71ZaytdzFrp0MHsVbJTXQB6v8rWzrFygDpA8Szb+qDTKhdp?=
 =?us-ascii?Q?ygp0WP8TBek48u0kWs/hySYLlPSqKrK4xSAZMqeUYzuMFSaAm/KcuwM3Nzhr?=
 =?us-ascii?Q?h4jx9H9SQAIiNPVLH7gmK7xmgEjOIplPxv/RRN4OeFmKeqQHo5BDqINZHF4k?=
 =?us-ascii?Q?qsaiyC20fGuRohxII1HlGls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1cad44f7-0e0a-490b-d371-08dbb321e16f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:30.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dwWwfXfHuqnSU9EV2bZjyXr8ffBHF2jZoC/ltU6UEEE1JVdoDq+Z2cEeOJ2QTRIVW+cK3MW+Rrtl9y5GCG7aFz8677Tc2H1kap9CQ4U5HUqFRl9iXr6HQJ40UioEfVj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: B3GULRLUOKLU344QN6TKY6ROLSIOMIVJ
X-Message-ID-Hash: B3GULRLUOKLU344QN6TKY6ROLSIOMIVJ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3GULRLUOKLU344QN6TKY6ROLSIOMIVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/intel.c       | 2 +-
 drivers/soundwire/intel_ace2x.c | 2 +-
 drivers/soundwire/stream.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 26d8485427dd2..1287a325c4359 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -759,7 +759,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	}
 
 	if (dai_runtime->suspended) {
-		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 		struct snd_pcm_hw_params *hw_params;
 
 		hw_params = &rtd->dpcm[substream->stream].hw_params;
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index a9d25ae0b73fe..82672fcbc2aa2 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -327,7 +327,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	}
 
 	if (dai_runtime->suspended) {
-		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 		struct snd_pcm_hw_params *hw_params;
 
 		hw_params = &rtd->dpcm[substream->stream].hw_params;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index d77a8a0d42c8d..69719b335bcb1 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1819,7 +1819,7 @@ void sdw_shutdown_stream(void *sdw_substream)
 	struct snd_soc_dai *dai;
 
 	/* Find stream from first CPU DAI */
-	dai = asoc_rtd_to_cpu(rtd, 0);
+	dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	sdw_stream = snd_soc_dai_get_stream(dai, substream->stream);
 
-- 
2.25.1

