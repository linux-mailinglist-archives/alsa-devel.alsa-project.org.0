Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3855D090
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 15:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC1691693;
	Tue,  2 Jul 2019 15:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC1691693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562073915;
	bh=iND3sPbo2JYn6B/BBIS5oYkQVcci0s0RvHlvBMqvAfo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YMtqx9pmJYYXMPt51EhMAe5qbG3bO4oA7WojSUW9+BvWouDyEzN9juhXWoJJoX61q
	 DtWW+iIfUx/KbUYB9USePve0LoHRnFJYHzWVLg7hDQ5o07VWUSzQFbNIyC0/tbsCI4
	 peYaHb0RR4kiVXW3XCRUkDmHtNghyqOWXTrdFQYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CA5F800C5;
	Tue,  2 Jul 2019 15:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3837CF800C9; Tue,  2 Jul 2019 15:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9459EF800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 15:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9459EF800C5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 06:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="171794323"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2019 06:23:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org
Date: Tue,  2 Jul 2019 16:24:25 +0300
Message-Id: <20190702132428.13129-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2 resend 0/3] ASoC: SOF: fix suspend ordering
	with runtime idle
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,
this series addresses issues with ordering of HDA codec and controller
suspends in the runtime PM flows. The implemented logic for SOF is
similar to what has been used by the Intel AZX HDA driver.

To implement this, first a fix is needed to hdac_hdmic ASoC codec
driver. SOF framework also needs to be extended to allow SOF devices
to implement a runtime_idle callback. Third, concrete implementation
is in a separate patch for APL/CNL Intel hardware, for which strict
ordering of codec-controller power down sequence needs to be
maintained.

As this extends the SOF device interface, Pierre asked me to
send to the list for wider review. This series has been prereviewd
at SOF github as:
https://github.com/thesofproject/linux/pull/1003

v2 resend:
  - no changes since v2 -- resending as 2 weeks has passed and
    multiple reviewed-by acks already received
v2:
  - Rebased on broonie/for-next, there was a conflict with patch
    "ASoC: SOF: Intel: hda: release link DMA for paused streams during suspend"
  - Added Reviewed-by tags from v1 round

Kai Vehmanen (3):
  ASoC: hdac_hdmi: report codec link up/down status to bus
  ASoC: SOF: add runtime idle callback
  ASoC: SOF: Intel: implement runtime idle for CNL/APL

 sound/soc/codecs/hdac_hdmi.c  |  2 ++
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dsp.c | 13 +++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/ops.h           |  8 ++++++++
 sound/soc/sof/pm.c            |  8 ++++++++
 sound/soc/sof/sof-acpi-dev.c  |  2 +-
 sound/soc/sof/sof-pci-dev.c   |  2 +-
 sound/soc/sof/sof-priv.h      |  2 ++
 10 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
