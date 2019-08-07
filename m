Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775F842E4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 05:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3581665;
	Wed,  7 Aug 2019 05:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3581665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565148228;
	bh=7nMihNHho8ir+6mp3Ci5S/F65R3NOLUZLD9zLn6Awp8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EzTwvtfaJ103gQAvCoSthSdQk9+8AoKplOSEQkKB49AdwrYQZrfBbYWlgLRHPRe+5
	 9qx8JjAIiyOfY/HbtzNX5FxI2Uzufepe8O3Ovs9dTguyLSB6UztBKMHOUkNYwM0qYk
	 sw0rTQJboPK7wAeXHoa7bCLHFUpbHUcw6xy/YbjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF27F804CA;
	Wed,  7 Aug 2019 05:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E3BDF804CA; Wed,  7 Aug 2019 05:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49594F800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 05:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49594F800F4
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x773MjhW057165
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Tue, 6 Aug 2019 23:22:47 -0400
Received: by mail-lf1-f47.google.com with SMTP id b29so55632554lfq.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 20:22:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVvwIahdO4XYCwk5CO/7Frs0Sgu42gkdeEFqnWHqf5WH6DagMyP
 zdxedUalzHMSNfuzCa/eavRFM1Dv1LRkUnxmL5M=
X-Google-Smtp-Source: APXvYqw3KascRBJeThGdIl1eMlrfY0MLn4+tPhdJYMi19pdSHHihKN0uMyQrgJJQBMdEzA/lLNkO+DuQuoIITtTaakI=
X-Received: by 2002:ac2:442f:: with SMTP id w15mr4617610lfl.9.1565148165415;
 Tue, 06 Aug 2019 20:22:45 -0700 (PDT)
MIME-Version: 1.0
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Tue, 6 Aug 2019 23:22:09 -0400
X-Gmail-Original-Message-ID: <CAAa=b7ebEkQZhPCbJPK=dVC+cR8_pTE3OOxX+PV+MNx7-Y25Cw@mail.gmail.com>
Message-ID: <CAAa=b7ebEkQZhPCbJPK=dVC+cR8_pTE3OOxX+PV+MNx7-Y25Cw@mail.gmail.com>
To: Wenwen Wang <wenwen@cs.uga.edu>
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-midi: fix a memory leak bug
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

In __snd_usbmidi_create(), a MIDI streaming interface structure is
allocated through kzalloc() and the pointer is saved to 'umidi'. Later on,
the endpoint structures are created by invoking
snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints(),
depending on the type of the audio quirk type. However, if the creation
fails, the allocated 'umidi' is not deallocated, leading to a memory leak
bug.

To fix the above issue, free 'umidi' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/usb/midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index b737f0e..22db37f 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -2476,7 +2476,7 @@ int __snd_usbmidi_create(struct snd_card *card,
        else
                err = snd_usbmidi_create_endpoints(umidi, endpoints);
        if (err < 0)
-               goto exit;
+               goto free_midi;

        usb_autopm_get_interface_no_resume(umidi->iface);

-- 
2.7.4
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
