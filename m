Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A7FE392
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 18:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66ECA1673;
	Fri, 15 Nov 2019 18:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66ECA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573837492;
	bh=3PL07A7YSkE2N/H8XsN9ci2iHfi0Fi8oVOTeokfelOg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=US+2IsJ4A7RudfaWoKJtGVnKP+vrea6qHWdC4aCJ2ui7JQQh//S0Vf1zRvX7KjJ2Q
	 g0hCrHTzAIIExbIeuePWqmZhftcENj06418qy2eBQ+KHCSHcTr3yo9uBqHDAm2RZIp
	 PK4+f1HpkauxSAgzq7PNfzN9e0WFpJ11+9u1eSJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6ABF80265;
	Fri, 15 Nov 2019 17:51:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77AF3F8014D; Fri, 15 Nov 2019 17:51:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05373F80123
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 17:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05373F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="P+9zR12+"
Received: by mail-qk1-x743.google.com with SMTP id h15so8583948qka.13
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=P+9zR12+B7+Ni+mQRP67o2Zs3sONiX4nIjJ7qmq8rJd/5bilLekrEvhkGEti7zOzae
 kkZidJRPfqthSVPYtG2fDC7CFyY+VWBRtWwPqaC3xGtAmJcreHZo+H0JNyBORPGUvs35
 JbSWbQ9m9VESKGc2o68e13RVPqf5CH9LdOawHSmsWJRygTEauNIEJA0mR6Wr/9AI9Hm/
 8P59NczdvXFHjufZZI0TwqjTOBXiFvqC8mHkrNVqP+kAoIBEqv6zeoLJAJooBBxElE7f
 JPnWwuua7w6S04n27GKQkevQoxzgi5bXGbFV6R+EiwH4onQBO8iCbp1WAZkLWqdLRY0q
 ZuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bFYsp63lkmiNIGxUbzfEOILdAxDIS+R8OA5WHO2VkgA=;
 b=nifJ/zrQMcFXOWpQFrEfBwTnMkesPbLa+id6JfkqlsxGR3cYhSqj+3HIc5mbr9BcDf
 PSRasBFdH75cYhiYLn62OPGWgUNVpH0JCP3/1ruVz1Gr6RGkzxN7akHlUQh7Gimn0OYI
 5W/TJG5U+Yn2Daff4ZhP/je9vcOfSIQsiYH3XdNCPB0uHbHwTFTT6YVToiKHDwDkkrgF
 OJr9SOHbgSSfRpLygiwkWbiVaHiQlC/2VquhuvrecWyXPqowY3GMC13mAjZlbiUqH/D/
 WL+ElIeAxGuNP6JduwljoEUhdjMw7rmj4120H99HQuey1jbiIAX26rF8/UH4hcHyh65G
 jYTA==
X-Gm-Message-State: APjAAAWcKn+l5xaueUPuwHKfBOfV8OxPn87pIDla/6FlXZHsT2tQkKKj
 F65g/Tx+hMVmbnoABo2os3U=
X-Google-Smtp-Source: APXvYqwnrPfEIxtnj95E0z6sMAScGe7tYRylFJZ8nsTfXGfIgJMe8mqRFLAlVQCwKlydbI2btQJ46w==
X-Received: by 2002:a05:620a:20cd:: with SMTP id
 f13mr12770548qka.461.1573836664664; 
 Fri, 15 Nov 2019 08:51:04 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:51:04 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Date: Fri, 15 Nov 2019 11:50:36 -0500
Message-Id: <20191115165038.56646-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 18/20] ALSA: hda/hdmi - Add new pci ids for AMD
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
