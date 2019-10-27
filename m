Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A1E6D5E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:39:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4AA1EF1;
	Mon, 28 Oct 2019 08:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4AA1EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248349;
	bh=CWZU53nmS8JeXsVISOOUKFpgKpWAbpBsc5Sxyo7X/oU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PN0J7WnF0fjrmwGPQijVjvH6smbtHCIh9AdrApNZfHgW7mo3UUSKwDbt1v0l6koP8
	 ddz1AlcJAI38X40k8Ij/+3y9DRKOabGAMuzUSOldkbDW1FJHb28yaBop3O8SY8AR+0
	 CNUkwt4v3UD/KGEPBww3sVTqDAsTmS4bNH7bnl9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6595BF8063C;
	Mon, 28 Oct 2019 08:33:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82F57F80392; Sun, 27 Oct 2019 23:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ACB6F80228
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 23:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ACB6F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XFvb1jxX"
Received: by mail-io1-xd42.google.com with SMTP id q1so8537023ion.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YHYEhw/ttN3qGticAt8C8vlSjAHhRkI7ojzgrjl+O1c=;
 b=XFvb1jxXsR8xNwzocagsc6QD5/10VL8qUpDjn9qaOcCPjwHyrLVh2Tw4igPb4hCruf
 JGwBLO3cVyHDVto9HokGvbQXd87ikFC1qdkfJT2UMf4Gmu7kOWenk5Ezfl3SHRk2vt7E
 NzPMN4MLrZC6hdD/ru1PRltpmJ2CBgLziW2eptgX+Fk+R5cElH0xpUksUSdp2sRQJWXn
 rRGVL+hDTSFlnK43ysIw06nf4T6ZgAJgJCnxDN8eE7ys4ZlI/oS8zbFmwxryCSooWUd/
 31WeP6Q62+wF2skWxbiPbDynZLUaAVpmCKGAx+7cUbETULbuJHnG9RUserl2I+pHpthi
 GMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YHYEhw/ttN3qGticAt8C8vlSjAHhRkI7ojzgrjl+O1c=;
 b=B79fX4NQYzkKYVEx/SQWt9Q+Cqxm8xbxoM0DLBr5CS1sFhXD1WNPeY9hjglHjvQ0Hw
 sYCcAMkYlZrGlGLk/Ot7qUfSftaQmgF3ljh3pyIVI3bxLv5fM7nZeHVSIT2MtZBCyjz5
 xeecDoZcBrKv6pCnj5j6KBq8XWZfJ/hQuIjQoPEkHamEAstSc9In6ByOwmFhLiqNivd5
 7Lu+HooSmughSHgG92t0KJaBSoVth38qU/Lu7f7XAbg1pWJdjtv1dNuDA89IZXHsuH/U
 EYNTQGeOIYk5vl03GP7ivxWEPRnbcoGy93+GTPSLhRg5nYbkpTJs9cnSIwRasWN2yQIb
 k26A==
X-Gm-Message-State: APjAAAV2fqwUkxdoQEYxE0e7jf48Nq/NjwJqDkDhFssEKvottKSmWmuA
 HlJZeC62RwYxfqw2gDvWcRM=
X-Google-Smtp-Source: APXvYqxVal8/QSSOGAOQGI6ESdTsFK21tbUAO7G+MMjgHbysGbrpcB7CYixkcNCEjev+WbgF+1+NFQ==
X-Received: by 2002:a5d:9b13:: with SMTP id y19mr7913063ion.38.1572214216847; 
 Sun, 27 Oct 2019 15:10:16 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id r1sm1290319ilq.7.2019.10.27.15.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 15:10:16 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Sun, 27 Oct 2019 17:10:06 -0500
Message-Id: <20191027221007.14317-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:33:18 +0100
Cc: alsa-devel@alsa-project.org, kjlu@umn.edu,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 emamd001@umn.edu, smccaman@umn.edu, linux-kernel@vger.kernel.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix memory leak in
	__snd_usbmidi_create
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

In the implementation of __snd_usbmidi_create() there is a memory leak
caused by incorrect goto destination. Go to free_midi if
snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints()
fail.

Fixes: 731209cc0417 ("ALSA: usb-midi: Use common error handling code in __snd_usbmidi_create()")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index b737f0ec77d0..22db37fbfbbd 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -2476,7 +2476,7 @@ int __snd_usbmidi_create(struct snd_card *card,
 	else
 		err = snd_usbmidi_create_endpoints(umidi, endpoints);
 	if (err < 0)
-		goto exit;
+		goto free_midi;
 
 	usb_autopm_get_interface_no_resume(umidi->iface);
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
