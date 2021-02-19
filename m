Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A03201C8
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF19165E;
	Sat, 20 Feb 2021 00:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF19165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777528;
	bh=I1Kj1Sx8wGaVB5ZzKQEVYLtvlOn0Bc3enlDcupSw27A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IQOVqDRFKR/hi31Ouzg4fZ+LuKTDOEEL+3f6pYwo4fLv9Tib7RqMp60vHgajw0BYj
	 97fDiC330x8hsgD97ILa1VbYeeUlpEl/6Z5sSUNAjPqi8zQ98KJD4CjaUwibHdYttD
	 Bt7M57REaaTAGsAEu8qZ9DVSX3sxvl8olsOXB+zQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 631F7F8026C;
	Sat, 20 Feb 2021 00:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6754DF8025B; Sat, 20 Feb 2021 00:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BD9AF8013F
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BD9AF8013F
IronPort-SDR: vwM9hrYyjpK9AqvbX7tM8yzqiRvVeVLpxV3g5JSxfoajpiSQaEJbUFgUDH+Ckrs4XJtantIPIh
 u5RQ6k0ch9Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293671"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:28 -0800
IronPort-SDR: TrHNNv7iDNk62UGLpf2z4P8cz0reDsrFq64yr1q4UKtVPP238GZCi00TNPDTX8WCnLtWTHDmTJ
 m0uF6Jh1hwNw==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662564"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:27 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/9] ASoC: fsl: remove cppcheck warnings
Date: Fri, 19 Feb 2021 17:29:28 -0600
Message-Id: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
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

Nothing critical and no functional changes.

The only change that needs attention if the 'fsl_ssi: remove
unnecessary tests' patch, where variables are to zero, then tested to
set register fields. Either the tests are indeed redundant or the
entire programming sequence is incorrect.

Pierre-Louis Bossart (9):
  ASoC: fsl: fsl_asrc: remove useless assignment
  ASoC: fsl: fsl_dma: remove unused variable
  ASoC: fsl: fsl_easrc: remove useless assignments
  ASoC: fsl: fsl_esai: clarify expression
  ASoC: fsl: fsl_ssi: remove unnecessary tests
  ASoC: fsl: imx-hdmi: remove unused structure members
  ASoC: fsl: mpc5200: signed parameter in snprintf format
  ASoC: fsl: mpc8610: remove useless assignment
  ASoC: fsl: p1022_ds: remove useless assignment

 sound/soc/fsl/fsl_asrc.c     | 2 +-
 sound/soc/fsl/fsl_dma.c      | 3 ---
 sound/soc/fsl/fsl_easrc.c    | 6 +++---
 sound/soc/fsl/fsl_esai.c     | 2 +-
 sound/soc/fsl/fsl_ssi.c      | 5 ++---
 sound/soc/fsl/imx-hdmi.c     | 4 ----
 sound/soc/fsl/mpc5200_dma.c  | 2 +-
 sound/soc/fsl/mpc8610_hpcd.c | 2 +-
 sound/soc/fsl/p1022_ds.c     | 2 +-
 9 files changed, 10 insertions(+), 18 deletions(-)

-- 
2.25.1

