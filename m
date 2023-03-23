Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE016C6CB2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 16:54:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6E8ECA;
	Thu, 23 Mar 2023 16:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6E8ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679586868;
	bh=FdHS15So9Ov5UwML5lh/46ZuooLqJDDwXlY+p4s6GWw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SxqTbLcpV4tuQWo6jfMh0NipjJ5t8KDpyHV57z6PuUXZ8pnJBdIwmLwlzJMdovCjb
	 t5eGisOXo8Z5ZPLoPRg9ZBgDIVBuAlwwT1Wj60+O+Eg6vEG+6O6c/XX2tAhGnpRaIR
	 +9vlAQApnvZzmyAsWHXVjzfgAuhGkgJ2Yc7o07Uk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA41F8027B;
	Thu, 23 Mar 2023 16:53:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4697FF80482; Thu, 23 Mar 2023 16:53:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E101F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 16:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E101F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CNGSrs2Q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D01CB82167;
	Thu, 23 Mar 2023 15:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5422BC4339B;
	Thu, 23 Mar 2023 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679586804;
	bh=FdHS15So9Ov5UwML5lh/46ZuooLqJDDwXlY+p4s6GWw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CNGSrs2QzotBEF+17I0Y5+b51GhUySm0eSUNvTgMHB4n9OihqfcOVEMFP6nf5qmGI
	 ynMvvmfJAW2mFYi3wY7vWpCN6pAAXD8Xa2+8LTCzG0thi+Lg5vSHYl+TyW3t++2GpO
	 m9bMWI98WntyjRC4t5aiuzNch7ZZW2+X/gnx0sGHYuOg3s+lFRMUQl/Fo8I2ASWL41
	 Ii0p0CJaz1xq6aLJVwHi6tUYKlsr57s7WrVZccZqOOnwjNlRQeRrQAducIsXOWNgpK
	 F01q12N6DgleqZ/gYdsZe8zFngRL4WJJE656WuNC+rGnlnUlMIzg1ijukzA1ndMIUJ
	 nQ/yG/FnXKFNA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230323110125.23790-1-srinivas.kandagatla@linaro.org>
References: <20230323110125.23790-1-srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH] ASoC: codecs: lpass: fix the order or clks turn
 off during suspend
Message-Id: <167958680207.69273.10837351413048222652.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 15:53:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: YJW3LS2KFW4DKV74ALEIKQHYUVJXJBV6
X-Message-ID-Hash: YJW3LS2KFW4DKV74ALEIKQHYUVJXJBV6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Amit Pundir <amit.pundir@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJW3LS2KFW4DKV74ALEIKQHYUVJXJBV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 11:01:25 +0000, Srinivas Kandagatla wrote:
> The order in which clocks are stopped matters as some of the clock
> like NPL are derived from MCLK.
> 
> Without this patch, Dragonboard RB5 DSP would crash with below error:
>  qcom_q6v5_pas 17300000.remoteproc: fatal error received:
>  ABT_dal.c:278:ABTimeout: AHB Bus hang is detected,
>  Number of bus hang detected := 2 , addr0 = 0x3370000 , addr1 = 0x0!!!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass: fix the order or clks turn off during suspend
      commit: a4a3203426f4b67535d6442ddc5dca8878a0678f

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

