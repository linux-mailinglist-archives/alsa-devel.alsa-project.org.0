Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26D377752
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 08:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9DA2062;
	Sat, 27 Jul 2019 08:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9DA2062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564209970;
	bh=586BzHfd8jQoqbLIzkeaccF2JS4qCOSvqdtfadGM30k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=my3e2FLiavDp1Dtj401P4fcPBzCRZYv1+BxRMWDG3vJHCdgcJcxnFvvtCNhwoz7c8
	 ZoJbva7/gAf4PxPHfRafNmngpNvgOFfEowfYal7y1oNcs47Zyzdqor9PO69CUStke8
	 XQ3GpgU7PvvZ+hsuXuVHxaAxzBOB7KopZKiw6Duc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 540E9F8044A;
	Sat, 27 Jul 2019 08:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F69F803D0; Thu, 25 Jul 2019 04:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EB7CF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 04:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB7CF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OS7tR5zy"
Received: by mail-pf1-x442.google.com with SMTP id r1so21860842pfq.12
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 19:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6xcP5bA0sOT1XKD434f1tzHJ1w8Z5pUhBurvR0md3Y=;
 b=OS7tR5zyV52UK8u0O/4vWdCPtirPj+DX3kR5Qgo2YISvEdfPqAmP6f7NJy+3klPmT4
 RfiJkeso73KofXRUuat2uX68lTB2nU+lTIoDsvW+XXbqveTSN22AxhIXfvTl1OPmEGOX
 DH3L7/9/XwY5TeTaDs6ABHYUM5FB1G0P87Pr1+h/ZEgE/aGHr9TSGUmLgFDYzYzqlESP
 1iAG/50feaU5Wpnt7JFSAudk6bjOxCwMgQE2p0Aw+aNMQHkFGspQpD8Jd1B6o/qaNIi6
 T5cdmRleLEqVXZqLsvnAhx+nQAuZlQQO0MSsTDOGkl5s4M6GF7nA2xY1Q2icg/YVFy96
 pCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6xcP5bA0sOT1XKD434f1tzHJ1w8Z5pUhBurvR0md3Y=;
 b=W/6wwfqHT6uVi7ZBCN4GIp21CyuEkK3ulxnbdtkdLkfKTowSjxPb5XkF+54XK49m6x
 lBW0GicwgeXNoSKuaK2Aeu+bdvkKiHr/yz8P8cTGO8mQxznl+xLTgkrqMpATy5UPi/+s
 mZe0pyb6qI078eacVmhOpMrfYUyf0FO4pUpsnFpm5t52wE9OI+12lzRNZp/wzelQ8Vwl
 hLjnfeT5Jr9OdT3jb0IwGtAD6Rtwq6MSLFfA+BeStAhjSn55chxSjQV67d19t9QFKEBc
 cXB78tYkej4bUiBPespnwQ+MdhmN/vFmCyxJIZrUpnZctmYgtxZmIUENbjOciQGsqntw
 P4hg==
X-Gm-Message-State: APjAAAXizykSNyilRuwVrE6u2l0OfE+nWGGujCX1AJzQfD8kFzC28PAD
 baumohb+TofGjT1gE62TcRM=
X-Google-Smtp-Source: APXvYqy09Mds/SHzIx9nVdnz1Mx3LWHtzspmtN58tOrZhoceS+OUaqb+iSoiBuk9HxtsEaV20c2MbQ==
X-Received: by 2002:a17:90a:2430:: with SMTP id
 h45mr92683720pje.14.1564020569953; 
 Wed, 24 Jul 2019 19:09:29 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id q1sm56990685pfg.84.2019.07.24.19.09.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 19:09:29 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Thu, 25 Jul 2019 10:09:24 +0800
Message-Id: <20190725020924.7643-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 27 Jul 2019 08:43:36 +0200
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: echoaudio: Replace kmalloc + memcpy with
	kmemdup
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

Instead of using kmalloc + memcpy, use kmemdup
to simplify the code.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index b612a536a5a1..ca9125726be2 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2189,11 +2189,10 @@ static int snd_echo_resume(struct device *dev)
 	u32 pipe_alloc_mask;
 	int err;
 
-	commpage_bak = kmalloc(sizeof(*commpage), GFP_KERNEL);
+	commpage = chip->comm_page;
+	commpage_bak = kmemdup(commpage, sizeof(*commpage), GFP_KERNEL);
 	if (commpage_bak == NULL)
 		return -ENOMEM;
-	commpage = chip->comm_page;
-	memcpy(commpage_bak, commpage, sizeof(*commpage));
 
 	err = init_hw(chip, chip->pci->device, chip->pci->subsystem_device);
 	if (err < 0) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
