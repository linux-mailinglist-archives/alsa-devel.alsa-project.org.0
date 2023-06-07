Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320C72523C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 04:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E0C6C1;
	Wed,  7 Jun 2023 04:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E0C6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686106339;
	bh=K0VFiSwkWEdXkCHBlIvbV1lr5mlswxCupItmMqeviI4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oRAxL+gtgFghvCUCEVtOnOWN25Q+XzdOj9FjSq0X/OYqsYW3FWPLQQ5TB5SlmAPL3
	 z9UQEEYSCk+MwTOdM6/oHaPVEi9seFZKfFyj/LSWLEeutNGitME4gZqJ9WtwZAttOm
	 bzJ5Oi4k0OUtqz2OnZ3yL/BYduRfBJ7EJ6ajx5eU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC972F8055C; Wed,  7 Jun 2023 04:50:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A9E7F8055C;
	Wed,  7 Jun 2023 04:50:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C77A7F80199; Wed,  7 Jun 2023 04:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADAC5F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 04:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADAC5F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T4Slse3m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686106209; x=1717642209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K0VFiSwkWEdXkCHBlIvbV1lr5mlswxCupItmMqeviI4=;
  b=T4Slse3mm6/7lHoYScEBpEBCVl5cFo6i82dwXRIL5Yexrp2fCo/NWU99
   1IWxi8o7xGQq9jtJjNNOSWDkB6hqpX7avpHJjl9lHm+n9ly47JxEZDfov
   t0a3f+nR6wFVjHfsIQdG5iRSEwrEY/fQds/9ObicDRatOjooPau6xHmto
   qT8HpElDxNznzL0hGy2Gw7TiBIx6659CtHsaP6OI7/dTDfIFaLkPp70sv
   pyd8wRRnXhlQOXKsBgxWAiyrZToMP1mJyRXdnUcmQCbfhcB2XQfbzd8iA
   5GTEqHpu2bwQv6WIm6d7fiRipadjFDWYZ3aQN9moAC6HinlcQ1G4g5A7p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360183310"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="360183310"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833478858"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="833478858"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:49:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Date: Wed,  7 Jun 2023 11:12:40 +0800
Message-Id: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JYNSVD4STJOLINSMLPWOUTYJ33XSQ53E
X-Message-ID-Hash: JYNSVD4STJOLINSMLPWOUTYJ33XSQ53E
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYNSVD4STJOLINSMLPWOUTYJ33XSQ53E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, ASoC supports dailinks with the following mappings:
1 cpu DAI to N codec DAIs
N cpu DAIs to N codec DAIs
But the mapping between N cpu DAIs and M codec DAIs is not supported.
The reason is that we didn't have a mechanism to map cpu and codec DAIs

This series suggests a new snd_soc_dai_link_codec_ch_map struct in
struct snd_soc_dai_link{} which provides codec DAI to cpu DAI mapping
information used to implement N cpu DAIs to M codec DAIs support.

And add the codec_ch_maps to SOF SoundWire machine driver.


Bard Liao (2):
  ASoC: add N cpus to M codecs dai link support
  ASoC: Intel: sof_sdw: add dai_link_codec_ch_map

 include/sound/soc.h                     |  6 +++
 sound/soc/intel/boards/sof_sdw.c        | 69 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h |  2 +
 sound/soc/intel/boards/sof_sdw_maxim.c  |  1 +
 sound/soc/soc-dapm.c                    | 24 ++++++++-
 sound/soc/soc-pcm.c                     | 44 ++++++++++++++--
 6 files changed, 141 insertions(+), 5 deletions(-)

-- 
2.25.1

