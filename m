Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7456ED2C2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 18:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E860FA3;
	Mon, 24 Apr 2023 18:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E860FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682354679;
	bh=9Au3JNyAgw52Zk4E5F8PDi85xXM6ynTX7QFchRV56F0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q1Nj2/i+xnwVnAVJZx5+fEsOLtp8U40a4xu/7062gwEeenAFvzbs6NGhGgdv3PwmC
	 DChpA15KzGqE1Im//5ssTJ1VfDI0aKAqSP78ozxtqnfWSIDGNtKXLI5wgGYj1N84TC
	 ppSOVRZRqRPRDa1S9eWx/1tCn8tG+annbRuG1u0Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0DA0F8025F;
	Mon, 24 Apr 2023 18:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86853F8018A; Mon, 24 Apr 2023 18:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EAA0F80162
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 18:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAA0F80162
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fCXLDHR4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AB5161E56;
	Mon, 24 Apr 2023 16:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3901EC433EF;
	Mon, 24 Apr 2023 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682354568;
	bh=9Au3JNyAgw52Zk4E5F8PDi85xXM6ynTX7QFchRV56F0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fCXLDHR4gGKOTQTd0BMOtgmV228SE4EzxnJvigMLz2xGWj3JpkNq+ALYdEvPOx7iO
	 5h3XnmxndfU5m0GRDcXBQtWH9DhZTdS4Oaz3Nssh4sRZn930ZIld15ST6lqn2vG7zF
	 BcM6bvx5TreMHjbBA8OaLN8becgXklClfTAPWlGn3WE3ThuDUgzRVTCELlPh40k0Nl
	 dsKVY8kK/5oLSEhPPI9dKg7tOr94/fI+f1GlRMLkzZxa1Oy1Z4U6bteT0CJqjNZs1e
	 D3YCn24olVj/8QsF8a6LicXUJmY/a5GHzjg92kolbbAcpeW7S88glORRhlKZBTjl6O
	 gx9kS0sKiNyFg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20230421211950.20972-1-fido_max@inbox.ru>
References: <20230421211950.20972-1-fido_max@inbox.ru>
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
Message-Id: <168235456595.139006.13916654169825783115.b4-ty@kernel.org>
Date: Mon, 24 Apr 2023 17:42:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: 6LM5AXMABRB23VUWV7MSIKXJHK5YFW2E
X-Message-ID-Hash: 6LM5AXMABRB23VUWV7MSIKXJHK5YFW2E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LM5AXMABRB23VUWV7MSIKXJHK5YFW2E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 22 Apr 2023 00:19:50 +0300, Maxim Kochetkov wrote:
> There is no way to select max98090 from menuconfig right now.
> Add a Kconfig menu description to allow building the driver standalone.
> It will allow this codec to be used by any other I2S master without
> adding extra sound card entry in Kconfig.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98090: make it selectable
      commit: 9e868ca1f269dec9f2062bb8de42b8a94773924e

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

