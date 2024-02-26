Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B2867574
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:44:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA016DE5;
	Mon, 26 Feb 2024 13:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA016DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708951493;
	bh=HNPW3gZaSH6fjCMtquzM1dI/vEaBhFuoLxGDia1XD9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b/V8pnt9tvJSlr+gOIHe6fSAvIA4SjIj94+ubUqHfhZYUfnXpnX364SprSf4KRQ0i
	 qFSJlpxl88itHk2wE7S9fjm/eLsvpXJ0U+XyccCzbAOKG5HfWnKp33GmsMzCEKhwTW
	 mCPCTAb0UbvNkMZaZUbgSVsH6pAU+uw1kH3AH7Ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB66CF8063B; Mon, 26 Feb 2024 13:43:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF08F8064C;
	Mon, 26 Feb 2024 13:43:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B16CFF805EB; Mon, 26 Feb 2024 13:43:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AEE2F805AE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AEE2F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BArNKX+X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951394; x=1740487394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HNPW3gZaSH6fjCMtquzM1dI/vEaBhFuoLxGDia1XD9A=;
  b=BArNKX+XwSr+cw8yXaLfMDxkoMXUOqgboQcXXf/OYWmK/15aIduA19ZY
   oP6mw3nx8o58eLSAA7H7CKCpUiVacNMULPYLyndL8Tzy/ROIGo1u3/s5L
   OydfCrCXFgZiR/2mP+LT4E88B+SHb2eKWr99u7XZtmyv6XryVFBS1KQt9
   isxhGgXycSEPzl036Yx2/PMrI7UyyoeQsHpSE0C2mKn4OnG/ZgvHZnrSu
   MC9dJnarex/6c/fHJEvjAfhrZ3G2Dz1Nc2luWtuJJkbt7QZCNwIeYvh2x
   kqWbBDln4FLJ1uz7cxx+5Z12c+vNGyvyzPS52D/Vx0z6K84TZqvOHMjEX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658263"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="28658263"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="6688619"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:07 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 4/5] ASoC: codecs: hda: Cleanup error messages
Date: Mon, 26 Feb 2024 13:44:31 +0100
Message-Id: <20240226124432.1203798-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PVM4JPAHOJPQX27SGQFVENY7HJGJ2CNU
X-Message-ID-Hash: PVM4JPAHOJPQX27SGQFVENY7HJGJ2CNU
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVM4JPAHOJPQX27SGQFVENY7HJGJ2CNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Be cohesive and use same pattern in each error message.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 7c6bedeceaa2..5a58723dc0e9 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -198,19 +198,19 @@ static int hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_device_new(codec->bus, component->card->snd_card, hdev->addr, codec,
 				       false);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "create hda codec failed: %d\n", ret);
+		dev_err(&hdev->dev, "codec create failed: %d\n", ret);
 		goto device_new_err;
 	}
 
 	ret = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "name failed %s\n", codec->preset->name);
+		dev_err(&hdev->dev, "set name: %s failed: %d\n", codec->preset->name, ret);
 		goto err;
 	}
 
 	ret = snd_hdac_regmap_init(&codec->core);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "regmap init failed\n");
+		dev_err(&hdev->dev, "regmap init failed: %d\n", ret);
 		goto err;
 	}
 
@@ -223,13 +223,13 @@ static int hda_codec_probe(struct snd_soc_component *component)
 
 	ret = patch(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "patch failed %d\n", ret);
+		dev_err(&hdev->dev, "codec init failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = snd_hda_codec_parse_pcms(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		dev_err(&hdev->dev, "unable to map pcms to dai: %d\n", ret);
 		goto parse_pcms_err;
 	}
 
-- 
2.25.1

