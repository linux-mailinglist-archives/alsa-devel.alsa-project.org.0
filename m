Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA42F03AE
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jan 2021 22:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0616F171D;
	Sat,  9 Jan 2021 22:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0616F171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610226257;
	bh=v2t/BqbH2eyHNAS/sb5ucAR23ePPHY3AvNLSpBPq7fU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGpsESOZovzGtogydOZ4YtHaHjDCYjKgsMqcTPGzPen4fcdVwQwyPrww1ACcz6ori
	 oNafb1zNdDyI8cFhMfC8ky+ZcNHmilTJxFbs09/v0T59cBNpSq+C0Ta4hi2VkLsk9Z
	 SouFM+txWDAzWsv9iRZAhaCaJ8/JDWCKF9CaBaCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A11E4F804C3;
	Sat,  9 Jan 2021 22:01:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CEFBF80268; Sat,  9 Jan 2021 22:01:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09093F80159
 for <alsa-devel@alsa-project.org>; Sat,  9 Jan 2021 22:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09093F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Wd1Ocd+O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610226092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0FoNaW7L67NKcado5IAFK6Mz08LhrhReX9fQY1/NjI=;
 b=Wd1Ocd+OO07sU6PcOR12l1Xwwh1ocv6wIb2e2S7VMsCkiRqe+5noMVabRUCLCtgWJkKrZR
 c2sSy2OqUY9BW1TgVjiidH0zpk6pto7/q1aTT7yaBe0p459grzsp0XSUknTS5pOxlToEQN
 wDFnx+frqUuAv0pS+XzwqP617hpjuEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-VkOigDYPPaiLGRHcOAXfuQ-1; Sat, 09 Jan 2021 16:01:28 -0500
X-MC-Unique: VkOigDYPPaiLGRHcOAXfuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0B9D801817;
 Sat,  9 Jan 2021 21:01:26 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6662360BF3;
 Sat,  9 Jan 2021 21:01:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: Intel: bytcr_rt5640: Add new
 BYT_RT5640_NO_INTERNAL_MIC_MAP input-mapping
Date: Sat,  9 Jan 2021 22:01:18 +0100
Message-Id: <20210109210119.159032-3-hdegoede@redhat.com>
In-Reply-To: <20210109210119.159032-1-hdegoede@redhat.com>
References: <20210109210119.159032-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Rasmus Porsager <rasmus@beat.dk>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org
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

Some devices, like mini PCs/media/top-set boxes do not have an internal
microphone at all, an example of the is the Mele PCG03 Mini PC.

Add a new BYT_RT5640_NO_INTERNAL_MIC_MAP input-mapping for this,
which does not add any internal-mic routes and modifies the components
and the (optional) long_name strings to reflect this.

Cc: Rasmus Porsager <rasmus@beat.dk>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index dce2df30d4c5..48d781faded1 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -35,6 +35,7 @@ enum {
 	BYT_RT5640_DMIC2_MAP,
 	BYT_RT5640_IN1_MAP,
 	BYT_RT5640_IN3_MAP,
+	BYT_RT5640_NO_INTERNAL_MIC_MAP,
 };
 
 enum {
@@ -117,6 +118,9 @@ static void log_quirks(struct device *dev)
 	case BYT_RT5640_IN3_MAP:
 		dev_info(dev, "quirk IN3_MAP enabled\n");
 		break;
+	case BYT_RT5640_NO_INTERNAL_MIC_MAP:
+		dev_info(dev, "quirk NO_INTERNAL_MIC_MAP enabled\n");
+		break;
 	default:
 		dev_err(dev, "quirk map 0x%x is not supported, microphone input will not work\n", map);
 		break;
@@ -876,8 +880,8 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_card *card = runtime->card;
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	const struct snd_soc_dapm_route *custom_map;
-	int num_routes;
+	const struct snd_soc_dapm_route *custom_map = NULL;
+	int num_routes = 0;
 	int ret;
 
 	card->dapm.idle_bias_off = true;
@@ -912,13 +916,14 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		custom_map = byt_rt5640_intmic_in3_map;
 		num_routes = ARRAY_SIZE(byt_rt5640_intmic_in3_map);
 		break;
+	case BYT_RT5640_DMIC1_MAP:
+		custom_map = byt_rt5640_intmic_dmic1_map;
+		num_routes = ARRAY_SIZE(byt_rt5640_intmic_dmic1_map);
+		break;
 	case BYT_RT5640_DMIC2_MAP:
 		custom_map = byt_rt5640_intmic_dmic2_map;
 		num_routes = ARRAY_SIZE(byt_rt5640_intmic_dmic2_map);
 		break;
-	default:
-		custom_map = byt_rt5640_intmic_dmic1_map;
-		num_routes = ARRAY_SIZE(byt_rt5640_intmic_dmic1_map);
 	}
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, custom_map, num_routes);
@@ -1190,7 +1195,7 @@ struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3" };
+	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3", "none" };
 	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
 	struct byt_rt5640_private *priv;
-- 
2.28.0

