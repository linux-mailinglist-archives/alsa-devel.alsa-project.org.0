Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B52CA3C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DCE01826;
	Tue, 28 May 2019 17:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DCE01826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056827;
	bh=/6g6nKcxxIYeJvQzoGpT46IiqwYD140O1za8sh9ENZM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IQrdre7xteo04rPATw9cHQ9ikJlYUtXM6nHXyR3PoTfkpvd0KUcomUNI8hk0KziW/
	 +Y0dPNPVIAM3fWJSqz5KWHItIWkhXvUKQkdwp6SfdIL1d7ODp1ca9pf2NiplAJTocH
	 Z/MZ8Xx88jDErMRi1wSVdbRqowoommers0rtyS0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E6D4F8978B;
	Tue, 28 May 2019 17:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46173F89766; Tue, 28 May 2019 17:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 237ACF89708
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 237ACF89708
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="alBfWdH9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JM3qRMN//XQkEzha8BwkptVAMHDC1JT9yLpWp/WNy+Q=; b=alBfWdH97QFV
 rl5ebffxdYAcNUb/YC9augb8ux5i+vgh/20QjOn2IdXaim4tA89L54nS21hil5bhv9m1UL0AnjeDV
 Ilig5WHdZGFegIjM/luJ6vZ37ZXlnrOz/pzZtYtQmitU8cZSnwDsz4oJ5EDBgG+SGyfC75Xe9x4/7
 wSxLY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgp-0002o5-7z; Tue, 28 May 2019 15:06:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8B8C7440049; Tue, 28 May 2019 16:06:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Jourdan <mjourdan@baylibre.com>
In-Reply-To: <20190527163809.28104-1-mjourdan@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190528150658.8B8C7440049@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:06:58 +0100 (BST)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] Applied "ASoC: max98357a: Show KConfig entry" to the
	asoc tree
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

   ASoC: max98357a: Show KConfig entry

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

From 99afc8df8b6f2d039b1ab20d879e4721068a6c34 Mon Sep 17 00:00:00 2001
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 27 May 2019 18:38:09 +0200
Subject: [PATCH] ASoC: max98357a: Show KConfig entry

The SEI510 board features a standalone MAX98357A codec.
Add a tristate prompt to allow selecting the codec.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 472bde124ebe..0835d4b0d8c3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -714,7 +714,8 @@ config SND_SOC_MAX98095
        tristate
 
 config SND_SOC_MAX98357A
-       tristate
+	tristate "Maxim MAX98357A CODEC"
+	depends on GPIOLIB
 
 config SND_SOC_MAX98371
        tristate
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
