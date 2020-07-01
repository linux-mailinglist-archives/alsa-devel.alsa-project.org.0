Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 737BC21129A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8931688;
	Wed,  1 Jul 2020 20:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8931688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627979;
	bh=g40S+PDkgHbmf28XSUxusP5ZPkOswueKEJmmGezVMBo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TrCL0d5FRvltsp+2118wGwJI+iVunoirkEOKLf2JyIkqnFDNkzZyJb/QxfGMzCn/P
	 /eDKJt/oqPnO7c+ZR7pNrmJVyshhQ9meZQt6/VgBr4/16jvThXvfYW1NUiln+SL8p9
	 EXxOcpuMTxXZsIRq4TJdk/n2b5eqCFgfERkgArMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E85F8025F;
	Wed,  1 Jul 2020 20:24:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0C9F8020C; Wed,  1 Jul 2020 20:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54F5DF801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F5DF801D8
IronPort-SDR: vHWwDbud7t9vIr8iyrwE/d2i9tZQ35qJ9cr9kyerQbYZJe75sKiUBraSgZ7SjqQJsDVT6cO6Vi
 fVseTcAvhU6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208189484"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="208189484"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:29 -0700
IronPort-SDR: gMuENYqhdKVip2oR/18O7v2BkYxVfM8b3iZ1zZuHN+2ZHx1IswMVk7t2GmErmj0MZgQVPi4+bD
 xbmrmGbXuKvw==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="425679542"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:24:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/11] ASoC: codecs: fix kernel-doc and W=1 warnings
Date: Wed,  1 Jul 2020 13:24:11 -0500
Message-Id: <20200701182422.81496-1-pierre-louis.bossart@linux.intel.com>
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

Second batch of cleanups to remove all the warnings reported by
buildbots/compile tests.

Pierre-Louis Bossart (11):
  ASoC: codecs: ak4458: fix 'set but not used' warning
  ASoC: codecs: cros_ec_codec: fix 'defined but not used' warning
  ASoC: codecs: da7210: fix kernel-doc
  ASoC: codecs: da7219: fix 'defined but not used' warning
  ASoC: codecs: es8316: fix 'defined but not used' warning
  ASoC: codecs: max98390: fix 'defined but not used' warning
  ASoC: codecs: rt*: fix 'defined but not used' warning
  ASoC: codecs: rt5659: add _maybe_unused as needed
  ASoC: codecs: rt5631: fix kernel-doc
  ASoC: codecs: tlv320aic26: fix kernel-doc warning
  ASoC: codecs: jz4770: add _maybe_unused as needed

 sound/soc/codecs/ak4458.c        |  2 +-
 sound/soc/codecs/cros_ec_codec.c |  2 ++
 sound/soc/codecs/da7210.c        | 12 +++++++-----
 sound/soc/codecs/da7219.c        |  2 ++
 sound/soc/codecs/es8316.c        |  2 ++
 sound/soc/codecs/jz4770.c        |  2 +-
 sound/soc/codecs/max98390.c      |  8 --------
 sound/soc/codecs/rt274.c         |  2 ++
 sound/soc/codecs/rt286.c         |  2 ++
 sound/soc/codecs/rt298.c         |  2 ++
 sound/soc/codecs/rt5631.c        |  8 ++++++--
 sound/soc/codecs/rt5659.c        | 14 +++++++-------
 sound/soc/codecs/rt5660.c        |  2 ++
 sound/soc/codecs/rt5677-spi.c    |  2 ++
 sound/soc/codecs/tlv320aic26.c   |  2 +-
 15 files changed, 39 insertions(+), 25 deletions(-)


base-commit: a2b782d59c57cb6f673dbb4804ffc500336d7a54
-- 
2.25.1

