Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB434C1716
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 16:40:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E55D1908;
	Wed, 23 Feb 2022 16:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E55D1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645630821;
	bh=n5ydIsqzf7QkFQKmttHHzFX6w7Ka8HSygNh9uzz1wXk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lm8cK5wAuRk5nITv0J9/0KG40Q/pvXtL6cWGyC2HwdX6OQ0TqYlc6feHiGDUp+iYA
	 Uo59qT5zxpaskX/R80EoFpxZK7RIgO/6JPRJlvDGBzkI+8Gj4hhXS/U+qqPaoqAFKG
	 YFZKt8XHe5+coxkthkh6OzIlrGkGzXIPxEuslC3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F36D0F80118;
	Wed, 23 Feb 2022 16:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7138F80237; Wed, 23 Feb 2022 16:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 263CCF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 16:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263CCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="hE5MxCvv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOb4Ol51GDHysKFQrLrcw89mF/4zW+PCK6eNShZ0eEiJVplQD6nmN73+nr9cu43tG57PGlszzqNSIZ5mNHGdTapehpgVLfpoSQjL+qVfatW9G+AjFq9Zs/7dJT3PTcma0lskY5gNZiSS1EB01LxIcTpwIKxu3V6FUX5HnZY7lshFsvg1WrjogVaOjwqvmfveCAZSJcSfqf6r5omcSTOUbgvfjKgutumjh1EUFAR71Rsck14HzZ7a7SLLs6A7BCHE/qbtmbpnqIDazS+ngVDGeFYY/UULdQ3mfqnjWTBgKw0yTbbnVun6kKi/JpbsNMz1LdRJoODUuntfe6yE+cPTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF0PXa2b3dhAQvdd1dGdtfmjUethHpEz+amFuKxOReA=;
 b=W30ObyjtKPbdfSCV2ZTnQgd7EyBLmJ1bBPp6oxUlM9QED9CHbGGrbHMh5kBVUwHPUiD8Yezmgx9MJmlCnDhGXatJ9bKn3uILUnSrrVQi7maVLg7cs+PKtsOg9S5VZHM0MjhIPFBw/2sJP90MBW6O6+XMnunTY5k8qCSiK2VebzS+J7WYo7Cmx9EFoon5jn3KCc8H4YXiAjHtdRlVW5swuwhhKremdodG3jhfw+bT8zjf5vVOmHdk9kASzh17qRpKhP2Z4UP7llNnGeRMWsoERxnfb3fMJUE3RjZBaTFajnV8p0EnlLStrs7kHgZJFdGYxN0GDE+fEj/rgz/xFLaNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF0PXa2b3dhAQvdd1dGdtfmjUethHpEz+amFuKxOReA=;
 b=hE5MxCvvFpf3tPkjogF4O5S3DGWuBSyECuV/PcSsRN2Qfy7/fe3ZDHDKR83usnVP5LPYjvQR6J/PGHpmLgWIAxAuUt/EHVGIcPQiiYOQUHkkoYZKsDWGGv1Xw2i001KG2Vw3wJt2qtGUv8Puxir3npv66bi2B3R+aBhuRGdUkb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DB7PR04MB5131.eurprd04.prod.outlook.com (2603:10a6:10:1c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:39:04 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::5004:926e:e5b:38c7]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::5004:926e:e5b:38c7%5]) with mapi id 15.20.4951.018; Wed, 23 Feb 2022
 15:39:04 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: SOF: pcm: Add compress_ops for SOF platform component
 driver
Date: Wed, 23 Feb 2022 17:38:49 +0200
Message-Id: <20220223153849.84471-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0186.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::16) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1023fe-5ea5-477c-b04c-08d9f6e29f25
X-MS-TrafficTypeDiagnostic: DB7PR04MB5131:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5131BF5F241EC74B0A18D6EFB83C9@DB7PR04MB5131.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPIMQZjz+SiMa4XhMRqfZi4B4Fny6aFlb4HCvQfOZ74lbbB6CotrRvqyMJTajPCcYkDxKX+4dBHV3YtHou5ABYbK/3Bvkq0dg22dn+jygu578PcuLHJvMxPBUylk6o9AsCOvbEj9gqJ3K5G7iQgTxM7hkx3Bg8LuAUEGd3Q/Kikkj3vYNjT6vkuSfQkOCqovYbkzWXzz3wOhEAC3rcisqrvC417neXO5sFLTemQWZ0eFOe3ZqQXCLRP8a38IO/SS9Zhl+41Cfq4VBZ3QY7Ap2LAnYnIHLVrMe9MoWhP69V1+lzSJBWxNYfuMD7Da4474Sz7iJtflu2unjN/wvx3G7dZAS6Wufx1div7aubs47PVFm6jI71Qqv1aSWjLvDINefJt6kJYexqpnWDX/a3e/OfxKUEIRFQnAhd553s21ztXtnWZqwrgDtKTFMv4zp24llse/ITjHJhho0tlbVgy2+U8dr6DnEx3WD4uem7vF1wiaQUF0xhhR9kxc4s1+zBxad79LMHx51/J1FoVRuiDt65RgYg4W3p29fC8Q8Qh5EnE02BGS8iAx8xIOMw93BI8skvChgxmzQN4ob5Fi55jwvhmRrVvW8fbrohwcaTKmI76/qEJEPirL43+LzWyjrwEZUUjMpllFNc/zousM5SFv/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(1076003)(8936002)(316002)(6506007)(86362001)(6916009)(2616005)(4326008)(66946007)(8676002)(66476007)(66556008)(186003)(52116002)(38100700002)(508600001)(6666004)(6486002)(83380400001)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQ6dwGQFxYFZ7oGEPSGy2OLKTLcV7NIwfXTldBa0t/jLxsiMfVWjI9LEkUJM?=
 =?us-ascii?Q?0PFaEBNQotPvtNTb7zSuWwkbdig9GBaTv1+/Y6cYB+qZwL79PYlAVE966bMz?=
 =?us-ascii?Q?q0XW8ack/smbkMpkFb4bdseWGJYPD3kw2PlZ+5S2XFrqQDbq/fHv44ZgXomU?=
 =?us-ascii?Q?vjpX9fh7ZCFWtaZG66DMbIStJ/ujY6SEgTBJ1VHQRlNYCr4fOnYc8NWqbLuu?=
 =?us-ascii?Q?bGdjdqVcxIUeEdA/mwkbiyQJKpfqldrlnG33jYEF/1v74Edm6uorkaeMVJP/?=
 =?us-ascii?Q?nB03Qj4k3wBdTcUQdAmNsxq2mgspl01tWKSJ9Sp2OiDM4RNpE+GPynk8Lx+S?=
 =?us-ascii?Q?hwf4IYbHatRE595beLVrOPMKTkS5WgcBFe0/PGSAJmgPxkL1klu9F2cU6mlD?=
 =?us-ascii?Q?xv+O56lw559RUF5SypEYlUfFe2cq5DnK3wLt7o0bl3jk5g91q9KWKsRqn2c1?=
 =?us-ascii?Q?DT6Xbnu24L+4pV/6NhmoxtFoEmQGlTpng8Imwua1vpgeB+aEYZVKH4dS/lR9?=
 =?us-ascii?Q?yxWmnMK4UwthWPBhW2Vb+AxMwm/dXfEfZ+0Y5nMv+WtD2Jka1IJ8nDcxzrOa?=
 =?us-ascii?Q?CeWhBoLRxLylRF4W7fwI/cw6UxE5KW70zpYJTK/9EMi+VQJDOA0tozOXgIIz?=
 =?us-ascii?Q?UPfJUev49QX6GTw20olMPHZDE/FnzOh7xxBogF+9OQUSVkmUij9+XN7eJfL4?=
 =?us-ascii?Q?9dLHqyYWNuZ+JasBNwIQZm3VMfagM19Z34AX1pdtoRC3UfG+8fV+LoFRzrUI?=
 =?us-ascii?Q?/rKuvy8h1vajO94LZQ9EDe38I8M3hEf4PfDc2GIGfJQe7DT5HAew165G8TAa?=
 =?us-ascii?Q?D4XvmpeY7X1MPx9Ugnqeo8OnJI88vJqU67BvqIV2DcmdrQC3v3NZ6jwoabvU?=
 =?us-ascii?Q?LyCfy8ALZSmNCngRid9vl3To3RaNdihAw8BcSRo6zBnwQwPZtnvjLt3DFgdm?=
 =?us-ascii?Q?DUPkyFg4XxPa2OwZjdd2T5oS7L0TAUGVXZKUZm6uhZZNrbHJ7H1WVmnwluJQ?=
 =?us-ascii?Q?EsyrfZf9lOtYg3g9YWuXIofVJV9PWQYXU4vR2vr5BUepXiLdP5TL0Jtg8Tka?=
 =?us-ascii?Q?jPBiiIE9+NNcRFw560Ztm1KUfK89+I6AGXe19hfWBmWJRZgg38uyZo8klpf5?=
 =?us-ascii?Q?Z3maGmOwLM6C/oK248sjVKJ599t0gEsCHswYFTGgTvzp+Tf0dTjpmHVpH4Mm?=
 =?us-ascii?Q?1L47zB7m5QSMlFnjfVT4oMAwzQ/qyicuKWKnrFiS+mYUwd2+uZjgCQBj2GaI?=
 =?us-ascii?Q?Eum7V2eWzrG0+wWWTH/0cJspoyKGnCZyh6A8BNCdE9TgpRrYclCDcVtVhcgG?=
 =?us-ascii?Q?uMvZ5SbwrLoe3kq7ZXCgNtBlLxVcxVf6T9wvRPc+3uPv7s3/cKWQIPZNe/CC?=
 =?us-ascii?Q?NJKQMz/LsOfMOnCw7LrZsjmAWXZe2G0urufTnw5tsbXwcvatukc4Q4owb5qA?=
 =?us-ascii?Q?vfNIO5Y7G+ycTf25lL2H9KRYaVh1RLWGUNsg6o05HxuU9uaHSK60MXcpqjN6?=
 =?us-ascii?Q?RbXdmCimxNPP92WJxxVGqqniJiYMDc0eJcEX/nurtD/IbdMqO9C+sv/gpcKJ?=
 =?us-ascii?Q?PjiJdKrUFnRxuceiPyFNK7cS5uYoKXSjqian3FnYt+X+AYI9hofZxoRC5GrI?=
 =?us-ascii?Q?bbtq6F0rf/btSnmbqSAhLW96y+2TFhdddF9x19fkWUUZ89o+m6Vu9hnPu6nf?=
 =?us-ascii?Q?yIITp+ZtfK+V8MXyinF7lmhHyj6tWjTeRvfGepQzws91zKS1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1023fe-5ea5-477c-b04c-08d9f6e29f25
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:39:04.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WWk1GgSu9J8gq1vzzstkutfchq3SjPgcsA1cIogRHbq+kJ8gVqKXyzfbjLxSNSMcVgIzR0HXnQZw9Mlrz5e8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5131
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Now that sof_compressed_ops initial implementation was merged
we can enable it in SOF platform component driver.

This partially reverts commit
8a720724589e ("ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS reference")

Reported-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/pcm.c      | 4 ++++
 sound/soc/sof/sof-priv.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 137f8ed71677..a312ed855f1a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -922,6 +922,10 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->pointer = sof_pcm_pointer;
 	pd->ack = sof_pcm_ack;
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
+	pd->compress_ops = &sof_compressed_ops;
+#endif
+
 	pd->pcm_construct = sof_pcm_new;
 	pd->ignore_machine = drv_name;
 	pd->be_hw_params_fixup = sof_pcm_dai_link_fixup;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2c8e556cd5cc..886787a9997f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -556,6 +556,11 @@ int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
 		const char *name, enum sof_debugfs_access_type access_type);
 
+/*
+ * Platform specific ops.
+ */
+extern struct snd_compress_ops sof_compressed_ops;
+
 /*
  * DSP Architectures.
  */
-- 
2.27.0

