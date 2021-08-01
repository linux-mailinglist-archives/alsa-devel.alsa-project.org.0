Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561F3DCDDD
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 23:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C8217ED;
	Sun,  1 Aug 2021 23:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C8217ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627852073;
	bh=EiDgn3Aaz+Z04VLjdo1ixo28DTSFX0cvgC7kZBSAi+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3ODchqov8j6IdGGUqWTaacHYlX8IT0RDj8DwjCz4Usd5WIThkT1D46W4pROgZMEm
	 XPvMPtioVnYoNdNdn5/IzuzaOfKnFJNCfC/1G42Fn5YQsQCT/q1ow4uGD+Nr/LacC9
	 gsVUVvK9UWoqSt9BlePwjlIKdMfoqMUzMj+oFxjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8326FF804D0;
	Sun,  1 Aug 2021 23:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C95CF804FB; Sun,  1 Aug 2021 23:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FDB3F804D0
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 23:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDB3F804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="D3z+LZkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627851888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ay0paqEZzLI5r79berxAngpL8XFpvK2sGPodWNkNmvs=;
 b=D3z+LZkCKdoXkOj2aBHfTji7/n8re1wKT/VY+4t0i9wsGKGG7Z6vWgYGY7rtWTW7/Bog6t
 nBGhyYAl/Cr/YrLdoAG1cDFc97pI+5QetyAQs1cwu+Kz4Ym6onUhmk5ZjvQMgF4tshEWjS
 LwT0rxHAomNPDtpveUKWDN7nGgV0HPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-HkpgCh6zOzixX3NZQow6-g-1; Sun, 01 Aug 2021 17:04:45 -0400
X-MC-Unique: HkpgCh6zOzixX3NZQow6-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5953E1853027;
 Sun,  1 Aug 2021 21:04:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF7E60C5A;
 Sun,  1 Aug 2021 21:04:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headphones output
Date: Sun,  1 Aug 2021 23:04:29 +0200
Message-Id: <20210801210431.161775-5-hdegoede@redhat.com>
In-Reply-To: <20210801210431.161775-1-hdegoede@redhat.com>
References: <20210801210431.161775-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Some devices (HP Elitepad 1000 G2) have a second headphones output
(1 on the dock, 2nd on the tablet itself) which is implemented through
the line-out output of the codec combined with an external hp-amp
which gets enabled through the codec's GPIO1 pin.

Add support for this through a new BYT_RT5640_LINEOUT_AS_HP2 quirk.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 36 +++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 70faba13450c..51fb44ad9b4b 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -74,6 +74,7 @@ enum {
 #define BYT_RT5640_MCLK_25MHZ		BIT(23)
 #define BYT_RT5640_NO_SPEAKERS		BIT(24)
 #define BYT_RT5640_LINEOUT		BIT(25)
+#define BYT_RT5640_LINEOUT_AS_HP2	BIT(26)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -142,6 +143,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk NO_SPEAKERS enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
 		dev_info(dev, "quirk LINEOUT enabled\n");
+	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2)
+		dev_info(dev, "quirk LINEOUT_AS_HP2 enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_DIFF_MIC)
 		dev_info(dev, "quirk DIFF_MIC enabled\n");
 	if (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) {
@@ -287,12 +290,39 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int byt_rt5640_event_lineout(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *k, int event)
+{
+	unsigned int gpio_ctrl3_val = RT5640_GP1_PF_OUT;
+	struct snd_soc_dai *codec_dai;
+
+	if (!(byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2))
+		return 0;
+
+	/*
+	 * On devices which use line-out as a second headphones output,
+	 * the codec's GPIO1 pin is used to enable an external HP-amp.
+	 */
+
+	codec_dai = byt_rt5640_get_codec_dai(w->dapm);
+	if (!codec_dai)
+		return -EIO;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		gpio_ctrl3_val |= RT5640_GP1_OUT_HI;
+
+	snd_soc_component_update_bits(codec_dai->component, RT5640_GPIO_CTRL3,
+		RT5640_GP1_PF_MASK | RT5640_GP1_OUT_MASK, gpio_ctrl3_val);
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget byt_rt5640_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
 	SND_SOC_DAPM_SPK("Speaker", NULL),
-	SND_SOC_DAPM_LINE("Line Out", NULL),
+	SND_SOC_DAPM_LINE("Line Out", byt_rt5640_event_lineout),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_PRE_PMU |
 			    SND_SOC_DAPM_POST_PMD),
@@ -1480,7 +1510,9 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		spk_type = "stereo";
 	}
 
-	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
+	if (byt_rt5640_quirk & BYT_RT5640_LINEOUT_AS_HP2)
+		lineout_string = " cfg-hp2:lineout";
+	else if (byt_rt5640_quirk & BYT_RT5640_LINEOUT)
 		lineout_string = " cfg-lineout:1";
 
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-- 
2.31.1

