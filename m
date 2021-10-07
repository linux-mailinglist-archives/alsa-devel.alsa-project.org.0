Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E32425444
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D761657;
	Thu,  7 Oct 2021 15:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D761657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633613902;
	bh=pFPevzGA8Ise8GAC6CToeekYtZMZ9FsxRKIAjlqaggI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oo80VPn7rFbgk2H0vvRBE0HuGXeUC0nSWg12/SLbj+Fxnf96FoBkB0X4/2Dfk8rl4
	 kr5RduGY5miIngIDZ0EVwU6OBfDbFpzlPXXalCNI8cKvfhpkRIEwt713Aa5uSgDkgc
	 rE3fhcOc15QMro16uuyPRArydXR/JAgCAYgJD2cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56180F802A0;
	Thu,  7 Oct 2021 15:37:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BE6F8028B; Thu,  7 Oct 2021 15:37:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DC16F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC16F800F0
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="249567741"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="249567741"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 06:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="484523082"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2021 06:36:50 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] Multiple headphone codec driver support
Date: Thu,  7 Oct 2021 21:35:13 +0800
Message-Id: <20211007133516.1464655-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Rander Wang <rander.wang@intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Bard Liao <bard.liao@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Brent Lu <brent.lu@intel.com>,
 Libin Yang <libin.yang@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>
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

Support multiple headphone drivers in same machine driver. In this
case, both rt5682 and rt5682s are supported and enumerated by different
ACPI HID "10EC5682" and "RTL5682".

V2 Changes:
- remove useless 'NULL', 'false' in if-condition
- can use 'comp_ids' field alone to enumerate driver
- add comma to the end of entry in structure initialization
- keep the table of byt/cht/cml/icl untouched

Brent Lu (3):
  ASoC: soc-acpi: add comp_ids field for machine driver matching
  ASoC: Intel: sof_rt5682: detect codec variant in probe function
  ASoC: Intel: sof_rt5682: use comp_ids to enumerate rt5682s

 include/sound/soc-acpi.h                      |  2 ++
 sound/soc/intel/boards/sof_rt5682.c           | 34 +++---------------
 .../intel/common/soc-acpi-intel-adl-match.c   | 11 ++++--
 .../intel/common/soc-acpi-intel-jsl-match.c   | 35 +++++--------------
 .../intel/common/soc-acpi-intel-tgl-match.c   | 11 ++++--
 sound/soc/soc-acpi.c                          | 24 +++++++++++--
 6 files changed, 52 insertions(+), 65 deletions(-)

-- 
2.25.1

