Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E49350AE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 22:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BF791697;
	Tue,  4 Jun 2019 22:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BF791697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559679061;
	bh=1q26Bm9YFhWBqcB4UXH0brf3v8cF+wPiC8ZlpRdJvHs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fZNuB2VHxfJYuZ4km+rTGElIF4i2W0mfiQvGaaOmXGySO+cTWZrgmD0HNctpiGbg0
	 69Ad4YsCpN024HxbuArKr5egJ0QJIJMqLOwTNeS6gqNIDsVT1Ul3wj32FucJtxwe74
	 v2m9TAJNf7mKhfT1t8hsHil6krsfkTBdSIFjJCM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BFCF896CE;
	Tue,  4 Jun 2019 22:09:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A8D3F89673; Tue,  4 Jun 2019 22:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 991F1F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 22:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991F1F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 13:09:05 -0700
X-ExtLoop1: 1
Received: from ifreitas-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.150.186])
 by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2019 13:09:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  4 Jun 2019 15:08:54 -0500
Message-Id: <20190604200858.4867-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: Intel: fix kernel oops in machine
	drivers
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

The changes made for v5.1 to override the default platform_name
assumed the card device was properly initialized so that devm_strdup()
could be used. This is true for the majority of the machine drivers,
but unfortunately this isn't valid for four of the Cherrytrail-based
ones which don't follow the same programming flow and initialize the
card device last. After hitting a kernel oops on cht-bsw-max98090
(Cyan Chromebook) I found 3 other cases where the same fix is
required.

These fixes should be applied for 5.1 and 5.2. While it's not an
excuse for this miss, the impact is limited in that the kernel oops
will only happen when SOF is used.

Pierre-Louis Bossart (4):
  ASoC: Intel: cht_bsw_max98090: fix kernel oops with platform_name
    override
  ASoC: Intel: bytcht_es8316: fix kernel oops with platform_name
    override
  ASoC: Intel: cht_bsw_nau8824: fix kernel oops with platform_name
    override
  ASoC: Intel: cht_bsw_rt5672: fix kernel oops with platform_name
    override

 sound/soc/intel/boards/bytcht_es8316.c       | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 2 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
