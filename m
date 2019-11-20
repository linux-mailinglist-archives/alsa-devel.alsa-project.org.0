Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE91103413
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:05:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28741693;
	Wed, 20 Nov 2019 07:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28741693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574229934;
	bh=+Ch4s5U+4hNoWFsNuBsF22JYB3mK/00zDULitv5b/kw=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mjbf8l0lEi436Dd5mobul/ko5OwafBKwulAUL2h1Flh05hbVdsX2oQv+mak3KRJXP
	 dSc45C1s8ISWqbyLKKxTR4aHS1kDoOjQn2nOsGFMzhTcTQZvHTMimKjOJnqxIAcDa2
	 ZclKGcVZ6q74aZntR4FZ1DFk1P5WSXIdA/WcqFaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADB66F8013E;
	Wed, 20 Nov 2019 07:03:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2811FF80140; Wed, 20 Nov 2019 07:03:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D14A3F8013C
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D14A3F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="csjy0tOc"
Received: by mail-pj1-x104a.google.com with SMTP id d21so2012867pjs.21
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rHvSP+r9Lb+DeD2PMrAaobDRLM7O+VFG6q0IT34Km/U=;
 b=csjy0tOcIwufMLaU5xSZtfs0SGJF+nnovtK9gquaBsQ7B7+f5sYTLiVgImOrMBJWPa
 TBP4MiaR94snITMt1g7oOOLleVUuuzE05yKqCgPYS1HmDNGlANjOKoAGUoToCBByMfFK
 OhmcNv5WbZvYcvuth85LAaNoJ74kryn0/F6fpIce33r/VQwSyleIrXTlOwsvcMvBsN5I
 z7VsP1GBr3orbBioPL+RYH2bfKNklUg8jTroGjGHdynMBwp+Ewfqe5pX9U5ehYhz3ahC
 OOtM6qy2QSpodxqzmpXn4rZQOWiO72LbnZNS2g7Z7GmJYgLpKKktY6OY31OcMLHfrpzG
 LgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rHvSP+r9Lb+DeD2PMrAaobDRLM7O+VFG6q0IT34Km/U=;
 b=D3AVO5EnDU8KDU5cxxejJoLkhTag5MxTIrRvLaECWrMHBx3Csahu45lexsnNSMsKkH
 N2XIs66Mkq49aXE+Z9kp/DvHaGOXZ52SWA5Gqgh28FxcrlawzIFidLC+ivS2Qcro3i+Y
 cseY+qAZY5H1Gp53c1iJKzt2hM5pr9hr/gG0W9E6oy78VuLWuejsXMTKLmORnJ24cUS8
 +Ym8sWUijXAER+NpHwekLQJ3nAnZgdx7TDFBHt5qjgkXGAwKaP9Ppo2u5gGA8tZXNuZf
 PhZFQbUG6LN6DGens6bJngJDxNMKIr7+rJ2UV6IKgK9WTuePvQGpn+tLdkQwiJCblUe/
 ipVA==
X-Gm-Message-State: APjAAAVTiR8sdRd19md/XTCjMA3t860Qp3liznSkdUZvwYXUPAwolC6z
 pj4EdUif1/uCFolgWGk/Vna24OXtcHL3
X-Google-Smtp-Source: APXvYqyncm8dq+VdWQeOLEhiBIBHzjAAKv8i0ywII1O6PqXBzGB57jT4OPrmP+RVdhz7/LzIi7VIBmtvCc7o
X-Received: by 2002:a63:3144:: with SMTP id x65mr1196978pgx.283.1574229794345; 
 Tue, 19 Nov 2019 22:03:14 -0800 (PST)
Date: Wed, 20 Nov 2019 14:02:54 +0800
In-Reply-To: <20191120060256.212818-1-tzungbi@google.com>
Message-Id: <20191120060256.212818-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20191120060256.212818-1-tzungbi@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: max98090: remove msleep in PLL
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
 sound/soc/codecs/max98090.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index f6bf4cfbea23..8382a77586ee 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2117,7 +2117,6 @@ static void max98090_pll_work(struct work_struct *work)
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
