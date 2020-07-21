Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB522790D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 08:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F2B1683;
	Tue, 21 Jul 2020 08:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F2B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595314318;
	bh=m8qlNw5ohP8ZUWRy/jU3aE2E5C2E+1UY1g1u1/Mz6ig=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sOTXM4JqSF4M9D0iJJaMxJbNs6Pdzrfh+LPYm9HKFc9svwzx4JKcx2a5JDc9Nahdn
	 tzrS9XELdrCONXMo6X4gvrU7OhoBeY/Cav+VJH5jvxOCY0xjxuICrUZ7aE2cj0hSIr
	 +EZU1EmrwCEZI2BoluuFe+5DUHc/hSqUdRZLEVm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF11FF802D2;
	Tue, 21 Jul 2020 08:49:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FBC7F80279; Tue, 21 Jul 2020 08:49:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B72EBF80268
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 08:49:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72EBF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GjFpxA73"
Received: by mail-ej1-x643.google.com with SMTP id l4so4311451ejd.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pykZW+14EY3zxFlazChZjg9gPQF2q2LZMNFE/iPOwa8=;
 b=GjFpxA73MYDoFHI5Q9CzGj2fzY9hadMfYn3QnK13VKWoBQNl9EbFenCV+jEqDuvBBP
 QJEIWoA3Md9DiZV9CEuMlzd7jU8j1VTQ02yfuFjWRiJy5m6NAWKS++entTeZBNLpqKKz
 n+0u7FaddPVlVLBn4TXoUWvRSfHK+Ffo61rNIt3b8paNHrPa/n5lMw3yWCUfixQo0JjN
 HNoYmVw1K8wVasyOgkSwQGOKfMkKwaZlJsUyHAAME25J/EmcdDPV7m5ZZ2m/AkVFMkA/
 A7uexGqhaA1y3O5cHApXpfqwxYWqI8rSrYZrRHJj+Jz4dBKMBT4ZLuGRLv2eQ7rnovhJ
 p9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pykZW+14EY3zxFlazChZjg9gPQF2q2LZMNFE/iPOwa8=;
 b=HxFdfnGrGKJytzd1x54cilZ0Oxwn/8dQyU6ziMtr770jVwP2tPD0yPx0LIlPkqR7cX
 V/CFelSEOWb1VtOv0OGmV0CGOk/n0OWAVH/elqXVvyot9bvvfwJxw15Y7WRKo5s7uXTX
 GOgoPwYU6W0C9/40CYvv+1zZX5mrEWwl/MUZvtskZbbsX43+k/SrEpFNnaHUH6vBaUGv
 NhyxpY/C7liDxwL+NC2mUBMvam8T7fvVp0JWiiSyUSKNvB6uNRQuF24D7VpkGJQJ2lmC
 U0k0PFE8bE65uXOmvLkGrz8U1RTdD75lwBdGkeBPkkVLneHrT2GqxwFTxhDqgXc6OAR0
 L3vw==
X-Gm-Message-State: AOAM5322I8wHQY1DNuG7jhpLD1R1G/YwUTWDO7CAAAV4gGi7w9EPX3tS
 hQZjVoKhqdn+aBinq2dD4cxtwVcWuFhMrA==
X-Google-Smtp-Source: ABdhPJx+Rdb8rpFlbDn5H0jiqaqJcbVx46Php5Mzp4GucY8HlV5xtJpgtdOoyBJqpjz0jr75CfXL6Q==
X-Received: by 2002:a17:906:c1d8:: with SMTP id
 bw24mr23403354ejb.91.1595314136004; 
 Mon, 20 Jul 2020 23:48:56 -0700 (PDT)
Received: from t5500.home (94-212-53-22.cable.dynamic.v4.ziggo.nl.
 [94.212.53.22])
 by smtp.gmail.com with ESMTPSA id bc23sm16515521edb.90.2020.07.20.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:48:55 -0700 (PDT)
Received: by t5500.home (Postfix, from userid 1000)
 id A1ECBA82E22; Tue, 21 Jul 2020 08:48:53 +0200 (CEST)
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/3] snd-usb-6fire: firmware load and pulseaudio assumption
Date: Tue, 21 Jul 2020 08:48:50 +0200
Message-Id: <20200721064853.9516-1-rene.herman@gmail.com>
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

I sent these out a week ago to alsa-devel (only) but am not sure they
got anywhere, perhaps due to at least the alsa-devel archive scrubbing
the text/x-patch attachments as "non-text".

The snd-usb-6fire driver for the TerraTec DMX 6Fire USB soundcard has
been failing its firmware upload due to a non DMA-capable buffer on the
stack. First of the patches kmallocs said bufffer instead and fixes the
firmware upload.

After that first patch the driver nominally works again but still has
Pulseaudio crap out due to struct snd_pcm_hardware.channels_min=1
causing it to recognize it as a mono device only. Comparing with e.g.
the TerraTec Aureon 7.1 Universe driver it seems that the solution is to
simply set channels_min=2 as per the second patch.

Third patch unmarks the snd_pcm_hardware struct const as it it is in
fact changed in usb6fire_pcm_open(), even though through a pointer, and
is supposedly trivial.

With these changes the card works again. Driver author Torsten Schenk
has seen these and is fine with them: maintains an external driver with
more options. I or he might time permitting start integrating more into
the kernel driver over time.

Regards,
René

René Herman (3):
  snd-usb-6fire: Move DMA-buffer off of the stack
  snd-usb-6fire: Pulseaudio needs snd_pcm_hardware.channels_min > 1
  snd-usb-6fire: Unmark struct snd_pcm_hardware const

 firmware.c | 95 ++++++++++++++++++++++++++----------------------------
 pcm.c      |  4 +--
 2 files changed, 48 insertions(+), 51 deletions(-)

-- 
2.17.1

