Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F25ADA84F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 08:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A65C601F1;
	Mon, 16 Jun 2025 08:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A65C601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750055733;
	bh=g1XSuWIHwWc44focdtp8wOAM0TQEgX6inz/PxMgrpj4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=H4EVbuazgdrLBsuXAqPdZUZ0gBz3/z5Jg2C3xLsR1SDtZRIllbJwp52F0u6Y08RKk
	 Ssa2myA2U8Knwmb1MhsSQ9T54wO4OAToFjGIsoSs05GF2UyGYkyCrxf5Ojxff/gBQR
	 5YsHCsNNcP+0r5tq8zdC4EtRiixMUklfilgoRWWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 813E7F805C8; Mon, 16 Jun 2025 08:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 401F3F805BE;
	Mon, 16 Jun 2025 08:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC66F80424; Fri, 13 Jun 2025 18:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16DF1F80075
	for <alsa-devel@alsa-project.org>; Fri, 13 Jun 2025 18:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16DF1F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MZccYSNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749832591; x=1781368591;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g1XSuWIHwWc44focdtp8wOAM0TQEgX6inz/PxMgrpj4=;
  b=MZccYSNxT7lp+R16aNGNZv+TDgM1DR0aLnt3HV7lJ1cCBAN81/lS9+e3
   EEj6L2cTNqCpOiNn4wamPAwBz+4WLEabvH91ZJqzHhgutRZ8KmW7SELNb
   XFv3NrUPiAalOt446NS1z36jSzGNuMKonBryQXa11sgimmRa2PDiJR17S
   Xr9c8VOHj5eRxQx3SQ1reFBBrV+9U+j/I6A/zEobuW26R4+roI/Qzm+8L
   7CtaDhpemr3owywF3Bhn28p6o5IG8bGoPv1g6neotxv4TOucSxZqSoszl
   fmYy6Qu2LF//AssJSN7kX+7MuTTDFzPX5+x4ZAkWZnefcVEEkcGo6UCaP
   w==;
X-CSE-ConnectionGUID: 7WpPq4AhQYyhPJH6E2dv/A==
X-CSE-MsgGUID: 9P5VPSDzRlOUlbtd9dR8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55728381"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600";
   d="scan'208";a="55728381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:36:25 -0700
X-CSE-ConnectionGUID: /rVRdw37SKCgwB810QmCEQ==
X-CSE-MsgGUID: TpM71zcwTNqEXIKQD6lKdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600";
   d="scan'208";a="148769965"
Received: from jpp-desktop.igk.intel.com ([10.91.221.24])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2025 09:36:24 -0700
From: Sachin Mokashi <sachin.mokashi@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	Sachin Mokashi <sachin.mokashi@intel.com>
Subject: [PATCH] ASoC: Intel: Replace deprecated strcpy() with strscpy()
Date: Fri, 13 Jun 2025 12:35:30 -0400
Message-Id: <20250613163530.1165690-1-sachin.mokashi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-MailFrom: sachin.mokashi@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HICS3RAWTALNOGPXPINCXSIT6GPCZM3O
X-Message-ID-Hash: HICS3RAWTALNOGPXPINCXSIT6GPCZM3O
X-Mailman-Approved-At: Mon, 16 Jun 2025 06:34:53 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HICS3RAWTALNOGPXPINCXSIT6GPCZM3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

strcpy() is deprecated, use strscpy() instead.
As strcpy() performs no bounds checking on the destination buffer. This
could result in buffer overflow. The safe replacement is strscpy().

Link: https://github.com/KSPP/linux/issues/88

Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index aaef212cf44e..54c1894ee96a 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/string.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -458,7 +459,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	if (!drv)
 		return -ENOMEM;
 
-	strcpy(drv->codec_name, RT5672_I2C_DEFAULT);
+	strscpy(drv->codec_name, RT5672_I2C_DEFAULT, sizeof(drv->codec_name));
 
 	/* find index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
-- 
2.34.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Sean Fennelly, Jeffrey Schneiderman, Tiffany Doon Silva
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

