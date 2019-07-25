Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23927479A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 08:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470631AAD;
	Thu, 25 Jul 2019 08:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470631AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564037981;
	bh=cNuRRFiSwsw9as74CYU9tsWu87a3FmjAbHDnUeixT54=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d1PqFWO1AbvUOl85xQpna3Odp9j9lAnIfZUqjm+go0iFy3tmJ1j8yJXwY297q2OZq
	 itfsgzrzBdmH4cfGSKmBNMIE1KnsYPLaXjKtEKwJXydEgniiHwlGhy+D/EB7jHCJ/N
	 0Arsd3ZoZm+bRFTjueHgOrLq+u4H/hUhZLFv8AFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7168BF803D0;
	Thu, 25 Jul 2019 08:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC4BAF803D0; Thu, 25 Jul 2019 08:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 084BFF800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 08:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084BFF800E8
Received: from [125.35.49.90] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hqXhE-0006Si-NP; Thu, 25 Jul 2019 06:57:49 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 25 Jul 2019 14:57:37 +0800
Message-Id: <20190725065737.5238-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda - Add a conexant codec entry to let
	mute led work
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This conexant codec isn't in the supported codec list yet, the hda
generic driver can drive this codec well, but on a Lenovo machine
with mute/mic-mute leds, we need to apply CXT_FIXUP_THINKPAD_ACPI
to make the leds work. After adding this codec to the list, the
driver patch_conexant.c will apply THINKPAD_ACPI to this machine.

Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 4f8d0845ee1e..f299f137eaea 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -1083,6 +1083,7 @@ static int patch_conexant_auto(struct hda_codec *codec)
  */
 
 static const struct hda_device_id snd_hda_id_conexant[] = {
+	HDA_CODEC_ENTRY(0x14f11f86, "CX8070", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f12008, "CX8200", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15045, "CX20549 (Venice)", patch_conexant_auto),
 	HDA_CODEC_ENTRY(0x14f15047, "CX20551 (Waikiki)", patch_conexant_auto),
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
