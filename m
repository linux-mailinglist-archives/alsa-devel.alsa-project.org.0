Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92E6E695F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD6EE9D;
	Tue, 18 Apr 2023 18:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD6EE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681835024;
	bh=RKq+8OHiBrOyLAi6BWiPxp9ZIBhsklW6Kv+GwshIKDc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MOqzJORErzHYkkdLdaT+G4bqLJycVwiN2XcU+iuX60MtRJY4hYpxB82nnh9CgjhJf
	 iQppsbPZPk7vnt4NsHFYagID3vFGgoElVfHkPBs8i0XwKRGF16K2FU0LiwsYR4gX5n
	 zRpJhtJ5e4N9GPFJKPcCMb/5uVAQ3lWKvBYemoP0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE069F80549;
	Tue, 18 Apr 2023 18:21:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B17D9F8019B; Tue, 18 Apr 2023 18:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 749A1F80155
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 749A1F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cCupsJ6z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A49363527;
	Tue, 18 Apr 2023 16:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49589C4339C;
	Tue, 18 Apr 2023 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834887;
	bh=RKq+8OHiBrOyLAi6BWiPxp9ZIBhsklW6Kv+GwshIKDc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cCupsJ6zwdXy+BDF9FUeePW5WTgEd+f/JSA+xOLP/v3zEPZbWFrKp3CxNQ5R7VOzo
	 eVMlA5V7G44uUSDSPJVijCctaZ2H9UXIcn/cj8ghPrgrnfi/1OfVH9X4w8ZFPi4yBX
	 egrZFUCo0IpsoM/BSt1LWWSywZ8wk9kacQWrosZ0ICKv451evk9LFMX/EZNHbeTsZE
	 MSaWx4EoCTpSoBdbV41CzOP3h8Zijxi6v6Klsig/eBySGU4vs1x6XRJ/bGeiz4V+Nj
	 bnwQTJKj1kClxmBLtioIVknGEkg3M8M/R5bqsw5eq6jIGPil+gaFMoyHxIB2Isoqxv
	 J30pp/YXJt77w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
References: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 1/4] ASoC: codecs: wcd9335: Simplify with
 dev_err_probe
Message-Id: <168183488500.87933.6599641233526402855.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: YUIWD7M7PNQTQOPLC6BDRXN52O74LMGW
X-Message-ID-Hash: YUIWD7M7PNQTQOPLC6BDRXN52O74LMGW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUIWD7M7PNQTQOPLC6BDRXN52O74LMGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Apr 2023 09:46:27 +0200, Krzysztof Kozlowski wrote:
> Replace dev_err() in probe() path with dev_err_probe() to:
> 1. Make code a bit simpler and easier to read,
> 2. Do not print messages on deferred probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
      commit: fa92f4294283cc7d1f29151420be9e9336182518
[3/4] ASoC: codecs: wcd934x: Simplify &pdev->dev in probe
      commit: 92864de45c3e445419d1e99e3a409469a5f3ef57
[4/4] ASoC: codecs: wcd938x: Simplify with dev_err_probe
      commit: 60ba2fda5280528e70fa26b44e36d1530f6d1d7e

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

