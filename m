Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3053CB54
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 16:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6171866;
	Fri,  3 Jun 2022 16:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6171866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654265246;
	bh=uaMKsSGnQ5m29f+nHU1wbs2aClAgm8Ruk9w3WT7aCEQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aaTqIIFUeoQQG7nJN5G5f1mcLe0R6EAVvFI96JM9ocW2OvAm7Vaz/HDyZJGgHmFce
	 vyW7L2vBmBZqyDX/cGO72KGkLxsnkYgFEVG7mF3InAzc54Wh+iHUahdnvnyVUmHokf
	 847TdCf+KROCjFMNdF6VCJ40x9uJFD/lhYak/eU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E806FF8052F;
	Fri,  3 Jun 2022 16:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0108BF804C1; Fri,  3 Jun 2022 16:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 875EBF804C1
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 16:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875EBF804C1
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-0006WW-Bd; Fri, 03 Jun 2022 16:05:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vV-006EWG-7Z; Fri, 03 Jun 2022 16:05:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nx7vT-00DxJR-0z; Fri, 03 Jun 2022 16:05:19 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>
Subject: [PATCH 0/4] ASoC: Drop some i2c noop remove callbacks
Date: Fri,  3 Jun 2022 16:05:09 +0200
Message-Id: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ove8J8AKIzo6pki5UuP0GcEWylMelXGusVq9TmPOndE=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimhUGV13LiDUgMplZLOtmJQVsITeINuZRSme9P99e
 IL9asHiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpoVBgAKCRDB/BR4rcrsCSe6B/
 44C94iJLJfzh54fqUXXCyRh+UAkYopAWocoWkoZ5J9VbXKCuMyLRlTMKj+SID1U67OlMyVLo4EVl13
 pmjEAcQWpYdhPE47WFMajRHOv5c/tr1JhM8heuGB+PUJ1vg+fQq2M1yX/LPNeONqxBIuImAIRyfNSg
 7DAPyx6xNdCW50JR7SHQSdyhxkYZHiR6pNVm2pkLIlIre9KIXo/NjbDf2saFGCEUrJiyjc6OreuGzn
 d7UBX7aO9dRmzSuPxX0I9LpZiay4/bzodfm6+emtXzz5M1JyLNy3wFccAJ9Yv8a+0BTtqNwPwls10v
 CO4aV7IFt6QhjlVfsmhgDstt1k1htJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
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

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

I intended to send this after -rc1 was cut, but found a few spare
minutes to prepare this series. All four patches were sent already
before based on v5.18, but there were some conflicting changes added in
the merge window. This series contains the four patches on top of
current linus/master and so bases on a tree including the conflicting
changes. Expecting no more sound changes in this merge window, this
should apply cleanly on top of -rc1.

Best regards
Uwe

Uwe Kleine-König (4):
  ASoC: ak4642: Drop no-op remove function
  ASoC: da7219: Drop no-op remove function
  ASoC: lm49453: Drop no-op remove function
  ASoC: da732x: Drop no-op remove function

 sound/soc/codecs/ak4613.c  | 6 ------
 sound/soc/codecs/da7219.c  | 6 ------
 sound/soc/codecs/da732x.c  | 6 ------
 sound/soc/codecs/lm49453.c | 6 ------
 4 files changed, 24 deletions(-)

base-commit: 50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
-- 
2.36.1

