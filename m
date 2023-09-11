Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD779B53F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75B3EEE;
	Tue, 12 Sep 2023 02:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75B3EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476993;
	bh=0DgzFwf2cSuw+XTUy1tvdzr5YtNL61afdq1ubWPBFe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMFi48CkiqsXr4tzfDyNEqMk8eOa7WkUZDurZXyQ1WF/OyH/mE6ot5Ke9qoHVpl/x
	 pNu2Q7bo8iBpx7K47gfIdzu5TBdt6+r5sardNxLYEc8+9eIUgSVZZLEHsdiUkXrrLF
	 aSmp9VzlvqoijuZkczlaDppijV9wl5zpPDXG5dTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D490DF805B6; Tue, 12 Sep 2023 01:53:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4EDBF805E7;
	Tue, 12 Sep 2023 01:53:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B1FF80640; Tue, 12 Sep 2023 01:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2191EF806DE
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2191EF806DE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CWonBIZC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDiosULPUrgn/1X8vR+VoBjRpXH++CkKsVZGByiFCUMLJJxGGxdLQw41aSXtVMEEWrPWuT7D9waL9eyVwqEpyG43i1KSQq10hKqRU8yb5rTks8b5HDwzI2eloQ/XcAZUDrlBEYwZLwXrJ290OOtRl5Fo967Vwbk+nIa9teiDR4RfFPiDUQLnIkNZr4WqCOGXwqZfLH9oBKmvfa9nTpXPC9X1+iK09XyLmM2TxdX8BOv1vj5QLx0LtNMWimRto8wKkoaErh8RKMW/gtHn146yBfSmCqtQMZ0aRSp0PHYqBdfivr4QOYR12pF8PqdwYB+weDqLy+wO2NBoUIi2mtgtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDZDmwaFAA5uAeeM5veBKZ8nK5ZlEA+D5KXlt5LW4zs=;
 b=mJhkpECO0sN/RAHdnAM9sBItNZI/hDOAYRdig/WdPEq1xLife0DxZm8WSvLFYEqzzf5a/437wV1YN9SmvSZYPGCvjPjPX4ZJBD3s61DyIyvLRLubwyHJNCniy+mhMgt02053xf0eOp8TVpjdjuIgGnsf3Ir+7FdWRMTGD9rDcd8ImCvO9OByADZArq9P7LiEPyK5wsgvPSy/hm4UArxFmODxv/8+xQEA8g7tx+ksvDBZFCz9LEmj4jnbmaetfGZigXaj0BmAMjqAJr5ouGD7icWkGZOVIyPXLdWJzc/cDchl/b1UeagZYuN4L6xTKHapk+0iryhz8tKlXJI5mJKRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDZDmwaFAA5uAeeM5veBKZ8nK5ZlEA+D5KXlt5LW4zs=;
 b=CWonBIZCT6DftIx56cGGKbEmOGdGQiesP9psfridikRTQb1STGKN0cuG/R5tWqWFWKdJiunQ7hhrGFAYzBk4Ofn4o0oTkwxSXpg2J1GDHxKV98tywNoFH8TXh6U1XDOiDdeyR4vt7xmqwXsGJSFysx5GyDwiXVlUHPhuc7JgtkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:23 +0000
Message-ID: <87cyyop8so.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 53/54] ASoC: soc-generic-dmaengine-pcm: convert not to use
 asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:23 +0000
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 8877fb5d-a6a2-4f7e-f7f8-08dbb322251c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6cEHpU85cnOAAf7MqrV55+uOdz/YGxy8iOfas8RUoJPGoyJSQp7tCfJ1eWf9vaxHW+/eikBFVPOroqxjiOnyzU+Io+/qk63PPsL34s8whAZRT5ro2lx4PvWcvRC4v/YvNKcmbGxKj/8JPzF4GKFbeQat/U6C1SSiPLLtM6rR1aOKWsbUlFaDVFxvJ2cpAVV4rG95o5qDPJdKwTpHrcUZcJv9ItkqvVFnFiRwviwywlwJa8Jju1M6P+vA8uqwqvN5CCYxJrVQZ4xa5HXZ7BG5XpkshxVfuOIyui7oz0WKna+aT05f9PqBN2+O4y+SE9sNmRxdox+1B1gYBpENmU468oWGo6cYvnO4Bdp9jay6DuEHTtUCKyJqP8xJL9rx9LyAhuJ3R3MZiy9DCMOlI6GeXUE74UF6RjlFzr20Wb8g5KP/HttbYOKGccmuqauHqcgQEgE6CiVtK60OTvq7KbWjDUmRQgxfyddGV1lZYjT5RHGNdrI56DX6F5dS2WOpNfOUCknKBDBgPhsVu/9edQ+NO2tTUtSf2R5chJAQMySm1LQcrRiynNuntrINPP0GkKfwxK1hq0wj0MVM6EKeq27MqGSW4uj2O8yLZD4JtMwYGjzZEA6JCIbWrbg0nzFaG5csswNTOnGmp51DS7warq5CzWBc7Y34q9NYJoPVeMeTJbc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(41533002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xn/uk9zqagdyCkceDlDLRLfYxqfSXhMSdEMJ47MLW3OvYY1qNF7gtx1nfkWs?=
 =?us-ascii?Q?F8FUztTLMBhtw/cf156l1vqK7ufrWV5F4hYxNgccHYKi6u6L8vZZCmn0nWLy?=
 =?us-ascii?Q?/u+zG9IVP8CxTuLbLnWk0Uw/d6NiFbgRAHAdjJ9QZQwHi4a7rVohHwc0LTOx?=
 =?us-ascii?Q?TjKlBdL6u66NJr2OdTNURInSp0RUUeJ+L4+KYfX0zWvv/z6DjzJOkw7ckdgz?=
 =?us-ascii?Q?hD6vsbQmTTRQprpwLKAzNNHnMbAEI8Rk5aRPnl/V8oboqzs3JPNXyUbmm2Dx?=
 =?us-ascii?Q?VsZ77MfUyM4TYARDxGrnRr/xnmYDncmJcpFYzaO0sDlSKWocLduJttO4rNTv?=
 =?us-ascii?Q?VuFXI7OAX79i5GyzdfF3SYqbVzqsUYJ0fwrjI/6EgBxFbZj4duWvxfGdYRKo?=
 =?us-ascii?Q?ujdNhMkAR+uNq9zixK+E7Uj2SHGmonWUSf8ZQvn/FDZpDoe/o05V26GCtFV8?=
 =?us-ascii?Q?Sr6pv1N+zhiC6GZrRM8jqgijrQap7kQ8hfILvlow0ZW5aMf3eaVUW6vB0Hhi?=
 =?us-ascii?Q?fmh6peRrU5CPt7BOAgjtr3Bhn4PZlSGHIAd8po74xOLg5pxkz/S08aYbTZ+6?=
 =?us-ascii?Q?esiQjtvNHIvddLzXa+sfD6VHNRF02NhbEHc/NMNUu5VhxwzitU0yg1jFxspB?=
 =?us-ascii?Q?catsLHaJfpQxssQ9MYyZuN5Ty8hyaF1X08OXrOaXMSZfEdMDcdlj+K3533qa?=
 =?us-ascii?Q?fB/4RtDocIO/ESNel6Su2nXVceeqGjM4bw1PBrjCZuiTdeb1qzy8UGalsK7j?=
 =?us-ascii?Q?6zuNoRuaED0L211a5SvborRBLvYq6pWh+ivL+2X3PFsNbch3O5aX4wrOEveG?=
 =?us-ascii?Q?sz4WbeUVyvP3jH7ZDcDCjAHx0RAZM/pZ9+qI3wBgkrLv61s+dpyutKATUUUi?=
 =?us-ascii?Q?yr8ocEwhmCpKWyglda3HeN6A670BkPQDbMid1VwXbLLMaOYZ+pH4ea3XeDfA?=
 =?us-ascii?Q?RfNva7/9bWbo+zdOoMSHHCMDisoNkXk9HF9CtfeFd4Sq5sNWBlB+6i6XgZzD?=
 =?us-ascii?Q?Nz5/7UxORjga13OTfRm3Mg9g/H2bLuhnDxSfRXqS0yNQuNMlS/ehdB2CuQE1?=
 =?us-ascii?Q?SVACV0hkGqoJUUTq5clWVWnG7EuDUsJDfoi9KCy3zyiAQeKOiLxUFj8TxZaB?=
 =?us-ascii?Q?x1g4/Z4DT1OkN7YOk+tFTCguZ+GOKN/coMVjrgy4PLM9h5DnAItH9uxvqfxo?=
 =?us-ascii?Q?jnyFDlg2rMWvRZI/Z1Oxq0iPqMOHR4HVWZ9iiUcN8YGuWO1hoE2cVsLdn/e+?=
 =?us-ascii?Q?jRT2kaZlZc14NutXSLUDlN7N4PdaNk3OpVt5RRZN8SfQ2v+xVu4SltK/p9Fe?=
 =?us-ascii?Q?G9BCu2QJPDSyezJnKuOpoKqWDF3ni2BSkC/x+Nm/IBVThTX+jmoY2x7wv4wg?=
 =?us-ascii?Q?dmtDmYZRblBk7EmoNuGLRBvdFVf3fQW9PnrLNX9j+BhrmD63/Y6KuVBLcZF9?=
 =?us-ascii?Q?qMKPC2JCM7PikYttTNGK8LVH4vTsPVWjqX3s/Ode/0H4OLIzwC4QDIJcMUcO?=
 =?us-ascii?Q?u03EQQbVEiEAvX12TA9jO9El2ZSUbsvDIjr6lacNnqbRxP+OidUvD9GEPFqj?=
 =?us-ascii?Q?xCIjDupjiNc4BzK6g8EnbdBzy8EaMMrWN5t6P6su+4TVoGxDXikNaysbJ5dV?=
 =?us-ascii?Q?zzcUWhh1Bi45UvVqYmHco00=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8877fb5d-a6a2-4f7e-f7f8-08dbb322251c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:23.7273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I2gTX1gsLCGCiF/SmRuh8flpddz4grQK3HEYLWZOAFCdnpFICNvqAc1Uu8BRHa3ULPoyQCKqi5fa1dEBIvTptYv4sJH7zOrCj3NFcyX3/qjSKSVe3d9a1a92a4eZ8RKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: BMN4JSWIDPYHS4JPLSF4QYXVYC7IX6Y6
X-Message-ID-Hash: BMN4JSWIDPYHS4JPLSF4QYXVYC7IX6Y6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMN4JSWIDPYHS4JPLSF4QYXVYC7IX6Y6/>
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
 sound/soc/soc-generic-dmaengine-pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index d0653d775c87a..63ae0c2310d7b 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -50,7 +50,7 @@ static struct device *dmaengine_dma_dev(struct dmaengine_pcm *pcm,
 int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
@@ -60,7 +60,7 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
 	if (ret)
@@ -98,7 +98,7 @@ static int
 dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct device *dma_dev = dmaengine_dma_dev(pcm, substream);
 	struct dma_chan *chan = pcm->chan[substream->stream];
@@ -115,7 +115,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	memset(&hw, 0, sizeof(hw));
 	hw.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
@@ -185,7 +185,7 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 		return NULL;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
 		return pcm->chan[0];
-- 
2.25.1

