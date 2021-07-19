Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45BB3CCC7E
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 05:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BEA1654;
	Mon, 19 Jul 2021 05:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BEA1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626663881;
	bh=cg5fHicJdEPpjuvspeHP5u/K/CdHLfhA2IWWbXP4DsA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=otqtRNwpLUDZh+8/CGjXXvokFK9iRr74Cmivj5yC0iQf4wgszUBXxAszpuefb1IC8
	 uVRiESmBjSweUNGe4fXegmtJYnVnkP8Su0rv0N7O2YeMWOP1MNfq9sKnMdw81e7KlU
	 skqWBpERrPW/YES73ABBTXmIz5j5YWkaBL5ZsNXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C34F80256;
	Mon, 19 Jul 2021 05:03:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77AA7F80227; Mon, 19 Jul 2021 05:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8152DF800DA
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 05:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8152DF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="RAahdELQ"
Received: from localhost.localdomain (unknown [223.104.247.91])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 762B7401C0; 
 Mon, 19 Jul 2021 03:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626663775;
 bh=FzKKXAxgTJvuH9M/lf6UV/1CISwlRZ4VmxlsEvkpwQ4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=RAahdELQpXoz16xOIZJ1RcwjVw1C3GpWWwO0Oh/qTD7U63qgS0MN33nrugP14OKA1
 IeA/8JhZ3R1ya4kpJKlbqr0tV3hRxbO4wdbEk024WHgzZ2Xk9c2rZhwgwDTsNoi1Vr
 rsxZCDHrQlLF1vbi3fjpuHAzxzhZFl9mfz6Xp2Rh0116VQUp+I5lMjimv/cd7HuEmt
 RIf9yW1tr7X3MiB95hf9BY518bU84nxbUKxRpPAxHD+ihntJTY/8pNve2gvOSLQyR5
 Qjt/PYeTM/jdvDoflpdEgTVBOvY1Yfy4l1+UpA3xXRUn6cVmJVDDwRy5p0Ll0JSyq0
 VcnKUNYV6xQ+A==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix pop noise and 2 Front Mic issues on a
 machine
Date: Mon, 19 Jul 2021 11:02:31 +0800
Message-Id: <20210719030231.6870-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is a Lenovo ThinkStation machine which uses the codec alc623.
There are 2 issues on this machine, the 1st one is the pop noise in
the lineout, the 2nd one is there are 2 Front Mics and pulseaudio
can't handle them, After applying the fixup of
ALC623_FIXUP_LENOVO_THINKSTATION_P340 to this machine, the 2 issues
are fixed.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1389cfd5e0db..caaf0e8aac11 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8626,6 +8626,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3151, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
-- 
2.25.1

