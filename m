Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716F96E695E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8670BE94;
	Tue, 18 Apr 2023 18:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8670BE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681835001;
	bh=sEurxhubJV3nON51IQZqLGOw26j1V6FgvthN0k69le8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pOo7GfIi2KaE+i4wyiHimtqSuiBJ5pIV9eHhr4NJfXEiDIqExyp5/lw2hcbJqE4kH
	 J4nZmF0YLrVwi/VqGsMZiWGTUo3Om210ocl8KU9a7fUhxX7J9yYbAVfDwsPPlIx10U
	 zn2yWKO8/lJKQZMd+QH0TidDf+n0qscRoyN68xdY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA80F8052D;
	Tue, 18 Apr 2023 18:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E071F8019B; Tue, 18 Apr 2023 18:21:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 73637F80212
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73637F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jfBEGMl5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52B0B63670;
	Tue, 18 Apr 2023 16:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A19C4339B;
	Tue, 18 Apr 2023 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834889;
	bh=sEurxhubJV3nON51IQZqLGOw26j1V6FgvthN0k69le8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jfBEGMl5amAy07pYzf66+W/0cbQfqJp+8j9IGzcAsovNiuHUmS7UZV4kZ1U6UHVPS
	 qrhYixAKvS93OHrIjNL+Bykm2oytk0oCezCJNMxKw8BOT6sEq0JFblpYtAoNQQz82q
	 fTWJ5gYVG3BAHnBgR2slYPgYkrcwNLbYWFGwIFXyOt4ReXUD7s2lDTdjh32L/CPOJb
	 B/W+QIVxu1DA54PMzXHCoyAphlCpx+pd7cwMukS2z6y80iu+Hto/7+nsmXzONuKurT
	 SNKJ3cKo52auL1Jzj+0c9Ki7dn79r2Qn2Avc7VzIlm9d9OwWzgq1BPLCmYBqKDyt9H
	 LD8FRoAMqHnYQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/4] ASoC: codecs: wcd9335: Simplify with
 dev_err_probe
Message-Id: <168183488717.87933.2105607240342604934.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: ZSYJXSGY5VOBESZRK73QGKG3TLZ5U5X2
X-Message-ID-Hash: ZSYJXSGY5VOBESZRK73QGKG3TLZ5U5X2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSYJXSGY5VOBESZRK73QGKG3TLZ5U5X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Apr 2023 16:14:50 +0200, Krzysztof Kozlowski wrote:
> Code can be a bit simpler with dev_err_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wcd9335: Simplify with dev_err_probe
      commit: 67380533d450000699848e292d20ec18d0321f0e

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

