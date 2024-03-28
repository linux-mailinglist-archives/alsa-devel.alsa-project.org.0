Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C9874906
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 08:47:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF15893A;
	Thu,  7 Mar 2024 08:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF15893A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709797671;
	bh=HBmrhhEuWxy3hoO5iNeDkh8W1qQNc1bOWF6AbhCMw/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mMJ8DMg2yqWs41/8APddT8BS6okORLDGd1A5yZqL51rpGaFFtgFaCB3qt8KC1S6tk
	 oGcOjJsIPJkftUBVf9ov/qPBBA/v+62AkBE8zpOz/ZVYOIWDRq5yDa8E1ojLHoyWyD
	 FWxC8nGRo9P38M0PzdvxC2BbsN7/2TCtJKE3PSNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04813F80494; Thu,  7 Mar 2024 08:47:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04291F805A8;
	Thu,  7 Mar 2024 08:47:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F15AF805AD; Thu,  7 Mar 2024 08:45:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260f::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79D9FF805AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 08:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79D9FF805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=nH4oJzDk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC7y57yTNMNZIoMcl4TSXCMbiIgveYByaslqHzJKeC7lmTde0Bwwa3IXqtX8Hoabo8A5CTBAJjNAELKqdXvqItCBf/JSGuT7C1DmNn6J2ZAy77Z0oIJaE3GTtGlWcoHRPevTcfBomx0uJOmt5aMh4UR6hNdH23D4geZQbKNuOrTOOCdp6PsRMAv4pfSTglCsKTPzC1LMLvJaWJRkU3gSv93E7NU/ij5+VOWbSQJXJL5kjnymWhB3qO+f+M8LBOF27mPTP9usT/mj/rsMu1GtfOW43ExZJrO4JO3tfhUouQv1cqo9wqBjupECrkAkhkcbe8N/6KiAY7gOhvZoSWrmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=dVek6ALtzlld0XWeMQ5i6roPY84SbgFwMJLEStNMHWJZAQ4AcpRrN0AMTxyZQzKJPu/c+08rHn1xKDQl849E6/SlKL2jy0WSmZaPW5h4Gv6+4luMQPnOHbr6/tbFKlN9Y/L2xlKjL7xoOhYJP3hYFUxVjl+u0sKkWXHBGUV/Pr1s7IP/KvCGwkHRt9/tlC/4azp5o2owlfmPX/eman3lT0vflFvZvh90/q483s+2hQ9yq7FmG7EhcQDhKbj7aM3OXQeLCHQo9UqynAJbqfHOdgJYAwVHKoUydSfTFLeGZYuoQOv8o+chCzihvuD22wvzvORvjB6Qh1RTkb9/Z9gh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usFJflqaAIQAVMktPObw+rK+eyJhCtZONibE7XKKYLg=;
 b=nH4oJzDkG2wAUgv7e65xJb7AAdWRhfHdQh1Lu93/iN87Qi4lPylBCP5V5IgXxaZenUL1AC5k7rB8kM1jXhZa+pdilv9EOtVwsFh295SZaHc+kWXmprLr7L451Y4OXpBTtkUeBXQkW0XLw6Rm/FemqUUulSxwK9cH3ZCHi+TVGN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 07:45:17 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 07:45:17 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 2/4] ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg
 channel name
Date: Thu,  7 Mar 2024 16:44:35 +0900
Message-ID: <20240307074437.1472593-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307074437.1472593-1-chancel.liu@nxp.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7fa820-1e62-47af-fc6d-08dc3e7a8869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hrb8bHveiWB1Ntmug/Lz/7CK+jlL2clC2XdXWWLjmejhvjivAJPQBB7KR18/K8ZJDUzFFZK7bTuAbe7bb/c8Xnw5g53/SDAXn2oyxJKGShUybR2bhv8woz9ljWeZyzTTzV4wPGi9/z1aUHMFnaT9NtXI24Kt06dStDGzyGqreA+H5cjFpKWog4LZ8Hst3CtGRHr7fw7qUsq3yAEjwHxexO24LhQGTCn24Lib9P8QIE/tcTsk4Lk1w+1D3wiZllZhd3LnWIQGPuPVfxLP90YTlKqlQCSIgptvfcLQVFhf8+wub+mbG3ukab/0YY3CzyB2LvuhFcqmEciRPQ9d2lyk1vl+P2uIfI1rhSOcr4OWYM4Jf4XPggICJWaVWRM/EORw8JGVf1yVMGusjXoVCEXjbLhmE771wq8zIRo7SpRBBiDF3jwvn/7F+OZGnAGjUTBT5YmstwpaLcX94p/hYUgPNECBP5rZbhdPeLBx8ht4nRqcB16rwqicYw1UcWGus5rUMmce4zuvgewJBe2EnF/OJL9tTmZ++RmKCu2AI/J9Pqv84VGQeoPYcHMl3eV01sgtTMUDNR54f09xfri6NXoBrLkWgS9LawdlOlHDbL89Zy7roiMGbxl84vnKo+6laBmnEKCF/2Fucm1ZcUQzw18Ojn0M2DTqusYwHiZFt4UzyqU3TuCUVdfPO7SlaOYLyxnQU8Rbcg1CLCHn6Swcc1EGHYdxqIcRZWSHjwWQugkiJuU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sz4lgKgC2gVz74rtM8+3ee1R5RkRvtisEaxJlVSZ4wunDSikLcJmzZMIWzk0?=
 =?us-ascii?Q?TYVCEMj025QWJRGY0sMuQO8cDIEZMeikJ33H55hkHgYPrqYCnOFOxlsR3hX7?=
 =?us-ascii?Q?TgYt7B0Bhmr1XXUnf3Vt2/ivTVROanAHmjFSDwWbt8dQa8d+N7KI8IcRBntV?=
 =?us-ascii?Q?zK+sjL4cZ3d0aonjQOCR1XyuUyOM6YGbWpryHNwh27V2PQtBOdnvJ4DF88ry?=
 =?us-ascii?Q?h78FXQwK9pQg1PkA0yRD4TzKfs0nW17LBxTKSxctll/5DCWMrtMt0FfLtWqO?=
 =?us-ascii?Q?bQ2F5xWiZvVyVofMKGm5tS00RchFkdyNtBcsTOYW5Wx0RVhdyp39PlGuWMAr?=
 =?us-ascii?Q?+/EnGjw9p6gFJgjScDnbDWdkeri4oZFJsH5jESdSPiE/7zAtuYl0Sh2W5J+N?=
 =?us-ascii?Q?bZ/bo65tZbe8f4d2+KIt68IU2hOTPhW+1ze4PVrEyVsTzaksv8THx4O5ZhpI?=
 =?us-ascii?Q?n4zkhHqns2XmFDhQJZU5E4SFVLDbSQyhdJAZVzHHPPYB1dGeE+ubKIkjWp2T?=
 =?us-ascii?Q?mpKpk2DXfQSePljNx7PzuJASPlIT0e7ysON+Me0IYYVIF5yDUBtO4ipz5Md/?=
 =?us-ascii?Q?3jUAP7Q4JoY5YQDB8gHS8zQwosbOuwCMe5kIHD29smQlSojp433u+ngEM0cv?=
 =?us-ascii?Q?F4pRj6dFSg8VFw4K0tOM6aBRDnqaADJqeeKTPBwwfnhlnaovKRptbcdqEjZy?=
 =?us-ascii?Q?uAM/KwKqrTqEbTuaT3V0kpCsUtPcE8XPH8UcMYGhlROPb3xpHDd7z3eheC94?=
 =?us-ascii?Q?TolXfATJ9ZlDEAHjOFgHtTOSMnjOOYhhTDS3S8cflrvbAEUPIMRP1WCye/g1?=
 =?us-ascii?Q?76byqGHxHSxy/jWpF+rr9EF8sKZh2xpcA7RgTCcBWqwS7TWIpR2+FM495Jla?=
 =?us-ascii?Q?RuCzQWi1P8ioFD+VYDXAQQSYeSvvNfw1GHzKLHjT1qx0tSNdzySXeKemusvE?=
 =?us-ascii?Q?uDlSrrxacAPr3TGnjXg2QYCa04nCAlSGPlcdXjzbPPEgz7qu/fSFKJxipzNG?=
 =?us-ascii?Q?BKVHSRo/xrcITcZQvq+pm8qMcXnyIsr0vxHKgso2UEUTmIHwM42xo5A6hscO?=
 =?us-ascii?Q?v9j02xjFM7GQcSiEVDgC3mUlyOBUZLgxZ0L9XXqZT5aQXm3I+1Ypvv9pb3bs?=
 =?us-ascii?Q?aP9qWlYhLeschEVsplOHZ2DHq/KVKrWIe8ZDXp7PEoAnyUieJzGuSeQE9I3O?=
 =?us-ascii?Q?5egk4YRXyPV0UxIjTOyqS8kpJj5VaQPtpOLaf/RJIG57f2dBJI0rNxmdompb?=
 =?us-ascii?Q?CLsgl+mSs/TK0vAFVgkxUy5VvkECG8dhU3w651S8t2iE3KpH9aAak1FSAQHj?=
 =?us-ascii?Q?7FxQfFZpT1h/JlpIdGQIxdfYEPAJl0QII1sLX7RnHa4qyDKrLB7ti6Rtg+wN?=
 =?us-ascii?Q?blCjUkzzyfFUG1oR8cpd0xDPY6cJqRpCQB4nxOGYXUy4+c8PcswG5wA3KOVy?=
 =?us-ascii?Q?eLA5j2urUbLQyUGIIBZfIoDtDxRjzYzqHIwYJKrjlt9+0eS8D3HxYgSpz4nf?=
 =?us-ascii?Q?hbUdgOuRsFnVr7aNjGQ/A5thpECh6Az544rqez8ufDRnylj3lXp0/Ilxw0AE?=
 =?us-ascii?Q?1TZNCI357X8nj6QBJgIM1aLaG9Ywaw5hLFxL+S41?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b7fa820-1e62-47af-fc6d-08dc3e7a8869
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:45:17.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RqAa2oZOgLs617BIdT8HhOTitbvwB+K3K8UXJ6TT4cpy5Kv3u+oTmOMKpq3yfEjbpgbXaf2IvYeCjyoGY1Ij0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789
Message-ID-Hash: AGPARJGBGXY67C6JFYR62IYTFK7M3B4E
X-Message-ID-Hash: AGPARJGBGXY67C6JFYR62IYTFK7M3B4E
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGPARJGBGXY67C6JFYR62IYTFK7M3B4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This rpmsg driver registers device for ASoC platform driver. To align
with platform driver use rpmsg channel name to create device.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 289e47c03d40..40820d5ad92d 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -87,8 +87,8 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	/* Register platform driver for rpmsg routine */
 	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
-							 IMX_PCM_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
+							 rpdev->id.name,
+							 PLATFORM_DEVID_NONE,
 							 NULL, 0);
 	if (IS_ERR(data->rpmsg_pdev)) {
 		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
-- 
2.43.0

