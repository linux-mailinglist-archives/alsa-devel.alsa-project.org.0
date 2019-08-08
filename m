Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B09859B2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 07:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F33E086E;
	Thu,  8 Aug 2019 07:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F33E086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565241447;
	bh=/zfPyYFHd6SgFBNN2AEWhCnHLnkXgnENy6l5rYhB8wQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GOn9nsTvy6zS3YOAMPb9yeUkS+hmZV97E3Rilu8AZJ7xTqfdZe2beOsh1wKyWARU+
	 bpTxWHtMc4Etw5ptc2CCWA7BjJO2bP1fMg5D3KiMvqRt/N2wIXgH7ka+ipjydk2pj4
	 hygq2YOAOwyHh7z+vlPgz9WHBgssxa6AL8oM4mPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E14EF80534;
	Thu,  8 Aug 2019 07:15:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B3DF80534; Thu,  8 Aug 2019 07:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63FDFF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 07:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63FDFF803F3
Received: by mail-yw1-f67.google.com with SMTP id g19so32810120ywe.2
 for <alsa-devel@alsa-project.org>; Wed, 07 Aug 2019 22:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zqjm4Ms2LWPF2JxoVedKSLuooEVD3FC/Jr22qU9ttc0=;
 b=a1v1Ytx4Ubv3Fn7yzsKr3sHGa12eAXWg7ODy4Fp6Hqooutw+l7dVmBAjISYy/KuSmH
 sZTMgAs+LHjvop4xfXaWgRJu4QPksKaZPO+zQl0R9tn9f1iUbmb2X5m8vOvf1c/4Pvpu
 W6xpRnSC7r5N97igFiM964EdKKXkVXjVwjanJPsfR8WEcGDU2nWL9+/xWbKYlHFYRPw6
 /E10HJyZ3BROcw+yHL6w3GQ+4lvmSo3m8UM2CLxhRsB4YmBYAxpxpaHoZkB6yhBndYdF
 JRB37kumLU6bYB6uHuX3jy+WmJQ/UsVdP71jh7gyt5s2E5ZVECid3z+K1R1pisYg2vEw
 sCpw==
X-Gm-Message-State: APjAAAXgXRpwrKUhccQT0NGKuys2UgjXzk5MQdCOrGVy5PVAF2ijoCfE
 wenmf9VTO0HWywAX8fX74xQ=
X-Google-Smtp-Source: APXvYqz08Zg+vgGovvm4k352MtWnv23Tf4vN81JusC7DQRnlND+8TfbEZkvXgCbk83qqGwiPPM57FA==
X-Received: by 2002:a81:33cd:: with SMTP id z196mr7990265ywz.213.1565241335327; 
 Wed, 07 Aug 2019 22:15:35 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id v141sm20845902ywe.66.2019.08.07.22.15.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 22:15:34 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Thu,  8 Aug 2019 00:15:21 -0500
Message-Id: <1565241321-2418-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] sound: fix a memory leak bug
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

In sound_insert_unit(), the controlling structure 's' is allocated through
kmalloc(). Then it is added to the sound driver list by invoking
__sound_insert_unit(). Later on, if __register_chrdev() fails, 's' is
removed from the list through __sound_remove_unit(). If 'index' is not less
than 0, -EBUSY is returned to indicate the error. However, 's' is not
deallocated on this execution path, leading to a memory leak bug.

To fix the above issue, free 's' before -EBUSY is returned.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 sound/sound_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index b730d97..90d118c 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -275,7 +275,8 @@ static int sound_insert_unit(struct sound_unit **list, const struct file_operati
 				goto retry;
 			}
 			spin_unlock(&sound_loader_lock);
-			return -EBUSY;
+			r = -EBUSY;
+			goto fail;
 		}
 	}
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
