Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD953E978
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 19:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CD5166B;
	Mon, 29 Apr 2019 19:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CD5166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556560065;
	bh=UENj7qJ7Mw/VzkdM5iNywicL814i0vyB+wp4/CnfZQ4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cHbGyTEPPmbuRpngXJbZTsH/wLRBKWzQB+3VGFtUNmIxnFJ+NKMRqOTzaI9uZNBvS
	 a7lgkbK2a/w0LdVmONGG6RPLnD2FKePKWAZ2xkucxkbXW8k0RLOD0DgzMnIpb3+fIg
	 CZNLwrWH2biajnspwoCKvTnY1slJ8oXreOKoPsNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D55ECF806E7;
	Mon, 29 Apr 2019 19:46:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46CCFF80CAB; Mon, 29 Apr 2019 19:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3E55F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 19:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E55F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="nKku9kvZ"
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 91F13CAD
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 17:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lsFF5aDy0w4 for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2019 12:45:51 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 6DA13A08
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 12:45:51 -0500 (CDT)
Received: by mail-io1-f72.google.com with SMTP id a5so9322670iod.16
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=uxPM7sWsj1FXWn2sHkMbQQ4Yr44ikQVSiMn4hllkK/A=;
 b=nKku9kvZYmb1cYpv1cXx+XLn4k2eH8QvwQNMaWpn0oyrUSy4lyBM6oz0WcZPjwVSOr
 0voqfz71u9Br9NWWJeR0sN1uRTRevnHljOHXj/yW2nO45QsEedoVnx0IgfjvUEUHHPka
 PIlI7jXIrZNpJ83x7NcJUWhYz5EfD3/Qv7TWwFaEyfp5fCtnXY3KRdkx7j67jX3Biifw
 KUIXO3V6dcD5tv5xvT/7WF2KARhdZuqJZdrxxt3V2YNY5QPwwiZCaawwP2gUDOZ5B8eJ
 N49eq3dErIAtrXnCQ5yWs85zQ1rPQhHZQwro+ICPGo4USj0oC1nVnbmkZmD4SCf1bVd/
 2epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uxPM7sWsj1FXWn2sHkMbQQ4Yr44ikQVSiMn4hllkK/A=;
 b=E2pwQK+n5mlhjLQtVBw66KzfK1uZWSt9vnKEnx39nr99SiF0US7/GJ03FmqifsXW+R
 3HzWwUtbPuOtiOj6eY3B145aQJm1hwLEHV54RuM/RbhHDdpq+q1jljXUbjVbXdHWPMpL
 V/bsxusWRtZThtuVn1AJKGmM+UXA6lqJ5wYumhO9cl0XQL9Lsk9ViuVSlNbIWP/vQQvA
 htb3cLg85GUiEfyVPPufAX7cNg3sXlUFhEV5NCzNCVLsO3pZCeFfCzTqIyJ18kXriYsn
 4IBmRhCr76tF9FNREz/7EdQ5ClfLDDXyWaMzpyHO5YaN/OR5FHwaruyzE9MtcM/ADUM+
 tOfw==
X-Gm-Message-State: APjAAAVNH/JdhoKnVJWJwB9qfGIh2rY6eymoc+fxvAxM4ndOxNwoMrJs
 cyWCt0bqlX/kDohir9RHfsxKk8g2VrSPTeU1uRNDBcq//3vGjQ/ITX7ME8+8lHbJ3B7h5yLmS8+
 q0GCHHlB8BP6ysWLjbBSIb4uHOz8=
X-Received: by 2002:a5e:dc44:: with SMTP id s4mr19244573iop.9.1556559950730;
 Mon, 29 Apr 2019 10:45:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5iCLTVrOmTeqizKMaoQ1oFJNs0FGOPNBW6H+Zer8OUXBmxy+2CAoDckD1tifSqHXZdw2Rtw==
X-Received: by 2002:a5e:dc44:: with SMTP id s4mr19244548iop.9.1556559950417;
 Mon, 29 Apr 2019 10:45:50 -0700 (PDT)
Received: from cs-u-cslp16.dtc.umn.edu (cs-u-cslp16.cs.umn.edu.
 [128.101.106.40])
 by smtp.gmail.com with ESMTPSA id n184sm90194itc.28.2019.04.29.10.45.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 10:45:49 -0700 (PDT)
From: Wenwen Wang <wang6495@umn.edu>
To: Wenwen Wang <wang6495@umn.edu>
Date: Mon, 29 Apr 2019 12:45:40 -0500
Message-Id: <1556559941-26684-1-git-send-email-wang6495@umn.edu>
X-Mailer: git-send-email 2.7.4
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <keescook@chromium.org>
Subject: [alsa-devel] [PATCH v2] ALSA: usx2y: fix a double free bug
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
kmalloc() and saved to 'usX2Y->In04Buf'. If the allocation of the buffer
fails, the error code ENOMEM is returned after usb_free_urb(), which frees
the created urb. However, the urb is actually freed at card->private_free
callback, i.e., snd_usX2Y_card_private_free(). So the free operation here
leads to a double free bug.

To fix the above issue, simply remove usb_free_urb().

Signed-off-by: Wenwen Wang <wang6495@umn.edu>
---
 sound/usb/usx2y/usbusx2y.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index da4a5a5..1f0b0100 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -293,10 +293,8 @@ int usX2Y_In04_init(struct usX2Ydev *usX2Y)
 	if (! (usX2Y->In04urb = usb_alloc_urb(0, GFP_KERNEL)))
 		return -ENOMEM;
 
-	if (! (usX2Y->In04Buf = kmalloc(21, GFP_KERNEL))) {
-		usb_free_urb(usX2Y->In04urb);
+	if (! (usX2Y->In04Buf = kmalloc(21, GFP_KERNEL)))
 		return -ENOMEM;
-	}
 	 
 	init_waitqueue_head(&usX2Y->In04WaitQueue);
 	usb_fill_int_urb(usX2Y->In04urb, usX2Y->dev, usb_rcvintpipe(usX2Y->dev, 0x4),
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
