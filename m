Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E861D5FABBC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 06:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD00357D;
	Tue, 11 Oct 2022 06:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD00357D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665463694;
	bh=P+CTUyLzjwt8HbVP+w5KgKdefA3Llq4TW0i7HuGxH3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a6jjU88m+PWP2l1Qpw7q9481MAG/AvTSRFiTYUpqMMgbcfDrZvRcfec7FAw2F49LY
	 7Mf8lmLWoLQuRdMLd5s3wAWeyo336TXRXeUE1zrZgwcY0rpEc4P53QwG4WvCRg0ZsS
	 HOEy4Hc4zVnyJsN1ro80AsdjrP2XsHIfIf4Y3h+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D658BF8021D;
	Tue, 11 Oct 2022 06:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBAA7F801D5; Tue, 11 Oct 2022 06:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB9B6F800C0
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 06:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB9B6F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X+n56+GA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665463631; x=1696999631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+CTUyLzjwt8HbVP+w5KgKdefA3Llq4TW0i7HuGxH3o=;
 b=X+n56+GAuYhg7HG+i6CtJ8p3T6Koelg5xjhyLjmm5ujHwF4UV1XXaigJ
 /i/nof+Dcd6mBUFtAfAe1mwFituax+odzi6qyduZ/4lDGVL+qi8yfryBZ
 zzwu/SHEWZlyiWTOHvV3JGUCUal5PzVrjueL64aBISMgRHWGCcJh7kVDh
 xuWK3uq3EfrXoW+gqr3/PCfqbIC2pcJaiSNJ4gQYBEVhst270uBiQi9aS
 ehzB9nH9k9NkiepAVhxnhB5vu4rGjq7RERRbkFT6AwqZgRmYNiev01QYP
 44MDpSBm0URn388XonUu2JfMvD8TDqYu5J+oKWMztxg24UpGVof2L1Dm+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="302016899"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="302016899"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 21:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="801327180"
X-IronPort-AV: E=Sophos;i="5.95,175,1661842800"; d="scan'208";a="801327180"
Received: from senthil-nuc10i7fnh.iind.intel.com ([10.223.107.62])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2022 21:47:03 -0700
From: Saranya Gopal <saranya.gopal@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add Intel Reference SSID to support
 headset keys
Date: Tue, 11 Oct 2022 10:19:16 +0530
Message-Id: <20221011044916.2278867-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, pshou@realtek.com, Saranya Gopal <saranya.gopal@intel.com>,
 Ninad Naik <ninad.naik@intel.com>
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

This patch fixes the issue with 3.5mm headset keys
on RPL-P platform.

Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
Signed-off-by: Ninad Naik <ninad.naik@intel.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bce82b834cec..4ea07634548d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9444,6 +9444,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x1230, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1252, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x10ec, 0x124c, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
-- 
2.25.1

