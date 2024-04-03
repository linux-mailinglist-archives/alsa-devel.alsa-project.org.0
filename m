Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D4896AA9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB162C9E;
	Wed,  3 Apr 2024 11:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB162C9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712136754;
	bh=ksuiznIoJxFzb1RHAvr0zISxppTJtV786zLmv8pdFSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D06wsIs4twNdAE7PB/sLaB9NTqBc+VbSSQdAasPEfVohSR3v+nZrx+bB7ZM6DYLaW
	 yVBYXgsg+hgCiqFThcmoWA1+Nk5GjXHB8PqsJdyJznery4uW2dgdrmoZxGbri3Dxtx
	 DtSAcXl2dRiBykjLuSQst5QNckUgS4QEPClV0Zfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BE4F8060D; Wed,  3 Apr 2024 11:31:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 283FEF805F0;
	Wed,  3 Apr 2024 11:31:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C90F8055C; Wed,  3 Apr 2024 11:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECC6FF80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC6FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MWo+cmFZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136681; x=1743672681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ksuiznIoJxFzb1RHAvr0zISxppTJtV786zLmv8pdFSg=;
  b=MWo+cmFZGJ5s/hEWtBU1JpG70SzSvto7tbYgajgXwu9gc9GU4gLTffoU
   x+Gh6RgdCJ7hunvLjHiKYJMg6aZMc0NdJUk1ocvj7FwAt8zxhY7rbIyUS
   RM9uZzTO4C+VX7uEYdEpJql9/fMXpMYhkNqEhR269r1rhywiS8xlYU04W
   ntOuF1Av74J3PDDtGonpJnsZXweoB9BqRpY/VDRiBexzlJ1qs6jeysuYs
   O+3clwjPIEZJTDNfhMMnKYfY4YKsZ+I5650nZbyl8S5iq/8UumOKEngxd
   D10bqU6lEvndfIYS5jQ6AhB1UydvP7cN8ydXJpJvcSGendyUQm2FeQaaJ
   w==;
X-CSE-ConnectionGUID: 1OkV87qoQsu3XpkWNqvRcQ==
X-CSE-MsgGUID: yJb13xDXSUCle/RS20oiEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218689"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7218689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:31:19 -0700
X-CSE-ConnectionGUID: cbNBmSYVTeiNkya1WpL43w==
X-CSE-MsgGUID: a+mdaRImQ++pyxrELfMr2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18797542"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:17 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/10] ASoC: Intel: avs: hdaudio: Constify probing_link
Date: Wed,  3 Apr 2024 11:31:38 +0200
Message-Id: <20240403093145.3375857-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NZBOG7WMJH2YKZTCUOCRZD6KD2RIJTJM
X-Message-ID-Hash: NZBOG7WMJH2YKZTCUOCRZD6KD2RIJTJM
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZBOG7WMJH2YKZTCUOCRZD6KD2RIJTJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

probing_link is passed to devm_kmemdup, and is never modified, may as
well mark it const.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 2de703b909c30..4433175814f80 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -155,7 +155,7 @@ static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
 	return 0;
 }
 
-static struct snd_soc_dai_link probing_link = {
+static const struct snd_soc_dai_link probing_link = {
 	.name = "probing-LINK",
 	.id = -1,
 	.nonatomic = 1,
-- 
2.34.1

