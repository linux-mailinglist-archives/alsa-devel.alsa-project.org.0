Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4E106719
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 08:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 914071810;
	Fri, 22 Nov 2019 08:33:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 914071810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574408044;
	bh=JmCD3WcmLhrQr2uh32/O0UYbdClol0JFxtQ2YR3we5A=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGyqd03nEF0yYbK2J4aLVtUtKZHfek0W8dshOpq0tToEzTOozrDnp418IjTNXIN75
	 /nO9SbyrsDXFZlowY5XnNRsYmFU9ODGWDVq6l5GlsHAYb0YCxJADHNhZd1FRFteeBJ
	 2syBzI9PiI+GpI/X1aRE18pne8sYpy9+sjumeNM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBBAEF8015A;
	Fri, 22 Nov 2019 08:31:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0703F8015A; Fri, 22 Nov 2019 08:31:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53384F8013F
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 08:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53384F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="l3G6jvUb"
Received: by mail-pj1-x1049.google.com with SMTP id e12so2564690pjt.15
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 23:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=62HsBMsR0K1XYhez3cyuww5t6C5JPcJi30pomEYqZJs=;
 b=l3G6jvUbL7gZllxCkzYb1khAbd6zg3oNlNpMb0U/mp8eLU2TXHMm0G9XN8qJ37dXkT
 ILkyxdccDgshbaV1BpGdY8fNfqiW/uU3wblQE+PaRS5b22FYr6AyjxCvL3imW09gi2Km
 4e4ubyIDYXLbyR1J4JmsEVwn0scWboG22ca1wFKsP4ocuew4KJCn3BDwd4H8DstlTC5L
 uipRiwkMcrLqlwfg3nEzRaWAgwzcEUYqs+IpRB7ajdokHzoMh0kWjuNG3d6dQxffPBl3
 TuFYcooyGqqEZR1mSkMyPJmnHh+kngf9ISfr9W2PlRM6vPdLxz8EYrVeU8DJyeXR4B64
 B/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=62HsBMsR0K1XYhez3cyuww5t6C5JPcJi30pomEYqZJs=;
 b=opEWnhGUcCi3PJesv8co6f4w1GLY9LZedQYXFt47ZCP3ACzYzjwaQw7Q5Pl6uJuVjo
 6sazBIwzxA8Wy4El852RYK7TDTIOmB9/01CyAz294IG4o2xIIsX4yX5frr4fETA0lMuK
 O5Tl7GmOyNhNi4Qm8DJpzUIBXeB1pmiSoWBQRy/4pUAd3v55Z42uU6wY4lPBxFqxVSAG
 nFjq0URdRTT2z//QZ0ojQiAdguVhFaFfdJWU59rtszVgr7bA5eEDvmKg6en4nkw/IADo
 xfyWGFTnlRYv2NFAhUbQsNPtd2qZUCsmeR2dRwUsk2UAKr30feZzLvxVDrYzDZRamCYL
 W7ZA==
X-Gm-Message-State: APjAAAV5Cyzst4IhVjWn/wmDy0GngTZ1fBayXKaEqAjlP3EZR/+AuyOL
 x3H0ACUjardHeAIcLS+bdBMODAW8ImED
X-Google-Smtp-Source: APXvYqzaUpQWNwgXMQ6tYQPALrnlWkyxLkiAxk+FyrtQ/cSKY2BTjDCKml1cEXoxis9xj67lVmijVdRMJ7Sp
X-Received: by 2002:a63:201b:: with SMTP id g27mr14261230pgg.56.1574407890148; 
 Thu, 21 Nov 2019 23:31:30 -0800 (PST)
Date: Fri, 22 Nov 2019 15:31:12 +0800
In-Reply-To: <20191122073114.219945-1-tzungbi@google.com>
Message-Id: <20191122073114.219945-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20191122073114.219945-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: max98090: remove msleep in PLL
	unlocked workaround
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

It was observed Baytrail-based chromebooks could cause continuous PLL
unlocked when using playback stream and capture stream simultaneously.
Specifically, starting a capture stream after started a playback stream.
As a result, the audio data could corrupt or turn completely silent.

As the datasheet suggested, the maximum PLL lock time should be 7 msec.
The workaround resets the codec softly by toggling SHDN off and on if
PLL failed to lock for 10 msec.  Notably, there is no suggested hold
time for SHDN off.

On Baytrail-based chromebooks, it would easily happen continuous PLL
unlocked if there is a 10 msec delay between SHDN off and on.  Removes
the msleep().

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/max98090.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index f6bf4cfbea23..12cb87c0d463 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2114,10 +2114,16 @@ static void max98090_pll_work(struct work_struct *work)
 
 	dev_info_ratelimited(component->dev, "PLL unlocked\n");
 
+	/*
+	 * As the datasheet suggested, the maximum PLL lock time should be
+	 * 7 msec.  The workaround resets the codec softly by toggling SHDN
+	 * off and on if PLL failed to lock for 10 msec.  Notably, there is
+	 * no suggested hold time for SHDN off.
+	 */
+
 	/* Toggle shutdown OFF then ON */
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, 0);
-	msleep(10);
 	snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
 			    M98090_SHDNN_MASK, M98090_SHDNN_MASK);
 
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
