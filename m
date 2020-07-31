Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BDF2347F9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 16:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38ED01662;
	Fri, 31 Jul 2020 16:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38ED01662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596206727;
	bh=J95sfTM7v3hqTH0+AQ7ny8jCVKodHy63a7P8J7f7YOw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l/VaJ9Q5VTkeTRpYTpRIhyAd1smy1C+ohLg+bEy8dBb/tf3DalbW6UjRcvT37rwX4
	 IVfcWcuNR4h3uFCGtEkLZo+i0MuXWoNTMmOuJjtNJOZISLZwr2qowO5IlJhyBD8Dq3
	 P0m/qlMSAo/J5ZhQM2aeZX+obJUEkZGNSb9wvgpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 894ECF802BD;
	Fri, 31 Jul 2020 16:42:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 707E7F801A3; Fri, 31 Jul 2020 16:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8C0AF80171
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 16:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C0AF80171
IronPort-SDR: QmpjiilmIyp6t08CJ7TUOA+p+BNlNoJNdWPgDQ0ZMcFO2PFUZFFL4AXUEO57TvPiFFlctvrANO
 mcMUAqYmwKrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131352411"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="131352411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 07:42:22 -0700
IronPort-SDR: WUyNtx4bBdBAvsj1E1OZ4zYM/KEPOTaP/5X0K+1m7AlJZkAMs2YcyF3LYyRJ+0GV4GauGXLEkC
 gdxdEyZt6P2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="491505194"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 07:42:19 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: core: Two step component registration
Date: Fri, 31 Jul 2020 16:41:43 +0200
Message-Id: <20200731144146.6678-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lars@metafoo.de,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, broonie@kernel.org,
 mcoquelin.stm32@gmail.com
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

Provide a mechanism for true two-step component registration. This
mimics device registration flow where initialization is the first step
while addition goes as second in line. Drivers may choose to modify
component's fields before registering component to ASoC subsystem via
snd_soc_add_component.

Patchset achieves status quo - behavior of snd_soc_register_component
remains unchanged.

Cezary Rojewski (3):
  ASoC: core: Relocate and expose snd_soc_component_initialize
  ASoC: core: Simplify snd_soc_component_initialize declaration
  ASoC: core: Two step component registration

 include/sound/soc-component.h         |  3 --
 include/sound/soc.h                   | 11 +++---
 sound/soc/soc-component.c             | 16 ---------
 sound/soc/soc-core.c                  | 52 +++++++++++++++++----------
 sound/soc/soc-generic-dmaengine-pcm.c | 14 +++++---
 sound/soc/stm/stm32_adfsdm.c          |  9 +++--
 6 files changed, 55 insertions(+), 50 deletions(-)

-- 
2.17.1

