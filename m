Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938C2112DE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655101688;
	Wed,  1 Jul 2020 20:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655101688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593628753;
	bh=a7YBJbTBh4fjaZz8gJIPRtT2ynmx3nTsBE10r0KkaLk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bH44FjaDQ0aFmZVaJk7BF5mqqn/f6mdXfw7VOvARF9Y/5nAuVfCFMnMaU4piFBuPL
	 QEhuObFhPFsjam7hUKZ5nbo50t6ASL2bWQMVVsLTya1gicJIM6B5WHEi1K0VG5N4/H
	 GEVqgQbJMfeiZe4T5F7by20pnBcZQlecqQHcWhbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 995AEF800C1;
	Wed,  1 Jul 2020 20:37:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 438B2F800C1; Wed,  1 Jul 2020 20:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06C1CF800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06C1CF800C1
IronPort-SDR: daULBS/VHSmwpsqRgBYlE4wT8sq/5at8LIEdMU/yADWTWNqLpPq1enyfHa17hMgOrliHi7ONb0
 NQGmACOyYfUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208193417"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="208193417"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:37:23 -0700
IronPort-SDR: vKGtuy+ruin4Ju+B/H1FagC2qRlnjanA5215uxbqiLtT8H/shR3TRqh9+Qzava4J+7MCFauGxk
 EfatgJRdcHQw==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481692828"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:37:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: Intel: atom: fix kernel-doc and W=1 warnings
Date: Wed,  1 Jul 2020 13:37:14 -0500
Message-Id: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

Yet another series to fix broken kernel-doc and mark unused variables
as such.

Pierre-Louis Bossart (2):
  ASoC: Intel: atom: fix kernel-doc
  ASoC: Intel: atom: fix 'defined but not used' warning

 sound/soc/intel/atom/sst-atom-controls.c | 65 ++++++++++++++++--------
 sound/soc/intel/atom/sst/sst_loader.c    |  4 ++
 sound/soc/intel/atom/sst/sst_stream.c    | 43 +++++++++-------
 3 files changed, 74 insertions(+), 38 deletions(-)


base-commit: a2b782d59c57cb6f673dbb4804ffc500336d7a54
-- 
2.25.1

