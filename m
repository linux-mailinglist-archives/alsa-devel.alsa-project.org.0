Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64BB894C6E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 09:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66522CC8;
	Tue,  2 Apr 2024 09:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66522CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712042125;
	bh=am7IiesRgWPBCP8oMGTR13F6D8Lkrz2+zNgKZaGUfds=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gbgjQ6IrUFfpKzFiGG4obmBP4VpMOeFXt+w3FD0FbvT0wMbL9n7oEHAxoJcECCj/M
	 W1LUmCPfNuD3rK2G3WV7bSQyPi2OJ3UpU3vTExNSWHYpl80g8ZQRYu0nFhwIOSxEDl
	 fdLjNrYn8e+GB9pXRam/sTLSAvZGv70EMp2jkFCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D738F89BDE; Tue,  2 Apr 2024 08:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C56B5F89C7B;
	Tue,  2 Apr 2024 08:58:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E527EF80236; Mon,  1 Apr 2024 19:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01D6BF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 19:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D6BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jx1SXBks
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1e0d82c529fso35815005ad.2
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Apr 2024 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711993630; x=1712598430;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AswTJHy50XsDpLvdgKziECQSTnLRsRT50RkSiPLe8Rg=;
        b=jx1SXBksjDoSGta8h7N/06VC4TixIu1pIBJJ5usQpBBI+xVHBksIbF5ZRdQAFsliWa
         aJP7uINbS7MM6YwT6eHBNCqzjcF62xY1tEbKNbSqtHoMYRkhf4v9/QKbqpvg4mN6YpGG
         LuN7YjBxT8JwO4ZNiUOmFfRRBwqZfCXsDUkB5jUy2hHlpAoubTBntBGOzda64LGySX33
         XyFQcenSPvQrRsuWL2PXtv+sJY3QN5Q7BFFRzBITt1P+8nH72KGM/nvaL6AF3ZmefoAz
         G3ysjdw/3n/5+T70QVtg6HSW47wKEU5nb4DAwxaqk2th2KgdU3bFZk0y93PVwGrNYuL7
         G8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711993630; x=1712598430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AswTJHy50XsDpLvdgKziECQSTnLRsRT50RkSiPLe8Rg=;
        b=xKpjMtA8fCK2r74Kcx9CWV4oLCUE8XvbqCCE5ZNMqarTM0wgz0BES1NEmxG1E7x+5x
         0WtxgoDkhKoillut/uusTuQ0+HQ95TWi3zxxZbS2ufGewl5mEepfe52X6nxoVPt9ycXu
         r/oUZiCUIBv9piTq8z5FESXtBvj9dRe0WQkUZlu8odtgXiMITKeN/DsrkyWNGLDfbtpz
         vohNFOE83f1xaFOrZKvjRymkrupDE1D/nort37b4yqzAioqifpz0gHv31IWNHsruLxNX
         Xs2MCFs0Ze9O2oeTolzpPdIlo+kLkV3v6z9bkvrfGllg0+GHbAU8sTZIMklo0X6yUZHb
         1zCQ==
X-Gm-Message-State: AOJu0YwfgN46IYVPjgtvjLLlPN/wO6421Af1u/gKfpC4S9KSDyuNW5gV
	s85gmFDeJG+OGFuRf0A7DATZyismqhV3aUij+E1umfH5bGCeN3kx0QdWT1zcNHeuzQ==
X-Google-Smtp-Source: 
 AGHT+IHhav+FZDPb/etrgGGolK5FqC4h1Vv7nF1VN3/M2M4VrjbdJ1IlMhTHzBaKr7VLxAAWWn8G5A==
X-Received: by 2002:a17:902:ecc8:b0:1e2:578:2c15 with SMTP id
 a8-20020a170902ecc800b001e205782c15mr11441560plh.52.1711993629714;
        Mon, 01 Apr 2024 10:47:09 -0700 (PDT)
Received: from pop-os.. ([2a09:bac5:3a23:dc::16:1c9])
        by smtp.googlemail.com with ESMTPSA id
 kz4-20020a170902f9c400b001dd55986b75sm9195880plb.183.2024.04.01.10.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 10:47:09 -0700 (PDT)
From: I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
To: alsa-devel@alsa-project.org
Cc: gedeagas22@gmail.com,
	yokota.hgml@gmail.com,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to support
 headset with microphone
Date: Tue,  2 Apr 2024 00:46:02 +0700
Message-Id: <20240401174602.14133-1-gedeagas22@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: gedeagas22@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3G6IFLHFXICU2E5KSQNBF3J64ZHGU5XH
X-Message-ID-Hash: 3G6IFLHFXICU2E5KSQNBF3J64ZHGU5XH
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:54:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3G6IFLHFXICU2E5KSQNBF3J64ZHGU5XH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch addresses an issue with the Panasonic CF-SZ6's existing quirk,
specifically its headset microphone functionality. Previously, the quirk
used ALC269_FIXUP_HEADSET_MODE, which does not support the CF-SZ6's design
of a single 3.5mm jack for both mic and audio output effectively. The
device uses pin 0x19 for the headset mic without jack detection.

Following verification on the CF-SZ6 and discussions with the original
patch author, i determined that the update to
ALC269_FIXUP_ASPIRE_HEADSET_MIC is the appropriate solution. This change
is custom-designed for the CF-SZ6's unique hardware setup, which includes
a single 3.5mm jack for both mic and audio output, connecting the headset
microphone to pin 0x19 without the use of jack detection.

Signed-off-by: I Gede Agastya Darma Laksana <gedeagas22@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a17c36a36..9dedb6504 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10159,7 +10159,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
-	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
+	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.34.1

