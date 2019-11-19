Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59078103852
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 12:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDBA316DE;
	Wed, 20 Nov 2019 12:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDBA316DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574248475;
	bh=dOyaS3H5Ee991pCdhpqTWtUCgJl07z7gav1iUT92Xr0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jMyxZQFB4tQo6zJMOtTZYddXjeyFAYhSurESVdzXXqevmPbTobpqOe9Pr0aRp9jC3
	 1swo6c1MXzkroOYwoBmftiTk0RCu48V30ZgZqwQh3dihbC3S1WS5PGArsD2jI+c6xP
	 o//squneOUHRm1Xhim50VSIARARdPRoj6IIiXOm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C3CF80273;
	Wed, 20 Nov 2019 12:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35424F80137; Tue, 19 Nov 2019 10:08:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B11A3F80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 10:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11A3F80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jTgcused"
Received: by mail-qk1-x742.google.com with SMTP id 71so17147490qkl.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Wt+oX9fkrAikGfzu2MKOa2qUy+fReDWIJawgofjTH5s=;
 b=jTgcused0CeDh9NfglkHNJxwebk9PMHr2U245TK/0iVXUDll8rqWBQlhPv3LwN0zuT
 AV5ZjJmmcOvJaNG2fJHzYOFkIpN5o2yWIqZlfgXP91ne16eRtokTQqYPsPECIzj6mMl7
 /55LH/z6j1a1cRU0XcB0yx8SqQ/YzINOjeTlO5oZSVV++irsn5ANtrvWZhVY2+ZhoILe
 XqnS3ocdsWmuysi6XmnH19fC0mrh1UewWdODzdGHJsN0ihvyn2QxHliXJsm6wB3cck3C
 52CZenuhtmU9pe4jvxZivlpY7YrG0Ad0sbKy4/hj8lYhw4Of+XgS5aEmKWm8VoTHHLl2
 LswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=Wt+oX9fkrAikGfzu2MKOa2qUy+fReDWIJawgofjTH5s=;
 b=fR5cg1PWE3Y+E+ZO3sUfUXuQ6B98cb4No16IJHOjQrwlBWjUFguWA6zaYut+IF0oQr
 oe8j6m9K9XxZf65PhpgJPpMJOv3pNTSyrbcMcnuHRVA5Y9xkFONlQHPzc59rwNSD4dm5
 NSO2e4EV0TOnVaSpxjzluUHmOP4h/PVXIP457jhLVScpj8nCQc6CFlUxwfAh5vkJut7S
 80XBLkLYVH1L1NRQg5YintINiPqY/7zJNbaY/kwRdOAopoFAyZJ2X6mMyOoHz2zErSSh
 6qHvY1M1zJrlWU6zf58eY6ft74CqzHJHmY5Rn93eJaD4hi1rugQ4YohelY6zw5o0P0nZ
 FLwA==
X-Gm-Message-State: APjAAAX74LCf3WmKDr0dmGrNA7A8Ydi34/bRwz+DEwWLy9BXNtWzj8Di
 SE1nXckOvXcpGRVDDhARiGc=
X-Google-Smtp-Source: APXvYqw/11kH/4uK+tZ2e1NapPLZgnNtB8M1EUCLNCTjD73AdoNE1r9bY0qO4Nprqn/U+CWxXUz9gA==
X-Received: by 2002:a37:ae05:: with SMTP id x5mr28138441qke.243.1574154531933; 
 Tue, 19 Nov 2019 01:08:51 -0800 (PST)
Received: from dc740-pc ([186.0.171.141])
 by smtp.gmail.com with ESMTPSA id s75sm10022708qke.14.2019.11.19.01.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 01:08:50 -0800 (PST)
Message-ID: <c759bc50134ea434bfed0a183e0ce72984f5b609.camel@gmail.com>
From: Emilio Moretti <emilio.moretti@gmail.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 19 Nov 2019 06:08:48 -0300
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2019 12:02:18 +0100
Subject: [alsa-devel] [PATCH 01/01] Add VID to support native DSD
 reproduction on FiiO devices.
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

Add VID to support native DSD reproduction on FiiO devices.

Signed-off-by: Emilio Moretti <emilio.moretti@gmail.com>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 349e1e52996d..f5fc65aef628 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1658,6 +1658,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case 0x25ce:  /* Mytek devices */
 	case 0x278b:  /* Rotel? */
 	case 0x292b:  /* Gustard/Ess based devices */
+	case 0x2972:  /* FiiO devices */
 	case 0x2ab6:  /* T+A devices */
 	case 0x3842:  /* EVGA */
 	case 0xc502:  /* HiBy devices */
-- 
2.20.1


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
