Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0017B4D82
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 10:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99182DEC;
	Mon,  2 Oct 2023 10:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99182DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696236451;
	bh=IYdYbzwnjS9nSJtH9hd3gf98UNr6gUicSLj+ccO+KTk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KrZzAbsefSpQMHENWv5K/NZcr/iW/KFv3o6DaBy/cltNCxIg9AuPKwNRABGrB7A+f
	 vSKUsU3BEgpoEDMyVkrZC3TwnteIeLiOzUZpi4RSPK+KwKFlqqPX9j86VTJ5+wYaA6
	 NNC1DVsijWFc0EWj3TZsQjbxtOsE9XLfJMV6/SGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24572F80549; Mon,  2 Oct 2023 10:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F4CF802E8;
	Mon,  2 Oct 2023 10:46:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F8A0F80310; Mon,  2 Oct 2023 10:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6248DF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 10:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6248DF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DRfAaJVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696236388; x=1727772388;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IYdYbzwnjS9nSJtH9hd3gf98UNr6gUicSLj+ccO+KTk=;
  b=DRfAaJVrpv2WEkskoNxa7O5Fb3wlo4FBnkPtxlepU/9UtVk58RWQfiq/
   2S9wgFIl+yxmjKZE2G3DlnsVv9mo9bEXWo3XI8/BdReP6AaS5l2/NcP9+
   vLp72iUk9I429u8i12LMLNE05d6RKO4jjJ1yr5e5Hbubvo0tASnXT241Y
   ZBMuU6ms/A6fW/3C376rx+arKW63kGnw/WAuXetO8u1TweqIym/+opbkG
   Ti6027vs0YR45yxJg2MFEp8Y1ps3TLsujX+eE5zIA8IbHV8zIlk/tAgfj
   Iq0T8Q1781Ia1IUseSIcs2XrcI0ECx4NmMBSStG0qx3ALgHvR3BmLrgWe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="362871439"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200";
   d="scan'208";a="362871439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 01:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200";
   d="scan'208";a="1454347"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2023 01:45:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Remove unused variable
Date: Mon,  2 Oct 2023 10:46:29 +0200
Message-Id: <20231002084629.903103-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZCJS5Q7TPJ2SATDWZEEGV4EKVMHAP2TJ
X-Message-ID-Hash: ZCJS5Q7TPJ2SATDWZEEGV4EKVMHAP2TJ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCJS5Q7TPJ2SATDWZEEGV4EKVMHAP2TJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recent commit removed the only user of bus variable in
avs_dai_fe_prepare(), also remove the variable itself.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309292121.5DdaNpLj-lkp@intel.com/
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 7b84197bd8b9..5b31203bd56a 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -603,7 +603,6 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	struct avs_dma_data *data;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
-	struct hdac_bus *bus;
 	unsigned int format_val;
 	int ret;
 
@@ -613,7 +612,6 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (hdac_stream(host_stream)->prepared)
 		return 0;
 
-	bus = hdac_stream(host_stream)->bus;
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
 	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,

base-commit: c0a68c96c76dfe139cd89e0b9ec40e25ded8e91d
-- 
2.34.1

