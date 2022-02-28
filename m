Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739EC4C789D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:17:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0367718A2;
	Mon, 28 Feb 2022 20:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0367718A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075866;
	bh=aWYprn5Xty9RgNxgQZ7iQ4sNiL6rJeBsi12InO0YXM4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOPae4TwHUvXQz3SnmCWKBDQFnjITYl9VFcQIZ9aX+x/S56wLNr0BazXDHzRpiAAN
	 0Rfu2b+xtCiS2dLDbojVneacxkBo2MBaOVUyf1IHYFE9XIIeTeQqEk28Yf7u2yeNZh
	 eMQWtaCowwIfbc6ni8a51hasq+AFBpQFIlFogMVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86592F80517;
	Mon, 28 Feb 2022 20:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4D89F804CA; Mon, 28 Feb 2022 20:15:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ABAEF80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABAEF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fmF/8wVx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CD84B8162C;
 Mon, 28 Feb 2022 19:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE23C340F1;
 Mon, 28 Feb 2022 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075717;
 bh=aWYprn5Xty9RgNxgQZ7iQ4sNiL6rJeBsi12InO0YXM4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fmF/8wVxBQs9AIUX+Sd1DJwEcfSoJdNpWW4wR29Ve1DC6go29f2TiwuMUcUXOklwH
 NmgoCfYQPtUh/cN+Cfz1zOCuOwzuS9YT6V6aK7YsRFklrcKpymYR4dYXVttfn9B1Iy
 r4pDtWV/h2gaa3T1IDWLgxGzVWxYMb3rpWDroHfD9aTk2/hJjr9L52rXDcML4PNAlo
 aypl8m7Ka2eM+x99FMcIyABHO8Yfaw7iV4j2BPECPKhWo2Vzz2tLZc6CqHupvW2oC8
 PpCdEy6+44HEXuzoEvWVR8b1LRQbfzgo9+UvkmSy1YFRn6m64VYNyivGLq3iWpOF0F
 bsrDBQ+SWirLw==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220222224816.3636987-1-broonie@kernel.org>
References: <20220222224816.3636987-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: inno_rk3036: Use modern ASoC DAI format terminology
Message-Id: <164607571676.3538791.8884134421076404085.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:16 +0000
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

On Tue, 22 Feb 2022 22:48:16 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the inno_rk3036 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: inno_rk3036: Use modern ASoC DAI format terminology
      commit: 58d858ae1c44e23ff48077b60b575359e81bb0ea

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
