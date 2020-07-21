Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1CD227903
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 08:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF87C1661;
	Tue, 21 Jul 2020 08:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF87C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595314253;
	bh=+6+CfJqTCRjYGjSy43hSsRiEdEgGbBK6CFZvPjWV5MA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDwk5nzbixmuU42hyH8wfnMXHNs1Ca9e9cOgz9i6tEZj36Tfk6rBtyH4KBmyim41t
	 L0C9s0ChlGcgm9Ve+BzzDTTJLH3xztEsSOrc/siEUVreEQC88YBTcXMD5Oej4YgZir
	 R+u7WpGP8StAe/8vq+MxHx4LcAHRZSVhCA/pHq7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1EE8F80268;
	Tue, 21 Jul 2020 08:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBD7AF80278; Tue, 21 Jul 2020 08:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD64F80212
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 08:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD64F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eH4pjgWa"
Received: by mail-ed1-x543.google.com with SMTP id z17so14484302edr.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 23:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aN8gWAp/VGPW89W/9uqgp3LhRn0j8k9haJPNfjwa9HI=;
 b=eH4pjgWadMy2t2kdMoU3YopcQ3REM30aYXlS3ovvYTvrixCzCNJQTge0jK29DGhYc0
 JsFu7/bbb6QolT74uvM4E3hleC1/mMb7/cVYmg5imrTWTHB5Va7/pwi4SB6pt18sJQ7P
 P1TKN6jkerWsKAkfitg28yoMqIqXKqcEBs3Cp6x4qC5jiELBDJM7OJe+2gREB9qOlG9P
 GJ2h/zToj4cIgXxnfTDKZeBKb1F3BENbKPuzyh6XsysYpjSH05sT2vEeyJKLcCQtDsiT
 cXg5TJREH4z4DqBve9TNFgmtsGh7AwC917C/j97IkZjqTzVDZ8R9wkSxB0dKnTVtn62n
 E5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aN8gWAp/VGPW89W/9uqgp3LhRn0j8k9haJPNfjwa9HI=;
 b=c41QyS0ts5ds3O8YqLZgxNJp1lEthtLAzAbhVSRsan0GeI7EolR++hLVkBXOJ6bdJ8
 sHWqC91JZkeOObLSpNQcKpxRGVzOQkMH9ssaUC8/QhxsLiHSXFeCHDDf4y7qth0jbPLx
 d+wQjJUIkdNGsn1CaxBaFftj/DMGlrg+bYWXEw1k/RBG7m2ct7yN2SMJIwi/lqp6dOD5
 jZpxzCOzJWjVI0zZgopAigvOTzGwWxpNTgJ7Wv3icPMsuc6Nwo+tEAWNqlnV5LqXceEA
 rytEXIA4BM/lMXd9pEUuVovZjYd2QEBj4EZOy7pKT/PKQtlLsaH2GXlNqaQGqHTX3azs
 AyHg==
X-Gm-Message-State: AOAM533y4k2iM+sLm+P7OOdpm5rzuIxUg6TjJgCWgxRAZTxeSl8h9+pg
 eFdpIVvAyY9Ac+s2eL237R054n367BClaQ==
X-Google-Smtp-Source: ABdhPJyzp68sBFcK9KuC2RjLjmMJJXrE8e7Y7oQ0Eq3eEiJSG4LkzLVd4PFzmtlj6fgkFeSIzyAb/g==
X-Received: by 2002:aa7:de05:: with SMTP id h5mr23771142edv.275.1595314136302; 
 Mon, 20 Jul 2020 23:48:56 -0700 (PDT)
Received: from t5500.home (94-212-53-22.cable.dynamic.v4.ziggo.nl.
 [94.212.53.22])
 by smtp.gmail.com with ESMTPSA id yj16sm16334176ejb.122.2020.07.20.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:48:55 -0700 (PDT)
Received: by t5500.home (Postfix, from userid 1000)
 id A8E9BA82E44; Tue, 21 Jul 2020 08:48:53 +0200 (CEST)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/3] snd-usb-6fire: Pulseaudio needs
 snd_pcm_hardware.channels_min > 1
Date: Tue, 21 Jul 2020 08:48:52 +0200
Message-Id: <20200721064853.9516-3-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721064853.9516-1-rene.herman@gmail.com>
References: <20200721064853.9516-1-rene.herman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Torsten Schenk <torsten.schenk@zoho.com>
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

Pulseaudio with snd_pcm_hardware.channels_min=1 creates a mono device
only.

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pcm.c b/pcm.c
index 88ac1c4..cce1312 100644
--- a/pcm.c
+++ b/pcm.c
@@ -58,7 +58,7 @@ static const struct snd_pcm_hardware pcm_hw = {
 
 	.rate_min = 44100,
 	.rate_max = 192000,
-	.channels_min = 1,
+	.channels_min = 2,
 	.channels_max = 0, /* set in pcm_open, depending on capture/playback */
 	.buffer_bytes_max = MAX_BUFSIZE,
 	.period_bytes_min = PCM_N_PACKETS_PER_URB * (PCM_MAX_PACKET_SIZE - 4),
-- 
2.17.1

