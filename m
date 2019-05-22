Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DE2821D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 18:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148011685;
	Thu, 23 May 2019 18:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148011685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558627537;
	bh=H0pvQqOPcGm7AJjVaBgaiIMxOUB1HWVYD0c743mE6Vk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=snTCIPBdxMRD9WbHjWXY4vnbMMIbpjlqA5NlwaryWWlX05a4WzTvi4BYYzMLjjjR4
	 GEfGwRSjsUKRDHiLJyXusvgjTWM1CDoUKgUjztRLpT81EIa0uckTTB8rqymQqrmtco
	 QTatGhbZeqsfdiLtFcPJ7t423bsR/xrx9CCOqs2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39204F89715;
	Thu, 23 May 2019 18:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44BAF8962C; Wed, 22 May 2019 19:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4128CF8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 19:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4128CF8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HDch0fyo"
Received: by mail-qt1-x849.google.com with SMTP id b46so2707216qte.6
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GDrZgFBNCd/50aXdWTdcgTRUOjYwaX5HGtY6WfFhngs=;
 b=HDch0fyonO76nulv6bx/pyYQB+ZJsheTlI/eSzV6LChzFc8bf0pVmFY6ISXNkP2RNo
 urMfiWQB2BNk4riB+5PGc2QZ7pmVUrtiyyFcBsaNnZnUpYqMQgoGwLJUXtwPoa6UwVXs
 G2JLwkDNGoWm8gqoYzkRAFfMQIbMsC+l18U6aNaWVLJLO8EywLPl7w6tf8Sb/VnR5g3G
 HWaGsxGDb0Mq5M+wtu9SSIXcQvEVwl++OhNbq9qOfG0Vj+raZeODuxV1sdQQ324GWI4T
 YOHIGj7+2z4O+cbXSAdnH5v8aAZxQDWo1UHwKDXwrbzN9MTpRnRBCYZWF/zbKaLfvMc8
 8jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GDrZgFBNCd/50aXdWTdcgTRUOjYwaX5HGtY6WfFhngs=;
 b=d6csXoqhxTLLVSvBNSWTi9wDK3hXywseStqIjVcvz8Lk410uCjNHP1OPbtxwvXabQA
 nlolf6FCUybkB1WbUxvuDJW+zZ+uhlWrhVoMjnM3yaPxoGkuCPoJt6xBICDXn0okdf0O
 ajehJdXWrvoJ+w/GvmpgMkyuuq8e8Rnx6dmdhVcYkRZmnp8eJ07i15obedXMDOAvTKh7
 Y9KX3VuvR8SIhuh+ZNelPW9KyVsauJDKkiEx6+5tFFxHuweV05tvmRPtbDDo6WZ8pAgF
 OHvfQQyRFv/Lx5wVPZ3bvmcu/qsoo50dkVC+l/7Hn3p0w72tWkBaqJxs7cno4tJIuGUH
 48dw==
X-Gm-Message-State: APjAAAXyxfosuCmhoBtUWdK33hTL2RbmscDTEG7PpOq+jcib5FVB5YdZ
 kgj6rgx18mT0+QLiuIDdSk1kYr2Vhrs=
X-Google-Smtp-Source: APXvYqzpVYQXKK9BrAQ22QPdc8hj66jbpZQyi15MqeS8wGqjUHYyi6O3dTkTesiBeRQj8YC1zBFY+VlmYNA=
X-Received: by 2002:ac8:3708:: with SMTP id o8mr75132809qtb.237.1558546022069; 
 Wed, 22 May 2019 10:27:02 -0700 (PDT)
Date: Wed, 22 May 2019 10:26:55 -0700
Message-Id: <20190522172655.183977-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Suren Baghdasaryan <surenb@google.com>
To: surenb@google.com
X-Mailman-Approved-At: Thu, 23 May 2019 18:03:14 +0200
Cc: mathias.payer@nebelwelt.net, tiwai@suse.de, kdeus@google.com,
 alsa-devel@alsa-project.org, stable@vger.kernel.org, benquike@gmail.com
Subject: [alsa-devel] [PATCH 1/1] ALSA: usb-audio: Fix UAF decrement if card
 has no live interfaces in card.c
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

Commit 5f8cf712582617d523120df67d392059eaf2fc4b upstream.

This is a backport to stable 3.18.y. Implementation in 3.18 differs using
chip->probing flag instead of chip->active atomic but it still has the UAF
issue.

If a USB sound card reports 0 interfaces, an error condition is triggered
and the function usb_audio_probe errors out. In the error path, there was a
use-after-free vulnerability where the memory object of the card was first
freed, followed by a decrement of the number of active chips. Moving the
decrement above the atomic_dec fixes the UAF.

[ The original problem was introduced in 3.1 kernel, while it was
  developed in a different form.  The Fixes tag below indicates the
  original commit but it doesn't mean that the patch is applicable
  cleanly. -- tiwai ]

Fixes: 362e4e49abe5 ("ALSA: usb-audio - clear chip->probing on error exit")
Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
Signed-off-by: Mathias Payer <mathias.payer@nebelwelt.net>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[surenb@google.com: resolve 3.18 differences]
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
Analysis for 3.18 codebase:
snd_usb_audio_create() sets card->device_data = chip
snd_usb_audio_probe() calls snd_card_free() and then resets chip->probing
snd_card_free() results in the following call chain:
 snd_card_free_when_closed() which waits on release_completion
 snd_card_do_free() calls snd_device_free_all() and signals release_completion
 snd_card_do_free() calls __snd_device_free()
 __snd_device_free() calls dev->ops->dev_free() == snd_usb_audio_dev_free()
 snd_usb_audio_dev_free() calls snd_usb_audio_free(chip) and frees "chip"
chip->probing = 0 results in UAF

 sound/usb/card.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index f7dbdc10bf77..59fb1ef3cd55 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -593,9 +593,12 @@ snd_usb_audio_probe(struct usb_device *dev,
 
  __error:
 	if (chip) {
+		/* chip->probing is inside the chip->card object,
+		 * reset before memory is possibly returned.
+		 */
+		chip->probing = 0;
 		if (!chip->num_interfaces)
 			snd_card_free(chip->card);
-		chip->probing = 0;
 	}
 	mutex_unlock(&register_mutex);
  __err_val:
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
