Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F6702B4F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F8F1EF;
	Mon, 15 May 2023 13:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F8F1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149651;
	bh=ZmG4CJXhh8qhB6E4BV1o3CRPwnngoUpKTKqWWRCHuho=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QaRWL8LngDovUcx32wLy9wCj1fS2P8314ljAQmlJR0Ut1EZe730IF4RAVnnyOl6M0
	 MgR/ffc0EKmiQyZCque0cifsAkius97Sx9SUuJWgiz5ouYj7zNV9CQwE8DKvLIzWm0
	 DUlbaJUWZaglvWmiubFzRX/qDTNVJssRItk0Zpeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EC11F80552; Mon, 15 May 2023 13:19:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02751F80431;
	Mon, 15 May 2023 13:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01C42F80272; Mon, 15 May 2023 13:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49AADF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49AADF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XWDUaKUX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684149573; x=1715685573;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZmG4CJXhh8qhB6E4BV1o3CRPwnngoUpKTKqWWRCHuho=;
  b=XWDUaKUXxH5NM+a9K8ErWw5H3UcFvxjckgs83xJy/bGtwA+UKUkOpvD0
   GRXBklptOO4HwkBx1LF97ovG8wjZFrUqOUdiYBWV8i+oEJzLah8ZzX3sc
   SfSNiu1Ua/fgUmFDl6H3rAKa2F0JuvAoQVEndPV69XEs14s1xV95PW/He
   Qq6cbJCGMOQdCINlDGJSfR6gQGud25kpe2YdEUfRdFQoVvawoS6ePgJ20
   r+Q4HprPgyGKVO+Y0dPHBdV3dVjTEqybLhRmXEGxeZz7nurYtZiQAYAtD
   szmkhr8PDTeFW8oxIDglh65KgbMtFUFhvg9toJKgsR6dOOVP11DqTsFsn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="379336174"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="379336174"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 04:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="875142094"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="875142094"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 04:19:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel/ipc4: Do not reset BE DAI pipeline
 during stop/suspend
Date: Mon, 15 May 2023 14:20:20 +0300
Message-Id: <20230515112022.30297-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LZUDQB7PDYPGB4Q6JYMYNNP3SYPGXLGW
X-Message-ID-Hash: LZUDQB7PDYPGB4Q6JYMYNNP3SYPGXLGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZUDQB7PDYPGB4Q6JYMYNNP3SYPGXLGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Do not reset pipelines during the stop/suspend triggers in the BE DAI
ops as the BE DAI pipeline needs to be left in the PAUSED state. It should
only be reset during hw_free. This simplification is already done for
the FE pipelines and the DAI trigger only toggles the states between
PAUSED and RUNNING.

Regards
Peter
---
Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda-dai-ops: Split the get_hext_stream() op for IPC4
  ASoC: SOF: ipc4-pcm: reset all pipelines during FE DAI hw_free

 sound/soc/sof/intel/hda-dai-ops.c | 69 +++++++++++++++++++++++--------
 sound/soc/sof/ipc4-pcm.c          |  4 +-
 sound/soc/sof/ipc4-topology.c     |  1 -
 3 files changed, 53 insertions(+), 21 deletions(-)

-- 
2.40.1

