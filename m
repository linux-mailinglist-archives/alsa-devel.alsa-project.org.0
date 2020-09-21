Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC42726D6
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505E216B9;
	Mon, 21 Sep 2020 16:21:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505E216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600698121;
	bh=ZoM/HSnu6pXz3Iqdu8IApUkUpqel3hDVIyDnKxcLdf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uyuTUWkFlQerCBhsc5heOqc6XBQYeU4k/aiDSZS+JzhcbO+mUxSS0aqC865yMQ5YX
	 /CKYuyZdvkA1eeIj/r5UTdUmPA/foy2HBqPWYuSLLepbVbOAqhwAixU+QDzKULag/z
	 uaAX563OO7wX9EUMHpfHrmercS1LYZKN8udwOXTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4A9F80162;
	Mon, 21 Sep 2020 16:19:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E131CF8020B; Mon, 21 Sep 2020 16:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35C3CF80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C3CF80161
IronPort-SDR: 3B/+la8jnOfnD/t9C/bI4Q97dDkGIwKhyPSpvvbyP0sHiU6XNaGrBegjLGXbvz8I2OX+XnXibI
 5hM+jpmqJ3Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="140394068"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="140394068"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:19:16 -0700
IronPort-SDR: KJzBLTEdnMp9+pw3rPE6GXYBjm9T9oUc+l6+tLbzoWMz4R3eEg3qXvJ67zGWnBEums1V/wK6M5
 J8WAjH/35t5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485495407"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 21 Sep 2020 07:19:15 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 0/4] ALSA: hda - add Intel DG1 support
Date: Mon, 21 Sep 2020 17:17:37 +0300
Message-Id: <20200921141741.2983072-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Series adding support for HDMI/DP audio for Intel DG1.

Kai Vehmanen (4):
  ALSA: hda - add Intel DG1 PCI and HDMI ids
  ALSA: hda - controller is in GPU on the DG1
  ALSA: hda - handle multiple i915 device instances
  ALSA: hda - fix CONTROLLER_IN_GPU macro name

 sound/hda/hdac_i915.c      | 48 ++++++++++++++++++++++++++++++++++----
 sound/pci/hda/hda_intel.c  |  6 ++++-
 sound/pci/hda/patch_hdmi.c |  1 +
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.27.0

