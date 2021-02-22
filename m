Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE69324F2F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:29:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D0016A3;
	Thu, 25 Feb 2021 12:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D0016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252596;
	bh=SnQsFkEbxqH2EVertjyr9tWw9RhQwDeeBx3bP9SWN7g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N1nl+/ibWkJRljxuhuW8yWBuiXD226BSiW/h4fUuJyf6EGuDP39H3nYlCzemBaEfI
	 2yT3i4RMlc4W/SsPY0BRwgE3gCH7UtiEr3ixtzq6kxdIXLsWFtdBxV9yyUh0bW2wHS
	 j9vA+obsP05Vvp8FHFeTSDIoApIeDrk2Bwzz5Gyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D577FF804AB;
	Thu, 25 Feb 2021 12:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D0FF8016C; Mon, 22 Feb 2021 20:42:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2477F80082
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 20:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2477F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XnlFPzGD"
Received: by mail-pl1-x62e.google.com with SMTP id a24so8366023plm.11
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 11:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vq/LjtkFh9pERziNSLl6ylHhs+PEljKyW7ISagnaboE=;
 b=XnlFPzGDm2iVBbnCctLYiQ0ZZVvR0bP9dNZwKJQG5BBdmWwo1WppTcH4qDHyV6SIlu
 vZbUPQkyhNZLNJee5cvHVsD6fAzt6mQFMW0RxPkDctKiWe9bxZTncWKlKbRNQBf6bTvS
 g2f6GWr6CU5cd5jM84+s7kWAcyZvDTznUyW6GGI/z51iiVutA3gI/Sn5p6TgmqBSgfIn
 NIh4mjgOxc9jQ/RbsFk+9tnMe8KATAaoDDJ2bve/k7/4+henrRIymoe6D20iu2unXXsx
 +E8DQbc/aysGY8o2nm2rhHFPw2OkmYlHC35xBa9VzYAgEhju5SIR4q1+cjiHK4aJ7zJc
 nfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vq/LjtkFh9pERziNSLl6ylHhs+PEljKyW7ISagnaboE=;
 b=YhBw6IKMY+SN7cwq2Drdq5fm7ip6OB6BZUQdd68XDRaSQaINfD1p/wFr7/Z0T3Xf3y
 tpFzGzA58/Gz72ZEnSylpiE1eVeB408Xs+9/i3LrqSSqASiAppK4Fx9QaRPE7LhwMwG2
 BwKKl6IVf8OIMalNi26PSGcDkcEW7hkXfW8l5kPdMcy4YRdD0ZoA+/JAmmHlopkFGdUz
 8Kt55RemuyEi0KxqGsEA+oSvVPVZZpwBefySumECGQ9wrsUZqzjClhgavPCkrFenoW55
 skn/X4Cz+UY+lcj6KG0tBY+ENXRkW4m2nJQft44gkhF6Q70uthGcOA0/UIRenjm6CFEP
 LlOw==
X-Gm-Message-State: AOAM531oJLBlIVmbx+NeEHo2TcLtOqKxTsYd7qdYBDDcmptK1ycow8Qe
 mR/m/m3qZ+0Y6oyJJHLuwl8=
X-Google-Smtp-Source: ABdhPJwYItbZQJc4+/MmJCXyy1YmB7Y8ohzyJLyZa08XcyTi4YjVuF8Iz8/umZ7XfJPtXaj4u/NhQg==
X-Received: by 2002:a17:90a:ad4a:: with SMTP id
 w10mr16495041pjv.112.1614022932721; 
 Mon, 22 Feb 2021 11:42:12 -0800 (PST)
Received: from localhost ([103.106.200.56])
 by smtp.gmail.com with ESMTPSA id c23sm19578464pfi.47.2021.02.22.11.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 11:42:11 -0800 (PST)
From: Rajesh Kumbhakar <sssraj.sssraj@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sfr@canb.auug.org.au
Subject: [PATCH] sound: core: fixed coding style errors
Date: Mon, 22 Feb 2021 11:41:56 -0800
Message-Id: <20210222194156.26758-1-sssraj.sssraj@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rajesh Kumbhakar <sssraj.sssraj@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

fixing ERROR: "foo * bar" should be "foo *bar"
fixing WARNING: Missing a blank line after declarations

Signed-off-by: Rajesh Kumbhakar <sssraj.sssraj@gmail.com>
---
 sound/core/hwdep_compat.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/hwdep_compat.c b/sound/core/hwdep_compat.c
index a0b76706c..d8624a14a 100644
--- a/sound/core/hwdep_compat.c
+++ b/sound/core/hwdep_compat.c
@@ -36,11 +36,13 @@ enum {
 	SNDRV_HWDEP_IOCTL_DSP_LOAD32   = _IOW('H', 0x03, struct snd_hwdep_dsp_image32)
 };
 
-static long snd_hwdep_ioctl_compat(struct file * file, unsigned int cmd,
+static long snd_hwdep_ioctl_compat(struct file *file, unsigned int cmd,
 				   unsigned long arg)
 {
 	struct snd_hwdep *hw = file->private_data;
+
 	void __user *argp = compat_ptr(arg);
+
 	switch (cmd) {
 	case SNDRV_HWDEP_IOCTL_PVERSION:
 	case SNDRV_HWDEP_IOCTL_INFO:
-- 
2.25.1

