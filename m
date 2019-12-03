Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AA10FF82
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 15:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CDB51661;
	Tue,  3 Dec 2019 15:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CDB51661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575381689;
	bh=oTJWeAQCDP2EeRJIY5rTJF6gdimPxx6HD06UIHLGomk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MiAVArotfmW8w5khCKsjoK2BLgIw7+bFtQhBBCCuWknrCSNTZFtnG1lTFAjY4/12M
	 9kWCAI3jrTafwwn4GqBxbWN6b1vEYIUJ9jAjcajcx/6aW+ATyC08bCkvmqnUBtL0/E
	 lc43UFbOpSi9XEvrJo/rDk33WUXoGU00ot2VkIQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8850F80229;
	Tue,  3 Dec 2019 14:59:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB45AF80228; Tue,  3 Dec 2019 14:59:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F43F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 14:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F43F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EhF8fwws"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=WklViDGV4ss23T8TYmp/6HDrwSgv4pa+ni2ckZv2ukA=; b=EhF8fwwsQD8e
 +LPePrNs6c1NQEUZHT48PyPOErBMS+qsBoRown40Qej1KcIbGAh5lR2ow4xIJUL9l1BtUsWqk/LcT
 +ND5VRZVD8GoMZ1CCG+znS4Ix9vWzkKH4tn5P7QKMSuMyFXyo4MlSYb/XKphLK7rc+8P87FxdSy48
 jzFVE=;
Received: from fw-tnat-cam1.arm.com ([217.140.106.49]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ic8iG-0002bn-6B; Tue, 03 Dec 2019 13:59:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 917CBD002FA; Tue,  3 Dec 2019 13:59:35 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20191128135853.8360-1-yuehaibing@huawei.com>
Message-Id: <applied-20191128135853.8360-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Date: Tue,  3 Dec 2019 13:59:35 +0000 (GMT)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, yuehaibing@huawei.com,
 Hulk Robot <hulkci@huawei.com>, gregkh@linuxfoundation.org, tiwai@suse.com,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 alexios.zavras@intel.com, Mark Brown <broonie@kernel.org>, tglx@linutronix.de,
 allison@lohutok.net
Subject: [alsa-devel] Applied "ASoC: Intel: sst: Add missing include
	<linux/io.h>" to the asoc tree
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

   ASoC: Intel: sst: Add missing include <linux/io.h>

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

From d5ee9108adacfbed140e0ac2371941ce7ca1fc54 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 28 Nov 2019 21:58:53 +0800
Subject: [PATCH] ASoC: Intel: sst: Add missing include <linux/io.h>

Fix build error:

sound/soc/intel/atom/sst/sst.c: In function intel_sst_interrupt_mrfld:
sound/soc/intel/atom/sst/sst.c:93:5: error: implicit declaration of function memcpy_fromio;
 did you mean memcpy32_fromio? [-Werror=implicit-function-declaration]
     memcpy_fromio(msg->mailbox_data,
     ^~~~~~~~~~~~~
     memcpy32_fromio

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191128135853.8360-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/atom/sst/sst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index fbecbb74350b..68bcec5241f7 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/firmware.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
