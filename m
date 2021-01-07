Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006492ECF28
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 12:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8463682B;
	Thu,  7 Jan 2021 12:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8463682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610020511;
	bh=jFeuhF8MpAbzJNZ/zmHLi37IMyrTg0uH/8MmIZQ+68I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RN6VnnGh+IU/RewYj4P1ocxSZq8epnBZV23qWC5FpgM3Zcm0Ay1RM5A5YwsSJhOdL
	 1M3fmVgmT9kM/zeE+qqWd1NpBioocHAj2zdcUA4S4J7+syFI1O7/yohs/GAfyNe9Fr
	 TG7iZetMnEnTQmKpwhv6S+oOSk0I1LV7tJk3cVg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12233F80258;
	Thu,  7 Jan 2021 12:53:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 388E8F80258; Thu,  7 Jan 2021 12:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53046F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 12:53:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53046F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="b0BY6Ngr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610020410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vguo8/yrD+/stCuZq9Tj26YARU6zQ1ImGlRCAkDRnVo=;
 b=b0BY6NgrlYncXuGUqWUEeLHohyHmY6mWqmC1QZPqb7lV8vbajeT6bv34MsONhAVThumFIA
 HU1++6l0xycmpPBzOWQyuMj7tNxkMbQGKUxLrNUYiufnruXlDMdkRj32oA4E8vmGiZlLgM
 pA2BeghOUW6v+sU/7ALKsjftrbj4XP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167--xoVhLImODedg_GGUK49QQ-1; Thu, 07 Jan 2021 06:53:28 -0500
X-MC-Unique: -xoVhLImODedg_GGUK49QQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14657180A095;
 Thu,  7 Jan 2021 11:53:27 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-236.ams2.redhat.com [10.36.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB1435C67A;
 Thu,  7 Jan 2021 11:53:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: cht_bsw_nau8824: Move snd_soc_dai_set_tdm_slot
 call to cht_codec_fixup
Date: Thu,  7 Jan 2021 12:53:24 +0100
Message-Id: <20210107115324.11602-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Move the snd_soc_dai_set_tdm_slot() call from cht_codec_init() to
cht_codec_fixup(). There are 2 reasons for doing this:

1. This aligns the cht_bsw_nau8824 with all the other BYT/CHT machine
drivers which also do this from their codec_fixup function.

2. When using the SOF driver, things like the TDM info is set from the
topology file. Moving the call to the codec_fixup function, which gets
skipped when using the SOF driver avoids the call interfering with the
settings when using the SOF driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_nau8824.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index fd5e25ca05f7..da5a5cbc8759 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -100,13 +100,6 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_component *component = codec_dai->component;
 	int ret, jack_type;
 
-	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
-	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xf, 0x1, 4, 24);
-	if (ret < 0) {
-		dev_err(runtime->dev, "can't set codec TDM slot %d\n", ret);
-		return ret;
-	}
-
 	/* NAU88L24 supports 4 butons headset detection
 	 * KEY_PLAYPAUSE
 	 * KEY_VOICECOMMAND
@@ -141,6 +134,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt =
 		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	int ret;
 
 	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
@@ -150,6 +144,13 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	snd_mask_none(fmt);
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
+	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xf, 0x1, 4, 24);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.28.0

