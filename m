Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF48712AAF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 18:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2E91FE;
	Fri, 26 May 2023 18:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2E91FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685118756;
	bh=Wq0/459LQgCKzVhcExDaJx/IJL140NV8zMyWDCNAyys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eypMP1Qo3DoktZZOJ76cdhywuV4bbPtW32xwJ3TzIydEgKR4gzQPw+CSonAljUhMZ
	 EUyOlXiTw6ssd9jNq8pxwZlA44pT1ty3v3+LAUq/HcSkOyjVzui3Xyf+39EjqMkn0M
	 IohqCOpIvMOprb8FV8qPSqep2WOeRGVGDySs2K+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C73F80249; Fri, 26 May 2023 18:31:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C842DF8016A;
	Fri, 26 May 2023 18:31:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 377ABF80249; Fri, 26 May 2023 18:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE1F2F80086
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 18:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1F2F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f1r9Ylp/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4D4261BE3;
	Fri, 26 May 2023 16:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DDDC433EF;
	Fri, 26 May 2023 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685118692;
	bh=Wq0/459LQgCKzVhcExDaJx/IJL140NV8zMyWDCNAyys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f1r9Ylp/MR+OP2Sk4wuk7qHMZzP4Ue+joIbVxlbgeoOUK3uSWgTxSDZQwfjMH5BqG
	 NPFkPym1ileruoiqQGom0c06wRigc9BiVHTwfmIuGPtpcV/J4fg3MER8vjiHYcERqb
	 egGzxHV39ivyE5TkZUTvthj53xkFedsMZxMykl1lr8Wwbjr7yQCIQx11jc5UeVDw+Y
	 5H+9fMWwWJid6t5Ysv++9DGxBf14aZhprJceyKZUeIW32T7QO0W4F79dS/ExXF7B2q
	 1uqAHAlYqJZlsE/MvYl9Xp5dJvDbsB3tvlW+kHOF3JmJxp5bdqYJLno/7gqE1yEFAV
	 jdEePgv98pBzQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230523151223.109551-1-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
Subject: Re: (subset) [PATCH v2 0/9] Add support for IIO devices in ASoC
Message-Id: <168511868876.36455.2854477201745113664.b4-ty@kernel.org>
Date: Fri, 26 May 2023 17:31:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 4UUBJZRXBOCDK5HQAIRAFIEKNIQNP3J3
X-Message-ID-Hash: 4UUBJZRXBOCDK5HQAIRAFIEKNIQNP3J3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UUBJZRXBOCDK5HQAIRAFIEKNIQNP3J3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 May 2023 17:12:14 +0200, Herve Codina wrote:
> Several weeks ago, I sent a series [1] for adding a potentiometer as an
> auxiliary device in ASoC. The feedback was that the potentiometer should
> be directly handled in IIO (as other potentiometers) and something more
> generic should be present in ASoC in order to have a binding to import
> some IIO devices into sound cards.
> 
> The series related to the IIO potentiometer device is already under
> review [2].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[8/9] ASoC: simple-card: Add missing of_node_put() in case of error
      commit: 8938f75a5e35c597a647c28984a0304da7a33d63

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

