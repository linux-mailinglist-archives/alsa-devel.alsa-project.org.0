Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931258FB13
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 13:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0777B15C1;
	Thu, 11 Aug 2022 13:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0777B15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660215865;
	bh=FyAJSOfnBv6BaOxlfypmmHhsSZ78X7hfzgV+gLj/eFI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RXKnQ0hD5BCkCYvKV8K8cR8DbTo5nxO9ViJz5ntdlJvdB+jrXD3/7lMEtAHfhzvBn
	 9Ok56weR5rZZxXeym5TZCH0/YkdEurYPWxOedQ+VV+oMd23UvTxEYeJB01jL8Vsyha
	 eqvJMLJTjxtlp7jaDi8D0G7servLjRndAtmPt5GA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 525C5F80549;
	Thu, 11 Aug 2022 13:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9013F801F5; Wed, 10 Aug 2022 17:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5BF2F800FB
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 17:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BF2F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QU0ALuzh"
Received: by mail-vs1-xe30.google.com with SMTP id 67so8120633vsv.2
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=dQ01aEhZNYaH2ZhVRRlO0MExQVXwpOhIKdTs5cP1++I=;
 b=QU0ALuzhQccpKzg5h9xW+3C67U6cZP7AmH8MJtSw3G9rRWRINBmo+z5WMt7HVlpG32
 OVBmJvD29gJyx8+1G2mPhUbP1960uhhZaWTUodTf1MxurLQhlY82aCMQGlxNChXz7J2i
 UzopJnD/+nEzuScKTkG3ARlNRBWPxuCbnjFs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=dQ01aEhZNYaH2ZhVRRlO0MExQVXwpOhIKdTs5cP1++I=;
 b=TGSK7x4sGySPzRhQ+HNTJ2mdB2V65UYfUgO9aTM9efp5n42n5pOpUBt7h+V/Yep6EH
 C7MxG9UnUSagmuFs+7gjMNFu32zhcuhvpQu87DFiY0BenpgDNp+7eArmXhLX20frGVmG
 Xc5DECgLLajAAih2hLJE/cL4lJR3GAg9ybmx0P2og8TqKtUhOJ+WLiPYQd5FyaRwbRcr
 0ByyvTdVeWQXgXysXeKu2FYb8YOaT1ZXDy+hw71vdTtIOVMD1KIV3jfZaUrISE/YG0x+
 8xxyIsusZBPQQT5e5h89MRZ20ayb2vQ03A2+8zA4IRpD1aSxVBKaSWB+ApgqgAXcPSCB
 CrFg==
X-Gm-Message-State: ACgBeo2A+KGIuRN1xVq7aIWreCoq7OrTbeXfYWt84gfKcV9UYOKvbSnO
 qGX7W0haED7TmvEs6YJ0yP5ZZgGCCof29RkH
X-Google-Smtp-Source: AA6agR6rNWJJ/UIpT2gl//wtCYsECa4lf534iajVWoCxuILkQfw/V1Tw05+Gd3s3l89osKDR+IF+Hg==
X-Received: by 2002:a62:18ce:0:b0:52d:3137:d854 with SMTP id
 197-20020a6218ce000000b0052d3137d854mr27750426pfy.16.1660145247536; 
 Wed, 10 Aug 2022 08:27:27 -0700 (PDT)
Received: from ballway1.c.googlers.com.com
 (97.173.125.34.bc.googleusercontent.com. [34.125.173.97])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm9685576pgm.62.2022.08.10.08.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:27:27 -0700 (PDT)
From: Allen Ballway <ballway@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: hda/cirrus - support for iMac 12,1 model
Date: Wed, 10 Aug 2022 15:27:22 +0000
Message-Id: <20220810152701.1.I902c2e591bbf8de9acb649d1322fa1f291849266@changeid>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Aug 2022 13:02:59 +0200
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Allen Ballway <ballway@chromium.org>
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

The 12,1 model requires the same configuration as the 12,2 model
to enable headphones but has a different codec SSID. Adds
12,1 SSID for matching quirk.

Signed-off-by: Allen Ballway <ballway@chromium.org>
---

 sound/pci/hda/patch_cirrus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 678fbcaf2a3b..e1055d7d9be6 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -396,6 +396,7 @@ static const struct snd_pci_quirk cs420x_fixup_tbl[] = {
 	/* codec SSID */
 	SND_PCI_QUIRK(0x106b, 0x0600, "iMac 14,1", CS420X_IMAC27_122),
 	SND_PCI_QUIRK(0x106b, 0x1c00, "MacBookPro 8,1", CS420X_MBP81),
+	SND_PCI_QUIRK(0x106b, 0x0900, "iMac 12,1", CS420X_IMAC27_122),
 	SND_PCI_QUIRK(0x106b, 0x2000, "iMac 12,2", CS420X_IMAC27_122),
 	SND_PCI_QUIRK(0x106b, 0x2800, "MacBookPro 10,1", CS420X_MBP101),
 	SND_PCI_QUIRK(0x106b, 0x5600, "MacBookAir 5,2", CS420X_MBP81),
--
2.37.1.559.g78731f0fdb-goog

