Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414913AA73
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:15:50 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBA12366;
	Mon, 13 Jan 2020 22:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBA12366
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5552BF8025A;
	Mon, 13 Jan 2020 22:04:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA59F801F8; Mon, 13 Jan 2020 22:04:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B55F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10B55F80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="213112659"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga007.jf.intel.com with ESMTP; 13 Jan 2020 13:04:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:04:10 -0600
Message-Id: <20200113210428.27457-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/18] ASoC: Intel: remove compilation/static
	analysis warnings
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

More trivial fixes for Intel machine drivers in my quixotic quest for
zero warnings. None of them are critical but they generate noise that
prevents developers from using those tools to detect real issues.

Pierre-Louis Bossart (18):
  ASoC: Intel: bxt_da7219_max98357a: rename shadowed variable
  ASoC: Intel: bxt_rt298: rename shadowed variable
  ASoC: Intel: glk_rt5682_max98357a: rename shadowed variable
  ASoC: Intel: glk_rt5682_max98357a: removed unused variables
  ASoC: Intel: kbl_da7219_max98357a: rename shadowed variable
  ASoC: Intel: kbl_da7219_max98927: test return value on route add
  ASoC: Intel: kbl_da7219_max98927: rename shadowed variable
  ASoC: Intel: kbl_da7219_max98927: remove unnecessary initialization
  ASoC: Intel: kbl_rt5660: rename shadowed variable
  ASoC: Intel: kbl_rt5663_max98927: rename shadowed variable
  ASoC: Intel: kbl_rt5663_rt5514_max98927: rename shadowed variable
  ASOC: Intel: kbl_rt5663_rt5514_max98927: remove useless initialization
  ASoC: Intel: skl_nau88l25_max98357a: rename shadowed variable
  ASoC: Intel: skl_nau88l25_ssm4567: rename shadowed variable
  ASoC: Intel: skl_rt286: rename shadowed variable
  ASoC: Intel: bytcht_es8316: removed unused variable
  ASoC: Intel: bytcr_rt5640: remove unused variable
  ASoC: Intel: bytcr_rt5651: remove unused variable

 sound/soc/intel/boards/bxt_da7219_max98357a.c | 10 +++++-----
 sound/soc/intel/boards/bxt_rt298.c            |  8 ++++----
 sound/soc/intel/boards/bytcht_es8316.c        |  8 --------
 sound/soc/intel/boards/bytcr_rt5640.c         |  8 --------
 sound/soc/intel/boards/bytcr_rt5651.c         |  8 --------
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 18 ++++--------------
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 10 +++++-----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 19 +++++++++++--------
 sound/soc/intel/boards/kbl_rt5660.c           |  4 ++--
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 10 +++++-----
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 10 +++++-----
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 10 +++++-----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 10 +++++-----
 sound/soc/intel/boards/skl_rt286.c            | 10 +++++-----
 14 files changed, 56 insertions(+), 87 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
