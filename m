Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D43117537
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0447C168E;
	Mon,  9 Dec 2019 20:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0447C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918605;
	bh=o8ZCBkYki/RECKAmi4BLPSTOD5q4oQHAUpViCyD5GSA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=INUsAZDsSV+aEu01OX+/B37b5mJZkvuOX9vyDIN5RV81Jr7l8hrK+Vo2X3c9KGPTW
	 n2k7/0l/z++bXYo6R0+emaHE+szXjXY6cW2iEYmVWMMy9Zo5kZnHTuzAz09sPv1Ap0
	 sRK95XwQ816ndXqNeXKHZT4/geFFHk0Z1VMDc6bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119C0F80321;
	Mon,  9 Dec 2019 19:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A70AF802E8; Mon,  9 Dec 2019 19:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EDEBEF802BC
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDEBEF802BC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1472513A1;
 Mon,  9 Dec 2019 10:59:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88FDE3F6CF;
 Mon,  9 Dec 2019 10:59:10 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2215ee04-e870-5eea-a00c-9a5caf06faae@infradead.org>
Message-Id: <applied-2215ee04-e870-5eea-a00c-9a5caf06faae@infradead.org>
X-Patchwork-Hint: ignore
Cc: moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] Applied "ASoC: fix soc-core.c kernel-doc warning" to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: fix soc-core.c kernel-doc warning

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From bc9a665581b3c6c82c9220a47f6573b49ce2df0b Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 8 Dec 2019 20:37:04 -0800
Subject: [PATCH] ASoC: fix soc-core.c kernel-doc warning

Fix a kernel-doc warning in soc-core.c by adding notation for
@legacy_dai_naming.

../sound/soc/soc-core.c:2509: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Link: https://lore.kernel.org/r/2215ee04-e870-5eea-a00c-9a5caf06faae@infradead.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 062653ab03a3..1a362a799dbb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2498,6 +2498,8 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
  *
  * @component: The component the DAIs are registered for
  * @dai_drv: DAI driver to use for the DAI
+ * @legacy_dai_naming: if %true, use legacy single-name format;
+ * 	if %false, use multiple-name format;
  *
  * Topology can use this API to register DAIs when probing a component.
  * These DAIs's widgets will be freed in the card cleanup and the DAIs
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
