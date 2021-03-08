Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4E331FAE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:06:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176E817DD;
	Tue,  9 Mar 2021 08:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176E817DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273611;
	bh=XYd/samGcXEe3kImjos3lFoXUEYLe1K9WW4i1p27cr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CAt1C5sGwtiW+dBwkLEKMhYdbFAQQz3NuGbYhEMD2U0jYy7rzhG13OXOXUEU/1IK9
	 ljKr7kimERRxwGHSmLhkF2gJ3UdzowaK3grozl5Kwla27G/2zrLXdfq3F2vW8sXZ1f
	 49yiftWlQk1o+kRzNfXCaMnqyGxVzU5oUMY7XwQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46003F804D9;
	Tue,  9 Mar 2021 08:02:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40432F801D8; Mon,  8 Mar 2021 23:30:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7B28F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B28F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q2RMvGYZ"
Received: by mail-lf1-x136.google.com with SMTP id p21so23628535lfu.11
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iW5ng6iEejvRMljMHfkKvj6+YTTzMof7NCYEOCF/AsQ=;
 b=Q2RMvGYZWGjX429xvgVCL9cuQIc+3cKcAD9TLhoHLcmuIXN2Let0Jbtk3LdbODPNTa
 NxeK/8zzqLqmf1qVDoT9MN/ocENVPb1ekZ4Gj+Sw3vIB74lolRKGxVQ54yjAaiJN97tT
 7iNprzA6v1+yu6EXzCkzSYB4qm+pSA+mKWfgKJ70nFYjgkPLry9BvZuujFXL8P7BXOzt
 cNhhkw8fO4oXkvWQKt84Ssqe9TlQK7tde3SyruRlvdk9CV5gOI7Omf331lSkOFgdbwOk
 ngCsz58cGJr76i8xxLSr1ilU95Kd0swhXX00QzpDXO50aqdBTBTP8H7zzyWl4XAGUfSI
 DTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iW5ng6iEejvRMljMHfkKvj6+YTTzMof7NCYEOCF/AsQ=;
 b=qU5adxt878OZdhi4fuQHBsW4u0AcM5fecp3kMfBMeHLgHpPM4UVQcElR5eKWAwEyie
 FABWvJIvFOgkYQYMvahDllZrR+f2PUiXnt+z8qHCISWziFdWC/WbB4DpdW6N8MQdlIzK
 aqiBykeyMBWER6p1VNeDPUeT3S4DF/u9KyyCuiO4Xtv4kd9DXh+lOFBgnwzhOi/jn9pv
 Mj68q8IegQvhAsnP3xnDcUaj/9rW2xcUha+4oCvlU0pYyoCGIB2krfSX3FJByLxYPaFM
 WVt41t6wmHq0HDw0mzijXKD43L7ag8lio43n0rGIeHsvSD6rj5N6zkqHfDYMFNKWrlHQ
 df/Q==
X-Gm-Message-State: AOAM532SJVkJEH+d7E5O6OBK6hAqQcNZCI8ym/yTd0CYgr3y47lmwaHA
 5KUk8vTX32gIvv+UzDXn/YXMmjJownNeZ1cp
X-Google-Smtp-Source: ABdhPJxoslaDSSHtgXh6g/iImKFgMLC6pad8pEJWqxQDJorwJEiY3vd+1Oh2zSRB94JhMkf6WShACw==
X-Received: by 2002:a05:6512:482:: with SMTP id
 v2mr15983387lfq.52.1615242648619; 
 Mon, 08 Mar 2021 14:30:48 -0800 (PST)
Received: from localhost.localdomain ([94.103.235.167])
 by smtp.gmail.com with ESMTPSA id x27sm1496976lfu.151.2021.03.08.14.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:30:48 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	kai.heng.feng@canonical.com
Subject: [PATCH next 1/2] sound: usb: fix NULL ptr dereference in
 usb_audio_probe
Date: Tue,  9 Mar 2021 01:30:36 +0300
Message-Id: <f1ebad6e721412843bd1b12584444c0a63c6b2fb.1615242183.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615242183.git.paskripkin@gmail.com>
References: <cover.1615242183.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:02:00 +0100
Cc: Pavel Skripkin <paskripkin@gmail.com>, alsa-devel@alsa-project.org,
 syzbot+719da9b149a931f5143f@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
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

syzbot reported null pointer dereference in usb_audio_probe.
The problem was in case, when quirk == NULL. It's not an
error condition, so quirk must be checked before dereferencing.

Call Trace:
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xe60 drivers/base/dd.c:554
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:740
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:846
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:914
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbdb/0x1db0 drivers/base/core.c:3242
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xe60 drivers/base/dd.c:554
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:740
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:846
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:914
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbdb/0x1db0 drivers/base/core.c:3242
 usb_new_device.cold+0x721/0x1058 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x2357/0x4320 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Reported-by: syzbot+719da9b149a931f5143f@syzkaller.appspotmail.com
Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 sound/usb/card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 08c794883299..3fd1743513b5 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -830,7 +830,8 @@ static int usb_audio_probe(struct usb_interface *intf,
 		snd_media_device_create(chip, intf);
 	}
 
-	chip->quirk_type = quirk->type;
+	if (quirk)
+		chip->quirk_type = quirk->type;
 
 	usb_chip[chip->index] = chip;
 	chip->intf[chip->num_interfaces] = intf;
-- 
2.25.1

