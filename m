Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03355897D2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 08:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350F785D;
	Thu,  4 Aug 2022 08:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350F785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659595078;
	bh=4zCAM/rQ7Mms3TIj2Wh5PNKxNzXcBaLg1ahjtAAqKBo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b2oSBJR5OmPpb466FPnQwVHQBSwxC/Tv3MnF9grAADwTMg7mlNkE/TNw247O7v5HP
	 G2QTzAw6d8i6lxDj2Zbhc0C2AoryVl2BIFImN17XHnIuaatf+KY9/nn3FKRgKQ6jSt
	 0uoPNaiADNr9axOuP0owL+nIFZrhs2kLGwgkZ7A4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13AB3F804B2;
	Thu,  4 Aug 2022 08:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D90F8016A; Wed,  3 Aug 2022 18:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 100A0F80134
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 18:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 100A0F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iTQLsQyr"
Received: by mail-ed1-x52c.google.com with SMTP id x21so9456076edd.3
 for <alsa-devel@alsa-project.org>; Wed, 03 Aug 2022 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEbeV4OUpZWR/RMps+1B9ugXkfGh+UmPMJhS6NYk2ds=;
 b=iTQLsQyrVlJvV4kz1DXLEuJDkKqnmFAsG85k2/+sz8Nij834Sp0Dkm/2zK0mlDi6Cc
 Nfw2YdUCtVmQAsVEys9Qhau2GdKE+goGut8vyt6+45+2LXu7m5yS6uPaILQg1w5wHW7f
 ij3juJ7pHyV7XPwyXvL3MFBjH3JNIovN2nshutItkoPjMN7Ey1A8YlBU/Fi1A2wS5j+8
 DeN47iA+0yEdlL3xvDte7/S40wrq1Siic1bp6jq0p60fJ0xPy+uzk1eBxqhEVcaraVSV
 Jbywxu+IwlumPMfFhcrb+gdLgztpmGCW3wGY4gqRtefwFn86m+PlMekInjlD6CVOPqns
 8N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEbeV4OUpZWR/RMps+1B9ugXkfGh+UmPMJhS6NYk2ds=;
 b=RjWNx/wE/yodtgvs4GNK29iZJNmgKVSGJp47F/8HDyPaJAcx6XgKLZjIuBY7XMduBz
 4lxTarVW22b6EvOSllbN+nEcm+B0F8F13fKJ35D0JpPl7MIOa5B/q7nxrN4jsYSKEDL9
 ucaa+OXY7pkAC/H452b+rg21KA4xMUyupOr9/kYRtnmQ/sSKBM5II0htlWUheZy7N0ml
 /gaad0hVAmmVfjdZca0mbvt+AnpT77UAwF2eZfRZ0UyV7vDFAFHvST3qJGqDQib87hRV
 uSzKH/d6mmaKXUWy/PlbM7pf4JheclmIv6GKKj0pWPy7NbN88awvPQCbgtnYcxcOVHrb
 NFfQ==
X-Gm-Message-State: ACgBeo3fk0pyMFRZYG72IvHlT9p+JKEHsaVObzmwWoC1fd1YUSsVQ++w
 CkosSyrJThRgBNtwSzf86KM=
X-Google-Smtp-Source: AA6agR4mnj3cIl/ZowGRVGE7a3UvEnVHL/i/iyJJCDAW1fTvYCfEfo4eFVNVM2ePlqypc1ZG/yV6ng==
X-Received: by 2002:a05:6402:95c:b0:43d:6297:f241 with SMTP id
 h28-20020a056402095c00b0043d6297f241mr20049333edz.373.1659544804580; 
 Wed, 03 Aug 2022 09:40:04 -0700 (PDT)
Received: from x360.fritz.box ([2001:9e8:a511:4e00:667:64a6:5f64:1055])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a170906769a00b007304924d07asm1508032ejm.172.2022.08.03.09.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 09:40:04 -0700 (PDT)
From: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
Date: Wed,  3 Aug 2022 18:40:01 +0200
Message-Id: <20220803164001.290394-1-ivan.hasenkampf@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Aug 2022 08:36:27 +0200
Cc: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Fixes speaker output on HP Spectre x360 15-eb0xxx

Signed-off-by: Ivan Hasenkampf <ivan.hasenkampf@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2f55bc43bfa9..fe43e5807b8c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9072,6 +9072,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8805, "HP ProBook 650 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.37.0

