Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC6701D5
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:59:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E704717D3;
	Mon, 22 Jul 2019 15:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E704717D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563803993;
	bh=MwMaN/qZt7B4tl0v7KicU16OWqINxg+lOdMCZQUYWf4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SR+2wcOP9m4oO6XFd9zDb11W9W8Ovfhq7R/PyFRy+uKXHgbGYo5EXmono6jeeQyMF
	 uwPAKIqus+QJXfl9RLbPcmHKed8IBcS7Ihm1eytUScK56Y8+qKHKBjBuGR1jrpKlJW
	 ftS6VMD/o4v30RBO6yfVwwfIMQdiHBw2gVb5GQ7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAABF803D7;
	Mon, 22 Jul 2019 15:58:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0448F803D5; Mon, 22 Jul 2019 15:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 825D5F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 15:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 825D5F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="U9NNSz9q"
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 513495A3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 13:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5efw5rVFbUf for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2019 08:57:58 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 2BBC5AFD
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 08:57:57 -0500 (CDT)
Received: by mail-io1-f72.google.com with SMTP id u84so43703477iod.1
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=kVakesV2CvYZvwzJLrv2MoVIkC/dgF99lbHbHv6O6Do=;
 b=U9NNSz9qiMTtAyk7MlpM4DImJC3y78wo2G+1IAHh0xmEu2kWLBbXp8mhyLL2nitquG
 7YzbVpWn1aX1lkYF60rLi/FV8kTlSIL2i4t/O7+2agIGasmz62Ke1AKye/xaZ0vnqywZ
 4wqXIDecPuu0A27k+7Hc3tB5nes9o0mdWHPeAfZ/1AEHiSEs0t2ffvXy1iT9N24wlpww
 LfPsaLdmyWT9TobcNKPR2vanwhaGEDRpbL5P3sbchdQUAhXn0MGcXK4Kp4iNdcWl6F+7
 W6v6Q8Hk8UOfPJ+tYq8mfiIQlA39fGVIjTW4uS3ZWmNZtI1wsOvmBTgZCSREIwCey4Dv
 YqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kVakesV2CvYZvwzJLrv2MoVIkC/dgF99lbHbHv6O6Do=;
 b=c1TDts9du3IjEqcg26gKox6viMWm3LaM4QYlrB35cilDPbUGNevaZw/tzkJrPH2guh
 xOhduIscEA5EAvB2/jGC5FcGE2nTARVwTUtFl8cbXwKfTc3XIxB8zX3bEJhTWBOL6ThB
 06kyiO40yiRjAkBc+wM7HeICbu2PO8CLeuZlvQxnqTjPcSylHHa24o8Fk+Lvs1L6eBi0
 IP8fz/sjg2x94zU/hcbn+I+M4BY0Yj8pn+6yDBZMCYeqyxz8Hfa62Yiq7Y6+cKMtT7j9
 ZH79I1iKi0qO1EyngKlsqKHveybKTR4h3DBfEhkdJCPW6+Zeo/88D+YDhI7yRsezawFT
 jvcw==
X-Gm-Message-State: APjAAAUGmI00bkEN4pXmv2J65mVkg/p/rSGNJZI4NPX4zIQ804icy1+A
 tqCaG4xdbFafw8YviG+818FJt07bZxUeyEuwhy+Pt3QetP/u2lLaf3x21LxfRROzZ0ioJw/vp2K
 1fJPjee9oBrDrRlz+N0lXbDjCVo4=
X-Received: by 2002:a6b:6505:: with SMTP id z5mr61900558iob.295.1563803877562; 
 Mon, 22 Jul 2019 06:57:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxSV0VUNFzRDvGQhggNhPxAkdfsSabNRwARqBBqvGMqIAHjhSFEIi5DtsjwVuBBJzc2A+mYA==
X-Received: by 2002:a6b:6505:: with SMTP id z5mr61900522iob.295.1563803877257; 
 Mon, 22 Jul 2019 06:57:57 -0700 (PDT)
Received: from localhost.localdomain (128-092-121-091.biz.spectrum.com.
 [128.92.121.91])
 by smtp.gmail.com with ESMTPSA id u17sm36913414iob.57.2019.07.22.06.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 22 Jul 2019 06:57:56 -0700 (PDT)
From: Wenwen Wang <wang6495@umn.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Mon, 22 Jul 2019 08:57:44 -0500
Message-Id: <1563803864-2809-1-git-send-email-wang6495@umn.edu>
X-Mailer: git-send-email 2.7.4
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: dapm: fix a memory leak bug
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

From: Wenwen Wang <wenwen@cs.uga.edu>

In snd_soc_dapm_new_control_unlocked(), a kernel buffer is allocated in
dapm_cnew_widget() to hold the new dapm widget. Then, different actions are
taken according to the id of the widget, i.e., 'w->id'. If any failure
occurs during this process, snd_soc_dapm_new_control_unlocked() should be
terminated by going to the 'request_failed' label. However, the allocated
kernel buffer is not freed on this code path, leading to a memory leak bug.

To fix the above issue, free the buffer before returning from
snd_soc_dapm_new_control_unlocked() through the 'request_failed' label.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/soc/soc-dapm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f013b24..23b9b25 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3706,6 +3706,8 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 		dev_err(dapm->dev, "ASoC: Failed to request %s: %d\n",
 			w->name, ret);
 
+	kfree_const(w->sname);
+	kfree(w);
 	return ERR_PTR(ret);
 }
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
