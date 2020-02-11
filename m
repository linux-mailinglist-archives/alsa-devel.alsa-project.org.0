Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D81589DA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 06:58:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370721682;
	Tue, 11 Feb 2020 06:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370721682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581400710;
	bh=DY5jhO4Ooqy3NK6D5l2fpKrZY/Gp8dN3mgpaXzl7XAQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KwWP65+DBU1rAQaEjc6T4w+4LBjjpjz7wNWs+/jDOnRr0rH9tLs/0oE23DKgJX1yN
	 JNq8yr9/bgTLHYxcS/L8oktoPp5PFTH+XVuK+FGR3SV//GSLPhEx4V8uH2GxcN0u2F
	 zu5rTblsGa2t5yRexeLIvaDclFJOPDH0cHHtOCmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E9FF801DA;
	Tue, 11 Feb 2020 06:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2CBDF80147; Tue, 11 Feb 2020 06:57:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B43F8013E
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 06:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B43F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gvZxgNzB"
Received: by mail-pg1-x541.google.com with SMTP id 6so5151574pgk.0
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 21:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kjJUuCHQpi9LW6K3SCFPHipBrAr50LwcH0CdlL5eTMs=;
 b=gvZxgNzBgl0TJLLOKiE2TTF3Pqx0vKD/tvCvkLUzP6Om61XXLI7C0Qtt/rFQyK5dB7
 3081QHioDn8bO1jrkqq6QgBIAhFiA3iKHTFllBxbdjVXK9AmD6iK5/zaJwYyGerB3tsb
 i9HejBAl/Y46aLKXfQVF0q/+B9l3Emf8TkFcTwy2Y9zKgQOZAf4+bNbASentgv46zlAB
 FAXINDmBSg2RS+R4+YZrVyYvWQCSfm7hbo3nczDBuHvaBrrFfqyPpfA81uNMJ4m2cGDI
 IzoFbN+WC5Gnr22i/Zaho7uMJYu2Vu+QNZXW1s7DtpvQuoNlgUON9cKcRc9plXUCIs7d
 39mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kjJUuCHQpi9LW6K3SCFPHipBrAr50LwcH0CdlL5eTMs=;
 b=ekOt3cvWBBCjiVF5SU8uT18TDwCZxeyHskDclZkM7qa7oxZr7tFuqOSW+fGkgTIAK4
 O9ePAw5prYrL5/37/m3q69OuL6iHjpv2xBn3NcDiwDD84ZGGhZLBo9eV8TbX6+mpvVNs
 I/EPUOUkoiyGVbLbnD//ZYBcpvhwi1fln+q0JwD4fdSD1vJcJe+JzVc9qvk2x2BakcQ0
 giAw2YR/Fe1lZesf8JK55MueJ6WgVvPoKgohHrVw3Soe6xJ75lqKPaaDHd+53e9HQwVP
 gxuR0u7/I5GqAQv3yXFY6pMZVngexXE657+JlNHbvF4tdrpLFTZ7EGZil8RQYlntcfT2
 1kOQ==
X-Gm-Message-State: APjAAAXYalSxpEkgRQEh7vjIf7joNondWw2NFkJ5gTvUM3N4GSAIYyP7
 nQMiAF9IvyMpb2+9zgjVfz4=
X-Google-Smtp-Source: APXvYqzOBM4eqdyXiL3AzHLtbF778Ggsf2iOPk8M3cfPyFjBwDrfq3tLZnzRT7QmuN3of3XJvP8++Q==
X-Received: by 2002:a63:cc4c:: with SMTP id q12mr5144257pgi.443.1581400648891; 
 Mon, 10 Feb 2020 21:57:28 -0800 (PST)
Received: from f3.synalogic.ca (ag119225.dynamic.ppp.asahi-net.or.jp.
 [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id x6sm2355617pfi.83.2020.02.10.21.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:57:28 -0800 (PST)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 Feb 2020 14:56:50 +0900
Message-Id: <20200211055651.4405-1-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda/realtek - Fix Lenovo Thinkpad X1
	Carbon 7th quirk subdevice id
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

fixes the pci subsystem device ids for the "Thinkpad X1 Carbon 7th" and
"Thinkpad X1 Yoga 7th" quirks.

My machine reports the following:
dmidecode -t system
        Manufacturer: LENOVO
        Product Name: 20QDCTO1WW
        Version: ThinkPad X1 Carbon 7th

lspci -s 1f.3 -vnn
00:1f.3 Audio device [0403]: Intel Corporation Cannon Point-LP High Definition Audio Controller [8086:9dc8] (rev 11) (prog-if 80)
        Subsystem: Lenovo Cannon Point-LP High Definition Audio Controller [17aa:2292]

/proc/asound/card0/codec#0
	Subsystem Id: 0x17aa2293

Notice the different subsystem device ids between pci info and codec info.

commit d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo
Carbon X1 7th gen") added a quirk meant for the X1 Carbon but used device
id 0x2293. Note that this does not match the PCI SSID but it matches the
codec SSID.
commit 54a6a7dc107d ("ALSA: hda/realtek - Add quirk for the bass speaker on
Lenovo Yoga X1 7th gen") added a quirk meant for the X1 Yoga but used
subdevice id 0x2292, the PCI SSID used on the X1 Carbon.

Given that in snd_hdac_device_init() quirks are first matched by PCI SSID
and then, if there is no match, by codec SSID, the net result is that the
quirk labelled "Thinkpad X1 Yoga 7th" now gets applied on the X1 Carbon.
Example from my machine (an X1 Carbon, not Yoga):
[   15.817637] snd_hda_codec_realtek hdaudioC0D0: ALC285: picked fixup Thinkpad X1 Yoga 7th (PCI SSID)

Therefore, fix the subdevice id for the "ThinkPad X1 Carbon 7th" quirk.

Note that looking through the lspci outputs collected at
https://github.com/linuxhw/LsPCI/tree/master/Notebook/Lenovo/ThinkPad
all X1 Carbon there have an Audio device with PCI SSID 0x2292, which
matches with the output from my machine.

This leaves the question of what to do with the quirk labelled "Thinkpad X1
Yoga 7th".

From email discussions, it seems that the author of commit 54a6a7dc107d
("ALSA: hda/realtek - Add quirk for the bass speaker on Lenovo Yoga X1 7th
gen") did not have a device to test the changes. I don't have an X1 Yoga
either and I did not find a sample lspci listing for it online. Therefore,
the best course of action seems to be to remove that quirk. In the best
case, the quirk for the X1 Carbon will match the X1 Yoga (via PCI SSID or
codec SSID). In the worst case, it will not and someone who actually has
such a machine should come forth with concrete data about subsystem ids and
needed quirks.

Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
Fixes: 54a6a7dc107d ("ALSA: hda/realtek - Add quirk for the bass speaker on Lenovo Yoga X1 7th gen")
Link: https://lore.kernel.org/alsa-devel/20200210025249.GA2700@f3/
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>
Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4770fb3f51fb..05d44df2008e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7268,8 +7268,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
-	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
