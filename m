Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFB567CC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F611697;
	Wed, 26 Jun 2019 13:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F611697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561549123;
	bh=LNjuVAxrrWVMuo8D2d8ynMUAWS1RAD5MoIIwPAahyA4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RCH31y9F34RolBweuSxmks4RAmSU+GwYfswkA/6QdbZ16TtgL5J0tQtUc7SAp0THX
	 OByB8xK4cX9iRod5mbjpzkmH+EU+MMFojSL+L/ZxA2U9ul+Fsu2BlB1KUU/wciIPEB
	 7Yae7gGk3t5kaDOGAg73qNWc4VZLbWvEiFu4ACTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D43F8974A;
	Wed, 26 Jun 2019 13:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4BBCF89721; Wed, 26 Jun 2019 13:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B10BF896EA
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B10BF896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FO3VoThz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8dwMSiqjt0dkWgoksIvDOmL2daqTMuMeEI0GqX18IU4=; b=FO3VoThzvERU
 TqrLMx3XwPt681TObrRHfNzImq5TRtvH3CEV0LIFdNaGA6ZmbvJvz5+r776J8iO1RMAjrHsmfvIZZ
 PxVxDwjDIHQ8DCnS5O+Y+ThTeirBE3byMx/TQbfsUz2ZdMWgNoVem+1YREtyG9bX1yy4BI3peaIPb
 4UUG4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AP-0007nI-Ec; Wed, 26 Jun 2019 11:32:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E543D44004B; Wed, 26 Jun 2019 12:32:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Gustaw Lewandowski <gustaw.lewandowski@intel.com>
In-Reply-To: <20190613190436.20156-5-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113244.E543D44004B@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Fix race condition in IPC rx
	list" to the asoc tree
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

   ASoC: Intel: Fix race condition in IPC rx list

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

From 26ae20490809db30677dfd54f81a73ce77ba2df1 Mon Sep 17 00:00:00 2001
From: Gustaw Lewandowski <gustaw.lewandowski@intel.com>
Date: Thu, 13 Jun 2019 21:04:33 +0200
Subject: [PATCH] ASoC: Intel: Fix race condition in IPC rx list

Since there are multiple IPCs being sent in a short span of time, there
is a possibility of more than one message being on the Rx list after
receiving response from firmware. In such cases, when the first
notification of interrupt from firmware is received, driver retrieves
the message from the Rx list but does not delete it from the list till
the next lock. In the meantime, when another interrupt is received from
the firmware, driver is reading the previous message again since the
previous message has not been removed from the list.

Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-sst-ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 5c9206dc7932..5094205a243f 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -344,6 +344,7 @@ static struct ipc_message *skl_ipc_reply_get_msg(struct sst_generic_ipc *ipc,
 
 	msg = list_first_entry(&ipc->rx_list, struct ipc_message, list);
 
+	list_del(&msg->list);
 out:
 	return msg;
 
@@ -488,7 +489,6 @@ void skl_ipc_process_reply(struct sst_generic_ipc *ipc,
 	}
 
 	spin_lock_irqsave(&ipc->dsp->spinlock, flags);
-	list_del(&msg->list);
 	sst_ipc_tx_msg_reply_complete(ipc, msg);
 	spin_unlock_irqrestore(&ipc->dsp->spinlock, flags);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
