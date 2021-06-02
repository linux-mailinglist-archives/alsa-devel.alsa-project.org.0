Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF39398FCA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E0671706;
	Wed,  2 Jun 2021 18:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E0671706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622650752;
	bh=LawA/3q1aMafaKZX9gy63FabVMT0MHZZ5bgEoAQClME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=plc6jp1lYkEKv8g4OmULsMFi00Bwgf5cBr3b3JRF6t8Q0zdyfhhTyYvmHlzG1Bz3E
	 gy7ZFU1X5X6g99H6QW/l7YQbuJ4Fg9GAwR0jVNyhu2Y9futSCqIHKz2tYSFLoxWsow
	 AcpeLKKasNyOWPxYzuXrOgfBZ3VzYiB8lPRKOoRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8956BF804BB;
	Wed,  2 Jun 2021 18:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9BADF80430; Wed,  2 Jun 2021 18:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C4E5F80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C4E5F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UQdhNlwz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA5D61943;
 Wed,  2 Jun 2021 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622650645;
 bh=LawA/3q1aMafaKZX9gy63FabVMT0MHZZ5bgEoAQClME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UQdhNlwzJzGisCRJBCfovm/q/MHYn/xrrHbx0dkeqETCFHa/DjLo9ZdoPoiYZluk6
 AM8V8ynsEmuTjrtYSH4hcFbvsg2HxHcMxOF2cRQdAhNRtp7/O+E6qvbdLejbS8in1X
 2DjR4v+fG9T0mPy8vk5WpL9YqAmwXFbQHWH5Hl56+CDLBsptDS8xSL0NOuU9U/JpLf
 wczf6Ob2R7vsXPFiFZ2/TwNUs/WlhxWD2A0VvTwliCeLwqjGbBdx4hvFpUCqL5jcwP
 Puc0AVAgjSwOF/RlLmumUKWiusi+yFpQaJsvSidBHDcQAMAsYuWhJ7Jh20Vqrr+T3r
 lBFGJ8HmUfcDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Shaokun Zhang <zhangshaokun@hisilicon.com>
Subject: Re: [PATCH] ASoC: sigmadsp: Remove the repeated declaration
Date: Wed,  2 Jun 2021 17:16:53 +0100
Message-Id: <162265045453.22459.7628494936017417505.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622279690-3740-1-git-send-email-zhangshaokun@hisilicon.com>
References: <1622279690-3740-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Sat, 29 May 2021 17:14:50 +0800, Shaokun Zhang wrote:
> Function 'sigmadsp_reset' is declared twice, so remove the repeated
> declaration.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sigmadsp: Remove the repeated declaration
      commit: f34cd5eb2c57c93bdd7659522da9f7f97e863a0d

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
