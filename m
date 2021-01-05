Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF822EB1D5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 18:54:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3380516A8;
	Tue,  5 Jan 2021 18:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3380516A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609869279;
	bh=QJv8NpWx7vRcX7g6gXDW4HZPs61FUAmcJ43EMxxt8nM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JopzLL/FqXAh8ZOewPYk+fCTENYwOatMT9nEluK8pEoJOe922sFSOfxEBc+WJtRSt
	 SoWHbTb0Cm3ZtjmGljyNHJNiBgqIihQgHJP7DD+7Pjx1Wos9lkAidxy15RecQMEBgH
	 AgCi/eD32j9VG0kIEiwm5P6XHU0ae2MexUFH2Drg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DDC2F80268;
	Tue,  5 Jan 2021 18:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A638EF80258; Tue,  5 Jan 2021 18:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45192F8012B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 18:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45192F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lm43+dr3"
Received: by mail-qk1-x731.google.com with SMTP id h4so91064qkk.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Jan 2021 09:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdBK+gac7RiZ1BPColKtSI5XBFmEiri3RCHe0eQPboE=;
 b=lm43+dr3llnTeguzWgoL69HUvNXPEuJkTlp6xbCTxrD8WxWjakiGoJIdRtAySi+5Yj
 tVSkX8XaHXXKvFobFIUq3IaRlU3U4P+ROxfJ8UJIkTyJ3TPDY7db9E/VI2W4PK5Nt28c
 EL8ZZUpZVjR0Hws2PB1bNOUoEDY397+Q9fsVoEUhHW0gwnv6STrqIDfTX2SPMf6X4MmB
 UzCuTer/YrNWE9UjUAP7orZCyjf+e1EjL7+X+Vk84/T7QYhghBD+DyNMNhWjuRMMhF/L
 TkDR0+UInmsHcCE8Ei1dCsKZ1al0jaLvUM9qZZa2ZaUg/IvW9ZpuoHtcImeCgM3g+uz3
 Nj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdBK+gac7RiZ1BPColKtSI5XBFmEiri3RCHe0eQPboE=;
 b=FstWPZQjHhlKPjN6P4v+BuAJeh4MH66atsYw0BdTt7IoPQIG9DpHNvGfhi/2BtX9Ly
 MfPUFx70euS6pAIUxde6ISO7gFqFRH0sXYazo+ICx/10br6rYlaQ8u14JJMQxVjkmY0Z
 YkDmpwu0I78EiDHEBObvYYH2MrJlJQQqs4yR2C0PZRGRvdAvNLLz0Qve6bmGMCAHmbyw
 M5cfqPJyTMG9lsPkthLLggxIMc3P0B6iq68KQr8WhX1kzdYjsSXAsR18h7Nw0JKwnXQO
 LPsjhFa1SyFzs1tAKZnzIRW572+cxKnYKcyrNvX+X5tpL1XYTeILZR6wLtKJfHSXv040
 7W9g==
X-Gm-Message-State: AOAM532fgp8HOH/V/Fy1xZlDJNOqXDnnUFLukTzI4IoDMbcXNz1F4V7X
 EN5oWZNb4/4wLDHuA403GgI=
X-Google-Smtp-Source: ABdhPJwiHIhEGk6/RqvN+/MgYKsYOvdk815Ez1fzQVikEu4jvOibZ1XN+ehwZT0zodum4hBi2HPm2g==
X-Received: by 2002:ae9:e8c5:: with SMTP id a188mr588809qkg.479.1609869175218; 
 Tue, 05 Jan 2021 09:52:55 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.241])
 by smtp.gmail.com with ESMTPSA id c7sm422729qkm.99.2021.01.05.09.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:52:54 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi - enable runtime pm for CI AMD display audio
Date: Tue,  5 Jan 2021 12:52:45 -0500
Message-Id: <20210105175245.963451-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
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

We are able to power down the GPU and audio via the GPU driver
so flag these asics as supporting runtime pm.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index d539f52009a1..2ea46b5a9a23 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2597,7 +2597,8 @@ static const struct pci_device_id azx_ids[] = {
 	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* ATI HDMI */
 	{ PCI_DEVICE(0x1002, 0x0002),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0x1308),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
 	{ PCI_DEVICE(0x1002, 0x157a),
@@ -2659,9 +2660,11 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE(0x1002, 0xaab0),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
 	{ PCI_DEVICE(0x1002, 0xaac0),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xaac8),
-	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xaad8),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-- 
2.29.2

