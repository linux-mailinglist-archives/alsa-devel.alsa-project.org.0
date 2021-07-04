Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD27A3BAD99
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 17:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4373016BF;
	Sun,  4 Jul 2021 17:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4373016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625411111;
	bh=uwv0Eh4Pbs4VWAXXN7AS1twbjlGITpUC+Z5Ot/y197c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6MlMRJ0JrXy+pg4yg9c77hnSBq6KJvIiKES4lKbIyYLdoDoR5nAt/m1F8T6Enq8z
	 il/qgWXLjj3sxh+p80WV4XnFdjoxpjLvuRMzHqt5BuSgucF2duykO+dRVpmYt5J81e
	 f9aH4Z5uuYv6MfYF8aHdOW7+U+z+kuAHgh39gPJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 236B6F804E3;
	Sun,  4 Jul 2021 17:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF305F804DA; Sun,  4 Jul 2021 17:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C4CAF80259
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 17:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4CAF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jljnPUsI"
Received: by mail-lf1-x12e.google.com with SMTP id r26so10212156lfp.2
 for <alsa-devel@alsa-project.org>; Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
 b=jljnPUsIyYOmIs1bcRM6CvDvrOai3kZAakwwBlqQGntYOUgSgs47WylFH1qIKsYKC+
 iU9LykHae1u+S7IqAysYp+1ZlZaYg6M90MSh5/Tfa3gno5yh5Y5pIM8cg736BKUnW6qg
 M7Gjmkcufn7kSA6Xc2+R6UdnScZR8L7Ks2hASqfoZtYOP5LnwOEzHTyqMJ71VSjMGOBL
 LlTkxPu6vx1yMjxrU6DFX24mcAhD0VFRtluDUVKoQL8As0bAFL+sliNnFfj+oStLwvmX
 I1TNoqtIY9hvHjCvidimX8g3KcrpvCTQbAHlytH4yigB+9gceTykGoDA2sls4CiximuB
 gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
 b=oo/6fhYXSxXjnuumorrrdMmGJ3tIrRV+hYctpYcrn7J41Kki7eMv0cpStCswmagnlJ
 ArHOBaponX/isR7f8oElYg9Nq5wA+71+UH59k1vvW6cG1A2cJiUhcjwDmAHo4seL75Xw
 raRgEFGv8bOEtyRQNCOwpS3IG7VNZzSDU5hTCGPk5outOCrNpgiRba5A9BTA3wQ4IMjN
 x3lpQ98FEfDGfvZOHILvVF3ajagxh17uJZvi9in2KXQLVnVxg8EanFleFf6QB7VFUntS
 9Rs9nUpYAcFxpUwSjPbzBJmNdZ/z8TXNCMuB5reZgjr2tFHo3A3llWOB18v9vsl2baCF
 o48g==
X-Gm-Message-State: AOAM533cVcga3KtR7H3oZeiEwTGJWmCY6LQ7/7gp9yhXQVZ5gD1FUFgf
 iDfsQnguUQJrEwFQw+DA+uw=
X-Google-Smtp-Source: ABdhPJy/JwI2YxTZ5dPeQTWsPh0lR7ycVqDTEoEwS3GApRiGqTq3JCPt4v2abR45jWzVMBV38Jyf0w==
X-Received: by 2002:ac2:5d23:: with SMTP id i3mr7091606lfb.523.1625410960022; 
 Sun, 04 Jul 2021 08:02:40 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id k11sm268826lfc.272.2021.07.04.08.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 08:02:39 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org,
	tony@atomide.com
Subject: [PATCH 4/5] ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
Date: Sun,  4 Jul 2021 18:04:49 +0300
Message-Id: <20210704150450.20106-5-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com
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

McASP only supports  Force-idle, No-idle and Smart-idle modes

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index a9573d441dea..8287fdaa526e 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -192,8 +192,7 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
+					<SYSC_IDLE_SMART>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.32.0

