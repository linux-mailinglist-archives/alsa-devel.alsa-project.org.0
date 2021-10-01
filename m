Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5341E79E
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 08:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B82416DF;
	Fri,  1 Oct 2021 08:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B82416DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633069869;
	bh=nH+tEkilGiLJv2Ss5YXgDvbajzwUVJD8mujIa08z6Ec=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KFlI5lmtInEKhmkBEi5qyyRJJ+j88BF6LrVZpdTS0uluBHSp6ZjaEz59eI1LTG8Ns
	 TOluxJfYiWs8efl74KmtPMEw2WeeYPP+rI8yxm4ltyNoC8yqVUyZ0srsqoPIPJOdqs
	 bOFk8ydCA7zSQ2AuKsNcwzeKC6tXHAdJNKwU55MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8133F801F7;
	Fri,  1 Oct 2021 08:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21288F80245; Fri,  1 Oct 2021 08:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21995F800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 08:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21995F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="XRkENSfu"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 68F3A402D3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633069744;
 bh=YyJ0fdVjmCzXOoJiRjIyyp/ZqjWN0zD1fovbCCHJr+U=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=XRkENSfuFYXI5sMhFl8teFJIdWys63K9lBgfQ207w2t04Rtjxnw4+P4zyA76UDBbP
 vniveY3Dfe4smfDeyDl+j42+CiFtilTL0KMZKjkPCA8v/QgOTnzBY3srw1FOczKlr0
 4MzyhHpJmTLFFUZ+cRw1elXDCgdND7NCS9nIU8P9QxS8xrx/GRgkUP7CRR1tcFAuuK
 s3HJIcMqgeGcwAjeJlG1b3sGc1GMUjwVzmi0aUZxBzdA25t4gmlPNLy674KUptzbzn
 D8+i6GJcOh5oqGy8ae7k3D2Dxje+OsCWeKvkDyA9GMepKjl88gFw+Rxe4jVgdvs4UE
 rDfOzy7kl09Og==
Received: by mail-pl1-f199.google.com with SMTP id
 z17-20020a170903019100b0013e6a46dc3bso2846796plg.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 23:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YyJ0fdVjmCzXOoJiRjIyyp/ZqjWN0zD1fovbCCHJr+U=;
 b=RL1/dPPZQSXnM5D5w78AxFKPTljZEJI3q1lufnsd/uXWl/QMj0s1i+J4tGtuwweS+5
 470W1BK/9yJFWtSJG1IqAx2pGnHbFQPbn3WEfSilDYhT83QCj6v3hdn48fy+RLHwX7Y5
 /CtH9W21qjxWz/lUq8Zoe88LfaqxbRIQRfJHBT1YfDGxBo170ZzJT3VqtRtmZnM5M0pH
 gMfqhBjum7Hb3VK6pYe1a5/+mgykmmPeDgCQB2Nqzb4GsEGwdR+1f3Izt+Rm30MStx/B
 ObxRyluvrQj1pGHdChjKFM56uLlq9YF0WVUjAeIgekGowr/l0acAjWHt1YslWM+5i4Ij
 C3xA==
X-Gm-Message-State: AOAM533wvEsJWvQLmNv3qnPYTJAI1TByDLoaqeZxbD93CWrlxU0YQt0e
 Os0hnIfrCiw1MjJRrYNN84nNds1K+51F/w2iAcFhc0osKIIfJ0/lEMs50ZZNpZy12MA404Ccmq2
 YfljbvmERYVeFCSfHSh8r17KlJSvE1TO3A76TfwQf
X-Received: by 2002:a17:90b:1909:: with SMTP id
 mp9mr4617157pjb.55.1633069742660; 
 Thu, 30 Sep 2021 23:29:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw22K5pK3MVs8uNXMcL4NftP/1Hm0OOcm0nnlcZc5uStWijE4TWaDDvLPPzDw9g93zW0yrxNw==
X-Received: by 2002:a17:90b:1909:: with SMTP id
 mp9mr4617134pjb.55.1633069742351; 
 Thu, 30 Sep 2021 23:29:02 -0700 (PDT)
Received: from localhost.localdomain (111-240-125-184.dynamic-ip.hinet.net.
 [111.240.125.184])
 by smtp.gmail.com with ESMTPSA id t3sm1461124pfb.100.2021.09.30.23.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 23:29:02 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com, kailang@realtek.com, hui.wang@canonical.com,
 jhp@endlessos.org
Subject: [PATCH] ALSA: hda - Enable headphone mic on Dell Latitude laptops
 with ALC3254
Date: Fri,  1 Oct 2021 14:28:56 +0800
Message-Id: <20211001062856.1037901-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
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

The headphone mic is not working on Dell Latitude laptops with ALC3254.
The codec vendor id is 0x10ec0295 and share the same pincfg as defined
in ALC295_STANDARD_PINS. So the ALC269_FIXUP_DELL1_MIC_NO_PRESENCE will
be applied per alc269_pin_fixup_tbl[] but actually the headphone mic is
using NID 0x1b instead of 0x1a. The ALC269_FIXUP_DELL4_MIC_NO_PRESENCE
need to be applied instead.

Use ALC269_FIXUP_DELL4_MIC_NO_PRESENCE for particular models before
a generic fixup comes out.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4407f7da57c4..70778aa137cf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8452,6 +8452,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a30, "Dell", ALC236_FIXUP_DELL_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a58, "Dell", ALC255_FIXUP_DELL_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0a61, "Dell XPS 15 9510", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
-- 
2.20.1

