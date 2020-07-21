Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012B227C5A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 12:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0397F168F;
	Tue, 21 Jul 2020 11:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0397F168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595325648;
	bh=qwPh9XMDojVLx5E8b9JeHxAvfqGabcI49vRgeBfJA6M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lmFgOZqjDCtAr/vtDZrwcH6ZSIWEjgEFf9v5TNwo1PeIwrg1w1aKccG8e3B/ZSmZz
	 vFOT+/jyauDkmPZwXEyspFkO0K79cgfXFfLUlieknYTuWiEJApCMr5ZFrJ2cq9vPrk
	 WUwIzF3+eDMaiDxLVcXXZ8Nj/Klq9Dw49eqE7iwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F017BF80278;
	Tue, 21 Jul 2020 11:58:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6399F80268; Tue, 21 Jul 2020 11:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23710F800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23710F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OGJC+hdJ"
Received: by mail-ej1-x641.google.com with SMTP id ga4so21018246ejb.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dhpcm0yLZHFIwOpwBJUXcOyEc60xamd0HpSTYmQcEug=;
 b=OGJC+hdJ4LMnbv3/v3W1w52YaPdPKOrTbnGVNQM0KKtcw8Pq1+xxN+I5Ipy2ErIGZS
 rj86xU8XlVFZzAyWcbtdS/E+28FwKgy7lmMUGikkZTbf8DttfwyqqLiqF1rNPJ36Tiu9
 2a06t4p5vakPDfidGPgIhOBAgySr9fQhb2nf+ND0VjiSpTKHdUsoQnDcphhL8ohQuyXD
 XZyUh7jCCG9AF+PbK7YTID09PyjBH9bl4F/vvHhUGDtZoj8QoOInPFe7oh9Q631DxsfW
 7IDrLDQF7PIX40ySAEz8/D6QzYhddQQAVBlZYCjRbxmtz+FfR3TbT+MTldl+wTvtxF14
 mWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dhpcm0yLZHFIwOpwBJUXcOyEc60xamd0HpSTYmQcEug=;
 b=avb7bDD7EA28J4yRevHLAFz/6lJQ5ZfS3tQosoJ5uQuaB0gsLE1x7Yt/fLSLViolU0
 3WcT6/LQRWrZE5kzzK1Ct9k4TF4IdL+Me8PUFnlmsrG3N76+pfEUhQs3acFhezWDsroS
 GECdeaEuLLZjWZQOlIM3uVQ5BYwyT/g0vNo9zwhp+kVAZyNYFCxhWOOBXXo1k6FVlH3a
 LN9Cbo0AiC918b5/wE9c1k9PilajmA1K5cxvsLFz/CbllIWR6XXQo53O7Q2pH9pMkTWh
 UuOuPcxoTrmPq9hWRGkA5RktzrKEjE5FaHZbh+Nr657uSN8Su3v5UC8htlcgH45Y6NIV
 5+Gg==
X-Gm-Message-State: AOAM531Fpoc7qWd/+AnCbIjYyjtuBO3A6vYNzH+yH6p3+yiTnWh1hkdE
 mEjGT7DNsa8C3+lH8BzRhZ4SoI9Zb02stQ==
X-Google-Smtp-Source: ABdhPJwqQFPl47sUvnCho74s9cJNx+mXgn0nY3mOHkEXTGEkgqEHwuKFr/OdsSHkdxL2n0zhjdCe4Q==
X-Received: by 2002:a17:906:e25a:: with SMTP id
 gq26mr23836314ejb.152.1595325490555; 
 Tue, 21 Jul 2020 02:58:10 -0700 (PDT)
Received: from t5500.home
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o17sm16426079ejb.105.2020.07.21.02.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:58:10 -0700 (PDT)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 0/2] snd-usb-6fire: firmware load and pulseaudio assumption
Date: Tue, 21 Jul 2020 11:57:46 +0200
Message-Id: <20200721095748.16224-1-rene.herman@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Hi Takashi.

v2 of the earlier today sent out "set" for snd-usb-6fire, although now
only two patches left, incorportaing the requested changes.

The snd-usb-6fire driver for the TerraTec DMX 6Fire USB soundcard has
been failing its firmware upload due to a non DMA-capable buffer on the
stack. First of the patches kmallocs said bufffer instead and fixes the
firmware upload; also makes it more alsa-generic by using the "goto out"
structure. Note that it only looks a bit ungeneric as a patch due to
also needing to at the same time unify its failure path: it's obvious
when looked at post-apply.

After that first patch the driver nominally works again but still has
Pulseaudio crap out due to struct snd_pcm_hardware.channels_min=1
causing it to recognize it as a mono device only. Comparing with e.g.
the TerraTec Aureon 7.1 Universe driver it seems that the solution is to
simply set channels_min=2 as per the second patch.

With these changes the card works again. Driver author Torsten Schenk
has seen these and is fine with them: maintains an external driver with
more options. I or he might time permitting start integrating more into
the kernel driver over time.

Regards,
René

René Herman (2):
  Move DMA-buffer off the stack
  Pulseaudio needs snd_pcm_hardware.channels_min > 1

 sound/usb/6fire/firmware.c | 95 ++++++++++++++++++--------------------
 sound/usb/6fire/pcm.c      |  2 +-
 2 files changed, 47 insertions(+), 50 deletions(-)

-- 
2.17.1

