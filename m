Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9094CA047
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89FCF1FB3;
	Wed,  2 Mar 2022 10:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89FCF1FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211982;
	bh=ouIXwC9qujK9ZsYVE0EshP7YqCXxr7q8AgeXvijkEdk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rj1gT3waoUy6ceQTfEpk9EmgdSuZhjhl8DLm7bt3J1TzNgU5n5a9toKxSeV7EObil
	 4hRburykXlueV//oqSwqoCM68/o9iTMxuqG8/E5V1z5hLB/Sh66i0I218OnmrJ+Kq0
	 f9dDjWt3fFhLRC+re59aNe6YZLfJUcIkpC58XxtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F39DDF80519;
	Wed,  2 Mar 2022 09:35:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F87F804AC; Wed,  2 Mar 2022 09:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B33F80C51
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 09:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B33F80C51
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPKRL-0005uR-9I; Wed, 02 Mar 2022 09:34:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPKRK-00FxnP-Bd; Wed, 02 Mar 2022 09:34:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: fsl_sai: Cleanups and 1:1 bclk:mclk ratio support
Date: Wed,  2 Mar 2022 09:34:21 +0100
Message-Id: <20220302083428.3804687-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>
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

This series has some updates for the fsl_sai driver: Some general
cleanup patches, a bugfix in the ip revision checking and finally
the mclk setting is made more accurate and support for 1:1 bclk:mclk
setting is added.

Ahmad Fatoum (2):
  ASoC: fsl_sai: simplify register poking in fsl_sai_set_bclk
  ASoC: fsl_sai: implement 1:1 bclk:mclk ratio support

Sascha Hauer (5):
  ASoC: fsl_sai: Drop unnecessary defines
  ASoC: fsl_sai: simplify irq return value
  ASoC: fsl_sai: store full version instead of major/minor
  ASoC: fsl_sai: Use better variable names
  ASoC: fsl_sai: use DIV_ROUND_CLOSEST() to calculate divider

 sound/soc/fsl/fsl_sai.c | 100 ++++++++++++++++++++--------------------
 sound/soc/fsl/fsl_sai.h |   9 +---
 2 files changed, 52 insertions(+), 57 deletions(-)

-- 
2.30.2

