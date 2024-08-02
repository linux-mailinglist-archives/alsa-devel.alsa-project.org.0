Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA09945E12
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B49D145E6;
	Fri,  2 Aug 2024 14:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B49D145E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602821;
	bh=fHr0c4y9cFrhSjFuuJ7aPF8B14yCQNEa5fFMaeX+GhI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eh1efm5dL4EJZb3cGVdb9fLkF9QNl8R+gx7HRMkHYY6ExgFqvZrL1CGXUYkw4UjAH
	 2u2QBjbpoh0xD++0dEWc+GevwAx5WClFQNR/A79gzm7Is2+/R80d6RaMfePe9Wz5eP
	 DkvZ4BaLvTotbsg1tvvcf8CsBfvRtdAyRb6hf5L4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E7FF805A8; Fri,  2 Aug 2024 14:46:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 278A6F805B0;
	Fri,  2 Aug 2024 14:46:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E300F8026A; Fri,  2 Aug 2024 14:46:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A6C1F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6C1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dJZ34QUs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602785; x=1754138785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fHr0c4y9cFrhSjFuuJ7aPF8B14yCQNEa5fFMaeX+GhI=;
  b=dJZ34QUsZOIHvZoaTu+7+iQaYHoMaQdY3nFtwHQt0c7gtsTuQcXWufYc
   25GuH5ojxCqXk3tShvP+FQPxUFN7U2a0CzurGaRti06gWbQqSaAn6LRJC
   eWESRAOFSkFj8Q74R8svoUqo4SOVcL9fTCsSeNUQg1YAody/DrsJoLyix
   K3E9c9qREZi0C8We4oKr3uos/OKF/JmPizkvEh3o8P95OjzpQ1uoIWXF5
   2zXwlAsC99pwyytdW5iEhQ8FWHEoeb0vc7h9najHaYzJGB32Ow0pxlUbJ
   GqqYO9dZ/Vlr38uZunThHn1+2e8yygKoo+Lky44mlvBZcRw56sE6NzVR2
   Q==;
X-CSE-ConnectionGUID: fPVAm/wPR6idRxaq+CDxGA==
X-CSE-MsgGUID: hFRu3K2lS4mGjEPPC1PBjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199374"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="20199374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:21 -0700
X-CSE-ConnectionGUID: JMN1u5hoROSKCtcbcPTL5A==
X-CSE-MsgGUID: XFKF4xJMSrSQAnVbeAeO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="60407822"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:46:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/4] ASoC: SOF: reshuffle and optimize structures
Date: Fri,  2 Aug 2024 14:46:05 +0200
Message-ID: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PAOMATSUZOUTBAHQG4WI33EOWOS53HY6
X-Message-ID-Hash: PAOMATSUZOUTBAHQG4WI33EOWOS53HY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAOMATSUZOUTBAHQG4WI33EOWOS53HY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

pahole reports a number of sub-optimal structure definitions with
holes and cache-line alignment problems, this patchset optimizes a
couple of structure frequently used.

No functionality change, only re-ordering of structure members.

Pierre-Louis Bossart (4):
  ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
  ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
  ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
  ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list

 sound/soc/sof/sof-audio.h |  4 ++--
 sound/soc/sof/sof-priv.h  | 16 +++++++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.43.0

