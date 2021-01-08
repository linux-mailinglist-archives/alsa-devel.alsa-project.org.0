Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1292EF39B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 15:01:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1E116F0;
	Fri,  8 Jan 2021 15:00:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1E116F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610114492;
	bh=Pv/yndSPAVxsshRuw3JgDVsdExY4eI/YMd7VBTIzzoM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVnTyrquL7qXdQbtYVU3D5b3YHcWb22NXXB9Rh6Hi4ZxqORDcc0yPznAYHFMqpW1S
	 keEhm+2wTTP6K3xleC16LmRSOeldE3BTTSG56UqUBZvSBx5X2Zvro801SsaYs3UX1k
	 Cp4gwPW/AQcG9XWneH+gaoyF0kiz8XTMIva+4mrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30FA3F8026F;
	Fri,  8 Jan 2021 14:59:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D41B5F8025E; Fri,  8 Jan 2021 14:59:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C0BF80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 14:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C0BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GOEfVOeF"
Received: by mail-io1-xd36.google.com with SMTP id w18so9856834iot.0
 for <alsa-devel@alsa-project.org>; Fri, 08 Jan 2021 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3YUKh3Pg+3HEmWFEzA6lV+W8xXHYJpJ+0Kz0Ylu/I0=;
 b=GOEfVOeF+iauU8s3f5xN+vySJJL75+qUxx13gPkp6BxYrf3ZpvDuz6iLgsQ+1qV84Y
 TtTnmu9ZLNEj9fSZsIHZeBF7IRDWzLvLoRurqNKGEJ2Ys1OVUt4zntLQYChpTuk/ZTmy
 lAXGAicWa/C9SFlDLPTWyNlMEm/xC1aKOhWguiaffn3r/eIe4vRr3aaAWUzMpUCa/qzl
 eDLd8Z3d1uGg5HnPbFIa7IIJxTrR5KISNk/hOKd206XMfSPFHaLdLKhC88FsNtOTQs7x
 qn/PK2LHIEMmjFm5mcRS5IBYY3rGX2Uxdom7V2KV4BEdclUtOEvMqx1laFL4vyDKAks8
 5TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3YUKh3Pg+3HEmWFEzA6lV+W8xXHYJpJ+0Kz0Ylu/I0=;
 b=uL+RWKSV7trd4BveRboHWnJ3v+Quu1lnkgBxLC4lbOKopaxnyH6P1+K54XBno9Mlwx
 9T9U/QIIZb+ctUFer9ISHCOAItPh52sh1UnB3OKUWb+zmQyJEyMMjcYD8UqmSrG8Ndqa
 1EkogC19NB9uqnR+f75RpSPpWT3RW0ckwnWqPFgMq+LfsSwTbcsLEQOkcmoPu1qL+WHA
 E1DKyDNjmAAG/Psxrp7ELNfGsz5lsfx8xYsnz1hBN1gMWmvAQpCmCWjtwq7e957f+1ZV
 cKhE3Lqe4k59sx+vCAweqa/fFyjWUSABt12yOOgH0wMmmqc7yP51l7rwGMzIdfCAyfuh
 HR4g==
X-Gm-Message-State: AOAM532nqkT9nC0vlAJj2Z1Obs5+K1r1wNrTpZrCOdypyipvVtMiRt+4
 5WNYPXQcZb3bLNx7H173RKY=
X-Google-Smtp-Source: ABdhPJyq3vyCn6Be2+obp8pxMdElBtgDGBCoHR8SfzvmL/r/TeRvqDvxO4BZCcIetZoFLBvygFklHg==
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr5458680iod.112.1610114374783; 
 Fri, 08 Jan 2021 05:59:34 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
 by smtp.gmail.com with ESMTPSA id l6sm7570063ili.78.2021.01.08.05.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 05:59:34 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH v2 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Date: Fri,  8 Jan 2021 13:59:13 +0000
Message-Id: <20210108135913.2421585-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108135913.2421585-1-pgwipeout@gmail.com>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
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

The tegra-hda device was introduced in tegra30 but only utilized in
tegra124 until recent chips. Tegra210/186 work only due to a hardware
change. For this reason it is unknown when this issue first manifested.
Discussions with the hardware team show this applies to all current tegra
chips. It has been resolved in the tegra234, which does not have hda
support at this time.

The explanation from the hardware team is this:
Below is the striping formula referenced from HD audio spec.
   { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

The current issue is seen because Tegra HW has a problem with boundary
condition (= 8) for striping. The reason why it is not seen on
Tegra210/Tegra186 is because it uses max 2SDO lines. Max SDO lines is
read from GCAP register.

For the given stream (channels = 2, bps = 16);
ratio = (channels * bps) / NSDO = 32 / NSDO;

On Tegra30,      ratio = 32/4 = 8  (FAIL)
On Tegra210/186, ratio = 32/2 = 16 (PASS)
On Tegra194,     ratio = 32/4 = 8  (FAIL) ==> Earlier workaround was
applied for it

If Tegra210/186 is forced to use 4SDO, it fails there as well. So the
behavior is consistent across all these chips.

Applying the fix in [1] universally resolves this issue on tegra30-hda.
Tested on the Ouya game console and the tf201 tablet.

[1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on
Tegra194")

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 70164d1428d4..361cf2041911 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -388,7 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * in powers of 2, next available ratio is 16 which can be
 	 * used as a limiting factor here.
 	 */
-	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
+	if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
 		chip->bus.core.sdo_limit = 16;
 
 	/* codec detection */
-- 
2.25.1

