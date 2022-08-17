Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AD596F42
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9D91654;
	Wed, 17 Aug 2022 15:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9D91654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741940;
	bh=nF9a1ygfaxp2mCx1j2qib7Mrnc7Es43ARNyD+iFbnpk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bTem45au3YRr9ehJOvBjWwajS2ILifWojQapueW2bF1a1FGycW2J4GOkRYffUgyfZ
	 pTcJcgKwUMPNEgyJP7HZ/PyfRrfYSlK0HgW0/OYgOEMDbNrtRMFOMKelnSeinsRhTi
	 ZsHvRVWrkJNVkwKAhPjkDOXSpvfxU3FZtQvpieU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCCBF80548;
	Wed, 17 Aug 2022 15:11:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D94AF80534; Wed, 17 Aug 2022 15:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA30F80082
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA30F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OjWiCNVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741873; x=1692277873;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nF9a1ygfaxp2mCx1j2qib7Mrnc7Es43ARNyD+iFbnpk=;
 b=OjWiCNVy6/3i6M2c/O+EHg2/RsgnIJsYRVlEYxRaQqjtbtzGvgPG7VwQ
 XYkrPJVLK5iJ3wRjwKesExc/WHN23FE+1BB25NtqSBYOEp/xkpWMnB4Hn
 Y/mrczZwU7UfWjHYUijQjCBQafA4R23WAqozGNNP/1jXwVziCJNy4zApl
 Cw+auCLhQkO8fZopnZuS28zp5bIMaqgOELQSEcXnv83cl3y/4rXtMczbc
 4sy7HtGHS014YO1dpErVW0or38zeRULfyVQbl6CPAPJt5zWaQFPF9aam9
 f3pkxiJ0FqXOjHh8N3BAVgTMMzuYC9fY8QUzQlgYRtUZLE3s/hcFaznBj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318496064"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318496064"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="667609938"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 06:11:08 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: hda: Minor cleanups
Date: Wed, 17 Aug 2022 15:11:33 +0200
Message-Id: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

First two patches are small refactoring of code to use poll macros
instead of open coding register checks.
Following two patches remove unused defines from code.

Amadeusz Sławiński (4):
  ALSA: hda: Move stream-register polling macros
  ALSA: hda: Rework snd_hdac_stream_reset() to use macros
  ALSA: hda: Remove unused MAX_PIN_CONFIGS constant
  ALSA: hda: Remove unused defines

 include/sound/hdaudio.h     |  6 ++++++
 include/sound/hdaudio_ext.h |  6 ------
 sound/hda/hdac_stream.c     | 27 +++++++--------------------
 sound/pci/hda/hda_intel.c   |  7 -------
 sound/pci/hda/hda_sysfs.c   |  2 --
 5 files changed, 13 insertions(+), 35 deletions(-)

-- 
2.25.1

