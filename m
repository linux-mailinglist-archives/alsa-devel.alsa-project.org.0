Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D985FEB1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 18:06:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C7D9E76;
	Thu, 22 Feb 2024 18:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C7D9E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708621615;
	bh=qOmiPs34pCUiDLhuSNi0Chuyh6/urNG1iNBP3mIBQVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g02jWGs/HV9lULObTNK7GxqGdihEzXZX/kEI6PQBEalYpQYRarIAa5hdqFpM2eYB4
	 xBfCzLYjky0k44UpVvT67pRg38LKwjcVsneEC6xNShiEvQ6AFurrd8swrGyqcyMy5V
	 zbQiVAZ36vAqixYT6h991Sxu19xli8whGvg9ZIDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2498DF805EC; Thu, 22 Feb 2024 18:06:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C85C7F805D9;
	Thu, 22 Feb 2024 18:06:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12025F805B2; Thu, 22 Feb 2024 18:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C8C6F805AA
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 18:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C8C6F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ez6mXMx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708621563; x=1740157563;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOmiPs34pCUiDLhuSNi0Chuyh6/urNG1iNBP3mIBQVU=;
  b=ez6mXMx8hJR4xrqv+jzLmyt3lEdguOk4BT/dGfKtTeXbpUteFnVfzi3+
   MKOwFH2FkRLGVB5Q12gZgHKd/9BSBd/YbJ/t9xWZBLEMRmiUSEmkiAYXf
   QEddMPFzQk8pgPF5TrPzG0+oX/jL3U16kTt0iAnfCJPh6kBQKEDWqUPgX
   qTJgI1bO3znIYayxvjdJ0+0IVlhy/THVa4/a9XK0fvjUpJJuDpJxwdGn/
   vrRF2Tim3Jj3DYLPVkOJoVIB4X3px/gyija3BrJZ0ZdbmfosLAKE3a0QI
   1SDHyfuruZ03XLzkMQs3EGn6s2/rPnJ6C8YkV8MQYtmlVwn4ATI92wlbd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20299253"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="20299253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 09:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827575245"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="827575245"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2024 09:05:01 -0800
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
Subject: [PATCH 3/4] ASoC: codecs: hda: Cleanup error messages
Date: Thu, 22 Feb 2024 18:06:13 +0100
Message-Id: <20240222170614.884413-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240222170614.884413-1-cezary.rojewski@intel.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P72IQT6723VYBTJ7XXP4HQTXXBO5LXB6
X-Message-ID-Hash: P72IQT6723VYBTJ7XXP4HQTXXBO5LXB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P72IQT6723VYBTJ7XXP4HQTXXBO5LXB6/>
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
index d9e7cd8aada2..8a9d0674555e 100644
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

