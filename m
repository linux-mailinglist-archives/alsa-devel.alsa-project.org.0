Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952BA15FC3F
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 02:49:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1BB1665;
	Sat, 15 Feb 2020 02:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1BB1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581731380;
	bh=w/icvHVsNJVa6aHN+UyKtA51l7iAprRgdrmzUpYtMCk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WvBPCpH2xGZrM1Y5PVhC+qwBUT8YtOMOfnn7HYM8LSwgbXC/XSPzHol4n7TWVIba3
	 yo62WtsK7vfWaqb8dw/bBv0oONOnXlYqwReKWhSRtR9yq4KQXTxCBGIV58pIUvG0B5
	 TrHGzfJutatidjfZlLfAktk7x7nP/G7gHoN2dRAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04DB3F800F0;
	Sat, 15 Feb 2020 02:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA392F80138; Sat, 15 Feb 2020 02:47:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DD89F80138
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 02:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DD89F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2020 17:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,442,1574150400"; d="scan'208";a="434975914"
Received: from gosalsar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.136.64])
 by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2020 17:47:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 14 Feb 2020 19:47:35 -0600
Message-Id: <20200215014740.27580-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 0/5] soundwire: intel: add DAI callbacks
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

The existing mainline code is missing most of the DAI callbacks needed
for a functional implementation, and the existing ones need to be
modified to provide the relevant information to ASoC/SOF drivers.

As suggested by Vinod, these patches are shared first - with the risk
that they are separated from the actual DAI enablement, so reviewers
might wonder why they are needed in the first place.

For reference, the complete set of 90+ patches required for SoundWire
on Intel platforms is available here:

https://github.com/thesofproject/linux/pull/1692

Changes since v2:
Add missing kfree for stream name (feedback from Vinod)

changes since v1:
Fix string allocation (only feedback from Vinod)

Pierre-Louis Bossart (2):
  soundwire: intel: rename res field as link_res
  soundwire: intel: free all resources on hw_free()

Rander Wang (3):
  soundwire: intel: add prepare support in sdw dai driver
  soundwire: intel: add trigger support in sdw dai driver
  soundwire: intel: add sdw_stream_setup helper for .startup callback

 drivers/soundwire/intel.c | 198 ++++++++++++++++++++++++++++++++++----
 1 file changed, 178 insertions(+), 20 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
