Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B58B67C1A7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:30:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1991E209;
	Thu, 26 Jan 2023 01:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1991E209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693001;
	bh=gubbhzGaviSeApE3IdtZWRMvA0UHhr8l5Bb71wx7pHE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ofTjzlVgQWMc3pd8GY3ajwj4XuwspX1M88IoTNWpDsMgnLVf+ygfbhYqU5fJPiqHr
	 9I5yvkvDp/0pf8PkKGQ4Zo50nO3ydpw+MmWSGdssPuc0i2LaiZjIl/M+9/grHpwiPY
	 Scgx2sQDW6pefdm1dxvTbO+EHXSZIS6fDo8GnDJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CED9F800FB;
	Thu, 26 Jan 2023 01:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC6B8F804A9; Thu, 26 Jan 2023 01:28:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6AFCF802E8
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6AFCF802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tuIKNqm4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CBD9B81C6A;
 Thu, 26 Jan 2023 00:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5B2C4339C;
 Thu, 26 Jan 2023 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692933;
 bh=gubbhzGaviSeApE3IdtZWRMvA0UHhr8l5Bb71wx7pHE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tuIKNqm4mU2Li0CLx3FjM1AU7UJSU4+yfdyi0iYXnnatFEF1v57rvOic1GS2TLqk/
 5kuA0L8CiRqoJr61ikJLH11e/0Pjf087rVIsL9X+zCgsoEErlmwTW6ryrKNN11l+2f
 yu2kdJwnbMx6s/W6nIQ7Qw03SP1GkTCGh7/CxEpu+wPFmIBGaaS/FwMN/4yjNzq3jF
 kXkHwnfTJGwG1hTaUTw7RYsqJFeq6rZO9m9iDcrhjJT9BFhhMcSzzcEdOOnCspfrFt
 Qluy9+VnBfG9N5jPTin0UNkY16poI0H+otWEjcTlsvmpBa9ilrmxueMwQt3dfhIx/B
 9JwUuYGlhGYRg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124123049.285395-1-krzysztof.kozlowski@linaro.org>
References: <20230124123049.285395-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: correct playback min/max rates
Message-Id: <167469293063.2696228.862026813738827424.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:28:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 24 Jan 2023 13:30:49 +0100, Krzysztof Kozlowski wrote:
> Correct reversed values used in min/max rates, leading to incorrect
> playback constraints.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa883x: correct playback min/max rates
      commit: 100c94ffde489ee11e23400f2a07b236144b048f

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

