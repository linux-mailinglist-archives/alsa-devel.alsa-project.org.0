Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C8347931
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 14:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17FC31660;
	Wed, 24 Mar 2021 14:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17FC31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616591078;
	bh=SyKlZp++YtgOCf3Ge/QXqk/AHV/St5+SSy0FneKQKqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m0/MZOg5M/FHuFyoa2I5i69PTprKW9IdkvzQr0iiE9Gy4W7tLs/ymZK4HJWGxX84E
	 0MGS36h3RY+D7SrI0gJ8c9Wmqdi3iZ2TmDvenr9c3ngbTYFcFcIRpzueb1BxpyDAXq
	 xm2BOZSY53K4P52sPzrNuPfBXlsFclWArm0MqK4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D48F80104;
	Wed, 24 Mar 2021 14:03:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 357C9F801EC; Wed, 24 Mar 2021 11:52:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F68EF80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 11:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F68EF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ho/mqtW7"
Received: by mail-pf1-x42c.google.com with SMTP id g15so17035475pfq.3
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHAm+76/M2ERnBpqBJ8Unh6sng0ndd/2/ck/dYLnYiM=;
 b=ho/mqtW7Z41cxn8EjFhy44T0xgx2WYhKkJ9tk4gjM8c1lXyncVdPmLmZGfrKkRBSFm
 lCrI/5g/00U4MI1yx3U+rr+ooTZJxqciHZMM9iA6pgnJUgYhOeXMoAQzMtPTH9umJNzD
 joX8SumJ+wMTE1hkUodlJw8RUJ/AQNYTnfaLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHAm+76/M2ERnBpqBJ8Unh6sng0ndd/2/ck/dYLnYiM=;
 b=gK1LGxr5jDOJWn8gJtO45c/aV2j2cyYB0yuXpGXyxAZHU8tREacE24PVps2yy9dA1v
 3FBqN4/RTHzFe4KewjXeX9kw1BG6G39Wxs5lwExvws0bHTMbcu8nz7L849OEAG+QO5o7
 PM30HjX5OSSNWqn/l0BVIgxsp/e3TwYxQ3z5BBhItK8qhvr6/SslMgeQvHbt221ywUe/
 /BkvbqhjP18QUv8EfXMtWKO2QQCVcDJGYDyxTnUDl/Ug5brpizddxwcEs3tFcFGdeLPs
 hx9gGsckaEdgTVZbsqoRyhwCRFSCoK7M6mxCz0SzaB5eVdbs1OpWKq1uBV/uDGm9i1H7
 IMdA==
X-Gm-Message-State: AOAM533uqukcHynJpJaFqlCxhkEC+AsAmCwgk9dna+0ND8b0ixQPh4LS
 v9dGw/NvqdguJkHRIDUrV9m/xm1Jqv3llA==
X-Google-Smtp-Source: ABdhPJw7V/f4oA9bNMIjIGhevVeob1pCiQHINzu/+yEXvfZBK2PFTdAsJCoe5M+5Y9r3sMqaK2BSxg==
X-Received: by 2002:a63:d309:: with SMTP id b9mr2454981pgg.96.1616583118899;
 Wed, 24 Mar 2021 03:51:58 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:5820:ad58:4021:85])
 by smtp.gmail.com with ESMTPSA id w4sm2107371pjk.55.2021.03.24.03.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 03:51:58 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: Apply sample rate quirk to Logitech Connect
Date: Wed, 24 Mar 2021 18:51:52 +0800
Message-Id: <20210324105153.2322881-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Mar 2021 14:03:11 +0100
Cc: linux-kernel@vger.kernel, Olivia Mackintosh <livvy@base.nu>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <joakim.tjernlund@infinera.com>,
 Alexander Tsoy <alexander@tsoy.me>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Gregor Pintar <grpintar@gmail.com>, Dmitry Panchenko <dmitry@d-systems.ee>,
 Ikjoon Jang <ikjn@chromium.org>
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

Logitech ConferenceCam Connect is a compound USB device with UVC and
UAC. Not 100% reproducible but sometimes it keeps responding STALL to
every control transfer once it receives get_freq request.

This patch adds 046d:0x084c to a snd_usb_get_sample_rate_quirk list.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=203419
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d3001fb18141..176437a441e6 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1521,6 +1521,7 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
 	case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
 	case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
 	case USB_ID(0x413c, 0xa506): /* Dell AE515 sound bar */
+	case USB_ID(0x046d, 0x084c): /* Logitech ConferenceCam Connect */
 		return true;
 	}
 
-- 
2.31.0.291.g576ba9dcdaf-goog

