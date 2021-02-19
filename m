Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7732018D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:11:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F24D820;
	Sat, 20 Feb 2021 00:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F24D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776272;
	bh=Y5pUqL1KJzs01MQUF/9qMJppCkjP1xKx7ExrRzdsR/8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vU/l1D6Ke5be12m7Zrdgae8fj0QcdP8Ecwmkmy6bvUtyAaee+6kp+AUUkrYuLxrRz
	 r4vd4bcT21cmCsDpxyqE4VFQtfJx6lg05xKNIbJfpv2aR1ka6d+SUJZrYCNyVRpAQa
	 aYvDHSreVn7NUT8M8OTTfvqoCx5RtlE1MHXSmb/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2F0F80277;
	Sat, 20 Feb 2021 00:09:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51CC8F800C7; Sat, 20 Feb 2021 00:09:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 369BEF800C7
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 369BEF800C7
IronPort-SDR: q/fw5tncXz8KeGKKSeVT+ppjvVjBHvY3mNISzGntjJ2IZtkHJdIojENvdZ8xxj/jd1XW8nzGlw
 XhFiNtuS0rGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="163139050"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="163139050"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:28 -0800
IronPort-SDR: GC61K1VU1Z8RVoUrPVdV/FVGyJ1nnZ5ejNYVVTZuDUbSowzw21tmQp8fFTgR0WvvWCPo3dsl+/
 DmsISDG+pkGQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="365362844"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:27 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ASoC: samsung: remove cppcheck warnings
Date: Fri, 19 Feb 2021 17:09:12 -0600
Message-Id: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

No functional changes except for patch 2 and 3 where missing error
checks were added for consistency.

Pierre-Louis Bossart (6):
  ASoC: samsung: i2s: remove unassigned variable
  ASoC: samsung: s3c24xx_simtec: add missing error check
  ASoC: samsung: smdk_wm8994: add missing return
  ASoC: samsung: snow: remove useless test
  ASoC: samsung: tm2_wm5110: check of_parse return value
  ASoC: samsung: tm2_wm5510: remove shadowing variable

 sound/soc/samsung/i2s.c            | 3 +--
 sound/soc/samsung/s3c24xx_simtec.c | 5 +++++
 sound/soc/samsung/smdk_wm8994.c    | 1 +
 sound/soc/samsung/snow.c           | 5 +----
 sound/soc/samsung/tm2_wm5110.c     | 3 +--
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.25.1

