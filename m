Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B782C04
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 08:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D7B31678;
	Tue,  6 Aug 2019 08:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D7B31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565074154;
	bh=A7VSNbEExivFyKm+mh6ijyzR6wrurGgFZ7CaI3YEKfw=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rQRlIfmbiDGqu1dPfIXZdctc9IBIRPGrRvSpdCgCSP9jpEqY8XmRIoESODo6t2TJ2
	 ZY+GjRhaeTqLxdk8YogAjPoZ26nQZgLrd3Wp5F3laLZVgp9whJVjJUyIBOsTnUas7j
	 CDGwFMU+advxrU/oN9Mk4rS8hjXICSCDnzpe0I3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2132BF8053A;
	Tue,  6 Aug 2019 08:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5044F80483; Tue,  6 Aug 2019 08:13:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12013F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 08:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12013F8011B
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x766DgGd031607
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Tue, 6 Aug 2019 02:13:44 -0400
Received: by mail-lf1-f53.google.com with SMTP id 62so55163019lfa.8
 for <alsa-devel@alsa-project.org>; Mon, 05 Aug 2019 23:13:43 -0700 (PDT)
X-Gm-Message-State: APjAAAXjg4Fzw+CEpBlOoYXY7pdmqcdSfvwYdm6omz9xPmqZAhbOjt37
 jZkjV/q8elBPXJc4VAyuX/QSs3U9YLNAVBJDuk8=
X-Google-Smtp-Source: APXvYqw1rV8RcMwhWvkw7ZNGJnFRxEGT7QjoZpw//yMfjk/vN5bfurliBHT9CDnOIGrD5vrZ4HS7tCa02o/2rRsOax0=
X-Received: by 2002:ac2:48b8:: with SMTP id u24mr1134365lfg.170.1565072022191; 
 Mon, 05 Aug 2019 23:13:42 -0700 (PDT)
MIME-Version: 1.0
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Tue, 6 Aug 2019 02:13:06 -0400
X-Gmail-Original-Message-ID: <CAAa=b7eiG_rpjfL8c-dWjpxSf3XPJxJbcVPrE1W0_1j-9s1QEg@mail.gmail.com>
Message-ID: <CAAa=b7eiG_rpjfL8c-dWjpxSf3XPJxJbcVPrE1W0_1j-9s1QEg@mail.gmail.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
X-Mailman-Approved-At: Tue, 06 Aug 2019 08:46:41 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix a memory leak bug
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

In add_new_ctl(), a mixer element structure is allocated through kzalloc()
and the pointer is saved to 'elem'. Later on, a new alsa control element is
created and added to this structure. In case the add process fails, i.e.,
the return value of snd_usb_mixer_add_control() is less than 0, the
allocated structure is not freed, leading to a memory leak.

To fix the above issue, free 'elem' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/usb/mixer_scarlett.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 83715fd..a6c028a 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -562,8 +562,10 @@ static int add_new_ctl(struct usb_mixer_interface *mixer,
        strlcpy(kctl->id.name, name, sizeof(kctl->id.name));

        err = snd_usb_mixer_add_control(&elem->head, kctl);
-       if (err < 0)
+       if (err < 0) {
+               kfree(elem);
                return err;
+       }

        if (elem_ret)
                *elem_ret = elem;
--
2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
