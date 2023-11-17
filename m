Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864D7EF242
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:06:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E118EDEF;
	Fri, 17 Nov 2023 13:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E118EDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222786;
	bh=e/MRhjR0kzflry7uFf3SrUDC5vM1n+xeCA0SNUy3hoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eq41ZsYTG4ibO4V7k/5y1EAcaKRL0UuWmuVuPrXS+5HL2d3Eh2v2+0P+zPIVkx/0I
	 ollQGbt+if6wuJwnQYSgCZYd05/unsxXb7R2fImx23WzvmVDCgNcb/+Kiro8kYIvTJ
	 jkjwnG0TZVJNGB+3xS1PROCO0yjG23DRZYeKIFs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA26F805AE; Fri, 17 Nov 2023 13:04:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1BAF805A0;
	Fri, 17 Nov 2023 13:04:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9155F8057D; Fri, 17 Nov 2023 13:04:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0921F80549
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0921F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dW4Wnm7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222663; x=1731758663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e/MRhjR0kzflry7uFf3SrUDC5vM1n+xeCA0SNUy3hoU=;
  b=dW4Wnm7C6xQUp1kExCcwWgbPkDv8TUcmjdStIVzUf45ZXMEXx2KaPLJK
   j0K7m2g7s9trIDyOhf5vUirIR+o9OwHUJwjTPrc8oEeyR43ELMdYIExiy
   yNoKFCVHjpcozD8CU56GjsIeEhvnqbi2db7nDZBHeuCWmjtTiAzqKznz6
   bE/djFDFJOEpAlXF1vjBw04tap61bQNC9MsVhmqcLundgyR6x+ebdaVXG
   I56954PGu2PgE+SRy5Zpmmli+HdXZ3jliLmCOxz6dPMa741jDXCqKxuHF
   jBvqKwnAgbG0dpEeQmRGBW1osTpen9SIM/Jk5spwgiLggkKGHY2MFsD8+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675242"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110183"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110183"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 07/16] ALSA: hda/ca0132: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:01 +0100
Message-Id: <20231117120610.1755254-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TPI3ATUJDIWMMYYMP4RK2SC2HPLNBPCG
X-Message-ID-Hash: TPI3ATUJDIWMMYYMP4RK2SC2HPLNBPCG
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TPI3ATUJDIWMMYYMP4RK2SC2HPLNBPCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/patch_ca0132.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 748a3c40966e..aa312441604f 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3022,8 +3022,7 @@ static int dma_convert_to_hda_format(struct hda_codec *codec,
 {
 	unsigned int format_val;
 
-	format_val = snd_hdac_calc_stream_format(sample_rate,
-				channels, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	format_val = snd_hdac_stream_format(channels, 32, sample_rate);
 
 	if (hda_format)
 		*hda_format = (unsigned short)format_val;
-- 
2.25.1

