Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D454D4EECC5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 14:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7888C1A96;
	Fri,  1 Apr 2022 14:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7888C1A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648814611;
	bh=xC2bSe82xYgP6abQYkmv+fmYKvztykr5uHYJHO5N3l4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FIQeD7w/zs3eW0ROoJD6YIR/repSmuj03m034nTCLrs3BrgS6hJrs5IIKyzheGl9c
	 pPcBcsre0KBwZvfj344+Hvsg1NdtgwhM/EHNA7+R0k0kNFugOHlFQlQce/fSL5+me9
	 vTZ3xsloVaWuZiRo3AeeEUop4AIzQ6Usevc5dLnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE62F80516;
	Fri,  1 Apr 2022 14:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04D7F804B2; Fri,  1 Apr 2022 14:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88754F80279
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 14:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88754F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j9eqjvwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648814535; x=1680350535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xC2bSe82xYgP6abQYkmv+fmYKvztykr5uHYJHO5N3l4=;
 b=j9eqjvwjY0n7fO/HXxCtANP2ArZbgLApJrSHA+1USeCWpTxmAyxPkxgy
 Cv/uv5R/vb/S7HG1QzmdA6FvQ8ZxqpG/lbV+CP6dgLqgEAhB9ZQeO1PZS
 gAI9KXv/NjPyJnSFae1F6XlT3+v+PWYijFYPJe5XkZJuZkjiU0M2JrS6m
 KjSxbrGVVZ0P/8ym0VwLLE4RA02NqFl+vOi6fSPy1jLj163S3gSeOlfGR
 NpGQ8FPKEwOew1IJF08QUGX6PlrfVmAwxPADl8XFODsH113sIgpxuRqu1
 oZeDZq61EO9rDLOfpGyLmSNhfpvLj9zZM3ssdRURvpbC1qdVKSj7p2MR1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="258945831"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="258945831"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567431951"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 05:02:04 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/6] ASoC: topology: Cleanup patches
Date: Fri,  1 Apr 2022 14:01:54 +0200
Message-Id: <20220401120200.4047867-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Following patches contain minor changes, cleaning up code to be easier
to read.
Clean up few loops, to be simpler or altogether remove them.
Rename some things to make code easier to understand.

Amadeusz Sławiński (6):
  ASoC: topology: Use for loop instead of while
  ASoC: topology: Remove unnecessary looping
  ASoC: topology: Return bool instead of int
  ASoC: topology: Rename SOC_TPLG_PASS_MIXER to _CONTROL
  ASoC: topology: Correct error message
  ASoC: topology: Rename soc_tplg_init_kcontrol() function

 sound/soc/soc-topology.c | 455 ++++++++++++++++++---------------------
 1 file changed, 208 insertions(+), 247 deletions(-)

-- 
2.25.1

