Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55A42427E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74F96844;
	Wed,  6 Oct 2021 18:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74F96844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537289;
	bh=BFfut4vidQFbaaIg2zAvPNsYVEQE6EHOLLibzwh2kFY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kj+R4xKvqcEYXRIRotysHOTW0ys30/+92ueQyRPptnSKg4ZtyGBgGmdfxqNJlYhtn
	 QIdENywMsV9WX7tF2PBaMfjDFC9Kln9hlqheFrvFgtoJgiIk1PwYQNofhLstKZ4EU6
	 KYsc03h4hC25b/NBaSdhfTlYmVjTcPZD4DamtDJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA804F8025C;
	Wed,  6 Oct 2021 18:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FFAAF800FE; Wed,  6 Oct 2021 18:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0593F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0593F800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="225926606"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="225926606"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="657046588"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.56])
 by orsmga005.jf.intel.com with ESMTP; 06 Oct 2021 09:20:00 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] Multiple headphone codec driver support
Date: Thu,  7 Oct 2021 00:18:02 +0800
Message-Id: <20211006161805.938950-1-brent.lu@intel.com>
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

Brent Lu (3):
  ASoC: soc-acpi: add alternative id field for machine driver matching
  ASoC: Intel: sof_rt5682: detect codec variant in probe function
  ASoC: Intel: sof_rt5682: use id_alt to enumerate rt5682s

 include/sound/soc-acpi.h                      |  2 ++
 sound/soc/intel/boards/sof_rt5682.c           | 34 +++----------------
 .../intel/common/soc-acpi-intel-adl-match.c   |  8 +++++
 .../intel/common/soc-acpi-intel-byt-match.c   |  6 ++++
 .../intel/common/soc-acpi-intel-cht-match.c   |  6 ++++
 .../intel/common/soc-acpi-intel-cml-match.c   |  8 +++++
 .../intel/common/soc-acpi-intel-icl-match.c   |  6 ++++
 .../intel/common/soc-acpi-intel-jsl-match.c   | 32 +++++------------
 .../intel/common/soc-acpi-intel-tgl-match.c   |  8 +++++
 sound/soc/soc-acpi.c                          | 21 +++++++++++-
 10 files changed, 76 insertions(+), 55 deletions(-)

-- 
2.25.1

