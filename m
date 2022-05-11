Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23390523470
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:39:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E92221A43;
	Wed, 11 May 2022 15:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E92221A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652276373;
	bh=MYL1LmTlRpJ0WAPUXcs7LtILFO4VLHwdu72ZeSokLGo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y7y6J/CQPzMocGmi3PGl/EyhL9Lc+TAxAMN+5H5XuPx98R02+mQAhU3LPqQegvVuO
	 2rNllLtBLBYuCCNTFL4su1CVPhWjsAp4YC40qwbuN2SrflPWEHBDWiypL5IsmesHC6
	 2im4+RZKP5R26dXJkf9c+VyCXa0W1Ihe0zaazfvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7C6F804CA;
	Wed, 11 May 2022 15:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84830F8015B; Wed, 11 May 2022 15:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D67CF80212
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D67CF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tuxedocomputers.com
 header.i=@tuxedocomputers.com header.b="U9MgXW3u"
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id AAB45C80099;
 Wed, 11 May 2022 15:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 tuxedocomputers.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1652276314; x=1654090715; bh=MYL1LmTlRpJ0WAPUXcs7LtIL
 FO4VLHwdu72ZeSokLGo=; b=U9MgXW3u7fhkbJ7cVgT/X0f3iNEOQ+YzVSHb2FWU
 WgvoEjFzp70Ttz8gZIFCH0+3gKcFaJBVji0xdZ7GYaLpX/6vC3kY2XyU0dN25Lv7
 kv0T94UvOWYUVJjaGtIS4DyqABVywBteCEiNygR5keh9gUqqu1yTPrIEK1iO3Mfb
 EfU=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id hdpoaOfmz9Hs; Wed, 11 May 2022 15:38:34 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id B639FC80090;
 Wed, 11 May 2022 15:38:33 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, imre.deak@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/intel: Add quirk for TongFang devices with pop noise
Date: Wed, 11 May 2022 15:38:28 +0200
Message-Id: <20220511133828.13724-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When audio stops playing and sometimes when it starts playing, there is an
audible "pop" noise when using headphones on most Tongfang GMxMxxx,
GKxNxxx, GMxZxxx, GMxTxxx, and GMxAxxx devices.

Disabling power saving for the Realtek codec fixes this noise. Presumably
it is triggered on some power event in the audio circuit.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 sound/pci/hda/hda_intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0a83eb6b88b1f..8a1088e057ec0 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2201,6 +2201,13 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x17aa, 0x36a7, "Lenovo C50 All in one", 0),
 	/* https://bugs.launchpad.net/bugs/1821663 */
 	SND_PCI_QUIRK(0x1631, 0xe017, "Packard Bell NEC IMEDIA 5204", 0),
+	/* Several TongFang barebones making popping sounds */
+	SND_PCI_QUIRK(0x1d05, 0x1096, "TongFang GMxMxxx", 0),
+	SND_PCI_QUIRK(0x1d05, 0x1100, "TongFang GKxNxxx", 0),
+	SND_PCI_QUIRK(0x1d05, 0x1111, "TongFang GMxZxxx", 0),
+	SND_PCI_QUIRK(0x1d05, 0x1129, "TongFang GMxZxxx", 0),
+	SND_PCI_QUIRK(0x1d05, 0x1147, "TongFang GMxTxxx", 0),
+	SND_PCI_QUIRK(0x1d05, 0x121b, "TongFang GMxAxxx", 0),
 	{}
 };
 #endif /* CONFIG_PM */
-- 
2.25.1

