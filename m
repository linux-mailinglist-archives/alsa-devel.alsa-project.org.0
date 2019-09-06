Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D851ACB1B
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 08:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1E31668;
	Sun,  8 Sep 2019 08:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1E31668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567922835;
	bh=N0g5DlL/4u3WUZ2c6tKpdN56PSlRY1D7FHqW35zrX34=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J2ygTDXjFDQr1KVrnio6yrrYQu2SY+r0Ynn7ImAuec19KnUveb9TeK0nAi1C4f5zm
	 AGng6bN1C7XINBI22gGTfKBfHwEiE1+WBr/hEf7rtCwIRyqhtRUNzKbPLVRpOM4qlP
	 UjGF5/aUyOWwKAnKWwyfalDaw7hbpuEUHH6+PDoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72ACFF802DF;
	Sun,  8 Sep 2019 08:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8957F80394; Fri,  6 Sep 2019 10:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18DF4F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 10:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18DF4F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kObRmSyC"
Received: by mail-ed1-x544.google.com with SMTP id o9so5570773edq.0
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEUMKCNSgzcE24WqN25Q+F0d5BZbGBWOLXhrIGnOlrg=;
 b=kObRmSyCGoFhl/gHhqQTKx1PpScEzV2QF4VkqzER4ZAtCh7NSnn3bToJjIeDhBJHnL
 H5FXBSHmetACx/izg4Z85bca0vudzuoLCPuqwhMkHRloCIoxgKotgphj/9BrYlbG6maK
 0kk6jaB3YGN6WzKkDqj7gbowhzoV2OX5vcVJp5VHJGjsQm/bwxDl5Qjape88pQrG+PTC
 xX52xc1675VaPFRVg77MVVtj9yH7ADEQu3IQTxZyfypGNP5u8X6dsXl6/ro2bmPDUprO
 18EDIHvx2mXt5PxXj+Qu+JR8E83jrw62AornwEtTp1p/iDMDOupFESE1TgoB1Lgdqwje
 4i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEUMKCNSgzcE24WqN25Q+F0d5BZbGBWOLXhrIGnOlrg=;
 b=WUVtiuYYgqSoU3IxWGq8HY2nc/udgyh59ISbDWOmo3gdlMu39UxmIOvKA9grpadC6D
 iL6UzHL60Q5Nmt2Ny8aDLvdmgZ0h9YG1TDivCuR3b9yEYGov1rOwM8hPY0+5m2lf9jvW
 GycO6g+2y7CSsTh6juBoz7SgNzgPdFxIJ+wXjL+yj+K3e82aMzxYl1NxNgOXzPyRB9c5
 joROyVAuzoGycDl5qoYyDXiHfajCRaYhEwR13VSfovcODhYNcNakBCWRA4cLK6+0gp1F
 ae65BOnxZGR9ePBPgNQFjoHIdQYQk7noegFYpsZDEqppY6W+tM618TsPbaVQwarCvMKj
 SMVQ==
X-Gm-Message-State: APjAAAWCM4r3o47nMtKlK3ng43aV2TeBej1Ds7Sq98ym0UHWueYCgj9U
 /e0HyYxfbJWvb3EWHETHMQNadntxOdY=
X-Google-Smtp-Source: APXvYqxlpa2bukoDkQwGCgyb2p8mQ2T2NHWYWayDw3k48wCUrz33sXK2Yv0G9JYyaTrBVhh76rE/ig==
X-Received: by 2002:a17:906:43c4:: with SMTP id
 j4mr6202007ejn.197.1567758114672; 
 Fri, 06 Sep 2019 01:21:54 -0700 (PDT)
Received: from localhost.localdomain ([115.132.198.120])
 by smtp.gmail.com with ESMTPSA id c8sm481232ejk.22.2019.09.06.01.21.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 01:21:54 -0700 (PDT)
From: Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 16:21:19 +0800
Message-Id: <20190906082119.40971-1-tim@klingt.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Sep 2019 08:05:28 +0200
Cc: Tim Blechmann <tim@klingt.org>
Subject: [alsa-devel] [PATCH] alsa: lx6464es - add support for LX6464ESe pci
	express variant
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

The pci express variant of the digigram lx6464es card has a different
device ID, but works without changes to the driver.
Thanks to Nikolas Slottke for reporting and testing.

Signed-off-by: Tim Blechmann <tim@klingt.org>

---
 include/linux/pci_ids.h       | 2 ++
 sound/pci/lx6464es/lx6464es.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 7fa3f1498b34..08e15891ed2e 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1933,6 +1933,8 @@
 #define PCI_VENDOR_ID_DIGIGRAM		0x1369
 #define PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ES_SERIAL_SUBSYSTEM	0xc001
 #define PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ES_CAE_SERIAL_SUBSYSTEM	0xc002
+#define PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ESE_SERIAL_SUBSYSTEM		0xc021
+#define PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ESE_CAE_SERIAL_SUBSYSTEM	0xc022
 
 #define PCI_VENDOR_ID_KAWASAKI		0x136b
 #define PCI_DEVICE_ID_MCHIP_KL5A72002	0xff01
diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 9655b08a1c52..3f07e346ad41 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -65,6 +65,14 @@ static const struct pci_device_id snd_lx6464es_ids[] = {
 			 PCI_VENDOR_ID_DIGIGRAM,
 			 PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ES_CAE_SERIAL_SUBSYSTEM),
 	},			/* LX6464ES-CAE */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_LX6464ES,
+			 PCI_VENDOR_ID_DIGIGRAM,
+			 PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ESE_SERIAL_SUBSYSTEM),
+	},			/* LX6464ESe */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_PLX, PCI_DEVICE_ID_PLX_LX6464ES,
+			 PCI_VENDOR_ID_DIGIGRAM,
+			 PCI_SUBDEVICE_ID_DIGIGRAM_LX6464ESE_CAE_SERIAL_SUBSYSTEM),
+	},			/* LX6464ESe-CAE */
 	{ 0, },
 };
 
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
