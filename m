Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D586C46BE
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 10:44:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2B0DAEA;
	Wed, 22 Mar 2023 10:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2B0DAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679478264;
	bh=PYDw9/4Xdgjx9mwwOXdzAA7DO/pKhfD7iS4FcRee4Yc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BgY+WID1Kl6/NsXGNlVbztcZzPKD8iLhz7b3p3GCEC8lLqN382NHwN+r41pdX4hEd
	 z6PP7xgxPLYYl2ovDnnhD3QtQFDjlO5AMxzzoOTc9AUUA+LR6jbLApCXoOL/KfsFz+
	 buzuxGz5qbfjwdmB1yUJwCTRkZdZldYLAkjGkynA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D070F8027B;
	Wed, 22 Mar 2023 10:43:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C88F80105; Wed, 22 Mar 2023 10:43:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26FBCF80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 10:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26FBCF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A8liYS5U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478205; x=1711014205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PYDw9/4Xdgjx9mwwOXdzAA7DO/pKhfD7iS4FcRee4Yc=;
  b=A8liYS5UYyuvJPql61RphvrIfw7LIJOOwpAKhzO813YgY6Bc+O+Jd7JA
   EZJMQCVaAw+/xfPknQDvEloUtoDZ9C7IVJ2R2C2wTAqvprrrJhnPZxJWZ
   pKi5AnVMeWLmY6//lEB/ssbOUWcDt4liAivTTlQ/rbMZHKNlq0DocCbcc
   4Q3upP1xRlVqDO2n5KmteMbBXHeXMfQzBELkWx9AfPsWTapeuBgPk54Dy
   Z9Yu1ukhLiBf4bSg3Uk5ZpRILr2gbzRJzEGEoWHIjEZYL2EH9zR+oK+p5
   jCQ44zZOpICLXrFH/kV4lwQ8Kt85Zc1vvQ7yRILXFclMtmlcmG6e2k1l+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404055546"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="404055546"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714344716"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="714344716"
Received: from gjantea-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.2])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:43:17 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: pcm/Intel: Handle IPC dependent sequencing
 correctly
Date: Wed, 22 Mar 2023 11:43:43 +0200
Message-Id: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KAA5XQPRGOUJFDHYXM6DNNYBWQZHIJ7J
X-Message-ID-Hash: KAA5XQPRGOUJFDHYXM6DNNYBWQZHIJ7J
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAA5XQPRGOUJFDHYXM6DNNYBWQZHIJ7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

IPC3 and IPC4 firmwares handle and execute tasks at different stages, like
managing DMAs.
In most cases these are aligned, but we have few exceptions that needs to be
handled differently.

This series introduces flags to handle the differing cases to make sure that
the correct sequencing is used regerless of the IPC version.

Regards,
Peter
---
Ranjani Sridharan (3):
  ASoC: SOF: Intel: hda-dai: Do not perform DMA cleanup during stop
  ASoC: SOF: pcm: Make hw_params reset conditional for IPC3
  ASoC: SOF: pcm: Improve the pcm trigger sequence

 sound/soc/sof/intel/hda-dai.c |  1 -
 sound/soc/sof/ipc3-pcm.c      |  1 +
 sound/soc/sof/ipc4-pcm.c      |  3 ++-
 sound/soc/sof/pcm.c           | 29 ++++++++++++++++++++++-------
 sound/soc/sof/sof-audio.h     |  6 ++++++
 5 files changed, 31 insertions(+), 9 deletions(-)

-- 
2.40.0

