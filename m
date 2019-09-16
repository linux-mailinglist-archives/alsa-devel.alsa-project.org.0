Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57758B40D8
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 21:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65B0166F;
	Mon, 16 Sep 2019 21:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65B0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568661112;
	bh=9GyQG4pGNJbWnIU9HyNuw2Ll/TAYVQVskkMuxoPE3Ts=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XwZZTnP4qNvQzCNeAT+QRAlBQj+CKippLf3YBblU3MA8AHY8OkFYP6hgAjKyuDny1
	 8AemdpdFhg8/3X9qa3BJKv4Dxa5+X4vvX7yeGafaN8FdCsEfataEP1eESvqDi/7heB
	 15EaluHA1x4QO0XxOOU245y6g/FuncMA4UpGPvWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD94FF80137;
	Mon, 16 Sep 2019 21:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F4BDF804FF; Mon, 16 Sep 2019 21:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41BA0F80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 21:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41BA0F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 12:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="191161687"
Received: from jvhicko1-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.104.227])
 by orsmga006.jf.intel.com with ESMTP; 16 Sep 2019 12:09:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 14:09:46 -0500
Message-Id: <20190916190952.32388-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/5] soundwire: intel/cadence: better
	initialization
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

V2 of the original series 'soundwire: inits and PM additions for 5.4',
with PM additions removed since more tests on hardware are required.

Changes since v1: addressed feedback from Vinod Koul
clarified init changes impact Intel and Cadence sides
remove unnecessary intermediate variable
disable interrupts when exit_reset fails, updated error handling
returned -EINVAL on debugfs invalid parameter

Pierre-Louis Bossart (5):
  soundwire: intel/cadence: fix startup sequence
  soundwire: cadence_master: add hw_reset capability in debugfs
  soundwire: intel: add helper for initialization
  soundwire: intel/cadence: add flag for interrupt enable
  soundwire: cadence_master: make clock stop exit configurable on init

 drivers/soundwire/cadence_master.c | 131 +++++++++++++++++++++--------
 drivers/soundwire/cadence_master.h |   5 +-
 drivers/soundwire/intel.c          |  38 ++++++---
 3 files changed, 126 insertions(+), 48 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
