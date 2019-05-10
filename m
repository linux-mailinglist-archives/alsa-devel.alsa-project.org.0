Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008B1B595
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1933916C2;
	Mon, 13 May 2019 14:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1933916C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557749625;
	bh=8YCbiwR8DHy+NoJLqXcXsG0yAExL+KGpYNFhdg1EoSs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZeucJpeVX6efAtmFc5nj6k7RtGW08glZwlOaB8TDyVWMCETPzt9t8kBDOZ5Cgr2pc
	 eu73KuYEk+P5QolK7wUhXCAT0IHYqorFS7AI/8Tmvuv/bi5QJbf0j4CMZYqwcEMrmC
	 oLWfBm9X3fUJn8BUbnZVSylpiBLJ7yK8u5hpyhpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD48F8972D;
	Mon, 13 May 2019 14:11:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF8FF89726; Fri, 10 May 2019 12:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F17EF80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 12:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F17EF80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XVwFUIhN"
Received: by mail-pf1-x444.google.com with SMTP id u17so3002116pfn.7
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 03:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KX7bhkHg3YMiIW9gA14W3R58YbYmx+bP30Xm0xrams=;
 b=XVwFUIhNnY7Vr6G0aenGbpxQIFAnTaqlTy+WW9vXqYfZ7BsFK1craSiGjLjskBZ086
 jbqTXWZM8AX8P9X1zYSTEC4ojR013LY0fP2JjGdngkSA9Erk90Twz5nYPz+6kf6zxhgA
 nB66O3jG2lSN9twe6lwecwgoTtcSgzMStOdJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6KX7bhkHg3YMiIW9gA14W3R58YbYmx+bP30Xm0xrams=;
 b=Ug7UVxDk74/aU2Mo08RYiVhyGzTlxu1mPgTb/qqKqJBnxuDgCcJp/E8R9ANSgWspMW
 6bZfborpZTBoTgs/AYtT2S7SXiZ4R8jbI9srv4O/A8Nm7SchfdD/d0r/n6xawWLeb7+G
 IvJxzg5mXAwlB9dMSC+IyyUwLCxKH7eKbZhn7F7q0IySIhv3gi7DBwYRxCmnWwc9V3hU
 LQ2f/ovkK4jl649qZGX9WB8KylAjjSLbQ7LtSO7kzeo+OoRsMtg2QipLMCsCv7w84+Ch
 LqbYycXhoU4wb5Yu7K1uGAoq8Wz48jmARUAdiz8aByDKvxkbL4L+LjR7XntEAFj5ilJG
 tpyQ==
X-Gm-Message-State: APjAAAXpb7j13uo3+AHqVnv+9xiGmvk7DgoGxEddPxRAQDFShLumByVd
 vMiOS48LNxHO3mprf76c+OAbLw==
X-Google-Smtp-Source: APXvYqxZydM/ao+0NNXc/nuBz/ZksXOF4YpflsZ26aodWr5g6Jq82oUw3d+UMo0H41Xf5RHg+UTInw==
X-Received: by 2002:a63:2943:: with SMTP id p64mr12654828pgp.151.1557483998262; 
 Fri, 10 May 2019 03:26:38 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:6cc8:36d1:3ceb:a986])
 by smtp.gmail.com with ESMTPSA id u75sm15317797pfa.138.2019.05.10.03.26.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 03:26:37 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 10 May 2019 18:25:59 +0800
Message-Id: <20190510102559.76137-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 14:10:23 +0200
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Jon Hunter <jonathanh@nvidia.com>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: max98090: remove 24-bit format support
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

Remove 24-bit format support because it doesn't work now. We can revert
this change after it really supports.
(https://patchwork.kernel.org/patch/10783561/)

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/max98090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7619ea31ab50..b25b7efa9118 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2313,7 +2313,7 @@ int max98090_mic_detect(struct snd_soc_component *component,
 EXPORT_SYMBOL_GPL(max98090_mic_detect);
 
 #define MAX98090_RATES SNDRV_PCM_RATE_8000_96000
-#define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
+#define MAX98090_FORMATS SNDRV_PCM_FMTBIT_S16_LE
 
 static const struct snd_soc_dai_ops max98090_dai_ops = {
 	.set_sysclk = max98090_dai_set_sysclk,
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
