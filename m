Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7683C7C07
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 04:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A688169B;
	Wed, 14 Jul 2021 04:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A688169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626230892;
	bh=rrjQ46fKWhrUQY94m8HXQzGTav/Tr5dhuz3HXqNscfU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XcLB4B4ThTvYkvBf5f4/sd9DdAoqvBJXPXgE+KuFDaCEZFMII/E0dgZsQSO7fwg+Q
	 5BkXE0+GnbEFjN3ALCNmmcoG9DRJ7kH4PRNLqhqIuqNCou/hsVQVxNremCMqSzrviy
	 8URQisp3QRNF/ICODb9++uNu0aHrHh90nXYf0BQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69340F8011C;
	Wed, 14 Jul 2021 04:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B29F802E7; Wed, 14 Jul 2021 04:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B47EF8011C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 04:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B47EF8011C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210092382"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210092382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="493593189"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/6] soundwire/ASoC: abstract platform-dependent bases
Date: Wed, 14 Jul 2021 10:46:08 +0800
Message-Id: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

shim base and alh base are platform-dependent. This series suggests
to use variables for those bases. It allows us to use different bases
for new platforms.

Bard Liao (6):
  soundwire: move intel sdw register definitions to sdw_intel.h
  ASoC: SOF: intel: add sdw_shim/alh_base to sof_intel_dsp_desc
  ASoC: SOF: intel: hda: remove HDA_DSP_REG_SNDW_WAKE_STS definition
  ASoC: SOF: intel: move sof_intel_dsp_desc() forward
  ASoC: SOF: intel: add snd_sof_dsp_check_sdw_irq ops
  soundwire: intel: introduce shim and alh base

 drivers/soundwire/intel.c           | 74 ------------------------
 drivers/soundwire/intel_init.c      | 14 ++---
 include/linux/soundwire/sdw_intel.h | 87 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/cnl.c           |  6 ++
 sound/soc/sof/intel/hda.c           | 39 ++++++++-----
 sound/soc/sof/intel/hda.h           |  8 ++-
 sound/soc/sof/intel/icl.c           |  3 +
 sound/soc/sof/intel/shim.h          |  3 +
 sound/soc/sof/intel/tgl.c           | 12 ++++
 9 files changed, 149 insertions(+), 97 deletions(-)

-- 
2.17.1

