Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746E02A4B6A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:28:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 137AD16AC;
	Tue,  3 Nov 2020 17:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 137AD16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420915;
	bh=d+ldXSRbsv1Imz7drCjCyVPAynPcnbEcAo2ACfetZ0U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=idbNcqyCQjvfV+MsTIaCAO9iZksxXXXyJDCQ7Ngd4WqLtJ8ycaeax4VtAVm7QzkmW
	 BYcZw0yJR6cF9TATya8r97Eo26SdZqcF8bwwiQui/6yBlnaZJtJkTBSkogDyzDwwy+
	 37/zrpAuuJ5tPpa2q9cnNDoYcn6rKC5fLDeOmJ8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 680BDF804BC;
	Tue,  3 Nov 2020 17:26:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BC6CF80171; Tue,  3 Nov 2020 11:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CD75F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD75F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CH26fav4"
Received: by mail-pf1-x444.google.com with SMTP id 133so13808677pfx.11
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 02:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MZVixt3bJyBbHov5aMt9uShWeZEKD4hMZGn5JRPvjGI=;
 b=CH26fav4EiFBNQLGJlILxppem54CB0ajkcpfJiQokiKF8w2ciRqHiM5Vn7qWl986Wh
 nr31g4d3lCaRE4OjZDV4rLR9lblTO8dmp4YZ7nn4otbne7JfsqwQ+muFLcUXGkeD7xcu
 B6shll/g+kanR5s80BNcRLr2N4jDdo8uKJb+YZ56coqpHzHq8FbMbw5i7WKuIu/8W7OT
 IJsYqSfo+ZMRJa8RmXoaR7+CodqFlb9qTV6+SQo3SIG57qhdJhIxYKXRlaY+x7oLnYRQ
 9nnBsQ+LPkK4v1iI1JOuLhECgSruym+taGG4SZSxF/5yKHufHBXUvKEZ5uxiiObFnvT5
 uKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MZVixt3bJyBbHov5aMt9uShWeZEKD4hMZGn5JRPvjGI=;
 b=fbaC7vLCfLab16t+0fu4X+dyAAInuq3h0VtQKuUVLjme8SKcxjfNuwjVt78RJCRGu7
 YEbVhMtuKvSnjuTaVm2FR/gPJQwnHD1oAplJbeUv3oAGOEvR0MFoM97xNpaluB3pZKX6
 n36FP1XbyvIkO3E0ZvpSDp7bSImP1Usqf2VyH/fOr02eMxvzQzjRW8l4g1tCmfnzixC1
 q14BzlAi3pP0j9d3tcoJQEmvuQVkIxwtQ5iqBxIs0xNXaUmQjgGVoVlfXIEBVYwzemQG
 Y8rfL0BC1hQN0ycPdj2Na4ZjMB5dLvznXbqzs97tIL1P5HZ5mZmrelzwLMg/FV44GNa0
 hFNQ==
X-Gm-Message-State: AOAM530iLo7O4RBlQWRMen9qH5j+gw3rkUdiZ4G2AAPulKyqbCki7Pbt
 sLD6TjLhh9jIC+/321n4KCM=
X-Google-Smtp-Source: ABdhPJwl3L9RBgprLZouaOiIYJ3YcKEX3m/JWYT5+6JobmNGSf2xUCiX9/4D/Oo2O6SjeoZ3Kgdlmg==
X-Received: by 2002:a17:90a:6501:: with SMTP id
 i1mr3150107pjj.30.1604399611905; 
 Tue, 03 Nov 2020 02:33:31 -0800 (PST)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id y4sm3041866pjc.53.2020.11.03.02.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 02:33:31 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: usb-audio: add usb vendor id as DSD-capable for Khadas
 devices
Date: Tue,  3 Nov 2020 18:33:11 +0800
Message-Id: <20201103103311.5435-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Nov 2020 17:26:07 +0100
Cc: alsa-devel@alsa-project.org, gouwa@khadas.com, gregkh@linuxfoundation.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, joakim.tjernlund@infinera.com,
 alexander@tsoy.me, jesus-ramos@live.com, nick@khadas.com, art@khadas.com,
 davem@davemloft.net
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

Khadas audio devices ( USB_ID_VENDOR 0x3353 )
have DSD-capable implementations from XMOS
need add new usb vendor id for recognition

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index b4fa80ef730..c989ad8052a 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1800,6 +1800,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case 0x278b:  /* Rotel? */
 	case 0x292b:  /* Gustard/Ess based devices */
 	case 0x2ab6:  /* T+A devices */
+	case 0x3353:  /* Khadas devices */
 	case 0x3842:  /* EVGA */
 	case 0xc502:  /* HiBy devices */
 		if (fp->dsd_raw)
-- 
2.25.1

