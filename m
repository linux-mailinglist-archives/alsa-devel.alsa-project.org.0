Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36387C3F86
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D96168B;
	Tue,  1 Oct 2019 20:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D96168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953518;
	bh=PBUFr0pUlHcmsuiH0F3yovnwONK6f+0ZSivjTM6HtFw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FbZIsrpquDd45JAMVtmLUk7gEtTUFoI/OHGzSzHncN3IXs6UZxo5h3uGvaWLvtGhn
	 EVpxnz1Yu7DDp6BN5ElWswW4Gz4HyAqn/Vw/vTX/Lo2R9qUlov9Sxh7Yda05cv5egb
	 XmiylY8DJAc2ure0Ecm4WV9ssd0CQQ84VXKHox0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D93FF8079B;
	Tue,  1 Oct 2019 19:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D866EF806E7; Tue,  1 Oct 2019 19:57:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F39BBF8063E
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F39BBF8063E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s3G5O+s3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=kW0HfJRjIjOpV1hYgVzqvKzVATe2iroCIQ9H8SwcoyQ=; b=s3G5O+s3noJ5
 9WR7lc6R3o37ioBrb5qAb3M5ovMaqgl/WL7Z8DakcF/Azv9Dfi6JS8w2+8MB+ZMBS3zo/du+lejUa
 OjbKVGw/STs167ehcvRwqJLCcSsPI+mn1Dozn6Zu+/zFo4IZ9GMvwgRJKjEmJuSI06WFDm/4R8X8c
 9m2lw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOH-0005tf-Sb; Tue, 01 Oct 2019 17:56:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 501F327429C0; Tue,  1 Oct 2019 18:56:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190927200538.660-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175649.501F327429C0@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:49 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: fix parse fail issue for
	byte/bool tuple types" to the asoc tree
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

   ASoC: SOF: topology: fix parse fail issue for byte/bool tuple types

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 2e305a074061121220a2828f97a57d315cf8efba Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:27 -0500
Subject: [PATCH] ASoC: SOF: topology: fix parse fail issue for byte/bool tuple
 types

We are using sof_parse_word_tokens() to parse tokens with
bool/byte/short/word tuple types, here add the missing check, to fix the
parsing failure at byte/bool tuple types.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fc85efbad378..0aabb3190ddc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -920,7 +920,9 @@ static void sof_parse_word_tokens(struct snd_soc_component *scomp,
 		for (j = 0; j < count; j++) {
 			/* match token type */
 			if (!(tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_WORD ||
-			      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT))
+			      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT ||
+			      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_BYTE ||
+			      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_BOOL))
 				continue;
 
 			/* match token id */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
