Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F63AA1B7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 18:44:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848DA16F3;
	Wed, 16 Jun 2021 18:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848DA16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623861853;
	bh=2onQOibA4CQc7noe+2STOIXu78f3FAxW2qGwNCOGv8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D40W/PkV0hjChmJ/b/TRIwjyMTSr7sPeG/7J86s37FW/lvVuoFuWKkL+qUVXAnseT
	 Af/Ei48wUokgzuY5eQ2fr1npfL3xvh6wsiyhfMihkkN6mqB5Vswf0C1ydm3jYsUTxs
	 QIYgKA1OQOrHpgOA4qgREXPbCqGTS2QdaFC/XL9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 466DAF804D2;
	Wed, 16 Jun 2021 18:42:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52726F804C3; Wed, 16 Jun 2021 18:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86636F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 18:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86636F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k5H4Xi3D"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C6C861245;
 Wed, 16 Jun 2021 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623861710;
 bh=2onQOibA4CQc7noe+2STOIXu78f3FAxW2qGwNCOGv8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k5H4Xi3DGBblbdIIqDBF/+JtxWem19ECMx4PAC6q4Do0j8SqCtxGUuMkJgFZpjZHD
 L3HM5Mvfw+eM4HATWyqg6u0zOuySxvHQyZV2Sxqmx0TTEyONqaQJPcQ/AKCugJMbMK
 5O9wcghRSoOcQmOP24QEvHJsxpQ79AGoTtamtxQ5ZYZp5OgGWy+RZnCRdQdRWY6efj
 tDWLa0S7dbzxuBSDyrJsaTFxDmv3mW5UM49aZYndc6lymQAN4M63kfWfMTof1xAIyU
 IGDLmSluePjlV4h94I24Clz55oF9QzNfCqLsOTz0ogD/Ur6gEkb3UzNgqhpQLi0SBM
 MF/yRCsLe5xJQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codecs: Fix duplicate included sound/soc.h
Date: Wed, 16 Jun 2021 17:41:15 +0100
Message-Id: <162386001971.25644.6040330182836931770.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1623822667-130511-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1623822667-130511-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Wed, 16 Jun 2021 13:51:07 +0800, Jiapeng Chong wrote:
> Clean up the following includecheck warnings:
> 
> ./sound/soc/codecs/wcd938x.c: sound/soc.h is included more than once.
> ./sound/soc/codecs/wcd938x-sdw.c: sound/soc.h is included more than
> once.
> 
> No functional change.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix duplicate included sound/soc.h
      commit: 06cc52329cb098ba0858032998e382311dcd9743

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
