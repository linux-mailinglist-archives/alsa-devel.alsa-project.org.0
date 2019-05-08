Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F361F17477
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D4A1938;
	Wed,  8 May 2019 11:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D4A1938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306158;
	bh=Yr63nPHSzoPc8+tpnN6T/zaIpSX3kSEnKHC+RhJCRWM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qYcAhRJyAcjcqfvFLxdRhMSSP2Ic4WKk1+bU/q5wCc8FdXhzyM+Xph/WwMxVHbOQh
	 9l7C7vQwqgOuwLQ/oqU8+D3Vmy0YrXKFxMq9OFe8vzntW0v+P5/wE6ji+Rcm95yOrH
	 Etn04MxanQFZJxMwsrwDKHt+llIliCvFsWgiY66U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46B99F807B5;
	Wed,  8 May 2019 11:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8944DF896F0; Wed,  8 May 2019 11:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20799F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20799F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bsWwKanj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bwHhshSS/kbfWXI+gsQyuvdaNlF4NdaPvcOqb1oDAdo=; b=bsWwKanjClyz
 3Q9U6F/VocjQtO/23y2c9tlFDgFhqXBiGnFtBEHU/dJYlV3dP1j2bgg8Bk6D6wCZnPj6Tf+kCXAQD
 hoNGpgQF/9zNWx9PFWMKEkNNEKceL1N4jLyGKKvmd3v6dzjvnJVyeCMsn22Zwf9I5hCtLMUe58Z9k
 N7pE8=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISA-0007dM-I7; Wed, 08 May 2019 09:01:31 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 34D1C44000C; Wed,  8 May 2019 10:01:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
In-Reply-To: <1555168518-15287-1-git-send-email-paul.gortmaker@windriver.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090124.34D1C44000C@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "sound: soc-acpi: fix implicit header use of
	module.h/export.h" to the asoc tree
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

   sound: soc-acpi: fix implicit header use of module.h/export.h

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

From 473849e7f208b2d7de004c6c6c0eabe037d125ac Mon Sep 17 00:00:00 2001
From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Sat, 13 Apr 2019 11:15:18 -0400
Subject: [PATCH] sound: soc-acpi: fix implicit header use of module.h/export.h

This file is implicitly relying on an instance of including
module.h from <linux/acpi.h>.

Ideally, header files under include/linux shouldn't be adding
includes of other headers, in anticipation of their consumers,
but just the headers needed for the header itself to pass
parsing with CPP.

The module.h is particularly bad in this sense, as it itself does
include a whole bunch of other headers, due to the complexity of
module support.

Here, we make the include explicit, in order to allow the future
removal of module.h from linux/acpi.h without causing build breakage.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 4fb29f0e561e..444ce0602f76 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -4,6 +4,8 @@
 //
 // Copyright (c) 2013-15, Intel Corporation.
 
+#include <linux/export.h>
+#include <linux/module.h>
 #include <sound/soc-acpi.h>
 
 struct snd_soc_acpi_mach *
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
