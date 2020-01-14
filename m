Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1286D13B933
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 06:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA77B17A9;
	Wed, 15 Jan 2020 06:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA77B17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579067401;
	bh=rjWeY7zREQzOJkkYpus3I27tNKIcE7sPsphiHxbc3bk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c9NRkKqtk55s746vMuNexwqrKU8JvA4+lrgEKA06rUcKoIsnZ7hyeZ8JhSzAr45Sa
	 y2Icm4MqzJXaiKHNYjqCcEGD/gqKZCYNcnb4RfGCoM8YGJy4FS3ZE13sQsjGboHjEc
	 o1ZSijQBtyTNo5WDwCMjkEP0x4Y9yDwy/pBB57w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E075F801F8;
	Wed, 15 Jan 2020 06:48:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D3CEF801F8; Wed, 15 Jan 2020 06:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28A4F800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 06:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28A4F800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 21:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="225452741"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2020 21:48:05 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Wed, 15 Jan 2020 01:51:48 +0800
Message-Id: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v2 0/4] ASoC: Add Multi CPU DAI support
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

As discussed in [1], ASoC core supports multi codec DAIs
on a DAI link. However it does not do so for CPU DAIs.

So, add support for multi CPU DAIs on a DAI Link by adding
multi CPU DAI in Card instantiation, suspend and resume
functions, PCM ops, stream handling functions and DAPM.

[1]: https://www.spinics.net/lists/alsa-devel/msg71369.html

changes in v2:
 - rebase on asoc-next
 - fix some typo
 - compare and merge Kuninori Morimoto's version
 - add warning if the function is not support multi cpu yet

Bard liao (1):
  ASoC: add warning if the function is not support multi cpu yet.

Shreyas NC (3):
  ASoC: Add initial support for multiple CPU DAIs
  ASoC: Add multiple CPU DAI support for PCM ops
  ASoC: Add multiple CPU DAI support in DAPM

 include/sound/soc.h                   |  15 +
 sound/soc/soc-compress.c              |   7 +-
 sound/soc/soc-core.c                  | 222 ++++++-----
 sound/soc/soc-dapm.c                  | 131 +++---
 sound/soc/soc-generic-dmaengine-pcm.c |  12 +
 sound/soc/soc-pcm.c                   | 547 +++++++++++++++++---------
 6 files changed, 599 insertions(+), 335 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
