Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F262061
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 16:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 383B91666;
	Mon,  8 Jul 2019 16:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 383B91666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562595673;
	bh=t5N3tjBptQT7fSL6ZinhWtU1IST1f0tfqmJEFT+hhg0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RoePI2KN8CZ4Ta0MwaEhUTX+IP+7at8KNVjfbZtlnviEZCgPWOt7ZQXRTeFGPnDfp
	 2eIyV6UeI/ZWOmBrQi59czXvscTdOXUCotrl7hCeuGUh8P+vYNusqtsQueffK6ghPJ
	 99k3fYj2X22Z+VBI/sFu9KvUykl3OlWOPfwHKY4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D82F80268;
	Mon,  8 Jul 2019 16:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 839C6F80268; Mon,  8 Jul 2019 16:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC0D0F801A4
 for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2019 16:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0D0F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HGrO8kvv"
Received: by mail-qt1-x849.google.com with SMTP id l9so9763920qtu.12
 for <alsa-devel@alsa-project.org>; Mon, 08 Jul 2019 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=wVu1oNsX7r5pN8OftWVGUKexsa/cE8Xu3yCWivZAPqQ=;
 b=HGrO8kvvhWi37EYPs4qaimvruqxDbUavKtgm8jMM/YnK5DcqimIa38GAGvpAcgIoOR
 p3Sx9qE8AgyCnhLeYsc/FG7kT7fT3YtRElgYe7FJ1hocwis1FN3pv0eYnRDG1PhHuUqo
 TM1YImJBfEdeohU5bdBdhcJeDXo3aVAFnw4dh4jImuXfXlXwfSCuzLLUxkth8tK5A2A5
 RHUFmCKYMTSXGCgwGgeiBm+b1zlWHhqwlX0Ati/c7UuAW67lsIN+bzL9BTCVrj626tgo
 dYmAKJxzSEv+A3FTNqlm+gAHYIWHpl9tWK2rxRT7kIJbNojW1M0OaLEZv7EgwWsPzrKi
 S83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=wVu1oNsX7r5pN8OftWVGUKexsa/cE8Xu3yCWivZAPqQ=;
 b=B2cBibJTEemaJ4Go0wzlm/XJL3cJXLeg+kiDFi3uN6r5QukF9TmEgnwQyeomyKEUGe
 uHdyDXLVZuqj/zJZSpFcQa1AKd43BoxPejYfhpy34Fk9D5KhGfz+Zn3NGuCQP97A7En5
 NacC82XIfbKNm2vq9D53JwLxnRqAe25yo0nHIm80ZB6tL6bSRHc/b+XBiXxVFsgI36XB
 6mOeGPtGHB5mc4nCJwXNKbVkxYNl1Bz5he9T1HCG7HS38bvkJHakQZQDKKKUk36APDN9
 XEGySOXMarPbHCPO+i7n5XM8J6KdUkhjSFoXO6U11DKW3MIj8ZM1wfgzO7n2u9Q9/rv1
 WYCg==
X-Gm-Message-State: APjAAAUCBvpvWbYnQ+mlX8QA1MtHcWt07s28Pndz9bYmqdeeDqsz8eKd
 YipwUKuDq7A1FtNtqNlQOTYmNIXOgkG9
X-Google-Smtp-Source: APXvYqyWHO2ZrSrtmrxqXkAJfYi6K0jWeIYV4bteOZipaunU3GxvYEybsI4ddZGnr1jJHwBEoY0ttV/D+n0K
X-Received: by 2002:a05:620a:1456:: with SMTP id
 i22mr14161505qkl.170.1562595561529; 
 Mon, 08 Jul 2019 07:19:21 -0700 (PDT)
Date: Mon,  8 Jul 2019 22:19:01 +0800
Message-Id: <20190708141901.68797-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RFC PATCH] ASoC: max98357a: use mdelay for
	sdmode-delay
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

max98357a_daiops_trigger() is possible to be called in atomic context if
the .nonatomic flag is equal to 0 in the DAI links.

When cancel_delayed_work_sync() in max98357a_daiops_trigger() is called
in atomic context, kernel emits the following message: "BUG: sleeping
function called from invalid context".

According to the DT binding document, value less than or equal to 5ms of
sdmod-delay should be sufficient to avoid the pop noise.  Use mdelay
(i.e. busy loop) for such low delay should be acceptable.

Fixes: cec5b01f8f1c ("ASoC: max98357a: avoid speaker pop when playback
startup")

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Hi,

Not sure whether this fix is acceptable or not.  Because in the document
"timers-howto.txt", it states "In general, use of mdelay is discouraged
and code should be refactored to allow for the use of msleep."

 sound/soc/codecs/max98357a.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 6f0e28f903bf..16313b973eaa 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -20,20 +20,10 @@
 #include <sound/soc-dapm.h>
 
 struct max98357a_priv {
-	struct delayed_work enable_sdmode_work;
 	struct gpio_desc *sdmode;
 	unsigned int sdmode_delay;
 };
 
-static void max98357a_enable_sdmode_work(struct work_struct *work)
-{
-	struct max98357a_priv *max98357a =
-	container_of(work, struct max98357a_priv,
-			enable_sdmode_work.work);
-
-	gpiod_set_value(max98357a->sdmode, 1);
-}
-
 static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
@@ -46,14 +36,12 @@ static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		queue_delayed_work(system_power_efficient_wq,
-				&max98357a->enable_sdmode_work,
-				msecs_to_jiffies(max98357a->sdmode_delay));
+		mdelay(max98357a->sdmode_delay);
+		gpiod_set_value(max98357a->sdmode, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		cancel_delayed_work_sync(&max98357a->enable_sdmode_work);
 		gpiod_set_value(max98357a->sdmode, 0);
 		break;
 	}
@@ -112,30 +100,25 @@ static int max98357a_platform_probe(struct platform_device *pdev)
 	int ret;
 
 	max98357a = devm_kzalloc(&pdev->dev, sizeof(*max98357a), GFP_KERNEL);
-
 	if (!max98357a)
 		return -ENOMEM;
 
 	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
 				"sdmode", GPIOD_OUT_LOW);
-
 	if (IS_ERR(max98357a->sdmode))
 		return PTR_ERR(max98357a->sdmode);
 
 	ret = device_property_read_u32(&pdev->dev, "sdmode-delay",
 					&max98357a->sdmode_delay);
-
 	if (ret) {
 		max98357a->sdmode_delay = 0;
 		dev_dbg(&pdev->dev,
-			"no optional property 'sdmode-delay' found, default: no delay\n");
+			"no optional property 'sdmode-delay' found, "
+			"default: no delay\n");
 	}
 
 	dev_set_drvdata(&pdev->dev, max98357a);
 
-	INIT_DELAYED_WORK(&max98357a->enable_sdmode_work,
-				max98357a_enable_sdmode_work);
-
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
