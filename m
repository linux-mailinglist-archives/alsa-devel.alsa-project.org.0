Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9C988831
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 06:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84AD846;
	Sat, 10 Aug 2019 06:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84AD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565411520;
	bh=HgF+8UvL8gjQ754bKyqMUO6yt1pSiWOnJmQPL3mR+N0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=APsnY4ETHRGGLiNMCrhwG03XQDkM7NR4rPi2HKKt6SYJPZTKzKjUNQAreQ29o+4QB
	 bYBJNx/5IvCQyGIfpmH9QuTAMlOSGzXiLzCGBdWyW3qQ11ffhhzaNU7XgjipBetBUG
	 IMcxnA7MpqE0ydtrbiZJ9MZbEzkFhFNufs0WQpIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25381F80506;
	Sat, 10 Aug 2019 06:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6EBAF801A4; Sat, 10 Aug 2019 06:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0CF6F801A4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 06:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0CF6F801A4
Received: by mail-yb1-f195.google.com with SMTP id s41so14370448ybe.12
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 21:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qpn09Q2IPVk1Zallzy6o+fiJZ4cg6kBGPdGeFP8iFUE=;
 b=Yv4h+pg9UNACZByOLTu0vHSufhvcf0/e+x/Dz5U9V70wcYABdtR/ToVy48hvVsyZ+l
 WbZAk+aX5FYCJPA35+H1uGZCcd5eIrGqDXhPbRagasxv6oVt5AeD2duiLjLlJ9pW4/ab
 3VszaU9/echz2Y7tttGYWCzL6QQVCq7twHrQEKuHqTRNMr8vdOuL7SY/41cKDuFU3pOt
 VtU+8pNJSlaCRmJD25MwGPblcwg+tIla/wTPiNihn5s+47ukQP0fs4ja4BbUtVQ8Iudu
 2FMvNO7+8JUReSI3Fqx5uSiKo3Bw/rN4Ear2z8LUp0/QOARNIcbZE3RvCl+8aXZF0pH9
 cxAQ==
X-Gm-Message-State: APjAAAXdWvilRsS3cFCqO7edaoDX3NXP5pmxDy4WpZEWLNUweo3JmH43
 kDUyMUCOLCNEsvjACfBcvIA=
X-Google-Smtp-Source: APXvYqwfKHOcF3+5sX+39qBI1GTLIQlNHuIdHvEGVBed9ILaHTwHRCaZUAl2NSo9E1anp4YT+mluow==
X-Received: by 2002:a25:8489:: with SMTP id v9mr14978725ybk.1.1565411402054;
 Fri, 09 Aug 2019 21:30:02 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id p141sm22736227ywg.78.2019.08.09.21.30.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 09 Aug 2019 21:30:00 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Fri,  9 Aug 2019 23:29:48 -0500
Message-Id: <1565411390-2684-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, open list <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: hda - Fix a memory leak bug
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

In snd_hda_parse_generic_codec(), 'spec' is allocated through kzalloc().
Then, the pin widgets in 'codec' are parsed. However, if the parsing
process fails, 'spec' is not deallocated, leading to a memory leak.

To fix the above issue, free 'spec' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/pci/hda/hda_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 485edab..8f2beb1 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6100,7 +6100,7 @@ static int snd_hda_parse_generic_codec(struct hda_codec *codec)
 
 	err = snd_hda_parse_pin_defcfg(codec, &spec->autocfg, NULL, 0);
 	if (err < 0)
-		return err;
+		goto error;
 
 	err = snd_hda_gen_parse_auto_config(codec, &spec->autocfg);
 	if (err < 0)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
