Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DF44BEB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A577A1877;
	Thu, 13 Jun 2019 21:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A577A1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453304;
	bh=5CZzIf3xhntU1H2zGJ3714DolFJBL3/ES15nTbupqWc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RFTIQRPL3f855RH8dGVvsVUhfjKAlErXbTio9aPHbXs5S1REQyqnKXt4snAekGYgI
	 7vUw6kBoQ0cUSx6hgLjBP0xgQB8+eSxooNlPK81kOuueu29Em5l69XEVrHXT+2ioT2
	 7fOC6Y6j03WSva5LexDXlERPSwocKd8DcV8T5Zig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 815C5F8976C;
	Thu, 13 Jun 2019 21:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D46F89770; Thu, 13 Jun 2019 21:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E614F89764
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E614F89764
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dIcQdFZb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TTU5En8IDcqHqE9/9VibO5dyrOata13fG/L1w7HNcoI=; b=dIcQdFZbHJTb
 QSGJ0J5Ba4lA5E7cRuEvN6xuBvCgQ8YewhGoPIy/VmpcSzSaqRdwVkQ4AeQT4I86LW/4FBiHHV7M9
 wOjNYLYFdJWkyXpfw007aeh4H3bYjMbUpG0mgtwB0ecJDkxbl0YSVCwUC61IOAbNA4alSoBO5HE0J
 7YUUc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV30-0005Rn-A7; Thu, 13 Jun 2019 19:06:06 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C9C2F440046; Thu, 13 Jun 2019 20:06:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20190612165705.1858-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190605.C9C2F440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:04 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: ipc: clarify operator precedence"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: ipc: clarify operator precedence

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 847a040dd2ebb39effcc6bd3a5157fbded65bce7 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 12 Jun 2019 11:57:05 -0500
Subject: [PATCH] ASoC: SOF: ipc: clarify operator precedence

Cppcheck complains about the following warning, fix by adding
parentheses

[sound/soc/sof/ipc.c:783]:
(style) Clarify calculation precedence for '&' and '?'.
[sound/soc/sof/ipc.c:785]:
(style) Clarify calculation precedence for '&' and '?'.
[sound/soc/sof/ipc.c:787]:
(style) Clarify calculation precedence for '&' and '?'.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index f3eb46bc808b..20dfca9c93b7 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -780,11 +780,11 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 			 " lock debug: %s\n"
 			 " lock vdebug: %s\n",
 			 v->build, v->date, v->time,
-			 ready->flags & SOF_IPC_INFO_GDB ?
+			 (ready->flags & SOF_IPC_INFO_GDB) ?
 				"enabled" : "disabled",
-			 ready->flags & SOF_IPC_INFO_LOCKS ?
+			 (ready->flags & SOF_IPC_INFO_LOCKS) ?
 				"enabled" : "disabled",
-			 ready->flags & SOF_IPC_INFO_LOCKSV ?
+			 (ready->flags & SOF_IPC_INFO_LOCKSV) ?
 				"enabled" : "disabled");
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
