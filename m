Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F66DCD9B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 00:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8414F102D;
	Tue, 11 Apr 2023 00:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8414F102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681166480;
	bh=Q+bTa5oWFv/tzALUdVrSwXQAZdaYfE3mk+N4eTqg/1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrtolJxt0I1UDmyyEPE/bm753VnnSTBKU7Y0/LiKkYV8GOjKx8lQ7Pb9OMb8hOhG4
	 0wR4TzBnx4mwrFqHrOAYd1Hq2uqM8pilOKQcILetHQ8LJagVqJeSyTDNS/7KG59Pbs
	 192uqxZEVz8cRaRCsQxxfovimD1o1vVNbmNOtUYk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7453F80549;
	Tue, 11 Apr 2023 00:39:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BA4AF8052E; Tue, 11 Apr 2023 00:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61886F8032B
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 00:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61886F8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dHR8/FV/
Received: by mail-wr1-x430.google.com with SMTP id d9so5799339wrb.11
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681166348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEW0TzE/iHLHzvHGUl4AlDs0HbakMRi0xvPaOvsk9N0=;
        b=dHR8/FV/VB9elKmpSAI11sosqQDYQcCFq6jASEZo+UpPU3+vILSJQuioDyDmtNvHXf
         8u4dnSowc6o1mn6woXbnveHCEWdNhXZXUWsoATMtaEx8nI+XRbwu1okv/F6YHrmPxH+i
         9Q0VBDJs4BVSPHPZExrlCyqKVzB+p8G8ml4/nrC3z3dqWMBi6TnQyLG9nqCP4u79xhvx
         VL+GkBPP50Ez87OC3rF+87FPDQGNOOO7XcbIU+AqzEOYMGrz1GG4RxAz4FPXcYjH1Ep/
         3nCjTZPWchY/VTI4SIERMzRrV41pHntk/4eY9P4YHTGRb67w5IjyWoy0b+TN81uaim+h
         4g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681166348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEW0TzE/iHLHzvHGUl4AlDs0HbakMRi0xvPaOvsk9N0=;
        b=G9BFfD4myvGpZAe5m2shMdT+FH0gWflKsQ6EmIPg5IjN5tIM+Q+2XY+6BeA0yy3TfF
         Jl+N4OTgHVEvK5SoK3Xf5tsLWFkIbQDBDU7G2b9pPbKzkCpQ6CoY64g9D7cZ6kPfe37x
         y9Fc0TK+ebRjJdrZQjdQi8gGekONwFkxcNd1N4z2OhX4BusrSGXWUZ6e8hrSOCAIk/9P
         bpBmpNkcoRaLHNLQcaNLCcTvKfVqtIorfGN5ykkOfPS1nyK5kNCZ4M4/KfVo9pR5YNda
         mi4hxOe4GrkM9QyPkklQJ3Ei6nV4FSEH4xIF/IqysIPzwDxe3Q3u3End8m0MFGGNVjou
         rTUw==
X-Gm-Message-State: AAQBX9f08Qvz2Wcr33PN2j50wvwTpjklW1ExNKcL8pXJNDoP1JUsr8Cy
	Pz+dXLSIY/rI9xr1NgGB41GEghoxHun6cQ==
X-Google-Smtp-Source: 
 AKy350b+wO4MJpD+u43vMScwz8azVmGnCXgzWl1VMIGqdNN/fQ1K6gERKuwr5WmiqLpz21Q+CGs6bw==
X-Received: by 2002:adf:e785:0:b0:2ef:b21c:f6a0 with SMTP id
 n5-20020adfe785000000b002efb21cf6a0mr5474454wrm.53.1681166347771;
        Mon, 10 Apr 2023 15:39:07 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 p17-20020a056000019100b002f1dc56579esm3637350wrx.2.2023.04.10.15.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 15:39:07 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: ep93xx: i2s: Make it individually selectable
Date: Tue, 11 Apr 2023 00:39:02 +0200
Message-Id: <20230410223902.2321834-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MLDYZLVFVOSZIJMCRW3SS2EHBRAHRX7Z
X-Message-ID-Hash: MLDYZLVFVOSZIJMCRW3SS2EHBRAHRX7Z
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLDYZLVFVOSZIJMCRW3SS2EHBRAHRX7Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is necessary to replace EDB93XX specific SoC audio driver with generic
"simple-audio-card".

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
index 34870c2d0cba..38a83c4dcc2d 100644
--- a/sound/soc/cirrus/Kconfig
+++ b/sound/soc/cirrus/Kconfig
@@ -8,7 +8,11 @@ config SND_EP93XX_SOC
 	  the EP93xx I2S or AC97 interfaces.
 
 config SND_EP93XX_SOC_I2S
-	tristate
+	tristate "I2S controller support for the Cirrus Logic EP93xx series"
+	depends on SND_EP93XX_SOC
+	help
+	  Say Y or M if you want to add support for codecs attached to
+	  the EP93xx I2S interface.
 
 if SND_EP93XX_SOC_I2S
 
-- 
2.40.0

