Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB097D7255
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 11:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC9B1674;
	Tue, 15 Oct 2019 11:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC9B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571131831;
	bh=Ou2p9lTiZhVj7BUhTMoEiFqv0BUy+virqYL/3OwVwxc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kn10jyvEivdBkrD7J8VQ9mGL3opiuasd8RFg7amafp9LAjrGcwI4ivWEcqFeW2YFS
	 3ks5XVN02t5rO8J1bLyHcYXEG8UEt5JiT30VSRnCR22QzVxwjzWBlgvnMVLXO+w4ic
	 Kg7/N8WqaN4hVESutC9xBsqqE/hXymeIYBy8osfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92989F80610;
	Tue, 15 Oct 2019 11:27:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2F4F805E1; Tue, 15 Oct 2019 11:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC3BF804AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 11:26:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC3BF804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="p/75Eeoz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pu72/CVYWvKCsXsqAWOpzWPxChqiqeN3qKfNTjp4aiw=; b=p/75EeozssiU
 IzX8poKsEhYEZITbyq7gyEU/9XswIAoqTKb5AhuLqL3W6I6KQZ3wDUJff9XNcAGfntMoRTrA8xt6O
 9IIP8ahmBy7HIoyex6ZNFcr91X6F9NB3fms/6vw09qBCNHarLZeWSnuE5pxdLRu2/hivsdGqRenxz
 8F3ks=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKJ6T-0001oa-14; Tue, 15 Oct 2019 09:26:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1BC3F274293A; Tue, 15 Oct 2019 10:26:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191015092652.1BC3F274293A@ypsilon.sirena.org.uk>
Date: Tue, 15 Oct 2019 10:26:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: sof: include types.h at header.h" to
	the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8819988492547359513=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8819988492547359513==
Content-Type: text/plain

The patch

   ASoC: sof: include types.h at header.h

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

From 03048217624a9472c1c7a205c8ea9bf8d4026e59 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 15 Oct 2019 14:44:09 +0900
Subject: [PATCH] ASoC: sof: include types.h at header.h
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Content-Transfer-Encoding: 8bit

Without <types.h> we will get these error

linux/include/sound/sof/header.h:125:2: error: unknown type name ‘uint32_t’uint32_t size;
linux/include/sound/sof/header.h:136:2: error: unknown type name ‘uint32_t’uint32_t size;
linux/include/sound/sof/header.h:137:2: error: unknown type name ‘uint32_t’uint32_t cmd;
...
linux/include/sound/sof/dai-imx.h:18:2: error: unknown type name ‘uint16_t’uint16_t reserved1;
linux/include/sound/sof/dai-imx.h:30:2: error: unknown type name ‘uint16_t’uint16_t tdm_slot_width;
linux/include/sound/sof/dai-imx.h:31:2: error: unknown type name ‘uint16_t’uint16_t reserved2;

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/header.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 10f00c08dbb7..332143ff7278 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -9,6 +9,7 @@
 #ifndef __INCLUDE_SOUND_SOF_HEADER_H__
 #define __INCLUDE_SOUND_SOF_HEADER_H__
 
+#include <linux/types.h>
 #include <uapi/sound/sof/abi.h>
 
 /** \addtogroup sof_uapi uAPI
-- 
2.20.1


--===============8819988492547359513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8819988492547359513==--
