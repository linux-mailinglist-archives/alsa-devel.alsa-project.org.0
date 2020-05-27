Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C992D1E46B7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 17:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 817AD1788;
	Wed, 27 May 2020 17:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 817AD1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590591686;
	bh=n3T3SCw7AuNm+LGdYO+r5qpnOKzrU0x+b1p1GFAuRg4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2BPSQZNLGT9RpHrd/JCWwFYphgpHBhzaGSQOfElwj2icjnySDmmZDKSGncI4hcsV
	 Ar9W/BV7GwiBBsDUQtKvEvMGg9aJhtom0rb2Ho6LN8B5lXTSENX/67T/2miYavAHjW
	 59BgF54lP0vMF0JATI5qG+7KeOK6tdMtkL5rYZjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF110F802A8;
	Wed, 27 May 2020 16:58:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F9ADF802A7; Wed, 27 May 2020 16:58:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72CE2F802A1
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 16:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CE2F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="clIMJ+gt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 753DB2088E;
 Wed, 27 May 2020 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590591493;
 bh=n3T3SCw7AuNm+LGdYO+r5qpnOKzrU0x+b1p1GFAuRg4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=clIMJ+gt1V10YcDy1CW3cRioiIu1IIxtmB1+ghdi9LkQDIaTTRX/HryEFwOMSbSCH
 oxse4sGd3xANMflPwtPhJwIN0uX2HKBOtc9GZa8shaxIrcPNxZIFiHSiX9KTzr3s9O
 aVmnYXR9VZlp26At+IKdgWeccHt5ISL07FHx/yI0=
Date: Wed, 27 May 2020 15:58:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Daniel Mack <daniel@zonque.org>
In-Reply-To: <20200527030210.124393-1-weiyongjun1@huawei.com>
References: <20200527030210.124393-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: mmp-sspa: Fix return value check in
 asoc_mmp_sspa_probe()
Message-Id: <159059147354.50918.14800110942668588703.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 27 May 2020 03:02:10 +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mmp-sspa: Fix return value check in asoc_mmp_sspa_probe()
      commit: 185457632ba344d3100e6bdd8ba839b959521813

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
