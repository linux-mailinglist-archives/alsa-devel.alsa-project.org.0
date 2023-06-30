Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD974411D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0797F839;
	Fri, 30 Jun 2023 19:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0797F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688145789;
	bh=ZBN4991fc3Az5Y2Qu0dseNwl7x1yFt5qfZkPD0JoAOk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GdjiOMqQ/vmWp+sbBmuVtmrVICqc1MbGCh8Ar/wR7a/G3caSopDtuhvsRTwTfZUtU
	 nzJ4+uB464QhH6xEzWtjXVXqvPCHHbix3AmfqAlgyGgNFx6ukVtALGsPh0od02Wyba
	 bukKs/n61+6Ly4PUn9/qPODElspKbT0irTuZQ984=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 388FFF80246; Fri, 30 Jun 2023 19:22:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F4AF80212;
	Fri, 30 Jun 2023 19:22:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB887F800E3; Fri, 30 Jun 2023 19:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA10AF800E3
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA10AF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B/2o6Cg/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145724; x=1719681724;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBN4991fc3Az5Y2Qu0dseNwl7x1yFt5qfZkPD0JoAOk=;
  b=B/2o6Cg/vXPTueB0ZnzEGht64V6vLPcumlOtsbFp6cXTXkcyEzyHVGMg
   qGHSovGCx71nYmz9BLtmo37QorjW1dVPE9wzrkY3h2rGxRrI6hV+/Z9LG
   4cbl4t9kpdTljlLxCWwNQidkDAvt5BSOnGRqW60c12oLXhDzzztmAuI66
   eEIQKNB7IrmcZJDiePzamS814rfPwIF3jXvddLdkBhutZqvtOywvNm0IL
   yC5+CIThk+kmbFS5tIgbPaIlOWnB+gn9FJGkW6mqRgcRdRvvBGnlg6gNq
   ak/qc65QigIjaq8hllpVQwbkQoTz/ZqjyL8czx+gFIpOV3arZr+knPSXV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342032349"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="342032349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711879223"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="711879223"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 10:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CB225358; Fri, 30 Jun 2023 20:21:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/4] ASoC: rt5677: Refactor GPIO and use
 device_get_match_data()
Date: Fri, 30 Jun 2023 20:21:51 +0300
Message-Id: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UM5BZWC7ISHMMV2MKCTP2JXOLQ7M3N6J
X-Message-ID-Hash: UM5BZWC7ISHMMV2MKCTP2JXOLQ7M3N6J
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UM5BZWC7ISHMMV2MKCTP2JXOLQ7M3N6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code can be simplified with refactored GPIO parts and with use of
device_get_match_data(). Besides that couple of additional changes,
one for maintenance and one for making IRQ domain agnostic (not being
pinned to OF).

Changelog v2:
- refactored GPIO code in (a new) patch 1
- fixed compilation error in patch 2 (LKP)

Andy Shevchenko (4):
  ASoC: rt5677: Refactor GPIO support code
  ASoC: rt5677: Use agnostic irq_domain_create_linear()
  ASoC: rt5677: Use device_get_match_data()
  ASoC: rt5677: Sort headers alphabetically

 sound/soc/codecs/rt5677.c | 117 +++++++++++++-------------------------
 sound/soc/codecs/rt5677.h |  92 +++++-------------------------
 2 files changed, 53 insertions(+), 156 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

