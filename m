Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40432107A2D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 22:47:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8101862;
	Fri, 22 Nov 2019 22:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8101862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574459258;
	bh=bwmMpYtDdooRXCZKMcyunPVcbLr1WxI6WHDs3zUCrUQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxXFI+AZjOQ1SGQGEaVlQlBkKpLAKAHij5/J59EwSvaE/LEDPOytakAExr8iJbKWo
	 WlpOK5FnLIAZKxO87jUaJjTA6wk4LCx4L8e6DWa3UkKAriiWVba3NFSP1ilkHYFJUv
	 D1DhopNcgQYt5I5usgL2lBGipioqLNZ0EJFes7Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 184D3F801DB;
	Fri, 22 Nov 2019 22:44:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1879F8015B; Fri, 22 Nov 2019 22:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2915EF80140
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 22:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2915EF80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KIYg3/6X"
Received: by mail-yw1-xc42.google.com with SMTP id d80so2940512ywa.6
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLz/VLKnB1IPKE8d1KUr8XukeZ9FBVXcYJIk8ITPAWE=;
 b=KIYg3/6XBSZO6t0fUpCrLv+5G5KYy6rBZRfkrr1JSxhQ6Q77nqrjTVNeE0w7F5e7in
 0asTE5h+w9Gh7tT70onmdLImPap5p4ZyRnQBlw+AdpEhKz3qMtqYUHNm+6KgRnoCU+L0
 ndJKykhlrmntmzeuTyZKmvt9D3RaFHu3s7HtgE8zYHa4YR/Ih9ZVGniUGvhJ7oEruanW
 Akr5SUolImHipw72p0tbhUMbuC3thbvOJWe71/lxYllvoYpJZBzGtefJSiVMeSp3xR+Y
 TBMA3lAcmAn3kcWO2oX2A9vKgh2BEChFarZB5g4XTvf/O/LWrMvhkf994Npo/2vMRC0N
 tgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLz/VLKnB1IPKE8d1KUr8XukeZ9FBVXcYJIk8ITPAWE=;
 b=hy5CP52QPJm+Dyto4e3EZkkPTSKYzayJojgEEFINnKe8ZHZx6qjR0wOKht5W/pYy4O
 MMEYYGVAilo16wStBc+j0glsKvM4BlvB75E/mLlDYdFoU99i4O8fshb/+y/I5pwMDemx
 fuw1MPBqjkW7LSR8cq9ywg4nj9D5B45brHjh+tYPtvJz1QPc6Rb8fCCzG7WsDl9B8sSm
 jR1MOEiDHrjJr/EjxzxPf88Nhoj4xy4oBn7QDG4uIFqBNFWn1wUlh+NR5owfobROOrtn
 ac7EQGEOB685+Oh3QoGs3Ls39uwH7axiQF0lmjhtnecpEkJnIhKn/BNstiHRl5MX06TV
 rTkQ==
X-Gm-Message-State: APjAAAUNM+bJMjHmCVDHKg+NeN77K3Ueic3PncRkDgC0qZwkfZSlTHfA
 qPvf176QGnYT3YYMfzwoLrsIC03h
X-Google-Smtp-Source: APXvYqyatKNHh/9+R3obw+MqEsRSJJgO8YWqCuf9fc+9XCQTIbCvwPw4FtbEG/nqVLSLi27hUGk2mw==
X-Received: by 2002:a0d:cc47:: with SMTP id o68mr10984795ywd.50.1574459044454; 
 Fri, 22 Nov 2019 13:44:04 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id t15sm2111522ywh.70.2019.11.22.13.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 13:44:04 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de
Date: Fri, 22 Nov 2019 16:43:52 -0500
Message-Id: <20191122214353.582899-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122214353.582899-1-alexander.deucher@amd.com>
References: <20191122214353.582899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Subject: [alsa-devel] [PATCH 3/4] ALSA: hda/hdmi - enable runtime pm for
	newer AMD display audio
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

We are able to power down the GPU and audio via the GPU driver
so flag these asics as supporting runtime pm.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 79ca97d6c811..111b9a869162 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2599,27 +2599,38 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE(0x1002, 0xaac8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
 	{ PCI_DEVICE(0x1002, 0xaad8),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-	{ PCI_DEVICE(0x1002, 0xaae8),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xaae0),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
+	{ PCI_DEVICE(0x1002, 0xaae8),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xaaf0),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xaaf8),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab00),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab08),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab10),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab18),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab20),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab38),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	/* VIA VT8251/VT8237A */
 	{ PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
 	/* VIA GFX VT7122/VX900 */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
