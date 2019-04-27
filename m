Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD5B2D9
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 08:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C54867;
	Sat, 27 Apr 2019 08:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C54867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556345338;
	bh=hMrPCr1aT7osN4blMpiixG8EZtnbjEyvP9aIY88WSRg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dvkCb48abjWY4gehoqxNAANq6VF/TlPxPc/nDnphFvGDwK/90pqKSVqTqoUSvxmE3
	 uXNm1V0Nc+EKpxlAo6e76F/KeclEhtdN447kzxTGiO09NRXr5tOk6Uhmtxslx3Xtce
	 /cG03hDM/4CzlZNTIN/O4qb1QxbLUu1+S+ZcEGxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8DAF896DB;
	Sat, 27 Apr 2019 08:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE6E1F896DB; Sat, 27 Apr 2019 08:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80633F80CAB
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 08:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80633F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="Kc8zoi7b"
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 2FA05F5F
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 06:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCevi0NEdYuf for <alsa-devel@alsa-project.org>;
 Sat, 27 Apr 2019 01:07:03 -0500 (CDT)
Received: from mail-it1-f198.google.com (mail-it1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 0935FF65
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 01:07:02 -0500 (CDT)
Received: by mail-it1-f198.google.com with SMTP id w1so4881105itk.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2019 23:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=NFlIqhQAiZ0fKBdX7sqqPlFbICv397OLf5KoFgtnxks=;
 b=Kc8zoi7baurWPlTU1x/nQLHBxVn40vnDnX+BlDg4nKi+7gxiwc3DP+cyQ54OiKWQbU
 rxOJUAotGkU6UkDJoyS+PvugK2b6W8gxtI0ZY2e29dqwUc9fce26RbIpi6JMpClLE3Nj
 vmFJuGeXStBkdjRxJWpQoF67x6+PwTQPAfgQIuBKAhik8v1i3jDtaBmVao1+psxcVC14
 6Zl1F944VZUPoJBgHYXEN9LNFGnr0szQTdJOKzpu2z0uuumo/MOmrFo/Pcw4ivTpIHDJ
 dqlT5z1lhQQde3M96I8rce6hOqigvhfjAV3FEZVoPtSbTw0wXCEf+jCKt+Po8aPhqE9j
 3p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NFlIqhQAiZ0fKBdX7sqqPlFbICv397OLf5KoFgtnxks=;
 b=N9RGbp/oeKxZ9Os5KrYAvamEwz7SRhQVq9zGkyGYe8y8XUmXCE+TKFh6jp9G+iKjUF
 zt+b/DdO2VFVBLcXgXARDcY4Z09H1Cu3AmDh4cL7bNBw8v3lWXe4HKwvI4fEXGV1dVuP
 d8/v9kgW9Lu6TweyDqe6gmru+wUEfJHKmiu3VUvzFZs4986rHZqz4Mv9pwepFcgXhy2K
 wur+8sLcU4opbv2GsBlwVevXdR5fqxGvcOBCy7VG7WkttqVRYlTmKwreUhRGfY7UA0bu
 tsjDCse+CNdjwZPaG3uahsdb6l+C5VoUC/ScvpdQdfXAUAhlQnJq32jTDtQGTCUFZQxf
 /r0w==
X-Gm-Message-State: APjAAAX73Cy0Fy7x+Yo8kmeJYqzUA1fnG5MfP4cKehEBHy5P1847jPU4
 vfkH3PVPhfeW7be1LdlsG6xxTSTEr8w8+fbsA56LhfYnkZvoi39rG3ZoN+RXXnEIBX6YIvcmQUk
 5tJBda4BExE9xVWJgFv1jUVaufGA=
X-Received: by 2002:a5d:9d0a:: with SMTP id j10mr28060549ioj.196.1556345222361; 
 Fri, 26 Apr 2019 23:07:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzS811HXtyXaCkgpoOpbax7PyFn3O06/h13VSIFhaFM9DP2JKm5kpfQ4hdDn9xpzx+c0mbK5Q==
X-Received: by 2002:a5d:9d0a:: with SMTP id j10mr28060531ioj.196.1556345222018; 
 Fri, 26 Apr 2019 23:07:02 -0700 (PDT)
Received: from cs-u-cslp16.dtc.umn.edu (cs-u-cslp16.cs.umn.edu.
 [128.101.106.40])
 by smtp.gmail.com with ESMTPSA id k125sm5670880ita.1.2019.04.26.23.07.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Apr 2019 23:07:01 -0700 (PDT)
From: Wenwen Wang <wang6495@umn.edu>
To: Wenwen Wang <wang6495@umn.edu>
Date: Sat, 27 Apr 2019 01:06:46 -0500
Message-Id: <1556345208-1210-1-git-send-email-wang6495@umn.edu>
X-Mailer: git-send-email 2.7.4
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix a memory leak bug
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

In parse_audio_selector_unit(), the string array 'namelist' is allocated
through kmalloc_array(), and each string pointer in this array, i.e.,
'namelist[]', is allocated through kmalloc() in the following for loop.
Then, a control instance 'kctl' is created by invoking snd_ctl_new1(). If
an error occurs during the creation process, the string array 'namelist',
including all string pointers in the array 'namelist[]', should be freed,
before the error code ENOMEM is returned. However, the current code does
not free 'namelist[]', resulting in memory leaks.

To fix the above issue, free all string pointers 'namelist[]' in a loop.

Signed-off-by: Wenwen Wang <wang6495@umn.edu>
---
 sound/usb/mixer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 73d7dff..53dccbf 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2675,6 +2675,8 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 	kctl = snd_ctl_new1(&mixer_selectunit_ctl, cval);
 	if (! kctl) {
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
+		for (i = 0; i < desc->bNrInPins; i++)
+			kfree(namelist[i]);
 		kfree(namelist);
 		kfree(cval);
 		return -ENOMEM;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
