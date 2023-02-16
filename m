Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B016995D1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F768E71;
	Thu, 16 Feb 2023 14:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F768E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676554230;
	bh=PIEfek2XSyFXiT78fsCeDpKQSF3oRPrbKj4TXKb2tBI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b8h9FHGOsHOyK5zQ4M0wjuRbpA+oV8+/pg0smMC8Ol7cjgEILsHdtAkR/RuFf/i3m
	 i/VmqArDY7drnjOM09R8IPec03zDp1Jh2vxn5CM4u3bVk/UlAzQDIVFaFaL3+zzS54
	 SceqpFXoQWEi8sF27gsw940/jT1lZwTKv5ODwtvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 007E4F800E4;
	Thu, 16 Feb 2023 14:29:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8600DF801C0; Thu, 16 Feb 2023 11:36:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 913F8F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913F8F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lgF0FfKx
Received: by mail-pj1-x102c.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so1714478pjw.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dehvFsN/oQxRP7kvlw0fqQwAKQjez3uQqjF/59ORbl4=;
        b=lgF0FfKxqho3//7JsLS7WJ3E3Sqd+i836bjeXgjdRRssOE0dlvKQtmAPiMq+hsbLRP
         axK6NE+ewD1NxTLIW/nja3vxOSozERFr81HeoFAtXYfu83p+0jsykr5p54QoxEu9fC9G
         QPn3AcrwH50yV1JiOlZUWye7jz9zM6aZ6fZDaWrYUTzrr/UdMM+EpdHY2DmHo+o8Ncg/
         rUot3Y1947U5t4YNXABclbQwUhKrBn135xDvUgNm2l0aC34Bmhj803InqDHaIPrFlB+0
         gj7k1Fx9e1KqFujM/ETYgmPHjvhden7FLp8tDqMQgEKCXDbpFatKNI1TeSs611kHZWKI
         uziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dehvFsN/oQxRP7kvlw0fqQwAKQjez3uQqjF/59ORbl4=;
        b=ut7nFaCGIOuoPLXhw2og6eXbh3n89qpVbaOQUw5q4qZT6/uaNF682jrMIGnVyfWwfh
         DN3gj1yt4h7NV3MSUuQ7p1Z4MMUpzc/PioOM4ULSHApV2BzsHtUz9orrnAIoSKIsOHD4
         pgmMKFMGFEPGhjreOGrsB6ZG0kWpHJf4w1Y8PI6VPz6Y9C82yP3cX8W4Z8UoNagPB1Zj
         98XBSF2CcVojCZk3EeUVOj1pweH0Wsg98xYcK/AxPr2wL5KNjAm1+2d9jrhr41NfTtjZ
         ewV+75TuwZ8UXD8rB357wrNFFyNiSpUi2dnTUB/DDFEeq78S5BHtdEe0sfk3lRBnGgiD
         dZXA==
X-Gm-Message-State: AO0yUKWbf0Msy4DaRMQ9e5zQV9k47XQtEU6vSBFkKmngnCHJvHVA7Wie
	DQUQRCUlm7Mh+HYA9JPgzkXSnCh0uWJ/Pg==
X-Google-Smtp-Source: 
 AK7set/ngPMAQ3tYexF8aGEns4clZ+Ez4ftXZTHe9+juQLLYrTknhPH+iaIRpUR+23rWc5WyU1GXPQ==
X-Received: by 2002:a05:6a20:12ca:b0:b8:66d3:30aa with SMTP id
 v10-20020a056a2012ca00b000b866d330aamr6208582pzg.50.1676543800805;
        Thu, 16 Feb 2023 02:36:40 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b00592591d1634sm1012380pfu.97.2023.02.16.02.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 02:36:40 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCHv2] hda/hdmi: Register with vga_switcheroo on Dual GPU Macbooks
Date: Thu, 16 Feb 2023 21:34:51 +1100
Message-Id: <20230216103450.12925-1-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KJIEC5QQZEX6GF64O3RTAMH5TYTOWU7L
X-Message-ID-Hash: KJIEC5QQZEX6GF64O3RTAMH5TYTOWU7L
X-Mailman-Approved-At: Thu, 16 Feb 2023 13:29:33 +0000
CC: Takashi Iwai <tiwai@suse.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Kerem Karabay <kekrby@gmail.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJIEC5QQZEX6GF64O3RTAMH5TYTOWU7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for
AMD") caused only AMD gpu's with PX to have their audio component register
with vga_switcheroo. This meant that Apple Macbooks with apple-gmux as the
gpu switcher no longer had the audio client registering, so when the gpu is
powered off by vga_switcheroo snd_hda_intel is unaware that it should have
suspended the device:

amdgpu: switched off
snd_hda_intel 0000:03:00.1:
    Unable to change power state from D3hot to D0, device inaccessible
snd_hda_intel 0000:03:00.1: CORB reset timeout#2, CORBRP = 65535

To resolve this, we use apple_gmux_detect() and register a
vga_switcheroo audio client when apple-gmux is detected.

Fixes: 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD")
Link: https://lore.kernel.org/all/20230210044826.9834-9-orlandoch.dev@gmail.com/
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
v1->v2: Use apple_gmux_detect(), split this patch out of the patch
series
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 87002670c0c9..cfd2ddfde112 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -50,6 +50,7 @@
 #include <sound/intel-dsp-config.h>
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/apple-gmux.h>
 #include <linux/firmware.h>
 #include <sound/hda_codec.h>
 #include "hda_controller.h"
@@ -1463,7 +1464,7 @@ static struct pci_dev *get_bound_vga(struct pci_dev *pci)
 				 * vgaswitcheroo.
 				 */
 				if (((p->class >> 16) == PCI_BASE_CLASS_DISPLAY) &&
-				    atpx_present())
+				    (atpx_present() || apple_gmux_detect(NULL, NULL)))
 					return p;
 				pci_dev_put(p);
 			}
-- 
2.39.1

