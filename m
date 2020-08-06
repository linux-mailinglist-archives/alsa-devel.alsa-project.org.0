Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477623DA11
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 13:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319211660;
	Thu,  6 Aug 2020 13:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319211660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596714327;
	bh=ETZ1kfcVQqM6vV95bnvi4k+Z47o/WXBRu3MjD3eXsMk=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ta87A0fwDlYcttet/pS4OTsk7eZy9G0cDOUKJHbWj0WUiLzxZw3EF6JWqlgDcQtgx
	 YGnoiPUipMKBA2+x+57PCCtzw9pb90Y80jNpF30lZJTBQn6eugpD7tMxEP9XmmyIXl
	 DJmjfjnniwUMzG4fstj6T4MKGq5WEspj7IhNUWGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 498FAF80150;
	Thu,  6 Aug 2020 13:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB50CF80159; Thu,  6 Aug 2020 13:43:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E2EF80086
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 13:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E2EF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e98zpcFd"
Received: by mail-wm1-x32c.google.com with SMTP id f18so6394740wmc.0
 for <alsa-devel@alsa-project.org>; Thu, 06 Aug 2020 04:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FgD7orWHpzGmDa/8oBTow9bXXYLWqdrIe7E2jYA9td4=;
 b=e98zpcFdf5jeTzGCpy37Vncq/4RgFwM3neMkkmIHc9+IgyqvYT4NZC5yAYUW6/xxUZ
 /JN6pkckiegsvGFAoDUPlAeB6E8GMvxcXE7NWs10l/8L/ZnDn6jsS0VGQtTYgWYHpko/
 o0Y6nMJMqnti8ZvmNc8/O27F13ulDw9/3oNp63pCgU9Gcjfq9OFgghiql13HZe5wByjh
 gA1XgN5oI6zQqU+rXvS/6O+h5QhNuCLik70uAQxUJEEs6WwTcOW/oOE+JHoflKf0yzco
 XlL941zSSN8Rv+/eUCBOXUsJ3WHlZKwIyK2QjBvLjA5gunlv77FZBBbq8L27IcPQMv5A
 bRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FgD7orWHpzGmDa/8oBTow9bXXYLWqdrIe7E2jYA9td4=;
 b=sjnJssLHhuEhdJ7o+la/wJHuILfolu92Rtq3E1DK4IksOYZ75S+3j/4xZ2InpBx3K9
 LV49++8My5KWHb/taCQILsC6cHGK+nYGD50MMtTrGioQt/2J2PXD4Efb4DoIgY5Fzq9i
 Rlx5nLrP0JkQbDEhk/SEuBej5tyjOQOFcS54mJ4IRL8sVK8FkZwlDnldR4ke0/5aqz/K
 bIdviqXvjh7daY5cSUn9jZ0loYrb9IzIK1eNxnFQ8n9BN5ujgCF+9vPGyzYhAHk37exK
 nfOLWHF+jyup/2x6K0SD2RhiY15q5Gm0E+kb1uFQs5nPHv7IbDeUCBVlmYuOUwIDs09a
 9PNw==
X-Gm-Message-State: AOAM531O8Xn/ZWw6UtGsd1vdS28CeZlmC2c+pe4EwBJ12YDhYGlrAm11
 dlkWk3HX3CN3rQ/oIc2W0nDSaqV8tR7jK8WOzOK6s6BJHzLXSw==
X-Google-Smtp-Source: ABdhPJxmujlVqEkoIBt7ZIQVgxDf0io7nNJTpTA79PUuIhd2XmsNqRZqZslm+wpWYepuMehQ+YcEctdv2bkD7OorKgo=
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr1954239wmh.140.1596714213129; 
 Thu, 06 Aug 2020 04:43:33 -0700 (PDT)
MIME-Version: 1.0
From: _ <tschunschi@gmail.com>
Date: Thu, 6 Aug 2020 13:43:22 +0200
Message-ID: <CAK=G1zU-F0=4JcHd2pZbKJX55gL-kAfhE6bxU_yvOon6=44tNw@mail.gmail.com>
Subject: Creative USB X-Fi Pro V3 volume knob and IR remote control
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I hope I'm in the right place here.

I bought a Creative USB X-Fi Pro (external USB DAC) which
plays/records audio just fine out of the box. It
features a volume knob and also an IR remote control (RM-820). These
controls didn't work.
I followed a guide which describes how to get the controls to work on
Linux using LIRC
alsa_usb driver (https://alsa.opensrc.org/Usb-audio under section
"Creative USB X-Fi Surround 5.1").

It turned out the method didn't work for my device (LIRC wouldn't
detect the IR device) so I did some digging
and found this patch
(https://github.com/torvalds/linux/commit/3dc8523fa7412e731441c01fb33f003eb3cfece1)
which enables the volume knob for the device. I noticed the USB ID is
041e:3237, while my device has 041e:3263.
My device is marketed as "CREATIVE Sound Blaster X-Fi Surround 5.1 Pro
v3" and only available since the
beginning of 2019. So, I assume it to be another revision of the same
hardware. The device model is SB1095.

I recompiled my kernel with the attached simple patch and the controls
including the IR remote are now
detected by LIRC and working.

I'd be happy if the change could be picked up if possible.

Thank you
Mirko

---
 sound/usb/mixer_quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index cec1cfd7edb7..199cdbfdc761 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -185,6 +185,7 @@ static const struct rc_config {
        { USB_ID(0x041e, 0x3042), 0, 1, 1, 1,  1,  0x000d }, /* Usb X-Fi S51 */
        { USB_ID(0x041e, 0x30df), 0, 1, 1, 1,  1,  0x000d }, /* Usb
X-Fi S51 Pro */
        { USB_ID(0x041e, 0x3237), 0, 1, 1, 1,  1,  0x000d }, /* Usb
X-Fi S51 Pro */
+       { USB_ID(0x041e, 0x3263), 0, 1, 1, 1,  1,  0x000d }, /* Usb
X-Fi S51 Pro */
        { USB_ID(0x041e, 0x3048), 2, 2, 6, 6,  2,  0x6e91 }, /*
Toshiba SB0500 */
 };

-- 
2.28.0
