Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8402A0C4E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 18:18:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEA1C1658;
	Fri, 30 Oct 2020 18:17:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEA1C1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604078322;
	bh=2qE33GJyzVM007sSzkf15bG02DmsUzZ504fzaIKwKoE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PLEzV+v1VvFkJCz8jXvVD2ezIA9S7el3yL/62qBFmCIk+ivgmmzVPRD5EzCSSA4fB
	 JbgY0+VFTa4gFz87upqm60w0Uz+AMdZAFUfB2TCI1dMHpqtLaB7aGtQEFgRpPOyId0
	 qPwOKkM5AfTKjksG+XodZaLK7yoKIrkgtCb4y6JY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58005F800FF;
	Fri, 30 Oct 2020 18:17:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22463F800FF; Fri, 30 Oct 2020 18:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47655F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 18:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47655F800FF
IronPort-SDR: ae8Nv1vUuEaMVvQQKVpsGgeK7EEOy4GN58xd4rEc9N7+OinqZ9IQeZfqx76tUUqm5cKjH3M/pl
 eiSdVbH2oPGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="165140682"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="165140682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 10:17:01 -0700
IronPort-SDR: /+T9kDmhijZAVN9aAqF7eeoqmhyF9zsJaTJLqkCrvSrxEvZ9DU3VPNNbezuuANQryLA3t2eYtv
 uwfZX2Hvv+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="469584679"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga004.jf.intel.com with ESMTP; 30 Oct 2020 10:16:57 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] Add rt1015 support to CML boards
Date: Sat, 31 Oct 2020 01:05:57 +0800
Message-Id: <20201030170559.20370-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

First patch adds tdm 4-slot 100fs DAI setting to avoid jitter of using
64fs on CML boards. Second patch is a DMI quirk for HP Dooly.

Changes since v1:
-Add comment on Dooly's DMI quirk

Brent Lu (2):
  ASoC: intel: sof_rt5682: Add support for cml_rt1015_rt5682
  ASoC: intel: sof_rt5682: Add quirk for Dooly

 sound/soc/intel/boards/sof_rt5682.c           | 65 +++++++++++++++++--
 .../intel/common/soc-acpi-intel-cml-match.c   | 13 ++++
 2 files changed, 73 insertions(+), 5 deletions(-)

-- 
2.17.1

