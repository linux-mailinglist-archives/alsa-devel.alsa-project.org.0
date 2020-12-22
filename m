Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2BF2E0C5F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 16:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C571754;
	Tue, 22 Dec 2020 16:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C571754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608649619;
	bh=whIHW8i+f5PAMaBl9ev4koA4d1+LZZK1gdr4WxXChOU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxo1ZHnYrJmaUIhcbHl5m4jzqfdgedW75gJ3pO6g91efgBiTJXjSEChVP3Ksg1CIE
	 TSW8KmLW67RGz7XONlziLL2tiB1sjIk5YKF2DzkUHfuv7n+qtw2OwCykpv3blR6Dw4
	 lx2ITbg2V7hHrFVthlw/jfL6/NqZmD/Z14+huipQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 559A3F8021D;
	Tue, 22 Dec 2020 16:05:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDCAFF8023E; Tue, 22 Dec 2020 16:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CA21F8021D
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 16:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CA21F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="EqRZ/gRP"
Received: by mail-pg1-x52f.google.com with SMTP id f17so8516080pge.6
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Hrgc2vErdduBB9qM7RbOF/nuu0syt0R9KKjGGJCpoc=;
 b=EqRZ/gRPWI+a3OaYV+YvH80ky5fZtAnCqzWOHvrGTYHYUqe9/QKO7dz0T5yrWbIWLS
 Z0hn/fe/f8Hi1isP0zvWIzHjfFOP/96EaZ1REeAfypGnHGFcqUA1Gx5Opw2chy/BTlBg
 ALJpyv7ya0FAvYQD1a+szxZ/vaiuOVN0a/VxXYU1mWIwk3lsmFyXVNmQXdQXgCpOteJh
 mRWzHRI94UgUom2tHJRsqxcBSlpbhGjmqmRmrHo/96lOKtI5873x+DZw66kgdlU3c64A
 cMhno0qLS06NpfkneAyGWwXGNCyCltXrCl7CB+c6uKw8+u8ExVlTwOBNZF2nvzDw8z2i
 bzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Hrgc2vErdduBB9qM7RbOF/nuu0syt0R9KKjGGJCpoc=;
 b=t37ANcQTGPlQrqt4EA4lgmN+LxWmA+ZKgPhgWPR3sP/tGaCXnf0KKQwY+iikqyxJ8c
 pXNzAdicjXq67KNwh+0Kn+uVnxyOWqK74hyAvAOXP4hovDtOhlGeOkgPoVIxCdIpy7BK
 lXcaqHARzmgVcFNT3y++m2Qtj8bHBLDqx+HTdjr1Bxygm6jSLnE7G2UV4H72ahnGrH3/
 4vVlnbdObHBCsB6Y8Y/mjvckqcUhHJIVUoa3Xa+AcEUxzVnhZ6DGM6dywoeaeIIF7nV5
 egG2XdD9d+ydHDlpexpwG9SxI4fMXBj+Kg6855DfINtvtjmNIXczbpIvAzahL+DdHZax
 JKag==
X-Gm-Message-State: AOAM530GBvbkrObf/3C7unlZEOIgV/EP3g85uDBV+9ty/LvTrUlRjdPL
 GvCaaflEt1MlgMEyumEzMiv2+bze9yuhQQ==
X-Google-Smtp-Source: ABdhPJx//2nSKhHTG8gyFHAn9MT2fZxkt0i1lk3RChMj03CHREE0oJTSOQ7Wbcrh7D+i0dOzhq6CqQ==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr12935334pgl.374.1608649508742; 
 Tue, 22 Dec 2020 07:05:08 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-3814-dae9-4a2f-9772-47bc-5b94.dynamic-ip6.hinet.net.
 [2001:b011:3814:dae9:4a2f:9772:47bc:5b94])
 by smtp.googlemail.com with ESMTPSA id
 u14sm19000202pfk.111.2020.12.22.07.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 07:05:08 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: tiwai@suse.com,
	kailang@realtek.com
Subject: [PATCH 2/2] ALSA/hda: apply jack fixup for the Acer Veriton
 N4640G/N6640G/N2510G
Date: Tue, 22 Dec 2020 23:04:59 +0800
Message-Id: <20201222150459.9545-2-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201222150459.9545-1-chiu@endlessos.org>
References: <20201222150459.9545-1-chiu@endlessos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, Jian-Hong Pan <jhp@endlessos.org>,
 linux@endlessos.org
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

This Acer Veriton N4640G/N6640G/N2510G desktops have 2 headphone
jacks(front and rear), and a separate Mic In jack.

The rear headphone jack is actually a line out jack but always silent
while playing audio. The front 'Mic In' also fails the jack sensing.
Apply the ALC269_FIXUP_LIFEBOOK to have all audio jacks to work as
expected.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bb1010d78717..9eb43d827bda 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7803,11 +7803,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x0762, "Acer Aspire E1-472", ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
 	SND_PCI_QUIRK(0x1025, 0x0775, "Acer Aspire E1-572", ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
 	SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G", ALC282_FIXUP_ASPIRE_V5_PINS),
+	SND_PCI_QUIRK(0x1025, 0x101c, "Acer Veriton N2510G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1065, "Acer Aspire C20-820", ALC269VC_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x106d, "Acer Cloudbook 14", ALC283_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x1025, 0x1099, "Acer Aspire E5-523G", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x110e, "Acer Aspire ES1-432", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1025, 0x1166, "Acer Veriton N4640G", ALC269_FIXUP_LIFEBOOK),
+	SND_PCI_QUIRK(0x1025, 0x1167, "Acer Veriton N6640G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
-- 
2.20.1

