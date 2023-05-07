Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38E6F9587
	for <lists+alsa-devel@lfdr.de>; Sun,  7 May 2023 02:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A0F918A4;
	Sun,  7 May 2023 02:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A0F918A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683419677;
	bh=/O/XkNe3bHehvczqzHylKHJi+VXkUeymg+W/IzhvROw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n2qX/KVQNHsgi7Y53mf1+CSnuUQr0nNMgO2pG15/4V9kZniU2fTTTZz/+5Ia1j5bn
	 wsRgdP6IRfp1JzIeI+qzwcmvBp56Mt9Ml2r4t2bHYOU9jaQXccWcvoKM6sV+M32WuW
	 I6bIb/Ua8+Yzw/MkUDxcM5ZSiDgEdfOJb/QqlJnQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B810F80558;
	Sun,  7 May 2023 02:33:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DAD0F80558; Sun,  7 May 2023 02:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83518F80553
	for <alsa-devel@alsa-project.org>; Sun,  7 May 2023 02:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83518F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PWrHZKSt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F4456145A;
	Sun,  7 May 2023 00:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C3FC433EF;
	Sun,  7 May 2023 00:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683419600;
	bh=/O/XkNe3bHehvczqzHylKHJi+VXkUeymg+W/IzhvROw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWrHZKStihm548377/R/0ntxbF/TBMuDVnBX5Tm+Gj5/aZoJKvCSx5GfTzRSXxE/2
	 LRNGj/IQQaDkOeTV2l/iN+AKZG+orpgdHmvm3nLDyD49BccFmR2wNZR50FdOeNlBQh
	 tMQTFLchEpYBfgcHuIhAt3jaXO1EflfiXWOuUVMADvq/REyC9HHuY1BpcCrc2wJIn/
	 QoYbSMC/kznE0EPCb2Qd9zi+PW5YJmFmDehgzmaHd3suGFVWtzV+8Ji1eXDnxOHQQv
	 jTul6JazZe6apN+HLxBQj9PqaQYvakffu1sdNhh2aT8KnbS/ezThHLKSlfQ9W3+jVY
	 o8UlXPfslUWug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 12/20] ALSA: hda: LNL: add HD Audio PCI ID
Date: Sat,  6 May 2023 20:32:27 -0400
Message-Id: <20230507003237.4074305-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507003237.4074305-1-sashal@kernel.org>
References: <20230507003237.4074305-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HNUOSSWKCFYTF756XWLGKTQ6MABDZXWI
X-Message-ID-Hash: HNUOSSWKCFYTF756XWLGKTQ6MABDZXWI
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fred Oh <fred.oh@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Sasha Levin <sashal@kernel.org>, tiwai@suse.com, rander.wang@intel.com,
 kai.vehmanen@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 yong.zhi@intel.com, evan.quan@amd.com, bhelgaas@google.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HNUOSSWKCFYTF756XWLGKTQ6MABDZXWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fred Oh <fred.oh@linux.intel.com>

[ Upstream commit 714b2f025d767e7df1fe9da18bd70537d64cc157 ]

Add HD Audio PCI ID for Intel Lunarlake platform.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230406152500.15104-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 77a592f219472..881b2f3a1551f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2528,6 +2528,9 @@ static const struct pci_device_id azx_ids[] = {
 	/* Meteorlake-P */
 	{ PCI_DEVICE(0x8086, 0x7e28),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	/* Lunarlake-P */
+	{ PCI_DEVICE(0x8086, 0xa828),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Broxton-P(Apollolake) */
 	{ PCI_DEVICE(0x8086, 0x5a98),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_BROXTON },
-- 
2.39.2

