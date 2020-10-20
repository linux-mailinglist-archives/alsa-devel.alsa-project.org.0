Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E98872934A5
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 08:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21730170F;
	Tue, 20 Oct 2020 08:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21730170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603174561;
	bh=KFOucrJPvz6Rdf1sDfrs9WKU23VHlKO7+ojFTTg4faE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NfNrtFksX0lkElTmwmsIQ5pWpzNrj2BFUFy4JRLM3zYuryOq7BOLD+c0sa6dzlaee
	 sochDDCBYNIMRn9KSH/IWnep83Qs4Qtq8LqzPzusvGGAKpscAXpYH7h7TAPEyI0r+i
	 5XYsUb8IPQ0ket/g4fZ+S3LNb9A1ygSXsaKfuZ8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D4F7F80216;
	Tue, 20 Oct 2020 08:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DE40F801F2; Tue, 20 Oct 2020 08:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 757BDF8010F
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 08:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757BDF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ADqaAPJs"
Received: by mail-wr1-x444.google.com with SMTP id t9so589204wrq.11
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=MqAFNi3NEmgvMsS+lIYBMCO9D/BYD7iXTUCBOFaFT5M=;
 b=ADqaAPJs2DfzYJxQYFnz4DlJroboYOPvNoRYxXUc2cBq2832vzELO6vau9ud4oCB2i
 6fcqaDRc3/VQllIGIIGAJkyd2C5v0rpXILRIYZk3ZwxwQnb8WiBJpwYYAMsdd/Wc1r6v
 li/Ut3/AauC38JWydNPhpnW7gZ0H6J2BtCAQJnn9mhR5rmCodpNQ3cE9zhQndHnwwP0L
 ETdgP+4qKn5llV65nI3qz0Mr1lYfvH4M9kFZrzscAhZQ5fRKmVsE1ee3r3yrJUTSIQ0R
 WQQhPrzMsykV7jgC9HAJ86tjISHkAXkiaMIjAOF2WasQOfQM+fBPXM1udzmkQKAJQCBt
 aGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=MqAFNi3NEmgvMsS+lIYBMCO9D/BYD7iXTUCBOFaFT5M=;
 b=bf1WTv03wBX6s3GeKD2dKXix69DtjdoAHhfBkCGf15pCkJeLmG5wiV+qyMYFAsrXzQ
 pF+ao7vUjHeyZ0OICkbd1+7LYsr5giquvGkAupbIsJ5OfZAwItmXtEFPuqjEcitDuOLK
 Lcw8NdrHPyUh5PC668+nMLeA5C4Y7JM/dTJGnTLrYpDzFsh9OIz7fvnXLqN84w7qPpdP
 IABZiandu96OhnIMSqtbpYp/k1KwgdMn7u2t5LEWsHtcYAYVXM0bzH13lWPzCzf98SrV
 XpiRtTDixOqkK0Yap0pQXIi2xb6fWsmipy6846WAKn5e+FZo5l0Z/giDc4cz0qG8Rcc+
 Q3Og==
X-Gm-Message-State: AOAM530dqMASUbTB8fO8bONk1vtF7+lHlFBr3sMM4ma0im2BbMzBaF+Z
 oDKZkyy2OWdLj9wLy2UtxQofpoY/MBA=
X-Google-Smtp-Source: ABdhPJzzUWsAd3iyMkDdTM/ze3s33XrUrv1lofIVve1AoyAO+tECSPnIJbqqqMv9jQh5irT/z1hgKg==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr1458829wru.173.1603174452804; 
 Mon, 19 Oct 2020 23:14:12 -0700 (PDT)
Received: from TAG009442538903 (public-gprs402829.centertel.pl.
 [37.47.204.206])
 by smtp.gmail.com with ESMTPSA id z6sm1027721wmi.28.2020.10.19.23.14.11
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 23:14:12 -0700 (PDT)
Date: Tue, 20 Oct 2020 08:14:09 +0200
From: Lukasz Halman <lukasz.halman@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Line6 Pod Go interface requires static clock rate quirk
Message-ID: <20201020061409.GA24382@TAG009442538903>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Recently released Line6 Pod Go requires static clock rate quirk to make
its usb audio interface working. Added its usb id to the list of similar
line6 devices.


Signed-off-by: Lukasz Halman <lukasz.halman@gmail.com>
---
 sound/usb/format.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 1b28d01d1..3bfead393 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -406,6 +406,7 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	case USB_ID(0x0e41, 0x4242): /* Line6 Helix Rack */
 	case USB_ID(0x0e41, 0x4244): /* Line6 Helix LT */
 	case USB_ID(0x0e41, 0x4246): /* Line6 HX-Stomp */
+	case USB_ID(0x0e41, 0x4247): /* Line6 Pod Go */
 	case USB_ID(0x0e41, 0x4248): /* Line6 Helix >= fw 2.82 */
 	case USB_ID(0x0e41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
 	case USB_ID(0x0e41, 0x424a): /* Line6 Helix LT >= fw 2.82 */
-- 
2.25.1

