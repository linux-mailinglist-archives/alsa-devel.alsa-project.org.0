Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A723F6F5A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 08:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA461684;
	Wed, 25 Aug 2021 08:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA461684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629872422;
	bh=yPThFMFTwpc216zFmRbfkrTSjWiMvkfjM2UeRIjBRUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZ9FR/s5XO6wVwVeeJ0775m25EVokUeuUHUr8vH9Jl2jQuFX5KoF7+qEPWyfTtTYH
	 0mSXyRCInJRsRWLKdIsVE8+OsRkg/jPKtgMbhioCYEAeS8JnjDaG/pvnRxb8LuL6GW
	 vxWBVl+QLBGziaD3hVe5KtZQWcmntgpe5aCfcuWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 750F1F80431;
	Wed, 25 Aug 2021 08:18:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC916F8026D; Sat, 21 Aug 2021 09:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26689F801EC
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 09:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26689F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com
 header.i=@timesys-com.20150623.gappssmtp.com header.b="j4A8Cl3r"
Received: by mail-ed1-x535.google.com with SMTP id d6so17450144edt.7
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qokDYwm5y8o6WtoZwHcyAOA0+R6VnBovyHislD9r3U=;
 b=j4A8Cl3r3ludZ8eHCS6QYEhbTCww6CsaVYRbaVFkZoNY3JyPJz6gT4oBv1idPVWdSC
 F6aTVhJNf5zzkpKhB51tiynvtMnV/6XsK9tal2KBgwIV6Pc+eiC95/kzDNinFRDe14xu
 YdgPlzCs7qRTnHpT6ncsG8wD4DpZB4RMmEx2SS1gDJ65+3k16ixogAylSV+9XxRkZ6mP
 F90Y9oBaMBGS6AfF7V+qKInvz0p3ARRo2pHGmTm9B8hBP4KaLEDr542OXE/fksqQ6kxw
 DoWpj5YsyXIOuZKs8kxdRhuiLZIYs3qrQKDnDmAjdhscNlgQQKYzof/QwOLKPJ74jiv2
 Pt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qokDYwm5y8o6WtoZwHcyAOA0+R6VnBovyHislD9r3U=;
 b=UfiQYQWAWlbdxarXXPkFNeQ1J00CKHGc+Rv9QEobNY5Lf5wsFx4qiIiJIxD1um8fvR
 HIZoeTdmbz44BbOEkkE1kBh+fvxdT0Em/xF4SzSGmW2u/FOTqQuywKn56AKIbEwmQwUl
 +73E3ypi2MYQCW03zRBn7WQucc6zajzSz7AIAXlRGvshPtUmqZlR+XHqU+MPe3NyvxSq
 hnH6Sqh8YAlNZFtBRz2Q+E/3cUqj3SxF/5W6AI+hDjPPjlN0+cPJ+lTTTHy1yznIGRi4
 r328Su3Dk1L50SzVQHGRBHIBZac+4v3jfUStBQUx4BkpZPtzsTNx7spitGWz5WndOqD7
 eivg==
X-Gm-Message-State: AOAM532AR0V7Tc5fFWHU1nLfuSZThLiZgE2gmvaZaGvG8LmqpvXuvAZb
 jvtGsE34+0DDfKkATt/IBEkJdeOa+ZRrwTtv
X-Google-Smtp-Source: ABdhPJxy8uM9o7ReWqnmQMuXnzv2zT+qRNbc9irW++c5tzxj5PhqW7meCkawRh+QekZtLASycR/PzA==
X-Received: by 2002:a05:6402:31bc:: with SMTP id
 dj28mr26522196edb.143.1629532552874; 
 Sat, 21 Aug 2021 00:55:52 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-95-246-39-126.retail.telecomitalia.it.
 [95.246.39.126])
 by smtp.gmail.com with ESMTPSA id i11sm4848914edu.97.2021.08.21.00.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 00:55:52 -0700 (PDT)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Subject: [RESEND 3/3] ASoC: ics43432: add compatible for CUI Devices
Date: Sat, 21 Aug 2021 09:53:54 +0200
Message-Id: <20210821075354.4140327-3-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210821075354.4140327-1-angelo.dureghello@timesys.com>
References: <20210821075354.4140327-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:18:36 +0200
Cc: ricard.wanderlof@axis.com,
 Angelo Dureghello <angelo.dureghello@timesys.com>
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

Add compatible for CUI Devices CMM-4030D-261-I2S-TR.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 Documentation/devicetree/bindings/sound/ics43432.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ics43432.txt b/Documentation/devicetree/bindings/sound/ics43432.txt
index b02e3a6c0fef..e6f05f2f6c4e 100644
--- a/Documentation/devicetree/bindings/sound/ics43432.txt
+++ b/Documentation/devicetree/bindings/sound/ics43432.txt
@@ -1,4 +1,4 @@
-Invensense ICS-43432 MEMS microphone with I2S output.
+Invensense ICS-43432-compatible MEMS microphone with I2S output.
 
 There are no software configuration options for this device, indeed, the only
 host connection is the I2S interface. Apart from requirements on clock
@@ -8,7 +8,9 @@ contain audio data. A hardware pin determines if the device outputs data
 on the left or right channel of the I2S frame.
 
 Required properties:
-  - compatible : Must be "invensense,ics43432"
+  - compatible: should be one of the following.
+     "invensense,ics43432": For the Invensense ICS43432
+     "cui,cmm-4030d-261": For the CUI CMM-4030D-261-I2S-TR
 
 Example:
 
-- 
2.32.0

