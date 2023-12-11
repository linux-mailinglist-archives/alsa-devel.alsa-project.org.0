Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5180D11B
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 17:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EBC201;
	Mon, 11 Dec 2023 17:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EBC201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702311715;
	bh=VhUeyCzkh5zgAybWShsWIF7CbargN192ExlRAXEqL78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kjl5/iKnRyKghBeX9YJz7UBMvvLdjvFXQbHkU4VsPcTbEPT965dMSDfoKpuVdyJ8X
	 TRF+vliBkS23kTbCHQMKehq0IQxBQE1LiXiD+LF+BD9fgF7fsOcxIhbETNz1ynQ0fi
	 IawH6qUfGY+B4HVjaLSLIl5uXpxGhcDC/MQ1CJmI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECB35F805AE; Mon, 11 Dec 2023 17:21:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D78F805B2;
	Mon, 11 Dec 2023 17:21:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C43C2F8016E; Mon, 11 Dec 2023 17:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AD09F80114
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 17:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD09F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GnCg+LgG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 12243B80E4A;
	Mon, 11 Dec 2023 16:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CE8C433C8;
	Mon, 11 Dec 2023 16:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702311615;
	bh=VhUeyCzkh5zgAybWShsWIF7CbargN192ExlRAXEqL78=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GnCg+LgGTUf3EY6SFnUOmBjJYnYF+M+0wX1+lQzGU0tguyJwJhtTEozqvF5d3GXi6
	 lNAr5zy1iFQ8SEGDC39RTGk/A50uGDK4giOmsROkRinhIIH6RNCi5locCA18O9BLxu
	 ce2f0/ffHJbu/VBe0Y65BUwyRAw6t1duQ0xHLrSfntKl9Srew1ehEe9fGLT32hX8mf
	 koCnzdB0WX9SwAtbN1n65yu8oYaAvsh3Nmb4t/rUhPXg2cRPr57FNDnwA9CnNqRPnR
	 zMfKKfI6MD1TBCP9wbc5vvwTc89T+uA61Df/6bJYtpcExP6aZmUg2tzHxLWkctkR20
	 b6bp+ZmomR1tQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: 
 <20231211-topic-sm8x50-upstream-wsa884x-fix-plop-v1-1-0dc630a19172@linaro.org>
References: 
 <20231211-topic-sm8x50-upstream-wsa884x-fix-plop-v1-1-0dc630a19172@linaro.org>
Subject: Re: [PATCH] ASoC: codec: wsa884x: make use of new
 mute_unmute_on_trigger flag
Message-Id: <170231161312.85457.4028188008468218226.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 16:20:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: PMTTQ25UY4E63ZYIIJ6K32FP5DCEJZHC
X-Message-ID-Hash: PMTTQ25UY4E63ZYIIJ6K32FP5DCEJZHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMTTQ25UY4E63ZYIIJ6K32FP5DCEJZHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Dec 2023 12:40:57 +0100, Neil Armstrong wrote:
> This fix is based on commit [1] fixing click and pop sounds during
> SoundWire port start because PA is left unmuted.
> 
> making use of new mute_unmute_on_trigger flag and removing unmute
> at PA setup, removes the Click/Pop issue at SoundWire enable.
> 
> [1] 805ce81826c8 ("ASoC: codecs: wsa883x: make use of new mute_unmute_on_trigger flag")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag
      commit: 28b0b18d53469833bf513a87732c638775073ba4

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

