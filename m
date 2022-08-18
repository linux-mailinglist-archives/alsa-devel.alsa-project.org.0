Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BC598578
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA531635;
	Thu, 18 Aug 2022 16:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA531635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660832152;
	bh=ZhOBlyLmWbCSd5npf+S55l4gbzaVMkSPYKPfp8DWzD0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZzCPOG1QfJaKsKvPjxgRpNcSB1TZKxhbWcwRABJGy8vf0F1WDaVbW3zvEcN9gv9OT
	 28i5GcxNthVe/V5oJeG4rcfDYRD0L01jvCVETuiMTTnv+96UYifSxUaOqbVbAGHw+A
	 1RTpejRmpyfAUsKenqzlCZSZwUooxWt02DvrFnYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E57F80496;
	Thu, 18 Aug 2022 16:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 641C8F8013D; Thu, 18 Aug 2022 16:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F39DF800EE
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 16:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F39DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IllGO4Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832090; x=1692368090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZhOBlyLmWbCSd5npf+S55l4gbzaVMkSPYKPfp8DWzD0=;
 b=IllGO4IciWOS3ItCSmwd3JKfpSNQ4Z4IyDi0hQooxh50MJR/anqqO8oG
 GaDpGzl6USW9ElbWCipP/s7dVejJuvhCNGF9yKmB0vi7jWGExnHSP8jRe
 TmcmpKBQUS/L5OXCz7F2eKr31KqTwmLC5v8UfTImOPVPnszAtuCzXJEUX
 2TieMrlP5cUajdX2TwaV7JQW5sK7h3W/UEFR5asqo5jtHhXi1ZahWteiF
 RnrIbY9e1sxD7ZldOGLvO8RwZAN4YWD9KmD6DFFBieSIPRZZFQq+WBm56
 23ExZyQ32zj/dQ8eddLcaTuvMyyUfkjveJnnky7hruWOJUDeIZMlakOBz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292764743"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292764743"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584222210"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 07:14:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] hda: Minor cleanups
Date: Thu, 18 Aug 2022 16:15:13 +0200
Message-Id: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

v2:
 * Fix includes

Amadeusz Sławiński (4):
  ALSA: hda: Move stream-register polling macros
  ALSA: hda: Rework snd_hdac_stream_reset() to use macros
  ALSA: hda: Remove unused MAX_PIN_CONFIGS constant
  ALSA: hda: Remove unused defines

 include/sound/hdaudio.h     |  7 +++++++
 include/sound/hdaudio_ext.h |  6 ------
 sound/hda/hdac_stream.c     | 26 ++++++--------------------
 sound/pci/hda/hda_intel.c   |  7 -------
 sound/pci/hda/hda_sysfs.c   |  2 --
 5 files changed, 13 insertions(+), 35 deletions(-)

-- 
2.25.1

