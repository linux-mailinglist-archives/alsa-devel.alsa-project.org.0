Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7E2E2969
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 02:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8EA17F7;
	Fri, 25 Dec 2020 02:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8EA17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608859417;
	bh=61W2ADln8CGfeCDpCMIXOa4GFuEa6nwq3WlIDk6OomY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3X+x3r7+fl+7mtdNYLLOEtOEH7b2auf584fJBpJKv2i5WY4dH9D700k8+FWdExhG
	 zbgFQcll5av4/UUgv00HmEJK0A9ifZXIz+f6gYEFCSLb8ukxtdug3QzOiF5vRDjgkq
	 uNoivLZnOpOXjNMlnFUwDBwzZK2kO5zpkw2Vv+BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92CCF804C1;
	Fri, 25 Dec 2020 02:21:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55DA3F80234; Fri, 25 Dec 2020 02:21:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E875F800CE
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 02:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E875F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VaT/v3w7"
Received: by mail-qv1-xf35.google.com with SMTP id az16so1812870qvb.5
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZaO4eapAX6YcgJ1V86x/6Z20q4JeFpmENkNZ+Vh17YY=;
 b=VaT/v3w7fIQwr4+nVx3FsfDl6sKjC+xegP3RJ5aJvK2cB6iqn22/Dyc/o6WByT7IMX
 9J5q1AOse3dJO7cN+i2XYBmjnq+cksvabKySclkdaJbH4TMqOwjxPWvAkK95835uzpBk
 kbZ/CCKTXsIMvhyEcJTKJQIHIEdsitddgiaZ/qVCX1zBMIsOV1R7jrb3bT5tuIZO2rrD
 O2q/azdZcystt+XcuDNCoftIjo0y5/G4tqyVbcF6dpugV/TvbnZctQggiQMrzIuhZoV4
 BLOyT0Tsg2m+aYBYfSzuvrgjmV9M1l8ObtKZ6n4jyVejzpjwQdUuvgp6zZzW7TnSHyPc
 KhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZaO4eapAX6YcgJ1V86x/6Z20q4JeFpmENkNZ+Vh17YY=;
 b=dfUyV0quhtOYSrjt0stGtGje5T+k93kn0dVjH7Ba/EPPPRvVsLcF4+TszjFfkl3kcb
 C3eDorFqRUNH+CzVFSX0IWl+0YrMC+NEhDzi7vKjrUPlN8gK+JK+ZgRkC5qW/0YpbyRk
 Hz5WZK5a12s/7oQLvt6FhpCpini+QSsmiaTICH+DtwGKNzyDW1PmPTT4fWqNn45SbrRj
 HIOhTBB492E0ky8ErskX+ce3b91R/tt4FruPKVoeov/rl5T0wo8vdExUZbrPDg2Ewd0P
 zGcCwzNR6u+bTZVumTPpd8+xMVlBR3z59V8wciwOCmCpYeNBm8N10FXgojH2//wpAErd
 rNbA==
X-Gm-Message-State: AOAM533jISl8r5+qKcolXjmf0sSHdh7lLUc2Ug9Wlo410Xi/+ZTKaHZl
 j+wxxoRxU9+MJkRBMuenmGY=
X-Google-Smtp-Source: ABdhPJyYpB3bNPAkvnqr+S9zrV/ifONY2HfJ9E0hXD7pAU/LgUB43e0WkZWZz0Pddacjq23iySU+TA==
X-Received: by 2002:a0c:ca13:: with SMTP id c19mr25994106qvk.21.1608859259481; 
 Thu, 24 Dec 2020 17:20:59 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
 by smtp.gmail.com with ESMTPSA id x47sm17583505qtb.86.2020.12.24.17.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 17:20:59 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Date: Fri, 25 Dec 2020 01:20:26 +0000
Message-Id: <20201225012025.507803-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225012025.507803-1-pgwipeout@gmail.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Ion Agorria <ion@agorria.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
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

Currently hda on tegra30 fails to open a stream with an input/output error.
This is similar to the issue referenced in [1].

For example:
speaker-test -Dhw:0,3 -c 2

speaker-test 1.2.2

Playback device is hw:0,3
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 64 to 16384
Period size range from 32 to 8192
Using max buffer size 16384
Periods = 4
was set period_size = 4096
was set buffer_size = 16384
 0 - Front Left
Write error: -5,Input/output error
xrun_recovery failed: -5,Input/output error
Transfer failed: Input/output error

[1] states "Due to a legacy HW design problem", implying the issue applies to all previous tegra-hda devices.
The tegra-hda device was introduced in tegra30 but only utilized in tegra124 until now.
For this reason it is unknown when this issue first manifested.

Applying the fix in [1] universally resolves this issue on tegra30.
Tested on the Ouya game console and the tf201 tablet.

[1] 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on Tegra194")

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
---
 sound/pci/hda/hda_tegra.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 70164d1428d4..f8d61e677a09 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * in powers of 2, next available ratio is 16 which can be
 	 * used as a limiting factor here.
 	 */
-	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
-		chip->bus.core.sdo_limit = 16;
+	chip->bus.core.sdo_limit = 16;
 
 	/* codec detection */
 	if (!bus->codec_mask) {
-- 
2.25.1

