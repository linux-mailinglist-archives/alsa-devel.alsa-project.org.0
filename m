Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B048138B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FB431787;
	Wed, 29 Dec 2021 14:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FB431787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784714;
	bh=MVd5KxCSC+WZfhjw2O7WEcyUHBPE/JuOeakntOcIc14=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TeB+T/LnB805eJFVmn1m1HPl6iQNhhHUBmjzeUmtLFOQIJ3aAROo5oJhuCtlh8NL4
	 Ol1QUeoOHxkFkWK9bRFM3odNf/tPkKMjwXdC/7m2jqAGFO2cb2/bcIMCykxhqew62f
	 uQRd55/Z6dy0a4mUfHPV8mV80tOh7/zxIdyGJngI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C064EF804F2;
	Wed, 29 Dec 2021 14:29:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 396CEF800F8; Wed, 29 Dec 2021 14:29:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55904F80224
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55904F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C5gSrjwR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70DC2B81908;
 Wed, 29 Dec 2021 13:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD0AC36AED;
 Wed, 29 Dec 2021 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784576;
 bh=MVd5KxCSC+WZfhjw2O7WEcyUHBPE/JuOeakntOcIc14=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C5gSrjwRStroLkZ/epa1jGi2OA8EOu32iTt1btMArfi06cXJ7ITIMnVk87msdu8IF
 K3Oz+tsCBORRd8fxjqGxlPPU33SUQs6TeqaZOaRk16E7LIavEtVemojAa7v5zCLPnG
 3Sh8NO8aIV0BabukM9WJkdD23tGP8XatUztzWlalIhaq02ZhsZv81DUeUR0ZfWcHj3
 lUtiordOhrC2uRibydkZreZnvANV3wLz4u7X7eXubjC+IRoVuKSLr6jtPc7jNZRRGA
 LCAWnU+aN7j5mdqw/GpizeVKo5PaWnpJ/WuI7nJMVHS04A6vue+jDQhWGzYEgaI5mQ
 aJ8RxG3/4uJ3A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, krzysztof.kozlowski@canonical.com,
 s.nawrocki@samsung.com, perex@perex.cz, Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20211228034026.1659385-1-jiasheng@iscas.ac.cn>
References: <20211228034026.1659385-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: samsung: idma: Check of ioremap return value
Message-Id: <164078457442.1246652.6708919601470029287.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 28 Dec 2021 11:40:26 +0800, Jiasheng Jiang wrote:
> Because of the potential failure of the ioremap(), the buf->area could
> be NULL.
> Therefore, we need to check it and return -ENOMEM in order to transfer
> the error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: idma: Check of ioremap return value
      commit: 3ecb46755eb85456b459a1a9f952c52986bce8ec

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
