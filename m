Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B28107A2C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 22:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF1A17CA;
	Fri, 22 Nov 2019 22:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF1A17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574459246;
	bh=3PL07A7YSkE2N/H8XsN9ci2iHfi0Fi8oVOTeokfelOg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQ+MPrES1kC8QwJhe/4vpK2y9laThP3ZSbeg8Sbyr23ixdvyobT7K0d0QIXKyrFWr
	 ODKpNQL6D+qnW5q7JRVGP7K0kSe7BYwj/m+g8hlQgVXIsJRoy2n+CNR5oADlXZ1vW2
	 bF8HeRwiV/6OQfFw1UufZeNjQTxTOx2aweylRfvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6507DF80161;
	Fri, 22 Nov 2019 22:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18018F8013F; Fri, 22 Nov 2019 22:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58192F8013F
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 22:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58192F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CdPvpN2T"
Received: by mail-yw1-xc42.google.com with SMTP id m196so2948127ywd.5
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 13:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=CdPvpN2TtkuzThokr8FkOIPM9sIktdP1vsg3eeUzjlHmbBORU+5zaRXh9Ls9tmM49g
 wD7bGtt4nVql4X30sc+4Y78TE44IHbpfqEFZBupdJxTIcSpU1sZJmToSIbV/Carc6G7w
 j7s2aAwPFVx9PpWM7WLMuwC/4FTP13zU2vFzvqwHLSqJWSlo4wx28OXWbVU2887dL4Hj
 bNvescc7S/R+3mlCnlVd05D/8nTN8bUEdklVeAqgZH1pcciu3LEdP9LtQcSU0iKfZ7vH
 t6kRipGDqnmzriLPvlu8nQHvceayKwmFZEiCMakD58oO2Gc/Aprc7BxgXix04emiKfKZ
 Aexw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=ox42la4eA+ME3oQB2wzRy9SnYTmlXQ+40Gv2TMaP+oYfc8YkrmrDjFATPS+ekp+Zo6
 TS/JiMEjq3pyTnPdLAsFvNtvh0XB4yGi/vaZSHohQJvbT7t2SMY7F/FklUxa/lshmQFs
 R2fyO2Hr0d87ZCSXNCtaM5w4sdWY3Rhru1LcYtcWPTKWflEG95NaiP5smcdg85hRmCS5
 P0uCFi4EAltWFmdrFRJWfG4Z1u2Y/CJhHd6JuFdlep+i8yyGDDy6nH2dD03WsV5d5XYs
 y2YS9OFv9jgQ9cyYoFeak8QJys2YrTcNyjx+ZibxACWRGJ7Rx6kFhlWzQQuBF7oj+jVQ
 MDxQ==
X-Gm-Message-State: APjAAAUaKRkK0xeMYE/7dm4datnaVoBK1dZh9RMQggZ8r/4ttMI9BAWT
 k09oslPy+JSqRpcz5ckKgutgJ/84
X-Google-Smtp-Source: APXvYqxQVI62Nh6WMju1/criCuPOgdm/c8IZD1mh9ib8Xftf731oiPDe/s7oraOJTKJoRlqzSND8oQ==
X-Received: by 2002:a81:a153:: with SMTP id y80mr11030740ywg.268.1574459043408; 
 Fri, 22 Nov 2019 13:44:03 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t15sm2111522ywh.70.2019.11.22.13.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 13:44:02 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Fri, 22 Nov 2019 16:43:51 -0500
Message-Id: <20191122214353.582899-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122214353.582899-1-alexander.deucher@amd.com>
References: <20191122214353.582899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 2/4] ALSA: hda/hdmi - Add new pci ids for AMD
	GPU display audio
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

These are needed so we can enable runtime pm in a subsequent
patch.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3ebc7b2a897f..79ca97d6c811 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2606,6 +2606,20 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
 	{ PCI_DEVICE(0x1002, 0xaaf0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xaaf8),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab00),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab08),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab10),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab18),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab20),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	{ PCI_DEVICE(0x1002, 0xab38),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
 	/* VIA VT8251/VT8237A */
 	{ PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
 	/* VIA GFX VT7122/VX900 */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
