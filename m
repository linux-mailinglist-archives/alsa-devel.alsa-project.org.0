Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D844384E522
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1172E829;
	Thu,  8 Feb 2024 17:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1172E829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707410394;
	bh=mqS9lw9rTFCFRqh4I38rzrLdGyE8889OqTSvXKvtVh0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jeCrBiSFd6GOQTbPPl1EXV/LJ4v2mWx/MQAAiXF2AhsYemTzP2D0ys+UukyK49Bky
	 R2M089QJ2AnnIsBwXEtaAeOP6RiMk8bfm7dOmTuky1Nw1o5q2eRzGzcGUOxcRh6d/M
	 Rym1EtOX5GvzWUJK7ivpTWgnPos1K5Rucpwy2GJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6DF5F801EB; Thu,  8 Feb 2024 17:39:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A087F8056F;
	Thu,  8 Feb 2024 17:39:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 191DDF804E7; Thu,  8 Feb 2024 17:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF270F80153
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF270F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N0LfrX42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707410357; x=1738946357;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mqS9lw9rTFCFRqh4I38rzrLdGyE8889OqTSvXKvtVh0=;
  b=N0LfrX42SRQQ25sBoSzjaWle658AtG/RD9SGoyVjkmYMg1V9LXGm22Ve
   QDUg8WU9VZdKM7NFx++yNQWicVxG50ttr3AqS8UlL8ZcuTWyUZAvpjE3G
   GVDEavkdUnPB+p/EgV0C8M8h3qujY4RuFbYpXP4jtjH38FILXHiHvaxkb
   qP/5TMFJ899xvoAmNpsJY3K6lYfihdYbS/8cslYiFx6cOmKQGYJLfa7eH
   Wx67GI/qkyTtV1b+wXLmn3nuKj4Cjufx4gz+J3LPmmwE5QokbY95my+Kp
   Xn9dZiK1lBQ4kBXSftfYOhIWvVzQSu+ILLSY5FMfCtnWW4V0zbOVNDhvV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1120320"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1120320"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="2068825"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:39:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
	"Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Sayed@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda/realtek: Add "Intel Reference board" SSID in the
 ALC256.
Date: Thu,  8 Feb 2024 10:39:04 -0600
Message-Id: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YNUVRECKGWRMESMEAJMA3AIH6SIMYXKP
X-Message-ID-Hash: YNUVRECKGWRMESMEAJMA3AIH6SIMYXKP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNUVRECKGWRMESMEAJMA3AIH6SIMYXKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>

Add "Intel Reference board" SSID in the alc256.
Enable "power saving mode" and Enable "headset jack mode".

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f6f16622f9cc..0052a654204d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10081,6 +10081,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x1252, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.40.1

