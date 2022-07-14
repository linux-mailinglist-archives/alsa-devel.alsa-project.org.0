Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BD57522D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 17:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A3A21929;
	Thu, 14 Jul 2022 17:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A3A21929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657813652;
	bh=ywjOcy0Fngl3ieYdZPaglANph/+aXsiQuKBuI/Ow9Oc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvt2jW9SRnnFllV8IhAFJEaFtSATWaj5AZjlnhso+iRS89kMD+Xa0c6Tgn5budK0C
	 hBq2TO6omo12XoGesk2NFCpxgXeBFGgkSDbS760RNHJ/a51rP9wsOsMnn9dFzBG6u+
	 7xeadsi60VuG4BafU7dx4n74dsXCwUKbRWNZSA40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5728F8016E;
	Thu, 14 Jul 2022 17:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AEB3F800AA; Thu, 14 Jul 2022 17:46:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2EAEF800AA
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 17:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2EAEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TSGZR5M1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34807B823DE;
 Thu, 14 Jul 2022 15:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEE7C34114;
 Thu, 14 Jul 2022 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657813583;
 bh=ywjOcy0Fngl3ieYdZPaglANph/+aXsiQuKBuI/Ow9Oc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TSGZR5M11flWI+w2N6MRUzQwF4tM9W3oDoiHNLbP9R2T7Akup1KXtS/xA8WpDcRnA
 dzamh/fvOzhxvdZ9ok4/GZKwBBbDQ0i/Uyd1Nho/XVQuU0Vhi6Amk6wnTX+D6sOwWC
 O0e+c1iANc3S0M9iZfF2h8NbNWXetq0C6o1b51XXYV7aFXn/QS9niaSjaoHF1qTKGY
 xTQY8lAr8IKOyvvPZN+Cri/MO26UKxoJx4y7WMU2y24K6NYSxrGlPL3+Gw/2FL80XD
 jZjR4Z9Eu4FZPJjr+pLknV+TN600CFlEBvVfaahiw0M3Rc2KoTqWFcuI7JpQCnDnA1
 Up8jBUKqHvZ/w==
From: Mark Brown <broonie@kernel.org>
To: wenst@chromium.org, alexandru.elisei@arm.com, broonie@kernel.org,
 lgirdwood@gmail.com
In-Reply-To: <20220713130451.31481-1-broonie@kernel.org>
References: <20220713130451.31481-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
Message-Id: <165781358234.103890.813501297551869982.b4-ty@kernel.org>
Date: Thu, 14 Jul 2022 16:46:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 13 Jul 2022 14:04:51 +0100, Mark Brown wrote:
> The version of the BCLK pinctrl management changes that made it into
> v5.19 has caused problems on some systems due to overly strict DT
> requirements but attempts to fix it have caused further breakage on
> other platforms.  Just drop the changes for this release, we already
> have a better version queued for -next.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
      commit: 1e347f861da8ddb17e1d1b3113cb6c188e0de3e5

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
