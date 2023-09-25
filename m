Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834B7ADB8F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 17:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A557A4E;
	Mon, 25 Sep 2023 17:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A557A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695656085;
	bh=UStx6NmdCQGQvwmGC5D2pyQnQNmQ94Ptm9hxFlXeGEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NI5IQMHBtPV9VyIPqMy/p2EY/lGdjXhsLoYlJ2i/n9A2VE/XCPGS6Xmlno6vM8402
	 uMBUFS3X9B8kddNC7/JNRrP942bF6qJPcRAwZiy7sXXnh39F0M/UIGe6OKvui3lXOK
	 pR9TM4VNuDrGlrM0Y/rT9p1XOShjn+NaCIAnfyqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69C15F80564; Mon, 25 Sep 2023 17:33:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C00F8055B;
	Mon, 25 Sep 2023 17:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A57F8055C; Mon, 25 Sep 2023 17:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AE73F8016A
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 17:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AE73F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uP+xAwOG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9525DCE10C2;
	Mon, 25 Sep 2023 15:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F977C433C9;
	Mon, 25 Sep 2023 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695655982;
	bh=UStx6NmdCQGQvwmGC5D2pyQnQNmQ94Ptm9hxFlXeGEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uP+xAwOG82qTikxi0069W+JuYphMTlWTHxLVC58LB1BAuPZUl6oH6DesK73QurFeA
	 tauJcd/mXvaI65NrsdCkWfRzGjWirYkI3XlZIbN1J9jgYEtRfrwhRE11nsYn7ZsQgQ
	 aCVoZqRyHH8DpTOF+CfaJchUVy+/Q326hEen0J4ahfmnAQ0MCsy/lcMNThJNQ86uef
	 Qxv1lELjU7Y+3VUzvXAU/PNl9kJQYfLoCIfZCOf9UYPtwil4Jlh4XJ58E58i0Ek1dA
	 4mMA6W0O771IVk3e8c79TfXUM+WM5zY795KbrwPHPFL6KNjn0v4szrTemOzb/5rn0n
	 4RaXvbVXfCwIA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <1c0090aaf49504eaeaff5e7dd119fd37173290b5.1695540940.git.christophe.jaillet@wanadoo.fr>
References: 
 <1c0090aaf49504eaeaff5e7dd119fd37173290b5.1695540940.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: audio-iio-aux: Use flex array to simplify code
Message-Id: <169565598128.2480451.10167343100025422485.b4-ty@kernel.org>
Date: Mon, 25 Sep 2023 17:33:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: LHH3EPEQD5VJSFFKEXDUPHTJOCR67ALI
X-Message-ID-Hash: LHH3EPEQD5VJSFFKEXDUPHTJOCR67ALI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHH3EPEQD5VJSFFKEXDUPHTJOCR67ALI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 24 Sep 2023 09:36:01 +0200, Christophe JAILLET wrote:
> "io-channel-names" is expected to have few values, so there is no real
> point to allocate audio_iio_aux_chan structure with a dedicate memory
> allocation.
> 
> Using a flexible array for struct audio_iio_aux->chans avoids the
> overhead of an additional, managed, memory allocation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-iio-aux: Use flex array to simplify code
      commit: c351835058419c1eb8791941a057c3f3e6068cb6

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

