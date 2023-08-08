Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E108774334
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 19:58:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E48E84C;
	Tue,  8 Aug 2023 19:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E48E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691517536;
	bh=uHvpznl0LP7uiwltab4V4SdVSeYHVaAfEQuMs85B9yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KnVHsb0lZOb+tqNCT1YMWwiwRJP2ZpI6NeBKbwn5rJHGzz8y3zLyD9l15sd1yeRMJ
	 NbVC35KaU8q9lIR5UbcIeAEkx0VnjiDPTIAq6o6FAYEkE7RgrXdxyfnaHB93T91vew
	 QrFnM6GTSPB5IQGYC0rLqdREq0bZKUCSEgQK06U8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC6F4F80578; Tue,  8 Aug 2023 19:57:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27150F80578;
	Tue,  8 Aug 2023 19:57:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45CFDF80564; Tue,  8 Aug 2023 19:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 466A8F80534
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 19:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 466A8F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GoM7IeJp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35B506293A;
	Tue,  8 Aug 2023 17:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E3AC433C9;
	Tue,  8 Aug 2023 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691517426;
	bh=uHvpznl0LP7uiwltab4V4SdVSeYHVaAfEQuMs85B9yM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GoM7IeJpvrztOcDwFg66Hgl55kUFV1QpDaESjTuHzcHwjDMaAi5eX+oop440aF50n
	 sazM597gcjHnRwypSNsAogaEiwGgOsG/kQKNghN3e0zg9/S6BeAdlFjozjEPB+1Oaq
	 CrykA2/LGxfm0JXjENEVzC7Io8rkh15x2+laZb31UqDB1T0xbJVGYg7EvXcmkzZQMi
	 Zv/InmEepdIjNN9+giea7EUtudn7JlFNXkxUZVA8Yne80PYN28McpVS7NECirY/p50
	 gSkx2FFg/K2bowQLRh6L63zrX+OeYoyiHDAnps0jQZlbcblsoQaFzH7VAEYGZc+i4T
	 dzXkPeyEMmW6Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20230805162216.441410-1-alpernebiyasak@gmail.com>
References: <20230805162216.441410-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp3x-rt5682-max9836: Configure jack as not
 detecting Line Out
Message-Id: <169151742431.78353.7016590322365439084.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 18:57:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: UA6L74B7HAWB6ZNA6FYC3VYO5Z5PTDUW
X-Message-ID-Hash: UA6L74B7HAWB6ZNA6FYC3VYO5Z5PTDUW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UA6L74B7HAWB6ZNA6FYC3VYO5Z5PTDUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 05 Aug 2023 19:22:16 +0300, Alper Nebi Yasak wrote:
> The RT5682, RT1015 and RT1015p codecs used in this driver do not seem
> capable of distinguishing Line Out connections from Headphone, but
> the driver configures its jack object as if it can. Remove the wrong
> value from the jack creation call to avoid any confusion.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp3x-rt5682-max9836: Configure jack as not detecting Line Out
      commit: 94c40dbbffa11bec54b5ca74df1c5bb0f52995b9

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

