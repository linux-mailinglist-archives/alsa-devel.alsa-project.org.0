Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C755C117178
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 17:23:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345381662;
	Mon,  9 Dec 2019 17:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345381662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575908614;
	bh=/CpXyCLlM1dMx9JSMGGP8vG1OAXheNrAuEgBTTn+1RQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rtC7ybuNy7hqaIbdbfZE1b9h4Zet06B1kgNY/44MvRuKCJITr+mieh0li1yWsuogs
	 JfLw8pTWdcw88IwAc4ucSwbilVe+2G5PqFuHYMJN9Xo5a/VwDS7rFhRTJicIDXwO+f
	 xzNJ9LjgPTV8KBxyzAg5aGwu3DJLzQztGWRrQf2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82673F801F4;
	Mon,  9 Dec 2019 17:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B77F80234; Mon,  9 Dec 2019 17:21:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7804CF8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 17:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7804CF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oe+5C+o2"
Received: by mail-pg1-x544.google.com with SMTP id k3so6718294pgc.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ivG1sogaJP93bTE4LGU6va4QS4V/Fw37s6F674FfD8=;
 b=oe+5C+o2ssEPEJg4vajO8v3ZF+0bJ8RMzXHtUw8k/N5UcGUYTL3+mwi3NeOA7S6sip
 Ml0YnEea19N3gxajFY+s144LflzHMoJkwtV8lXm6Qjj0FnWPfT/gcqygWfmWHs7KmQZX
 o4i/lmpRRGgpvNO63t7uEgc8/855nkXQemUMvgDV99FI8K7oHpGAs7MfQavtzAxz8S78
 Io7OWZa0+BCEv8Nozwwe1+G1qLQUE7nOtFKBnaCQhHlcFl/L/2o7ZQVuUbZiX30c0YO1
 hCkWjnaGZ3NVTI3iCFWQH6d6Z8gGquqqFYKlvilIbgz0n6KS8YAFZEQNdY0t8/Kxz56b
 G5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ivG1sogaJP93bTE4LGU6va4QS4V/Fw37s6F674FfD8=;
 b=Fn+ykxxiMOT3ZD2SBbWyweR8RqAghwpaXMFyX6fj4A9D2tGcjdmnig+yNy5usCz/5k
 0QX71CJCCC0VQfEOKl2kTjB/pdg2CW8UYrYYk8o/QjSGPiUBsAjR9sna+MaJ/696W5ID
 ePmHlK9MJp6dDMH3LX2BfvytSdWi95vCMTap7qMt2gLsy8ZJ2MdnGMr7DzQ7LanwrrKl
 fHePPeqrrQWKKl2c9tStC7JtbuhzHJfWfnUG1FDsuVhd0huPeU2vuSQKqUsd1OpxNca3
 pNhk5QRQdd+qPyZX0zRAn5sOvLZsuom3rUwQ1EEAD/q0Ii+OIxPyDHs9j2HDwSgH0fd0
 Bttg==
X-Gm-Message-State: APjAAAWYcZUdSZ50GzrvgKBq+Mc9R/wfQfXM5BGIRiHUak2wI4fYG9Xv
 8hKEzBFfg2u/UEm0wVBLFcY=
X-Google-Smtp-Source: APXvYqwtrxgz6QJcHHYTa6IyBm/KUca0VEZGe4yjjL2YzTMzsOiREc+CN40xHYRI/2lIoD/3oTFqdQ==
X-Received: by 2002:a65:530d:: with SMTP id m13mr19576837pgq.351.1575908495552; 
 Mon, 09 Dec 2019 08:21:35 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id s2sm28695572pfb.109.2019.12.09.08.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 08:21:34 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Tue, 10 Dec 2019 00:21:19 +0800
Message-Id: <20191209162119.14820-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: hda/ca0132 - add missed
	snd_hda_gen_parse_auto_config
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

It is found that all usages of snd_hda_parse_pin_defcfg() are followed
with snd_hda_gen_parse_auto_config() except here.
This should be a miss and needs to add the missed call.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index b7a1abb3e231..ea1187a13241 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -24,6 +24,7 @@
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
+#include "hda_generic.h"
 
 #include "ca0132_regs.h"
 
@@ -8844,6 +8845,10 @@ static int patch_ca0132(struct hda_codec *codec)
 	if (err < 0)
 		goto error;
 
+	err = snd_hda_gen_parse_auto_config(codec, &spec->autocfg);
+	if (err < 0)
+		goto error;
+
 	return 0;
 
  error:
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
