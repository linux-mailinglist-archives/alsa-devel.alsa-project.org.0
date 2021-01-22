Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB42FFC5C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 06:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CFB1A3C;
	Fri, 22 Jan 2021 06:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CFB1A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611294626;
	bh=gYRorHewYq9whYgEX7FUXIW9+OX6/PF7ztqN4ufg42Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sXY2+eFvqn+uY9jwM22stVyooVt2yQe4Ej8b5orSTHYuHq2ZfdqS8WINwjJA7xwV9
	 /ewX8ukqK4FewdEgXwOkQJuoEDccOE/QivpROX4+GdWAUZYk2J5SBZ6GnEqf04vdpx
	 1wF3DxWy0O/4Uu3K7qrLz0OTN+Ant04NrfmxssUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4978EF8019B;
	Fri, 22 Jan 2021 06:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EC35F8016E; Fri, 22 Jan 2021 06:48:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB65F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 06:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB65F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="odYmuytY"
Received: by mail-pg1-x536.google.com with SMTP id 30so2965307pgr.6
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpUv7BpGe97VvIuJXCpyMafCEF/2ASdyYXmAmRoiigA=;
 b=odYmuytYpz1voPKzJ/dPbeeWfurHPYBTibVwl0y74lY8C7g1V4cuzxdAS8eh3Xmlxn
 wGktiwm9XJe7fJw8vzAiZqm7q3MW2eJfwdE1q3iFs9bPX8PgDEmeVDCtYyR3Lkb8Rh1X
 Qo8w0h+aklZCca+WP1zdB70lUtmf9ZZbC7Sa94RupgyuP2OSJO7BXTJuaD6tz+s6cZpD
 Nbe6jlS6ToQcdSjjilobeHkUiSHm/b6xevaikJuLAzwFM331EfhuBTrDcpgNf5BPv7Tk
 8xB6rYsuQsP+yyM5o+3+iX8K6kxj90hm6bgyyfLH8xkRChlg9n5aqXnZmhW4RfMIoNrK
 B16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpUv7BpGe97VvIuJXCpyMafCEF/2ASdyYXmAmRoiigA=;
 b=gYVMYqRlrHyn/7m9EOjmZygJLUDxCKRkseaB4xJFVimj3C5Mia6Xu98yfSozEVX5EW
 ekwpRafKLztpmDy4I+w77GPLbOUep/Hx2a2gxx98yU5PCPXVsDjnnQ5yy3tJ5S6jBhs+
 HBvNagxXj1Og/MReXn5T7BJCt/fSZDHpA8IDdswjoowsf7htXoH5v6EebbBFLTfcl3Iu
 zNUiHxiCHa+l3ptDtLoRY587K5BPNNDPl8v3bVkPPp3z0h+GhxPAQEKXyhOr8S3G7cgZ
 6gixWRXxE5RJchC4ayDpsUD38CCtEei2lxJaw5u+LZUxZ6Hvs0lIYJkW5i9x5d3EvZ6w
 xKHA==
X-Gm-Message-State: AOAM533xtGfq3aFWqWsyvPoJSRlinJQDALbrKFCXgsiJJO9Wdndh0ytl
 rWfnW2w//srdmMs2kJj/eKg53A==
X-Google-Smtp-Source: ABdhPJxIGamgud5deMH7oQJJpOQfILtqLFBzrLaNURQdl/K3azp/yl9sgf3KwO0wZiRqfEjPwEGZNw==
X-Received: by 2002:a63:520d:: with SMTP id g13mr3061728pgb.289.1611294518754; 
 Thu, 21 Jan 2021 21:48:38 -0800 (PST)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id gg6sm12252779pjb.2.2021.01.21.21.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 21:48:38 -0800 (PST)
From: Jian-Hong Pan <jhp@endlessos.org>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Enable headset of ASUS B1400CEPE with
 ALC256
Date: Fri, 22 Jan 2021 13:47:06 +0800
Message-Id: <20210122054705.48804-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jian-Hong Pan <jhp@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

ASUS B1400CEPE laptop's headset audio is not enabled until
ALC256_FIXUP_ASUS_HPE quirk is applied.

Here is the original pin node values:

0x12 0x40000000
0x13 0x411111f0
0x14 0x90170110
0x18 0x411111f0
0x19 0x411111f0
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x40461b45
0x1e 0x411111f0
0x21 0x04211020

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ed5b6b894dc1..290645516313 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8006,6 +8006,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
+	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
-- 
2.30.0

