Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360FE7BDB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 22:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E6E21A6;
	Mon, 28 Oct 2019 22:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E6E21A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572299853;
	bh=KlLpUDN+nIXEL7vDUSa2gOowwBGtzis6ODqgKMg4IuA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+yRuymVowCeAUJNU2PSJijXFtTVdOfV+aGMAjDx1sMeAKukmNx5KDHNsQmamcrre
	 YWz8wiV10ZCV+qg0F6X/I1UMIEmBZ79/pf5wSgUokwDDDiaXNVvTF/cEwuJ9k7zKgX
	 QmYS0yWTVUea/8G+OJKEopagNa0rHHQDGfVvu7as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6AFF8077B;
	Mon, 28 Oct 2019 22:44:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2F99F8076A; Mon, 28 Oct 2019 22:44:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF9E6F80764
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 22:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF9E6F80764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s1mGKr1A"
Received: by mail-yb1-xb42.google.com with SMTP id t11so1884667ybk.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86OaAIUStlP4vQMmLnRFdDIvmpFylru96i13DOreI6Y=;
 b=s1mGKr1AI6wvxdKJyGVtyJGiMli/X5NCPURqUjWQGuZ+WhskdWAwKGeHPeGHJUB9ZH
 hLjUdF6NQxohnYdjp1sLiZHFck1E+nAVK+7SCHrCtN0MQV19iH1GyrcwO1CH/y/tGnu2
 GXJehhorjTOe4Yk7eW+aqgMYA2Z8CBn0GpsIbSzOnRITJIQz6bD1kD6tApq1iAMazw9W
 U98G0+UyRL2r5K3oJk1bE0yIAaHDsDta+/34KE5LiwQWLZBUDXST3HOoPaPGIrLPS2Ud
 7VZ1OB25Ncoe8Dvma0/RckzY+7HdjWYIPwpf6NEygc1OCHzxgmn+df0kUSLQey2MvEK1
 /+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86OaAIUStlP4vQMmLnRFdDIvmpFylru96i13DOreI6Y=;
 b=tM2At6hsJWlI33SX8H1txpUsd0HimGhaSpbmVm8oWVmtonACc0asg7YPF1hN0e+8s7
 RYJ74Pk1n6KpwuISLTN0/JeZ2zr8mpatdZMuY2dD09H5hXdZ+MHH4xqa0H1LrCXVTfDY
 Exn1uzZIwdjy3PEWPQ74jFh6ZxvF4A1FVDQGRA9cAN2yOgAzJYFUf1W1gD4c0yPwE/30
 ROkGVnFUZQH2RJfYaqORspYnixlnInz7jjNIze1/rc5tUjYKz5w3wwVTlWzMhvHIEPlM
 GRcpAN+HIzHmwO61Ig1PTfKFwT3/rRFbX8ZDPmOZuUp7JinCOlSCnWt56PP+PVXTTIp+
 SYIA==
X-Gm-Message-State: APjAAAW37BbpDLRZfQpbQm23Q8h1a/LTX6GL2ymgqvHZ1OokuzzK7SHd
 DXkq5AL4QaKmxqRdszmLyio=
X-Google-Smtp-Source: APXvYqyqHnG7vDeZSQmPcl0bg2lJXIgC8E0pMNNgdjsGmKZLlfxUN1nkdFa+ckY3QTcesYJjeyb6ng==
X-Received: by 2002:a25:7ac4:: with SMTP id v187mr6204298ybc.118.1572299037385; 
 Mon, 28 Oct 2019 14:43:57 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l68sm3421090ywf.95.2019.10.28.14.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:43:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Mon, 28 Oct 2019 17:42:14 -0400
Message-Id: <20191028214216.1508370-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214216.1508370-1-alexander.deucher@amd.com>
References: <20191028214216.1508370-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 19/21] ALSA: hda/hdmi - Add new pci ids for AMD
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

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ab6c4e7c468b..a07cc8dca7de 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2579,6 +2579,20 @@ static const struct pci_device_id azx_ids[] = {
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
