Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A758C7086F9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 19:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E78C208;
	Thu, 18 May 2023 19:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E78C208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684431183;
	bh=WfV7ZgvpIey0LYxW06z/T5cWU/5jL9R1xH3vlu9ii8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YwgmI5vkOM5zdKzEEkG3aTtVzvSNY5iVHApAaAv4Sw6pq3y5k1MRv9g21bEtc1l0R
	 z9Wy6L++7w+zri3W44uO+nqLcvJ6x1Tcf1iWai69Wx2avOeTimR3SF5mZWnmVG5MzE
	 22jfZA5SAI1ooWPe1ukm5x2fCjXKaySo+Lpk7bT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAE65F8055C; Thu, 18 May 2023 19:31:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39FA1F80272;
	Thu, 18 May 2023 19:31:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F5ECF80272; Thu, 18 May 2023 19:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1831F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 19:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1831F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=az9TF+/K
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1BF9065139;
	Thu, 18 May 2023 17:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9E0C4339C;
	Thu, 18 May 2023 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684431069;
	bh=WfV7ZgvpIey0LYxW06z/T5cWU/5jL9R1xH3vlu9ii8A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=az9TF+/KVLHKlYUouCys4Vph9kfks1mbLHq2Y5GlKi2+APOVJ4wnc28oUxZiY4uPj
	 J/+Vj3YVtrBuwTUuLo/a3mVsLzY89KP3b4QNMmmc0QvliiMIr0sPWQkfrbVSzotDX8
	 aKnajMuO4g40ohcFtvKHPh+DlYwflEXYZ3Ta9Qg0iiGaTEpu6S7OLOo1xnRZQ7uDAd
	 QwXrZi5OU6Ukd86B94oRSxpEdJ4JsfTWC69VlYbTxXkvrAzsAQgT0HFFrYbf3B7Lr4
	 7JheKv/0vSxWWKmmWs9u/mpNtWxPm1CgxDhds9QQ7SOYCcCeu/f5IsW5qtgeNg9N2Z
	 Bl2LIHNWSoy+A==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Stephen Boyd <swboyd@chromium.org>,
 stable@kernel.org
In-Reply-To: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
References: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
Subject: Re: [PATCH] SoC: rt5682: Disable jack detection interrupt during
 suspend
Message-Id: <168443106667.480335.17640741139485759385.b4-ty@kernel.org>
Date: Fri, 19 May 2023 02:31:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: RDAFHMLA3W2N56PRZQ7XQTSP425BGQYT
X-Message-ID-Hash: RDAFHMLA3W2N56PRZQ7XQTSP425BGQYT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDAFHMLA3W2N56PRZQ7XQTSP425BGQYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 16 May 2023 16:46:30 +0000, Matthias Kaehlcke wrote:
> The rt5682 driver switches its regmap to cache-only when the
> device suspends and back to regular mode on resume. When the
> jack detect interrupt fires rt5682_irq() schedules the jack
> detect work. This can result in invalid reads from the regmap
> in cache-only mode if the work runs before the device has
> resumed:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] SoC: rt5682: Disable jack detection interrupt during suspend
      commit: 8b271370e963370703819bd9795a54d658071bed

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

