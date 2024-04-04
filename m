Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37067898E9E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 21:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4622CDD;
	Thu,  4 Apr 2024 21:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4622CDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712257525;
	bh=gvWvwJz1TMcsZ+arLk6e5VFQm8nhkbazC2Uqjo8O/ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YeKjpTHuSQ/F53UPBsvc69yRVN81sJtWvRp0kwwZSWegdZYXS3pg81qYJoDxjhjMc
	 alvfettzLO+fVjwt8RLY1nmEsvMAiJoda039lewcIyMl8DF8wRZHNdn7XTzn/McPJB
	 4CPsjE2vnsB6Hx/V3HqYWX5qqyOoh95V3pODx5BE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CF8F805FD; Thu,  4 Apr 2024 21:04:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE740F805F7;
	Thu,  4 Apr 2024 21:04:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FCAFF8020D; Thu,  4 Apr 2024 21:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7AFEF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 21:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7AFEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ED/w7CNJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257449; x=1743793449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gvWvwJz1TMcsZ+arLk6e5VFQm8nhkbazC2Uqjo8O/ic=;
  b=ED/w7CNJu12U1EbZoDn4E8qy8oVJc9h+WrJwdQQcUQg75iRUv2v5WKOa
   uww+ao1qxzU3oiWutpP5qfQU92a/J9x8i/n0z8PJDzcNMB9iEBgkSY90h
   HEGl3WYOWbl0wLufWnz6JTaUrFVWd3/3+aPbIfB5Jax2yoJ1eYtotv9Kf
   fl/T5VEjtb35G/q7J9oQe8uUHqlhubkmJEpkWmIgsKbiE+BVFlnwtmy5E
   E+6HV3iimjWm5mK3KMXKkKjVwqbg3qd8TG4/UQl97IMvm39qQBp2ink8Y
   uv70KiiWe6raH+8QQBOOc/SaG7nV8aqxkBvvTpYjSRn2YEHRiBdZus3NH
   w==;
X-CSE-ConnectionGUID: wudPjVd4SqqLfU1gcJ5Xfg==
X-CSE-MsgGUID: NOPpGBgXQ4ydRW+kQP79iA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433861"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7433861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:04 -0700
X-CSE-ConnectionGUID: KHTE80dDQGaUdnzi4OBsNA==
X-CSE-MsgGUID: xF8Og7J8Sc63xgcAh590cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="19492306"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: Intel: hda-ctrl: add missing WAKE_STS clear
Date: Thu,  4 Apr 2024 14:03:54 -0500
Message-Id: <20240404190357.138073-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DLEEMKKUZJSKLJDISRAQFBNKRS5DLMYK
X-Message-ID-Hash: DLEEMKKUZJSKLJDISRAQFBNKRS5DLMYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLEEMKKUZJSKLJDISRAQFBNKRS5DLMYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason, the programming sequences in the SOF driver do not
include a clear of the WAKE_STS bits before resetting the controller.

This clear is not formally required by the HDaudio specification, but
was added to harden the snd-hda-reset back in 2007. Adding this
sequence back avoids an issue reported by the Intel CI.

Closes: https://github.com/thesofproject/linux/issues/4889
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 84bf01bd360a..b4f0756e21f6 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -184,6 +184,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *stream;
 	int sd_offset, ret = 0;
+	u32 gctl;
 
 	if (bus->chip_init)
 		return 0;
@@ -192,6 +193,12 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
 
+	/* clear WAKE_STS if not in reset */
+	gctl = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_GCTL);
+	if (gctl & SOF_HDA_GCTL_RESET)
+		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
+				  SOF_HDA_WAKESTS, SOF_HDA_WAKESTS_INT_MASK);
+
 	/* reset HDA controller */
 	ret = hda_dsp_ctrl_link_reset(sdev, true);
 	if (ret < 0) {
-- 
2.40.1

