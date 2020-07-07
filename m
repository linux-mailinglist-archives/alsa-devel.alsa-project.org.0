Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE92177C8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F3261678;
	Tue,  7 Jul 2020 21:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F3261678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149504;
	bh=vWT8CZ6FDae4taf6o7JVBanGMrzuGIpk+EnurcykN1w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JZtI87E9AFi5U7NWur7gg2SRKFlq00qL2JsZN6ESxT4xzfDySvbhBYJgylLhqkghn
	 4OtMDtiicF9QBHPuzr9DcDNOsmpW7n+IVvHNTNywhG/Nsn4hmOcIfN5qc6sBJ9KqdK
	 4oOVkbnEmwCpE5O0kBoOoJD5a23kIeGr5Y0IxKXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C12EBF802A0;
	Tue,  7 Jul 2020 21:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF0E1F8027C; Tue,  7 Jul 2020 21:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MIME_8BIT_HEADER, SPF_HELO_NONE,
 SPF_NONE,SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DECC5F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DECC5F800D0
IronPort-SDR: 8XZQUI5LCyaNZL/HgWZ2Og1LRvxHZueQINSJKG3oI+A58KCBl5syEn3ETNDurQKJZwJAbZLQaQ
 9L0cd1h1X/Sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147690645"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="147690645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:16:27 -0700
IronPort-SDR: iohdinfKc84pW0NCxUKWbIF1CcLCVCrUVMedZ3gCopEqgT4yqAb7MUXCuc77aZqxP2UCpmJtmw
 2SE4ZWFnwnew==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="388601589"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:16:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 00/10] ASoC: Clean-up W=1 build warnings​ - part2
Date: Tue,  7 Jul 2020 14:16:05 -0500
Message-Id: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
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

Both Lee Jones and I submitted separate series, this is the second
part of the merged result, for which no feedback was provided.

I picked Lee's patches for rt5659 and ak4458 and added the pxa and
ux500 that I didn't fix. The rest is largely identical between our
respective series, with the exception of the sunxi which I documented
and Lee removed. I don't have any specific preference and will go with
the flow on this.

Lee Jones (4):
  ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
  ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
    'reg_val_TSTDR'
  ASoC: codecs: rt5659: Remove many unused const variables
  ASoC: codecs: ak4458: Remove set but never checked variable 'ret'

Pierre-Louis Bossart (6):
  ASoC: qcom: q6asm: fix kernel-doc
  ASoC: sunxi: sun4i-i2s: fix kernel-doc
  ASoC: sunxi: sun4i-spdif: fix kernel-doc
  ASoC: sti: uniperif: fix 'defined by not used' warning
  ASoC: codecs: rt5631: fix kernel-doc
  ASoC: codecs: tlv320aic26: fix kernel-doc warning

 sound/soc/codecs/ak4458.c       |  6 +++---
 sound/soc/codecs/rt5631.c       |  8 +++++--
 sound/soc/codecs/rt5659.c       | 37 ---------------------------------
 sound/soc/codecs/tlv320aic26.c  |  2 +-
 sound/soc/pxa/pxa-ssp.c         |  2 +-
 sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
 sound/soc/sti/uniperif.h        |  2 +-
 sound/soc/sunxi/sun4i-i2s.c     | 10 ++++++++-
 sound/soc/sunxi/sun4i-spdif.c   |  2 +-
 sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
 10 files changed, 27 insertions(+), 52 deletions(-)

-- 
2.25.1

