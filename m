Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42EB449
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB411697;
	Sat, 27 Apr 2019 20:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB411697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389331;
	bh=xpzgvLmuxkisPTKijJ5U0KMBFqs97vAQIgEOnPPEW08=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XIPw8/r5TJdl8ZFIjEn2HX07jCX63hVH2+3mlqfTdZTUbd+qH+IOmYoaZMRrpsq8J
	 ONTBgXoWUx2MdSGQbpBA4/XBpIECavMeSkJHjNFWUaYPF6L3SaFYV3muW4N87yH1E2
	 qD/04oxGfjI5kBR3Yht5LVzehKmYEgK41kIwpkk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D869F898A5;
	Sat, 27 Apr 2019 19:55:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9468EF8973E; Sat, 27 Apr 2019 19:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id 88667F897B6
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 19:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88667F897B6
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23991216AbfD0Rymfm5J6 (ORCPT
 <rfc822;alsa-devel@alsa-project.org>);
 Sat, 27 Apr 2019 19:54:42 +0200
Date: Sat, 27 Apr 2019 19:54:41 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: alsa-devel@alsa-project.org
Message-ID: <20190427175441.GA21587@lenoch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAqJ6B_FQK=nPHsxwOq4c0YsoBrxaX7gD0QC0L1T0cUVwcAmTw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Petr Nosek <petr.nosek@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek: Enable internal speaker of
 ASUS UX362FA with ALC294
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

The ASUS UX362FA with ALC294 cannot detect the outputs through the
internal speaker until ALC294_FIXUP_ASUS_SPK quirk applied.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=203443
Suggested-by: Petr Nosek <petr.nosek@gmail.com>
Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Hi Petr,

 I tried to verify information in your patch, but all links you provided
 are unpleasant to read and you also didn't provide bootlog, so I had to
 trust you that your machine comes with ALC294...
 Also, does it fix internal speaker only or also headphones? We need to
 get commit log right. Once verified, let's send v2 of this patch with
 your Tested-by tag and posibly Cc: stable. Thank you.

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 070749b50eff..490b42e3e3dc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6896,6 +6896,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x12f0, "ASUS X541UV", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x12e0, "ASUS X541SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x13e1, "ASUS UX362FA", ALC294_FIXUP_ASUS_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS_ZENBOOK),
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x16e3, "ASUS UX50", ALC269_FIXUP_STEREO_DMIC),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
