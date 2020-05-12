Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AA71CECEF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 08:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFCDD86E;
	Tue, 12 May 2020 08:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFCDD86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589264368;
	bh=dC0/jOQrdBBeY3E4bIIPJnkgPX6uLlq0UlAK+to1UOo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQ9twc9br0due0OvyqBxoflOLaufzSdrIl4UbrK5qp/CbeppmX194I54GXWPlMYt0
	 jfckS3s+FUPElq2aSQFtnh0BR/JvExlNm1n2Nv62mDTqgt6mzqp89A7CtldjmMyfiy
	 PFvOvS+ez6aT8QkICn8IrKakt8VLQe84T57oiqg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A412DF80255;
	Tue, 12 May 2020 08:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 701CFF80253; Tue, 12 May 2020 08:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9B5F8021D
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 08:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9B5F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="YSnUur22"
Received: by mail-pl1-x641.google.com with SMTP id t16so4943274plo.7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPhdNQpmNdWMTH4ItY0n2wQhmbRZdFbnehkFaFShH6Q=;
 b=YSnUur22fR3d6DIb8DsRfVkB1mFWIES6U6mYkad1cZyYbCSIVC4QhoBNKT1q71A8/f
 VctpRiXXnzj/5KBa0r/X8VOSJ2OLOQsZ850kXKKeybtWitiFvEv02/iKAQV6pKVVwQph
 7MAmeAlfniwk2NdiFnPJPhXjyYZalGPoD5ULKOxLEw308RjuDi/26t+zxHn1jRi2Kv1+
 Tgf2fw1F2ethVvtYT2Bol/6WI/ogZP9SqSAIlQrdvbZzMQ9u1rs2f5M8ZwOI0xn463Vm
 1kbC4M+DDhT0kild8gIQGRMGDsjm3mTiqcqgeUyX67HfnPEvusM/bRAYHw/hnnnJ9wcs
 +raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPhdNQpmNdWMTH4ItY0n2wQhmbRZdFbnehkFaFShH6Q=;
 b=lzgqdQ02EHQhZ942AYDllxjf2DIezzJ88oJGfqDuyhxoiXA2sYW5ZpThBVXkYUDTs3
 wGX7dgexn2Dt30NKR5bi3W9DlsmvQxDISAhm/QLUZfsZeCwA/UN6Wfhn7uIAVVzVr6hx
 mNGxRqkFowrndGJ8w5uiBvO+wGf5zJSorWw1Hl25VEJ+THSHTclU7kjZCbXJbqawqeJN
 sULG+s+R/Egce8Sg5HvaSL6WxYcKaId0n0t0qRRaKOl11urrSOYLNkCXmOXWcJ5cn+h3
 sqUfT1dsyhToIbZvFoZHIT1xfAHB3nwN6jfnvACZdGzQ9hbhl6BJUuOOZZNLI0Rh4hdG
 Z8AA==
X-Gm-Message-State: AGi0PuYt1C5HXTsJj28hyCRr54sd6i3CR7dSX+17/5cu/6/LOYxmWVb8
 Ixb72nGWn3AtQuCL4GX+NXyZkw==
X-Google-Smtp-Source: APiQypIwfoYwi1fH88HLIciOEZsXl0lOuoY0ylnOHLNtCKe5ewazcN2I9jXlqNbgs8DybvDDMV/4xg==
X-Received: by 2002:a17:90a:ad93:: with SMTP id
 s19mr26160781pjq.73.1589264238826; 
 Mon, 11 May 2020 23:17:18 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id m14sm9660554pgk.56.2020.05.11.23.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:17:18 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ALSA: hda/realtek: Enable headset mic of ASUS UX581LV
 with ALC295
Date: Tue, 12 May 2020 14:15:28 +0800
Message-Id: <20200512061525.133985-3-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512061525.133985-1-jian-hong@endlessm.com>
References: <20200512061525.133985-1-jian-hong@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org
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

The ASUS UX581LV laptop's audio (1043:19e1) with ALC295 can't detect the
headset microphone until ALC295_FIXUP_ASUS_MIC_NO_PRESENCE quirk
applied.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dcb97b39be6e..36832645de78 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7393,6 +7393,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
+	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a30, "ASUS X705UD", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
-- 
2.26.2

