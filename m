Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40BB867571
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C84825;
	Mon, 26 Feb 2024 13:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C84825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708951476;
	bh=oTHR95JWcz0ap604v+zFjYvXKhk2SC2e8b03VMGFeXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lw9tYYglDhcOymouzGgtY6Xf5GuDLRUfhJ1+Ds+5weJIzm+fD+52PDPzi8RvDkPac
	 BHkx5svdgO1+3ql4UQS7QQxo+9Qe//LsGMZa02frA6YhANKo2I6ls/bCEAWnlexbF6
	 g1ju1F+8TYCpLbfvKDevSOQ6Snq/nTU6R62RDHqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56F74F80617; Mon, 26 Feb 2024 13:43:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35799F8060A;
	Mon, 26 Feb 2024 13:43:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CEF6F80587; Mon, 26 Feb 2024 13:43:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 109DEF80246
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109DEF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jt9M5tQq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708951389; x=1740487389;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oTHR95JWcz0ap604v+zFjYvXKhk2SC2e8b03VMGFeXk=;
  b=Jt9M5tQq6gYCoG4yovCQeBC+YSV9iFNYZz60CezWiLXGFD2goph6AYmx
   qkOMTavYXpvOpNhzIvnJojPiSYgV8P6IvqLVgvxDQ9VI9Ay4KOIcHZddw
   J8qeRgsoxkds0HDjPaDce8CuRT/y/bfUibYREKNR7EMbc1AnwUw0/b5Gf
   IZo8Vv6tmNuNBGhorAnY6MulEhDKJEEtMQonbmX4XRrziR6sOM3p89GON
   JtTx7zz49m9h5VZm0+6arBSCGojIkZrzMqizUi+QKaqxJlenj3SLLy1Id
   xZJTlsuJIhRqEf/V3qs7kR0yel1TehDwHvF8h7xILRfsSvhb3uYv5RjzP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="28658253"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="28658253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="6688616"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2024 04:43:04 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 3/5] ASoC: Intel: avs: Ignore codecs with no suppoting
 driver
Date: Mon, 26 Feb 2024 13:44:30 +0100
Message-Id: <20240226124432.1203798-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226124432.1203798-1-cezary.rojewski@intel.com>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VUCQK2A3XY5N5CROJ7QAKHFJLOZFFMUE
X-Message-ID-Hash: VUCQK2A3XY5N5CROJ7QAKHFJLOZFFMUE
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUCQK2A3XY5N5CROJ7QAKHFJLOZFFMUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HDMI codecs which are present and functional from audio perspective lack
i915 support on drm side what results in -ENODEV during the probing
sequence. There is no reason to perform recovery procedure e.g.: reset
the HDAudio controller if this is the case.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index b3e5a5012167..a61ce42b426c 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -150,7 +150,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	/* configure effectively creates new ASoC component */
 	ret = snd_hda_codec_configure(codec);
 	if (ret < 0) {
-		dev_err(bus->dev, "failed to config codec %d\n", ret);
+		dev_warn(bus->dev, "failed to config codec #%d: %d\n", addr, ret);
 		return ret;
 	}
 
@@ -159,15 +159,16 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 
 static void avs_hdac_bus_probe_codecs(struct hdac_bus *bus)
 {
-	int c;
+	int ret, c;
 
 	/* First try to probe all given codec slots */
 	for (c = 0; c < HDA_MAX_CODECS; c++) {
 		if (!(bus->codec_mask & BIT(c)))
 			continue;
 
-		if (!probe_codec(bus, c))
-			/* success, continue probing */
+		ret = probe_codec(bus, c);
+		/* Ignore codecs with no supporting driver. */
+		if (!ret || ret == -ENODEV)
 			continue;
 
 		/*
-- 
2.25.1

