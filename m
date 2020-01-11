Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FF13826F
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 17:33:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B88F416A9;
	Sat, 11 Jan 2020 17:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B88F416A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578760414;
	bh=xRJoxNqcJIaM61a7QyFVyadybFedn0GquHLU0wBPL/4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KXjhy6ZGQILpTA6ZCEBAYJ+DPemc0CHvVZswo5nnRQMzAT67qShL1xy0eXLXnS8he
	 EaWoyjNRnVyn6bJEifsxJOqNKAw0L/Tqj70jKrfnVEgAbb18n32i1hB+mFInDlb3DR
	 xw4fwBjdccX4mKFWpRHgtAD60/wh6qvmCC6yQUQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44227F8010B;
	Sat, 11 Jan 2020 17:31:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8405F801F4; Sat, 11 Jan 2020 17:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 362E7F8010B
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 17:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 362E7F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ppTqZL0k"
Received: by mail-pg1-x541.google.com with SMTP id k3so2526816pgc.3
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=f1vRmHhrV08XFgVnUDwocso32DPdXB96AAdJZ+4F8qM=;
 b=ppTqZL0kzWaBSg6qpBFaHk1o9lIXhnNlrcYC+nmG75Ay95+W/DGgXe+6spz5sj3n+R
 CcwFdOpG/Bd0mZrgYn+M+cj95xnecldiD943L5eyPwx3Oq60xqdhJO8Xyu9khyN0dLNQ
 ZJR4mvMJljAKDVZo+zTcGhhsourgZBxuByW0gJwV14P3k6kUOkmyie4IYbw8qR2czVXU
 VFbUNcnZKQ+3r0fgDO/x9IekbuiwP9tFtqQUfS47CzErUCPL1t0dcpG7M/o0s+nvhP90
 01HyYpaHxnvh/h2RBBuc8l34v2t9KFNOrPXk5FvunhaLJrI0JwVfP3OXUXhIZdf8LLie
 BQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=f1vRmHhrV08XFgVnUDwocso32DPdXB96AAdJZ+4F8qM=;
 b=VSxuKbP1DExkHXlSBBDqcdSzRtbIspQ47DIGcYS5lINAg4FhM0Z35bRTnzyP88lQsg
 s/H3XPoHmDu/k2dVf2BjQCaOLLZM1XHqPqFLdgHCLGHF49I5BFaSP+nOVosdlwYjgFcf
 wGipRqEj4u830OWfEw3gdtqgS+RwzDZLw9KCRIW7UclDp+VOJr4P7LY+i64DmZU9Pf8L
 xuaBVvhDvrXJJLxEWo8t0L7PPZBEUI835VYJXj4+Jh8paLMAEDjtpJapqegR3CT9q8ya
 3c1+x8KQy1RwlGKo9GYJ0WlRceGZtTOsc37KJ1rySirkYgVfdXNt9SHAg1x1YbQtHV1t
 /wuQ==
X-Gm-Message-State: APjAAAXp9TizQ49BA/JCujdZzti+ECGsrI4mRKZhvQLwsPay/8tBdUPW
 LDo98fWrntKF493CKXYGnHU=
X-Google-Smtp-Source: APXvYqyvooAPj6DJQGAiHR9lnZWvJc3ZiAu4Zkp5EWGFQLtiGlZu7YHmVbXWUscLpX6sSiTaH67AIw==
X-Received: by 2002:a63:6ac1:: with SMTP id
 f184mr11698153pgc.133.1578760301054; 
 Sat, 11 Jan 2020 08:31:41 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
 by smtp.gmail.com with ESMTPSA id b65sm7347072pgc.18.2020.01.11.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2020 08:31:40 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, tiwai@suse.com, rfontana@redhat.com, tglx@linutronix.de,
 allison@lohutok.net
Date: Sun, 12 Jan 2020 00:30:27 +0800
Message-Id: <20200111163027.27135-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: cmipci: Fix possible a data race in
	snd_cmipci_interrupt()
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

The functions snd_cmipci_interrupt() and snd_cmipci_capture_trigger()
may be concurrently executed.

The function snd_cmipci_capture_trigger() calls
snd_cmipci_pcm_trigger(). In snd_cmipci_pcm_trigger(), the variable
rec->running is written with holding a spinlock cm->reg_lock. But in
snd_cmipci_interrupt(), the identical variable cm->channel[0].running
or cm->channel[1].running is read without holding this spinlock. Thus,
a possible data race may occur.

To fix this data race, in snd_cmipci_interrupt(), the variables
cm->channel[0].running and cm->channel[1].running are read with holding 
the spinlock cm->reg_lock.

This data race is found by the runtime testing of our tool DILP-2.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 sound/pci/cmipci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index dd9d62e2b633..f791152ec48f 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -1430,7 +1430,7 @@ static int snd_cmipci_capture_spdif_hw_free(struct snd_pcm_substream *subs)
 static irqreturn_t snd_cmipci_interrupt(int irq, void *dev_id)
 {
 	struct cmipci *cm = dev_id;
-	unsigned int status, mask = 0;
+	unsigned int run_flag0, run_flag1, status, mask = 0;
 	
 	/* fastpath out, to ease interrupt sharing */
 	status = snd_cmipci_read(cm, CM_REG_INT_STATUS);
@@ -1445,15 +1445,17 @@ static irqreturn_t snd_cmipci_interrupt(int irq, void *dev_id)
 		mask |= CM_CH1_INT_EN;
 	snd_cmipci_clear_bit(cm, CM_REG_INT_HLDCLR, mask);
 	snd_cmipci_set_bit(cm, CM_REG_INT_HLDCLR, mask);
+	run_flag0 = cm->channel[0].running;
+	run_flag1 = cm->channel[1].running;
 	spin_unlock(&cm->reg_lock);
 
 	if (cm->rmidi && (status & CM_UARTINT))
 		snd_mpu401_uart_interrupt(irq, cm->rmidi->private_data);
 
 	if (cm->pcm) {
-		if ((status & CM_CHINT0) && cm->channel[0].running)
+		if ((status & CM_CHINT0) && run_flag0)
 			snd_pcm_period_elapsed(cm->channel[0].substream);
-		if ((status & CM_CHINT1) && cm->channel[1].running)
+		if ((status & CM_CHINT1) && run_flag1)
 			snd_pcm_period_elapsed(cm->channel[1].substream);
 	}
 	return IRQ_HANDLED;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
