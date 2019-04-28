Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81FB570
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 08:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751CE883;
	Sun, 28 Apr 2019 08:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751CE883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556433884;
	bh=mnMvBvMGeAO3TycEpXuamBRlOMADh1AiSdGa1J0ZaKM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KaTdv26dQ4XkBwVmTFuaENlTVDD47mdplb+Bocxx5DsqvYmq1sIpNR4QMQuVLgDPv
	 BWna1IoO2ZbcuRyFDxoA7OJ8sGTz63LP5magY25UztYzzrhJ6UCJkRZealkv2+2pea
	 Yt8uCxVuAWirJO+8xHxsHHAxATtw79G0DuGPpAGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EAB8F80CAD;
	Sun, 28 Apr 2019 08:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDDA4F80CAD; Sun, 28 Apr 2019 08:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35D00F80C0D
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 08:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D00F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="BLfbkACX"
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id BE484CA0
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 06:42:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KVGZJD4hGPa for <alsa-devel@alsa-project.org>;
 Sun, 28 Apr 2019 01:42:49 -0500 (CDT)
Received: from mail-it1-f200.google.com (mail-it1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 97DAECC3
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 01:42:49 -0500 (CDT)
Received: by mail-it1-f200.google.com with SMTP id w1so6875144itk.4
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=dCtKX+pD+Z8ECSwxAGND0lenK4rzuRAysijRT4r9928=;
 b=BLfbkACXnG8TpTRmYKunbL4CiOzxnkePBMfwtdcdWl/kIXhCjOcI2YON9uEroEIqJI
 ebb9TwPy7EM6XMXLnsSsQhjQisHlXBE3JVTXONzd8U/GgpsYIh/oy2EXZp8sv4VZc6za
 JEQeRFCSmta12GJYWplyzHEv6oUKZT9WW7O2AQviCtzOYS877DSfNTwWb9tV6/BzyjRc
 EmCcVvjh8KvHxHoBAUYIl3vlQKd2q/kDxfxHC9wlKtF46gBX4Wu2wgP68etGawyW/NUV
 evya0qtasnMW0gQ+g8TftViBwUE8QihBzDG7tIqLxo+r9E+JPvUs0o6e6kgZRMUyp4i0
 9WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dCtKX+pD+Z8ECSwxAGND0lenK4rzuRAysijRT4r9928=;
 b=fWW8VaiYysBs2uIWJkgs5hBjB5WyBReZt8pYrsT9JEFJoMKvjMAvxI0/a4RUJfULKX
 2OAAWBRc9IpGBpD8UQqF1o8KNfUQeeYiLYFN+NDHSDI552q8j7ApBGx9N23pBGkeCc7a
 2ERxeW/MzUuAg+N6aGlc+8afWmbc01GYzTJpH5xOiIQ3feyoTZjm39lec5Ew1c9jcZ8F
 qMVA46EDHzOIpzqHYbNqoPMDfuUQLQIp31hh1nkthzGyIFZSN8byMKVl5VifVzg4kyXT
 /S8lq70jYutiETpsWqor0H8SxcgJnH/E+GerVU9CUwp6gWiFDv5Da7clNETfLuAnN8y5
 6Y1A==
X-Gm-Message-State: APjAAAWWMwqU1eKlO8lhd5iw1rGXvaprvbrtAfJr3GwqfN+CawQzntMg
 TuFw7Pdnm9QV1W24MyRQIaH9RqE9AxNRFGpS/RaIvP7fAr+XryWBlROs6hRFNok+fR2N059JKW4
 QGqHVVtCHVLmQ+3GpzysWD8KDNe0=
X-Received: by 2002:a24:ba15:: with SMTP id p21mr16196067itf.66.1556433768930; 
 Sat, 27 Apr 2019 23:42:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUO3Awb5bzEO7UyKRhdDNml7dECRtpXHtvd8+lHTvuTLGI8LZQeT2b8BcU6XhYLp8xz1oo6g==
X-Received: by 2002:a24:ba15:: with SMTP id p21mr16196059itf.66.1556433768619; 
 Sat, 27 Apr 2019 23:42:48 -0700 (PDT)
Received: from cs-u-cslp16.dtc.umn.edu (cs-u-cslp16.cs.umn.edu.
 [128.101.106.40])
 by smtp.gmail.com with ESMTPSA id k131sm4139784iof.82.2019.04.27.23.42.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 27 Apr 2019 23:42:47 -0700 (PDT)
From: Wenwen Wang <wang6495@umn.edu>
To: Wenwen Wang <wang6495@umn.edu>
Date: Sun, 28 Apr 2019 01:42:32 -0500
Message-Id: <1556433754-3291-1-git-send-email-wang6495@umn.edu>
X-Mailer: git-send-email 2.7.4
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <keescook@chromium.org>
Subject: [alsa-devel] [PATCH] ALSA: usx2y: fix a memory leak bug
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In usX2Y_In04_init(), a new urb is firstly created through usb_alloc_urb()
and saved to 'usX2Y->In04urb'. Then, a buffer is allocated through
kmalloc() and saved to 'usX2Y->In04Buf'. After the urb is initialized, a
sanity check is performed for the endpoint in the urb by invoking
usb_urb_ep_type_check(). If the check fails, the error code EINVAL will be
returned. In that case, however, the created urb and the allocated buffer
are not freed, leading to memory leaks.

To fix the above issue, free the urb and the buffer if the check fails.

Signed-off-by: Wenwen Wang <wang6495@umn.edu>
---
 sound/usb/usx2y/usbusx2y.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index da4a5a5..0817018 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -303,8 +303,11 @@ int usX2Y_In04_init(struct usX2Ydev *usX2Y)
 			 usX2Y->In04Buf, 21,
 			 i_usX2Y_In04Int, usX2Y,
 			 10);
-	if (usb_urb_ep_type_check(usX2Y->In04urb))
+	if (usb_urb_ep_type_check(usX2Y->In04urb)) {
+		kfree(usX2Y->In04Buf);
+		usb_put_urb(usX2Y->In04urb);
 		return -EINVAL;
+	}
 	return usb_submit_urb(usX2Y->In04urb, GFP_KERNEL);
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
