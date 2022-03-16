Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26C4DB97B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6413D17DB;
	Wed, 16 Mar 2022 21:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6413D17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463051;
	bh=Q9MaDhAnGACCcyapv0JtCCj4Kw8dJ7djLostnoDnvI8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDgXMtO6XDAXaTvzQ2S/HXqereFyQui6Odg/pvfdAd9WuKeAIocTLyc4E0+vmSKq4
	 YbedllXk6ji8U4UKuFbi3nuWAiD6+P4oQEoj5bmJ348AEY/6/tALb/wsWEt2xb5dyV
	 Y5IKOxFnAg+c/0ljbr4F47QmDEGAUoIR9xgkj+jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 836C9F80517;
	Wed, 16 Mar 2022 21:35:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B195EF80510; Wed, 16 Mar 2022 21:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 897E9F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897E9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XIU0kiSo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 555E5B81D44;
 Wed, 16 Mar 2022 20:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6810BC340E9;
 Wed, 16 Mar 2022 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462945;
 bh=Q9MaDhAnGACCcyapv0JtCCj4Kw8dJ7djLostnoDnvI8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XIU0kiSow2df6hM+NlsEOZz+A1EZQz8rETYeg6bDS7LLYQvNVJ14AU+My4R5XItuF
 j2u55/CvxXdF/siCNnYZTsDtHbj+DyXAWGBD1QEgfXyU83uRbu3nYFphV1wXP3q8u5
 0mhlrhE2G/35AF1ODngY3CS0xY1wDEOJbRtTZt+mYTdmbOWGeLD/PBHAgTq4gncbRP
 OF2FfB7zc63TUa1HvrUKYryl+brgnOF5Y3taOtuvOxl8zXoYc/T+D/YlKxfz7N/s8h
 rIfaSPRXLc1+rI3OouXiG6FNVlxpihw1BAOx++DXsEjI0THvpfbukT1jsCYVLOuCHC
 88COmUasxYLSQ==
From: Mark Brown <broonie@kernel.org>
To: xkernel.wang@foxmail.com, tiwai@suse.com, perex@perex.cz
In-Reply-To: <tencent_EC21778DC383823CBC4069EA9F0B84943905@qq.com>
References: <tencent_EC21778DC383823CBC4069EA9F0B84943905@qq.com>
Subject: Re: [PATCH v2] ASoC: samsung: i2s: check the return value of kstrdup()
Message-Id: <164746294312.1220201.13120834563042031092.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, krzysztof.kozlowski@canonical.com
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

On Mon, 14 Mar 2022 18:36:45 +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kstrdup() is a memory allocation function which can return NULL when
> some internal memory errors happen. It is better to check the return
> value of it to catch the error in time.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: i2s: check the return value of kstrdup()
      commit: d39664cb758e9e329ac3ba05bd4f813f928f63c2

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
