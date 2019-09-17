Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4628B4888
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 09:51:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E6E166C;
	Tue, 17 Sep 2019 09:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E6E166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568706701;
	bh=3jTqupvfAJBEem+JUrkFj2ngMlNMl33WLi6WUJh99JA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NmXWCc/efGa8BACmaie1BFRowWmFC5j6jV8hp/pwWmK7HXgz/x0hZEeIlGkt/72hZ
	 pyL/ryagjYpyus/+mevQXv0UqAqCwhqSEKXFYJ2UfAwM6N3iP+57dgCEELxztxkdFm
	 RQoOxSGuCqieJ7RyYWrTJ3FjNB9FQHc4+IvKF4H8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1154F80361;
	Tue, 17 Sep 2019 09:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB54F80361; Tue, 17 Sep 2019 09:49:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4348CF802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 09:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4348CF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=netforce.ua header.i=@netforce.ua
 header.b="vKzM+Hbc"
Received: by mail-lf1-x141.google.com with SMTP id y127so2099071lfc.0
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netforce.ua; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ankm3LCZEaJD3BWJKIMuewTTlEirw0P6hVdl8ocB80s=;
 b=vKzM+Hbc3bGuttUwBZEJv443RDSwKnGtbmymNt+olccFjQqqh5swLf8DYx0dPG3G0L
 3JysYPqqjGtrXdC7oHPepKQqQh/mIWXFZsf4L1Xbcq59BK6RiYAGUZ9K4BI1WiRUQgcH
 wpAuC32IP7YqeFEi7sfHhs7ONvjv1OSr/duwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ankm3LCZEaJD3BWJKIMuewTTlEirw0P6hVdl8ocB80s=;
 b=sODrvpP9D+yezmPo1taeeEpnrZVP8lFV6qOanLQ+p2Hj30upiniUH4TNCL4Yd9gIM+
 gpyBNtqKBvw9XEgYuTI+a3JQNXGPGoZMUW+Q6iAHimtDhxEjxRioIXB17BDywBtxTihi
 NrhV01em+rUiJM0TBEfCiZi9gQoAdumkh9PwTUpCF+iGuyIih/yFt7vWUGDEaN/45HZ6
 3lWihOdq4syVOA4UMCshyB/z9jTP0SlWgr3tGUj4prAnD53614QTjJTpkg0RkUJyh25h
 OjyMBa9q6d3q5pZ9vybY4M9WqwcxgGqW3Z7Hj9j4q7Qy0V/jl1FhYwcnsnwdNOn1BmXO
 N9dQ==
X-Gm-Message-State: APjAAAUH0Ds0LNAp68fWlFBaO2IWDvKiDekJ03+FmEP3KssU/QmHH3K0
 NSYlTl8R5SHT7UXMHfUYXS0/4g==
X-Google-Smtp-Source: APXvYqx8VdH4sWRxk7OR+GjT8WaGAKs1L/dw8/Wbee8fdjRDoMTqIJd3Z2BFHlCKXFAd/hrmm9Zelw==
X-Received: by 2002:ac2:4902:: with SMTP id n2mr1343367lfi.0.1568706590256;
 Tue, 17 Sep 2019 00:49:50 -0700 (PDT)
Received: from rhea.localdomain ([37.46.255.109])
 by smtp.gmail.com with ESMTPSA id j22sm263563lja.4.2019.09.17.00.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 00:49:49 -0700 (PDT)
From: ilya.pshonkin@netforce.ua
To: ilya.pshonkin@netforce.ua
Date: Tue, 17 Sep 2019 10:49:34 +0300
Message-Id: <20190917074937.157802-1-ilya.pshonkin@netforce.ua>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, Jussi Laako <jussi@sonarnerd.net>,
 Udo Eberhardt <udo.eberhardt@thesycon.de>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Manuel Reinhardt <manuel.rhdt@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Olek Poplavsky <woodenbits@gmail.com>,
 Ilya Pshonkin <sudokamikaze@protonmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Add Hiby device family to
	quirks for native DSD support
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

From: Ilya Pshonkin <sudokamikaze@protonmail.com>

This patch adds quirk VID ID for Hiby portable players family with native DSD playback support

Signed-off-by: Ilya Pshonkin <sudokamikaze@protonmail.com>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 78858918cbc1..64a8d73972e3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1655,6 +1655,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case 0x152a:  /* Thesycon devices */
 	case 0x25ce:  /* Mytek devices */
 	case 0x2ab6:  /* T+A devices */
+	case 0xc502:  /* HiBy devices */
 		if (fp->dsd_raw)
 			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
 		break;
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
