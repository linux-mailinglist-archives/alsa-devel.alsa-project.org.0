Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFF3B5AB
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 10:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 243D291E;
	Sun, 28 Apr 2019 10:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 243D291E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556438619;
	bh=RPgvH0t1SL9v+i9yKyUsB8cqvDIksXfLoN6Fm/fpgKY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gDQz9DItFkf0If4kkerhhKvpcc9BH7GzFFf3q73Mo/NBv7RtkhINSBc50Iv+RCJ6P
	 7BH42n7/uTPOFby2VANK6IDAw+Omb0smAKaI/1F9dQqR8Gi5xUeV8cSfu4EayukAbH
	 TT2qzf/8WkN7rADb3si5TYrL0Hq5KU5IPCT/gYu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08518F8962C;
	Sun, 28 Apr 2019 10:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261EAF8962C; Sun, 28 Apr 2019 10:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
 by alsa1.perex.cz (Postfix) with ESMTP id 60F78F8070B
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 10:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F78F8070B
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992227AbfD1ICUn0SDV (ORCPT
 <rfc822;alsa-devel@alsa-project.org>);
 Sun, 28 Apr 2019 10:02:20 +0200
Date: Sun, 28 Apr 2019 10:02:16 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: alsa-devel@alsa-project.org
Message-ID: <20190428080216.GA26628@lenoch>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Petr Nosek <petr.nosek@gmail.com>
Subject: [alsa-devel] [PATCH v2] ALSA: hda/realtek: Enable audio output of
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
internal speaker and the headphone until ALC294_FIXUP_ASUS_SPK quirk
applied.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=203443
Suggested-by: Petr Nosek <petr.nosek@gmail.com>
Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 CHANGES:
 - v2: adjusted commit message

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
