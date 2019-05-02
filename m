Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED611343
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CD11781;
	Thu,  2 May 2019 08:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CD11781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556777877;
	bh=3eF2MQH+XCDH6PAGutdqYdm9bRBb4zC+LDo7kEQzh3s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ETP4EeSJWFp1u2L7VI+9WNCuhZT1CrZzpDhqGvhXiayob17R00XfKPVIzl8yhABmQ
	 +nf22avOZfU6DzoG+m6HihRwRWgLgl34zQV5D2BW8goVwTJ/p2OTBYC9nJMenXAIva
	 hZ7cYYCrZa67T9xx+f3FpAWxaRc48pXONEj75vtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06FA8F896C7;
	Thu,  2 May 2019 08:16:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 041A4F80722; Thu,  2 May 2019 08:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E19F2F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 08:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E19F2F8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 23:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,420,1549958400"; d="scan'208";a="139201489"
Received: from macchian.itwn.intel.com ([10.5.230.135])
 by orsmga008.jf.intel.com with ESMTP; 01 May 2019 23:15:58 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 14:16:15 +0800
Message-Id: <1556777775-7598-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: mac.chiang@intel.com, broonie@kernel.org, chintan.m.patel@intel.com,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: kbl_da7219_max98357a: Map BTN_0
	to KEY_PLAYPAUSE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

On kbl_rt5663_max98927, commit 38a5882e4292
    ("ASoC: Intel: kbl_rt5663_max98927: Map BTN_0 to KEY_PLAYPAUSE")
    This key pair mapping to play/pause when playing Youtube

The Android 3.5mm Headset jack specification mentions that BTN_0 should
be mapped to KEY_MEDIA, but this is less logical than KEY_PLAYPAUSE,
which has much broader userspace support.

For example, the Chrome OS userspace now supports KEY_PLAYPAUSE to toggle
play/pause of videos and audio, but does not handle KEY_MEDIA.

Furthermore, Android itself now supports KEY_PLAYPAUSE equivalently, as the
new USB headset spec requires KEY_PLAYPAUSE for BTN_0.
https://source.android.com/devices/accessories/headset/usb-headset-spec

The same fix is required on Chrome kbl_da7219_max98357a.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 38f6ab7..07491a0 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -188,7 +188,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 	jack = &ctx->kabylake_headset;
 
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_MEDIA);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
