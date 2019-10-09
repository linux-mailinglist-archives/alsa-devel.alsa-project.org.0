Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6DD1594
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 19:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE10C1691;
	Wed,  9 Oct 2019 19:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE10C1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570641870;
	bh=VxwKXSZoJOE3uK2tAfcrkv8WUUsfpRYFSN+B6rwZUGk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=egNBPRQ1vA26+kjuoj8uSsv1R+/VUoeLvObwzE9jcVMLB9ure/iHGyskTFbqq3R4S
	 cW4FW6U2rBNG/LZs0hlb0AP5ZgTDuNArGYbeUKla18hXbosNeK9i3CtdUKhk7RJmpw
	 w4mgL2X31cs81Iqi0P4E3LpgyXMHXNfWxfphrb5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E02F805FA;
	Wed,  9 Oct 2019 19:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F173F802FB; Wed,  9 Oct 2019 19:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62E6F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 19:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62E6F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="iZcejeOl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TKg7v6WJnfalf3/eDZyUsArggkC5Wu/TWTDuseQcCOg=; b=iZcejeOlvIs8
 AvpDHdDwFddODe7PpldqSNZhqCbEV0+F2Kc1ttGpzZFn63sOlGhxe1d314M8htdGp0KjV3NE+A1Ja
 ato26IZALx88FURRdVOJBj81FuB99Nx/7FFM+GYZkys4V3arLJg6zw3fFqgbdODaTrXgwjN7YfOqH
 VFlik=;
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIFer-0005Js-J7; Wed, 09 Oct 2019 17:21:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3C7EBD03ED3; Wed,  9 Oct 2019 18:21:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191009153615.32105-2-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20191009172148.3C7EBD03ED3@fitzroy.sirena.org.uk>
Date: Wed,  9 Oct 2019 18:21:48 +0100 (BST)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com
Subject: [alsa-devel] Applied "ASoC: simple_card_utils.h: Add missing
	include" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============0582680514241896018=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============0582680514241896018==
Content-Type: text/plain

The patch

   ASoC: simple_card_utils.h: Add missing include

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 4bbee14d8e5487e3d2662138e3767cf4678cdf57 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 9 Oct 2019 18:36:14 +0300
Subject: [PATCH] ASoC: simple_card_utils.h: Add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When debug is enabled compiler cannot find the definition of
clk_get_rate resulting in the following error:

./include/sound/simple_card_utils.h:168:40: note: previous implicit
declaration of ‘clk_get_rate’ was here
   dev_dbg(dev, "%s clk %luHz\n", name, clk_get_rate(dai->clk));
./include/sound/simple_card_utils.h:168:3: note: in expansion of macro
‘dev_dbg’
   dev_dbg(dev, "%s clk %luHz\n", name, clk_get_rate(dai->clk));

Fix this by including the appropriate header.

Fixes: 0580dde59438686d ("ASoC: simple-card-utils: add asoc_simple_debug_info()")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20191009153615.32105-2-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/simple_card_utils.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 985a5f583de4..293ff8115960 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -8,6 +8,7 @@
 #ifndef __SIMPLE_CARD_UTILS_H
 #define __SIMPLE_CARD_UTILS_H
 
+#include <linux/clk.h>
 #include <sound/soc.h>
 
 #define asoc_simple_init_hp(card, sjack, prefix) \
-- 
2.20.1


--===============0582680514241896018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0582680514241896018==--
