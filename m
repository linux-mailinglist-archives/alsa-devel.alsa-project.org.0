Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32017E08
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5645A1ABB;
	Wed,  8 May 2019 18:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5645A1ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557332612;
	bh=wU4AgNiXqP5I6zCxi7vmoOcerESdkkpqympT+DON0g0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jrSdmv62Cq+WfZ9HmOWjJfZljAX2Zm8xrw9mbStwC9/i91Ds89RbTGgxwOdBLlH86
	 rmXx91UjuZC1Whq/VCZmFcHCau+cnyve++3lYfxrTqtSVrEKvoBeYPQM41B5lZ/Bz5
	 aTbUG7ZgDNWBuiEz6WLJhs50Q4xKoi6Tw2aZjuo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAE4F896F0;
	Wed,  8 May 2019 18:22:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1755EF8075E; Wed,  8 May 2019 18:22:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C361DF8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C361DF8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="NgaNglaP"
Received: by mail-qt1-x84a.google.com with SMTP id i5so21780486qtd.17
 for <alsa-devel@alsa-project.org>; Wed, 08 May 2019 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OD2jCbTwAM9ArlwWtzqGvaqK7T857o9kqOtl5VL3lNE=;
 b=NgaNglaPcWZjPdk0WWbKecpWsNmEssi6UVvNif8+5V9qOHbIHDo31+Vel6MTcmn38k
 Z53g8pa6MAbduxx0MpnZPtscWcrDWaCkddAFMmGT8uPURFgamNXJn3X9hylZXmUozxYS
 it55Mw79e2/9MF/a3xT5KxJbGaMFPUU8lM7vf0kSglAWt0o62imT4Qn6RUxBwn0WSJcm
 0Lu0t6eFKhVyWeAQfq+TfIFYQjvZb6d7jW6oO/vMt9fQoYDcsdMrAp/7IGpffFmdFRJ2
 KeIq9KJ/HwJW7bfWohkTDNzMKXY5sp/7yvLyBB+xQRRusgAWqIZn9xq+idTzpsLWJUG2
 FPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OD2jCbTwAM9ArlwWtzqGvaqK7T857o9kqOtl5VL3lNE=;
 b=dKZhSSzd8ZaHWiUHpIRjv+NckDQwr96/qCtXTXbLKmaTzzXnTuF+ui/Es6PFDmX27l
 JP+9TTEniqUzmW/HI5KnnzObhxTgqitNfWdSNErmIjV4bLTSgOyzTZ7Jgkcp58tu9NfC
 OvLZ2jtwxfbs1rnqCQSesvCyMgYGg8IzE/L9i8pEX5mnMx7B8jKgfEid0nAUXE8T8oNq
 q6yFPb8FAREH05KbuTj66pVtfkQrh59FBd7Ku0xW7ShTRfqJ5yDmTXmn9I+bDwmWbvId
 NNTUjBympPzWSPqKRmm+9zwTgYUdAuXKR5zz4BVf6YsKM1vtK7k3NaFsH7BdgA9cIJln
 ii6A==
X-Gm-Message-State: APjAAAVNLmpkiUF+YuSnG883w05XzmjsRIYgR2i5PZniSFqtfjWTVnKW
 VMfrXxwKC2RVxhhf6ml6jIYp3pwfbaN4
X-Google-Smtp-Source: APXvYqwhttconqUO43y1ap0H1sg4jaPAGfS0I9Li8K+g0v6Kn38h6ToHtXkib1d9P6I3g7YhSejHrmV9cjE0
X-Received: by 2002:ae9:f818:: with SMTP id x24mr21750827qkh.329.1557332549989; 
 Wed, 08 May 2019 09:22:29 -0700 (PDT)
Date: Thu,  9 May 2019 00:22:23 +0800
Message-Id: <20190508162223.75322-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: max98357a: request GPIO when device get
	probed
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

devm_gpiod_get_optional() returns EBUSY after component rebound.

Request GPIO in max98357a_platform_probe() to support component
rebinding.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
v1:
ASoC: max98357a: manage GPIO for component rebinding
=> don't move from devm to non-devm

v2:
ASoC: max98357a: release GPIO when component removing
=> only put things that really need the card in component's probe()
=> don't use devm_gpiod_put() if possible

 sound/soc/codecs/max98357a.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index d037a3e4d323..0a14f9dacbee 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -61,14 +61,6 @@ static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
 
 static int max98357a_component_probe(struct snd_soc_component *component)
 {
-	struct gpio_desc *sdmode;
-
-	sdmode = devm_gpiod_get_optional(component->dev, "sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
-
-	snd_soc_component_set_drvdata(component, sdmode);
-
 	return 0;
 }
 
@@ -112,6 +104,15 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
+	struct gpio_desc *sdmode;
+
+	sdmode = devm_gpiod_get_optional(&pdev->dev,
+				"sdmode", GPIOD_OUT_LOW);
+	if (IS_ERR(sdmode))
+		return PTR_ERR(sdmode);
+
+	dev_set_drvdata(&pdev->dev, sdmode);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
 			&max98357a_dai_driver, 1);
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
