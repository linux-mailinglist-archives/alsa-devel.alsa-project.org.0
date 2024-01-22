Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0AC8375A6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 22:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA55DF8;
	Mon, 22 Jan 2024 22:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA55DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705960534;
	bh=4Bz1DD90hbSr+QDM9o6ei83T0CBo8SWVx1b2kI4unKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lqF567jbE2DB6+G+9713EuDIubJbPvtpTT69d5/+JlAU0w7W8+4Bz0Ws1ME4gWncL
	 slfSKyXEaSt1K2u/Y8asQcq/ja4Nwgq8u5G/P/0mT7y1W96EL3LvUXNEMp5YTOnCjR
	 6ZW5SsEIF6zEV8AhC8+omT5Ot5rRThTKHObPbEZs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4692F805F4; Mon, 22 Jan 2024 22:54:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C33B3F805D7;
	Mon, 22 Jan 2024 22:54:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD55F8025F; Mon, 22 Jan 2024 22:54:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD7A7F8028D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 22:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD7A7F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SOEkwOQI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F5B961B0B;
	Mon, 22 Jan 2024 21:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6B7C433C7;
	Mon, 22 Jan 2024 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705960458;
	bh=4Bz1DD90hbSr+QDM9o6ei83T0CBo8SWVx1b2kI4unKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SOEkwOQIN1dYHbkNB3myXMNJEhBKc3YUqOCR9vip3DqnSpcgpcH1rAt4RCMqAWG9X
	 y5x/2qKyui1xbBzG1xCsy6igPtTiitq/jW5atXchbWcoPg9f6BOd93HlD+bka5ipcU
	 x7sA15g5iIpdLj8+tr5hFRdMX1JCEQ55tptqTzYIW41AcE4Zsk9Km4hbGoNEKTT+8L
	 9APIss2jLIx9QVetrAv1jWoDR8G6l/Sgkk6jVdHHSPsRlIkz7vsxIfwNzmWDxSMmdX
	 vhpb4/qokfGY0Pn0o/54HdJI329fVknYf8/LP8RR8T+m/EE2ea4JSY6x6NMt9kbrJX
	 mLc0gN1p1N6iw==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240122181819.4038-1-johan+linaro@kernel.org>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH v5 0/4] ASoC: qcom: volume fixes and codec
 cleanups
Message-Id: <170596045583.161959.6600754837297158632.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:54:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: LYXTR4OJCG6JW27HL2MEWV2H6MK3BXAD
X-Message-ID-Hash: LYXTR4OJCG6JW27HL2MEWV2H6MK3BXAD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYXTR4OJCG6JW27HL2MEWV2H6MK3BXAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jan 2024 19:18:15 +0100, Johan Hovold wrote:
> To reduce the risk of speaker damage the PA gain needs to be limited on
> machines like the Lenovo Thinkpad X13s until we have active speaker
> protection in place.
> 
> Limit the gain to the current default setting provided by the UCM
> configuration which most user have so far been using (due to a bug in
> the configuration files which prevented hardware volume control [1]).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/4] ASoC: qcom: sc8280xp: limit speaker volumes
      commit: c481016bb4f8a9c059c39ac06e7b65e233a61f6a

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

