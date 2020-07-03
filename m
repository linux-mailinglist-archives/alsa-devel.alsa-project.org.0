Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F72135AA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2AC16DB;
	Fri,  3 Jul 2020 10:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2AC16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593763345;
	bh=TDp7ie/cFTS39T/UMNdI1dOULdPWfDdqsWgViOVZnzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbFIq2TjfMztITRJwTjUGGz3igC7jDSDQyJlJNuvfrOmiKb1veZDiePjLkUzoWe1+
	 UweWqwa/CJNG+ECyYjRR8IP2p2x5kP/A8bkyxxMduOUVx0NzkLpuedQdZw6GUI74Oh
	 /VKZQUHMcK5PqrmiGjjQmS91hxhHj2KaX0j4sGIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E106F80269;
	Fri,  3 Jul 2020 10:01:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46746F8025F; Fri,  3 Jul 2020 10:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0711F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0711F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VV8RMLeq"
Received: by mail-pg1-x543.google.com with SMTP id d4so14747399pgk.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0hsRzjk7oDI2hHiljYy7+BkiNjsSGmqdQfPYb2C3vo=;
 b=VV8RMLeqDB3Fr64lEpXGvMtxlKJlEAhYtgeuiVd0k2z+XgT2p5uPvrEUrO6uaLdA3P
 I59oFuyyPTu11XtuJkRVoSCegYyto5LDDDneQ59E8EgZiJzY3J3G4m1yVRGZYs0mp2fx
 Lzkme3llv/mSAp/Kj6E5XS3MABMZvb/LT0N5zm92Tv/jdwcBmhEtRno1BHo/f/oBfMUk
 4XNfUI7ICxbnfQoRhfowX4J9dk+gdXMSRlSZe5ozX9rMN7bUqX8fj2+oXM7P7eQBGulU
 9onhveDtZg5OkPdVEABzUqeynbso1h8Wm5atfBTSApQngR5S9qCAghxSnyNeAaTESsya
 86Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0hsRzjk7oDI2hHiljYy7+BkiNjsSGmqdQfPYb2C3vo=;
 b=W/Si4V1mW9tOND8CiMX7Q+yy7k6u67DFc7IlsWBwQxnagi9p5cQf9CmfPHOpjCB5tf
 GLcs3Kl1k1/bKrJeGnjIs+0Z85YfKxZlZvKWwBk+NGxhPBrkBbWil9Er26SD9Kros+rA
 0EbyD6gOJW49nySFlisbTbYQddBSXVjghNP5HkyAN69Hj/U6Bmk8UaBihEjbWmbnF0Cq
 byUbel2aCYG1aty7dzvOdpiu8sZzaIBb7OuxJlK6FLXFQxkvySA8/Rh3lWLOqZyx5CW9
 y6j3xq7tFewBrJgIOxr3HVH1obN3ZegpofkEYOV0Oc0E4hRfB9hFH2uecgtro/ALdHyh
 62jw==
X-Gm-Message-State: AOAM533UdRWE30/rA1yue/ShWc791774zR8OniX9VRoUn7Rw8d7QiiQK
 EFPtQ6na9XuUS7EBWH3scqcQ8cdzQlc=
X-Google-Smtp-Source: ABdhPJx/TNm4zqlqMSznBRlLErdQuHyyQdeJG7/XvOb+/oLpS4Qj+1q8blwzoVRTYeU4LcUE9zSjgA==
X-Received: by 2002:a05:6a00:78a:: with SMTP id
 g10mr14518936pfu.0.1593763254908; 
 Fri, 03 Jul 2020 01:00:54 -0700 (PDT)
Received: from f3.nvidia.com (ae055068.dynamic.ppp.asahi-net.or.jp.
 [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id 17sm8956411pfv.16.2020.07.03.01.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:00:54 -0700 (PDT)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: hda/realtek - Fix Lenovo Thinkpad X1 Carbon 7th
 quirk subdevice id
Date: Fri,  3 Jul 2020 17:00:04 +0900
Message-Id: <20200703080005.8942-2-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703080005.8942-1-benjamin.poirier@gmail.com>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

1)
In snd_hda_pick_fixup(), quirks are first matched by PCI SSID and then, if
there is no match, by codec SSID. The Lenovo "ThinkPad X1 Carbon 7th" has
an audio chip with PCI SSID 0x2292 and codec SSID 0x2293[1]. Therefore, fix
the quirk meant for that device to match on .subdevice == 0x2292.

2)
The "Thinkpad X1 Yoga 7th" does not exist. The companion product to the
Carbon 7th is the Yoga 4th. That device has an audio chip with PCI SSID
0x2292 and codec SSID 0x2292[2]. Given the behavior of
snd_hda_pick_fixup(), it is not possible to have a separate quirk for the
Yoga based on SSID. Therefore, merge the quirks meant for the Carbon and
Yoga. This preserves the current behavior for the Yoga.

[1] This is the case on my own machine and can also be checked here
https://github.com/linuxhw/LsPCI/tree/master/Notebook/Lenovo/ThinkPad
https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3225701
[2]
https://github.com/linuxhw/LsPCI/tree/master/Convertible/Lenovo/ThinkPad
https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3176355

Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
Fixes: 54a6a7dc107d ("ALSA: hda/realtek - Add quirk for the bass speaker on Lenovo Yoga X1 7th gen")
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>
Tested-by: Vincent Bernat <vincent@bernat.ch>
Tested-by: Even Brenden <evenbrenden@gmail.com>
Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5a11ac2d446d..16696694da91 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7559,8 +7559,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
-	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
-- 
2.27.0

