Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F5662BAF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:51:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB5A28F3F;
	Mon,  9 Jan 2023 17:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB5A28F3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283087;
	bh=YwSP2w9wGKi2ttakQ9Xz42YL9cH5sw+0e4H+bY+2QYE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q82zgeK4CHh3Os3fxJexYkUfvfEezOheeaAMTh+V00V1/OPyIirpvpVqEJ8+qryQQ
	 kZVYAVR9B0EF14qVQgE6R5H5GmqMoYlGWO7bz/Hv+wbJUX1LWUxP6q6Yvr1DNiVgdV
	 33q+qOkVbUYlRK+pBdY/7XWm0pr8P36aiIAzo+xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93400F80557;
	Mon,  9 Jan 2023 17:49:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47548F80557; Mon,  9 Jan 2023 17:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74AC9F80549
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74AC9F80549
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bR5oClSE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 38251611CF;
 Mon,  9 Jan 2023 16:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D96C43396;
 Mon,  9 Jan 2023 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282957;
 bh=YwSP2w9wGKi2ttakQ9Xz42YL9cH5sw+0e4H+bY+2QYE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=bR5oClSEGTvqSQyskWB8vv5rBgYftECC/PY3hreKOGdwTGX0zkiJnGMoHRss8kqrM
 lRE7aJoVKx7Infq+IqJkWPxjFXfRkRg5Opc8R4SGK4hlK9emXTCCCmlacOWmPhAB0h
 /a4dzJ1OkU2qQZhYD6CaNNUaJW1ROFyUxe+wOnjjTns+qJe7GNrzyl+PJtn6gdN8m5
 Kq1t0WCa4Hs/2YJXgprroIDgSoPUrX8DuBY69ZgkfO4TTt5RZDaHHDWwer+3NG9pvX
 v85z0lslfUv9F8ovsyR2DGr3MkFbfKHHHHc721cg33w7WNgY7601y2tGX7On0R3jx4
 TiUtYT8NwW7Kw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109083301.76282-1-krzysztof.kozlowski@linaro.org>
References: <20230109083301.76282-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: correct DAI subnodes
 pattern
Message-Id: <167328295575.323147.8150537822946345432.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On Mon, 09 Jan 2023 09:33:01 +0100, Krzysztof Kozlowski wrote:
> The simple-audio-card,dai-link node does not allow address/size-cells
> thus children (cpu, codec) should come without unit addresses.  For
> cases with multiple nodes of same type, require a dash before index
> (e.g. cpu-x) and add trailing $ to the pattern to disallow other
> characters.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: simple-card: correct DAI subnodes pattern
      commit: cbf74baf02219978bfa9c2959eac6bf1d98c32cd

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
