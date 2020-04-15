Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41A51AAEF9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 19:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A03A1663;
	Wed, 15 Apr 2020 19:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A03A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586970064;
	bh=TsaN0gPfYDdnHXfzGe1ancvTHT6mAwteLwnmKODNIEo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AkJ6TWSJN9xXxxp1alFMUvc64iq3+LJjNOrCT+pZU8wk9zM2ldvTKruSmwe1uilL4
	 zSUSB8CyOkUo+IFMPUAYydoCfkX+v8deFPE3rjqqzOO95c+hHnska0x3t5iFC6HxsS
	 4Xz0f/+Yzv4NgQ23Gdkt14XSWR02nBFT/eXhQS3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20385F80115;
	Wed, 15 Apr 2020 18:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5B0F8025F; Wed, 15 Apr 2020 18:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 MIME_8BIT_HEADER, SPF_HELO_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51610F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 18:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51610F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mGyJYLlN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D34D1206F9;
 Wed, 15 Apr 2020 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586969952;
 bh=TsaN0gPfYDdnHXfzGe1ancvTHT6mAwteLwnmKODNIEo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mGyJYLlNU0jz95PqcZPzRx+bJvGZXzg3ryMBMm/Ts0WFOjIkrgq2DZoPp/R0aX8m5
 W2UJwtgOSqbVCY6CiFGosgcfPVfASGbc/zVNDTOza3QBcTiqA6zlyzHZv3sXoUorw7
 0zMOovaOq7lQRychW3tE2oUuPUNgxGkuWcY38C/c=
Date: Wed, 15 Apr 2020 17:59:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Subject: Applied "ASoC: topology: Fix endianness issue" to the asoc tree
In-Reply-To: <20200415162435.31859-2-amadeuszx.slawinski@linux.intel.com>
Message-Id: <applied-20200415162435.31859-2-amadeuszx.slawinski@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: topology: Fix endianness issue

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 26d87881590fd55ccdd8f829498d7b3033f81990 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Date: Wed, 15 Apr 2020 12:24:35 -0400
Subject: [PATCH] ASoC: topology: Fix endianness issue
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As done in already existing cases, we should use le32_to_cpu macro while
accessing hdr->magic. Found with sparse.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20200415162435.31859-2-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 33e8d189ba2f..6df3b0d12d87 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2652,7 +2652,7 @@ static int soc_valid_header(struct soc_tplg *tplg,
 	}
 
 	/* big endian firmware objects not supported atm */
-	if (hdr->magic == SOC_TPLG_MAGIC_BIG_ENDIAN) {
+	if (le32_to_cpu(hdr->magic) == SOC_TPLG_MAGIC_BIG_ENDIAN) {
 		dev_err(tplg->dev,
 			"ASoC: pass %d big endian not supported header got %x at offset 0x%lx size 0x%zx.\n",
 			tplg->pass, hdr->magic,
-- 
2.20.1

