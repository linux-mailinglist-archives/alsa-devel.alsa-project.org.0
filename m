Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63946A927
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 22:09:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CBA52239;
	Mon,  6 Dec 2021 22:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CBA52239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638824993;
	bh=WPo5jJMZbcxZ9YBxeC22J4huR5k0uiEUk0ey8doEIvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bvOs/d0/VF+qHQmkmCb2xEyx/9hzun3tyLrgqFhZId3zJNhn8evRXZFnD9a84DfxF
	 C2rj1XHO60DSsIZGRQSaxy0s5HDYvb5y7NfwOAeuGkwb9sKt12WssUTNMdJbLNzWpx
	 wv5gq/MjhR5fdEku1mIO7hqM8LkeS3CvabRuDoaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC23DF804F2;
	Mon,  6 Dec 2021 22:08:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098B7F804E4; Mon,  6 Dec 2021 22:08:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBB4AF804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 22:08:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBB4AF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="o1bTX+KH"
Received: by mail-wm1-x336.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so763708wms.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 13:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YX3z1j0kzxdvMhDSejpCHfZc5AO9HN6Aa+IgB+x/Zhc=;
 b=o1bTX+KHRMpwsOkiIqgpUIjvyUmvD53mDXlD+vGqffgVmm8qJ7Cf6HWOJLDXxM/95l
 /aYPybuvQecvUySKNdXWctZGD/eV4GYgJ96bLmmhZNbyopw1FesRDiGpPndIT5WDh1VJ
 YfNSt+f8NAonf0G5HVeqcq2/OrYWwADIW/k5OK3PBE4M5DbeK3EyMibyAbnOpw4qaLoc
 ype84W++66UlcV7pG1+aXsZXpSRthM/jZuMU7EQPAyEdWYWUhahVbmzReMdYpGXAMX0e
 4SrgOmaM8sBbPI4ktE1ZiUngws1yL/Q683qmB8st6ONL8wsSE3Q5W60w/HWQTtZ3F6Wr
 BM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YX3z1j0kzxdvMhDSejpCHfZc5AO9HN6Aa+IgB+x/Zhc=;
 b=JuR1dlinpioyw8wHl3bprxqo+J2BSXlDw86CNrWfB/MWbDowQAxQkr3D7xNBO/KRH9
 3VgzGDRjjw2rtDu+AwYUcF3LheXU9cwtn1kADCE2FZw2Z3KRXjrr0uq8l0BgjC9UaCSC
 A4JmBHt5FgcMci2dTLCnEcM11nrw+xr+PxKa/LR1vZCXgeiGrVwc2jkF5Uf1SdADZm62
 j46x61RToVkE5XmoHyiC92RlfD6G7FHZj4rCigIJithkrgon7ivFwEvPB+XRkZqnFuk5
 cCa+bxCoMOqwbIOeBHEm55o8zNKJ+zuY3LfLOmdFEd3xjjJoCVS2Eah+Yaxd4DTWlvs9
 hiiw==
X-Gm-Message-State: AOAM532DXBQhExeNQsYX27Y/NHRsqIyCNMkwLMT5dHlnRJuUl2FPiDPt
 bW4XTpiQFb0/4ngJZNOzWZlncR9eNzM=
X-Google-Smtp-Source: ABdhPJx4RP8hbzwbyl65YVzTdgXZhHlULJsQKpP1erTYrNto/KFeKGG2NxVTACIVfiteVBnE6EANyA==
X-Received: by 2002:a05:600c:17c3:: with SMTP id
 y3mr1277188wmo.136.1638824900455; 
 Mon, 06 Dec 2021 13:08:20 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] ASoC: meson: aiu: two fixes (for 5.16)
Date: Mon,  6 Dec 2021 22:08:02 +0100
Message-Id: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

In this series I am proposing two fixes for the "aiu" driver, used on
Amlogic Meson8, Meson8b, Meson8m2, GXBB, GXL and GXM SoCs.

The first patch is the result of me trying to understand the way how
we get the DMA buffer and address for the audio data. I'm not an expert
in terms of DMA. From what I understand we need to inform DMA core
about the limitations of the hardware. In case of AIU it's DMA address
registers only take 32 bits, so DMA core should be aware of this.

The second patch is what I could come up with to fix the infamous I2S
buffer underrun issue, also called the "machine gun noise" (MGN) bug.
After a lot of testing, debugging and comparing vendor code with the
upstream "aiu" driver I have come up with this fix. I have written down
my thoughts in the description of that patch. To be clear: these are my
thoughts, unfortunately I have no way of proving this other than asking
other people to test this patch (off-list I have already received
positive feedback along with confirmation that both 2-ch and 6-ch audio
are still working fine. Even with Kodi's menu - which is an easy way to
reproduce the MGN bug - sound output is fine with this patch).

@Mark, @Liam: It would be great if at least the second patch could be
queued as a fix for "for-5.16" as this solves a long standing buffer
underrun.
This issue is nasty because it can occur at any time and it can even
loop forever. Christian provided an example with the speakers on low
volume: [1]. Imagine the same sound on "medium" volume after playing
a movie.


Changes since v1 at [0]:
- Dropped a paragraph about FIFO IRQs from the second patch because
  Jerome has a valid point that this behavior can either mean that
  AIU_I2S_MISC is related to the FIFO or the FIFO consumer (= encoder)
- Add a bit of documentation explaining why we set the
  AIU_I2S_MISC_FORCE_LEFT_RIGHT bit (affects patch #2)
- Collect Christian's and Geraldo's Tested-by as well as Jerome's
  Acked-by for patch #2 (thanks to all three of you!)
- Cc linux-stable for the second patch
- Dropped RFC prefix


[0] https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov
[1] https://patchwork.kernel.org/project/linux-amlogic/cover/20211205180816.2083864-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
  ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s

 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 19 ++++++++++++++++++
 sound/soc/meson/aiu-fifo.c        |  6 ++++++
 3 files changed, 25 insertions(+), 33 deletions(-)

-- 
2.34.1

