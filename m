Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613577E2A3
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 15:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E826D20C;
	Wed, 16 Aug 2023 15:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E826D20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692192771;
	bh=7COBcJ8HiTEHbOpWCy0lAitRCk8S3UbO3GqQlhzmP4o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gFOoyh5Hli+vl+QI4iOU5Ll5+F8GgESEGVTNNf7aWJwwaUozVVS1JexlzglY4HpJ4
	 VVPxqyCnNK6HQ/mXxEfTM900DueFqENbexh9pRzKCWiHCTUjedkvSzCl/uOSn+4oLg
	 HEXPBBDPGTFZdWuRYsSf00LAep2w7Ymqn1Rs7Nss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B02FF80254; Wed, 16 Aug 2023 15:32:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B084CF8016A;
	Wed, 16 Aug 2023 15:31:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96977F8016D; Wed, 16 Aug 2023 15:31:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C191F800D1
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 15:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C191F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S4jWJpqe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692192708; x=1723728708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7COBcJ8HiTEHbOpWCy0lAitRCk8S3UbO3GqQlhzmP4o=;
  b=S4jWJpqeAnSbgcz6OudM3mCrwIlZ/+9a/fDVxoWrcqt3SWP5Opt1qb0t
   ZmJOJ0XGRwepkfpfC3isSFqLs33gw3ghThVer5xZZCk20rHRzcu66CdxH
   SXe9yLRuD0awStqx/VInN7QamO9vIsA/i98gapebuxP4hDGz8by77e1Ax
   9+i2dKuDVwvbEu2c4zZ4ZuenexrwvgTbVPp+5D52YAK2Jb/RGFGuy7pLO
   6NW+b2lpa1rJJrY58Rx3bwYYl2m19xo7tP+Dse9j9AOmQy8W9242IrgEk
   egL5fM15pafzmHhV5WFgEs9IqUVVdKaO2X5Trl0XJD1KscUsfnNy6Rmya
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352857880"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200";
   d="scan'208";a="352857880"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 06:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824237792"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200";
   d="scan'208";a="824237792"
Received: from isyrjala-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.211.131])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 06:31:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc4-pcm: fix possible null pointer deference
Date: Wed, 16 Aug 2023 16:33:11 +0300
Message-ID: <20230816133311.7523-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LWOK3KZMWQOSZVXHZMEVLT2XW5KSR4IS
X-Message-ID-Hash: LWOK3KZMWQOSZVXHZMEVLT2XW5KSR4IS
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWOK3KZMWQOSZVXHZMEVLT2XW5KSR4IS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

The call to snd_sof_find_spcm_dai() could return NULL,
add nullable check for the return value to avoid null
pointer defenrece.

Fixes: 7cb19007baba ("ASoC: SOF: ipc4-pcm: add hw_params")
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 802cbf73594e..db19cd03ecad 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -709,6 +709,9 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_sof_pcm *spcm;
 
 	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
 	time_info = spcm->stream[substream->stream].private;
 	/* delay calculation is not supported by current fw_reg ABI */
 	if (!time_info)
-- 
2.41.0

