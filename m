Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448F596FA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC191662;
	Fri, 28 Jun 2019 11:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC191662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561713101;
	bh=XunfwZ8voQ5mAeQ8OZretZyUuUCyiaX4up0bp3beskw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oh3k2gNY3bVLROEveqVHIUtVuzpFXsDznx0fYUBqBBE/LoVyktlCwSd/cey9GbvpV
	 wCagbVYOKI3HkW/2eWLuAeL4aE5zfbfbXKnRrcighb81jFUYdT4Io+xV9MyVL66f3a
	 dITL82MunhLL7zcpolv0Wlfos5FHaD9ONvTOp47Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF895F896CC;
	Fri, 28 Jun 2019 11:09:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E91CF80C0B; Fri, 28 Jun 2019 11:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E37A0F80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E37A0F80C0B
Received: from localhost (localhost [127.0.0.1])
 by a.mx.secunet.com (Postfix) with ESMTP id C381620275;
 Fri, 28 Jun 2019 11:09:48 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
 by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDtm5AXgp7JG; Fri, 28 Jun 2019 11:09:48 +0200 (CEST)
Received: from mail-essen-01.secunet.de (mail-essen-01.secunet.de
 [10.53.40.204])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by a.mx.secunet.com (Postfix) with ESMTPS id 5AF03201BF;
 Fri, 28 Jun 2019 11:09:48 +0200 (CEST)
Received: from [10.182.6.138] (10.182.6.138) by mail-essen-01.secunet.de
 (10.53.40.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 28 Jun
 2019 11:09:48 +0200
From: Dennis Wassenberg <dennis.wassenberg@secunet.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dennis.wassenberg@secunet.com; keydata=
 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
 YPsSSSBN/R6Xmw==
Organization: secunet Security Networks AG
To: <tiwai@suse.com>
Message-ID: <d529f0d8-31f5-aa03-c9bc-9bed58ed6137@secunet.com>
Date: Fri, 28 Jun 2019 10:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Cc: alsa-devel@alsa-project.org, qkrwngud825@gmail.com,
 jurica.vukadin@rt-rk.com, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, po-hsu.lin@canonical.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek - Change front mic location
 for Lenovo M710q
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

On M710q Lenovo ThinkCentre machine, there are two front mics,
we change the location for one of them to avoid conflicts.

Signed-off-by: Dennis Wassenberg <dennis.wassenberg@secunet.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5b3c26991f26..78cef7392122 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7074,6 +7074,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
+	SND_PCI_QUIRK(0x17aa, 0x3111, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x312a, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x312f, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x17aa, 0x313c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
-- 
2.17.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
