Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9B68C3C8
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 23:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DCDD1680;
	Tue, 13 Aug 2019 23:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DCDD1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565732080;
	bh=9jw5c/IpnmaGQK5qng9NQsU9TMBGNIekwrRO5ifYLYs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dn77Fv9/jeqyh+blbnpkt7fG+LG2lC2jhrEORYlV8EviRbWrsrKZktA2cVaH6vzGM
	 OG+XN+LzkRPzcz6DT7rR/FdQlu5ngh53C8rS+JU/daYJGcDFD1mtEbMVwdIXxyX0bc
	 TexJr7S20GYGmu9PZcwn8kUu5LlUYrdqRuuXEbp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A17F80274;
	Tue, 13 Aug 2019 23:32:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E3CF8049A; Tue, 13 Aug 2019 23:32:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D4BF8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D4BF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 14:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="177922890"
Received: from ccalgarr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.205.92])
 by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 14:32:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 13 Aug 2019 16:32:20 -0500
Message-Id: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com
Subject: [alsa-devel] [PATCH 0/6] soundwire: inits and PM additions for 5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an update on the RFC, to be applied after the '[PATCH v2 0/3]
soundwire: debugfs support for 5.4' and '[PATCH 00/17] soundwire:
fixes for 5.4' series.

Total that makes 28 patches submitted for review, broken in 3 sets.

Changes since RFC (Feedback from GregKH, Vinod, Cezary, Guennadi):
Squashed init sequence fixes in one patch, which remains
readable. Tested all return values and called update_config() as
needed.
Fixed hw-reset debugfs (removed -unsafe and noisy dev_info traces)
Simplified enable_interrupt() with goto
Fixed style, removed typos and FIXMES in pm_runtime code
Clarified commit messages

Pierre-Louis Bossart (6):
  soundwire: fix startup sequence for Intel/Cadence
  soundwire: cadence_master: add hw_reset capability in debugfs
  soundwire: intel: add helper for initialization
  soundwire: intel: Add basic power management support
  soundwire: cadence_master: make clock stop exit configurable on init
  soundwire: intel: add pm_runtime support

 drivers/soundwire/cadence_master.c | 135 ++++++++++++++------
 drivers/soundwire/cadence_master.h |   5 +-
 drivers/soundwire/intel.c          | 194 +++++++++++++++++++++++++++--
 3 files changed, 289 insertions(+), 45 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
