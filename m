Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6BD12783A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 10:33:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6A515F8;
	Fri, 20 Dec 2019 10:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6A515F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576834434;
	bh=BGEqx+VE+f9Q+9vj8kfZlzNdHt4QpncOMJ3Afj31GHs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aQsJEnLrFjR7/JVQdhiWNxk81TkLDDXD2F2eupwP6cLAZhW7tIlLlsK5HaRJ61eUQ
	 9/deiWBGQvkqav9z7DlTOxYR4NIRzDcRowC5hJjdlK1sUQSnR/FW7s5Fs/FFMNUlXY
	 uWoKet4T1THJ7pHWElGZwr6HRX0xmb9g2Q+TS7QY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 499BEF80059;
	Fri, 20 Dec 2019 10:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8172CF8015A; Fri, 20 Dec 2019 10:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 053F6F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 10:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 053F6F800B5
Received: by mail-lj1-f196.google.com with SMTP id u71so9293182lje.11
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 01:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vACzD6DaxQvgtCMU0tnPw1WJ51oVtIqk0pKAR9FuZpU=;
 b=r0IdfkfcouXY8AwHIUt0hOiPzVcxPzkuHnlkpxzrfMMHpjgU8Kx3XljwG3enn9hsNV
 t5Ry+IUaFYd2JPwxzOb4YYjwuubzUwFoX3rSiGI1RupwRk1symgo93DNQFpouOSOEbDk
 YB/pksCeqk94Dx4lhn/fts7VsTFoaWgkCrUReeHMp4/bESfyV4MXiycoKUk9OAZwaP3X
 HiThq2/lkibsSGVvuO6cFsRz78OMIRIros+sYiTIYIveVgWlQKQhrnAvq2Z6w2HXXAaD
 lpe4TTy0KyoqWs0qXaUgimphMXCxb+IXkLLnnsV3EWhbBavVZtYeRwU2ZNzvX56FQeRb
 Q2Hg==
X-Gm-Message-State: APjAAAU64CMJwWkri52xYVrYB+t6/LyPbpjER6DRMwMabsOcGCHoeMa0
 uEfGeWOZ6wtxecgt9Nh9Qo8=
X-Google-Smtp-Source: APXvYqx7d4xmf7k72/iB+L72Tyd+ARo47ZmuVxirOZXppNqFPl+yhzLOboPX4ybagaHMNyeKmQuMow==
X-Received: by 2002:a2e:910b:: with SMTP id m11mr9162003ljg.213.1576834323858; 
 Fri, 20 Dec 2019 01:32:03 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id z7sm4437120lfa.81.2019.12.20.01.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 01:32:03 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1iiEde-0000L0-4r; Fri, 20 Dec 2019 10:32:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Date: Fri, 20 Dec 2019 10:31:34 +0100
Message-Id: <20191220093134.1248-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix set_format altsetting
	sanity check
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

Make sure to check the return value of usb_altnum_to_altsetting() to
avoid dereferencing a NULL pointer when the requested alternate settings
is missing.

The format altsetting number may come from a quirk table and there does
not seem to be any other validation of it (the corresponding index is
checked however).

Fixes: b099b9693d23 ("ALSA: usb-audio: Avoid superfluous usb_set_interface() calls")
Cc: stable <stable@vger.kernel.org>     # 4.18
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 9c8930bb00c8..73dd9d21bb42 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -506,9 +506,9 @@ static int set_format(struct snd_usb_substream *subs, struct audioformat *fmt)
 	if (WARN_ON(!iface))
 		return -EINVAL;
 	alts = usb_altnum_to_altsetting(iface, fmt->altsetting);
-	altsd = get_iface_desc(alts);
-	if (WARN_ON(altsd->bAlternateSetting != fmt->altsetting))
+	if (WARN_ON(!alts))
 		return -EINVAL;
+	altsd = get_iface_desc(alts);
 
 	if (fmt == subs->cur_audiofmt)
 		return 0;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
