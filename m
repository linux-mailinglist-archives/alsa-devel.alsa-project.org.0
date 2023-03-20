Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41976C1FC5
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51DF81EF;
	Mon, 20 Mar 2023 19:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51DF81EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679337226;
	bh=1k2HdZd7GXcK9Rf8Iw4VOgSYsoDP5B0+bCp15WVe8Ss=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ejXA5Vi6Eyk8Nrc+hN5gWQdyQYxvx6ZPvjPZqS8fIabdfY4xRnmKKu21lJq/Ggx+W
	 LKwhWXWL6zgVVt65z1/cgXS4IaBnsSmHwCmfc+sS1lRBZnGVJXmuUM1NcFcdtPD0TE
	 2if7OFnR2abikWDhgwuXwN+e0MeR+JCUM7iscXec=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD1CF804FE;
	Mon, 20 Mar 2023 19:32:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 356ABF8027B; Mon, 20 Mar 2023 19:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC73EF800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC73EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tm7liQ/n
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3BF6179A;
	Mon, 20 Mar 2023 18:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47034C4339E;
	Mon, 20 Mar 2023 18:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337111;
	bh=1k2HdZd7GXcK9Rf8Iw4VOgSYsoDP5B0+bCp15WVe8Ss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tm7liQ/nAFkV3CyP8a5RNECtveLtuaotxTZ21TXsgIzjk1jw7OqCcVuv5NSZClLep
	 A+YM+EoDWvAq/odu/8f8PeyGDE0GTZ7mII3jhBhwbOwFwfve8X9bPGiPxOZYoicIRJ
	 20oCl/tDXbBYel8S0o+06wWKtlPcbSkhLyu5fEfx2owYwn11EaGWcMfhLn5S7E4/+M
	 eqQBsPmIEofHdZei6aya7XgzWnYrNqKzbu9V9UWiKA/U6KKAnVB4hg8gyW270SN6hT
	 105QGLl+bxcHLDrriY5dCPHD1av/R5D9e7OdcgqJJYlemAvgytJV6awT6gwaLTENb6
	 zrw/M/zLSUxFA==
From: Mark Brown <broonie@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
Subject: Re: (subset) [PATCH 00/11] Enable I2S support for RK3588/RK3588S
 SoCs
Message-Id: <167933710700.198283.8153226214101331490.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: NY2L5WAHUPKKBIUYBPZZQ6AOQHUZ2AV7
X-Message-ID-Hash: NY2L5WAHUPKKBIUYBPZZQ6AOQHUZ2AV7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NY2L5WAHUPKKBIUYBPZZQ6AOQHUZ2AV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Mar 2023 13:47:55 +0200, Cristian Ciocaltea wrote:
> There are five I2S/PCM/TDM controllers and two I2S/PCM controllers embedded
> in the RK3588 and RK3588S SoCs. Furthermore, RK3588 provides four additional
> I2S/PCM/TDM controllers.
> 
> This patch series adds the required device tree nodes to support all the above.
> 
> Additionally, it enables analog audio support for the Rock 5B SBC, which has
> been used to test both audio playback and recording.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/11] ASoC: dt-bindings: everest,es8316: Document audio graph port
        commit: 2f43ef99ac623b6d9154c26d4f6785df18b4d8e4
[04/11] ASoC: dt-bindings: rockchip: Document audio graph port
        commit: bf4062b7420d01b4fafd7211fd2dc68b916591bd
[05/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document audio graph port
        commit: bfbae373c55e3b1c15a6ba656211dbbe7c390aa1
[06/11] ASoC: dt-bindings: rockchip: i2s-tdm: Document power-domains
        commit: 9971f3358338950d9d3345184fb2c0cfc6fc8552
[07/11] ASoC: dt-bindings: rockchip: Add compatible for RK3588
        commit: b0fe6a91fa9d5599ba3cace2748906e086c5a56e
[08/11] ASoC: rockchip: i2s: Add compatible for RK3588
        commit: 0e6c37610934e9b91f6f5f2599de5e2f1ab59e72

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

