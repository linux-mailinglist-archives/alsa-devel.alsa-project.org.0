Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 199536E931C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA757EC3;
	Thu, 20 Apr 2023 13:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA757EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681990917;
	bh=kvB1cxNVZXADRg/+xCPYoeN9/6LeMG6G4zPAHYOv79w=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p+4k7HrRs8eRoZSkjJ4/UE3xfyzovbD0b6vmaoifbYYWtWfUteJ1Vz2wcbgpKphVL
	 vzndOEFvmD2Id0xjyb3v8kvMcRVVQretW1mvK8BhEDYCqTw2izhnGMoRCZpMLFT5gA
	 Ed+JC5VBdtThWAigCQkmbKYj8sggxPA5hQ8uckbE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AD1F800AC;
	Thu, 20 Apr 2023 13:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5DD5F80212; Thu, 20 Apr 2023 13:41:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C07C6F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07C6F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X0HhGl7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681990861; x=1713526861;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kvB1cxNVZXADRg/+xCPYoeN9/6LeMG6G4zPAHYOv79w=;
  b=X0HhGl7aZq8VEhfEuxvo38BWpg+xF68tkqNiqr1+r92+XbmLsxRixdv3
   AI5oVFUZKL+t5sXGAoaa6aUEo22IjkSF+6FY2NqMkoLBAHpQ486hbCyO5
   8SzBE7eqpx24E0NJvi4L1nwJllAUf1cnAU1xnrBV9zV279+u0j8Axe/XK
   DPPbjIvhlFYVvoB+pW3IVF/55NRyQ+7VsvbiiR9LgUJLH6qGf8zuv6CHM
   qbrTYDxb4JkFZPoFY69Lk1whQqGynPbzjmvOVrVp/XrjtnNOodAC5Yl6v
   Cno1P0dOAwXQu2aFL3sdQKSwFG/qVvhJP8YgNju65X4tvJEZ0A611bUc0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373606509"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="373606509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021553552"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200";
   d="scan'208";a="1021553552"
Received: from draj-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.32.253])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:40:54 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: SOF: pcm/Intel: Pause-resume improvements for IPC4
Date: Thu, 20 Apr 2023 14:41:35 +0300
Message-Id: <20230420114137.27613-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N73F5RFLUVMLKDNHLOW3M6YSQDLXOEVO
X-Message-ID-Hash: N73F5RFLUVMLKDNHLOW3M6YSQDLXOEVO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N73F5RFLUVMLKDNHLOW3M6YSQDLXOEVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

last minute patch for correct the pasue/resume operation with IPC4.

The issues are hardto reproduce and needs extended stress testing to be hit, in
which case the audio breaks due to DMA errors.

Regards,
Peter
---
Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: Do not stop/start DMA during pause/release
  ASoC: SOF: pcm: Add an option to skip platform trigger during stop

 sound/soc/sof/intel/hda-stream.c | 11 ++++++++++-
 sound/soc/sof/ipc4-pcm.c         |  3 ++-
 sound/soc/sof/pcm.c              | 23 +++++++++++++++--------
 sound/soc/sof/sof-audio.c        | 22 ++++++++++++++--------
 sound/soc/sof/sof-audio.h        |  6 ++++++
 5 files changed, 47 insertions(+), 18 deletions(-)

-- 
2.40.0

