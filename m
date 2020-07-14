Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587721EC57
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 11:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D984F1672;
	Tue, 14 Jul 2020 11:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D984F1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594717866;
	bh=VciWBLo1eyz7eq0VZp1w/n6uIMMEZbpDxnNBZoZhbxE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b2k1DkzUG8oQIVgnKkXzzKgI94ruB0BeoIVrmnYPROj1PgGtka+ZcnmP//3V61DvF
	 0A5bOD9t+p4nac5Wn4YaOEn9MUb6xMqW2kIT+nblnLUchw/MvIPFiKINvHYyK2QVRH
	 RcW/Ace4kIsy5CnG9ddWxeEX1Xz160+mKi3JMbDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18221F8020C;
	Tue, 14 Jul 2020 11:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7CECF8027B; Tue, 14 Jul 2020 11:09:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6728F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 11:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6728F8014E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8623D200F2E;
 Tue, 14 Jul 2020 11:09:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 38E5F200F35;
 Tue, 14 Jul 2020 11:09:08 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 220AA402B4;
 Tue, 14 Jul 2020 17:09:00 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 kuninori.morimoto.gx@renesas.com, katsuhiro@katsuster.net,
 samuel@sholland.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com
Subject: [PATCH 0/3] ASoC: fsl-asoc-card: Support hp and mic detection
Date: Tue, 14 Jul 2020 17:05:33 +0800
Message-Id: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Support hp and mic detection.
Add a parameter for asoc_simple_init_jack.

Shengjiu Wang (3):
  ASoC: simple-card-utils: Support configure pin_name for
    asoc_simple_init_jack
  ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
  ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection

 .../bindings/sound/fsl-asoc-card.txt          |  3 +
 include/sound/simple_card_utils.h             |  6 +-
 sound/soc/fsl/Kconfig                         |  1 +
 sound/soc/fsl/fsl-asoc-card.c                 | 69 ++++++++++++++++++-
 sound/soc/generic/simple-card-utils.c         |  7 +-
 5 files changed, 78 insertions(+), 8 deletions(-)

-- 
2.27.0

