Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A0187A52
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F15B1669;
	Fri,  9 Aug 2019 14:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F15B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354345;
	bh=PXsWFVpuG+c2hRkHxI58vhwEjTzugGLygRkh+vWfmBw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=IkMn8TSiZ+jro85ff3m89RXZ7nD7g3IMJQLmvUXCTfWYHHCFqKo8OvHjqXCH+3H/z
	 ifxHJ2QOWTKNm6IFdPsHYoJfR7OEL3K0HCryqQS0hr5ea04M5z6rgiNQxDM1XF923Z
	 uQeS2mEt9gS3/VTaG6ZTTQ7/+vPLAa7UwD1UCIvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D358F8065E;
	Fri,  9 Aug 2019 14:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAC00F804AB; Fri,  9 Aug 2019 14:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346C7F805F5
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346C7F805F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="beh/h/nA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/jo88AcFDfqbdS1YL/mJqykjovRrReNV4GrM29uIo6I=; b=beh/h/nA91ib
 PMNIJTuxEbXDVpq+KGoMpQCkFasHwzcTy5iqXQohAtvZumX8+mBl+v2W8SEubU6osQU6bq7MT9T8y
 cLitK/M81arRm74Tq7h1CSTysPVZcDFPQLFHoA//YZ97ZjhG7CqsZUM8LQC7bJ6ALjVdRGqWpPH/e
 bNrLo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43l-000618-2D; Fri, 09 Aug 2019 12:31:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6CEB82743057; Fri,  9 Aug 2019 13:31:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190809082440.67412-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123152.6CEB82743057@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:52 +0100 (BST)
Cc: alsa-devel@alsa-project.org, rfontana@redhat.com,
 gregkh@linuxfoundation.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ml26124: remove unused variable 'ngth'"
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

   ASoC: ml26124: remove unused variable 'ngth'

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

From 0fd70e22a0ffebd13028bf2c7da6b747070475bf Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 9 Aug 2019 16:24:40 +0800
Subject: [PATCH] ASoC: ml26124: remove unused variable 'ngth'

In file included from ./include/sound/tlv.h:10:0,
                 from sound/soc/codecs/ml26124.c:19:
sound/soc/codecs/ml26124.c:59:35: warning: ngth defined but not used [-Wunused-const-variable=]
 static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
                                   ^
./include/uapi/sound/tlv.h:64:15: note: in definition of macro SNDRV_CTL_TLVD_DECLARE_DB_SCALE
  unsigned int name[] = { \
               ^~~~
sound/soc/codecs/ml26124.c:59:14: note: in expansion of macro DECLARE_TLV_DB_SCALE
 static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
              ^~~~~~~~~~~~~~~~~~~~

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190809082440.67412-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ml26124.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 3abd27893ce6..55823bc95d06 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -56,7 +56,6 @@ static const DECLARE_TLV_DB_SCALE(alclvl, -2250, 150, 0);
 static const DECLARE_TLV_DB_SCALE(mingain, -1200, 600, 0);
 static const DECLARE_TLV_DB_SCALE(maxgain, -675, 600, 0);
 static const DECLARE_TLV_DB_SCALE(boost_vol, -1200, 75, 0);
-static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
 
 static const char * const ml26124_companding[] = {"16bit PCM", "u-law",
 						  "A-law"};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
