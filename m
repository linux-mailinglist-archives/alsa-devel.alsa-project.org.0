Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D656428421
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 01:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF10D1686;
	Mon, 11 Oct 2021 01:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF10D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633906962;
	bh=chr65zOAdK/IIXSdakASPWEGmHnYox9KnKOM7txVQpM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Afa/2wnBjug2gzyuFKt9t+pHo7WpQxfJJ7r0GDoKJfSVcYbYjPdsDJNvc1sEVBTQ0
	 k0SREqZZQKegcbB840vsU8UAp0YBZTXR5whKkubrCSOg0Brbzu9aWGir/w2G9IK4lp
	 cCKbnS64sz9Kszoh59aupnfMd375KImIRucG6PKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 410A9F80059;
	Mon, 11 Oct 2021 01:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 802FCF801F7; Mon, 11 Oct 2021 01:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54AE5F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 01:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54AE5F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="e/TmDxBl"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id d07635dd;
 Sun, 10 Oct 2021 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=1; bh=xPuRpsibpV2sdddVzlfHIymtpfg=; b=e/TmDxBlqxRGzEYoR5wXr1D
 oYsFm5cxXCnSm3Tv5KxQ8nUvNuJ0mjYYfdOy01uDZdXI0E/g5DpI0cd118iMSms9
 jZzZPyaDix544DD6UBgW1WhsgDkUX4H2dq2R6OTA0jh4VBoOCGgvDs3K00JitrgD
 ddVx9zt5z0pYJ+MKeSHI=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 65f17820
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Oct 2021 15:54:31 -0700 (PDT)
From: Cameron Berkenpas <cam@neo-zeon.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Fix for quirk to enable speaker output on
 the Lenovo 13s Gen2.
Date: Sun, 10 Oct 2021 15:54:11 -0700
Message-Id: <20211010225410.23423-1-cam@neo-zeon.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cameron Berkenpas <cam@neo-zeon.de>
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

The previous patch's HDA verb initialization for the Lenovo 13s sequence was
slightly off. This updated verb sequence has been tested and confirmed working.

Fixes: ad7cc2d41b7a ("ALSA: hda/realtek: Quirks to enable speaker output for Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208555
Cc: <stable@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4407f7da57c4..84d3e062a335 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8344,7 +8344,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.v.verbs = (const struct hda_verb[]) {
 			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x41 },
-			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x2 },
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
 			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
-- 
2.30.2

