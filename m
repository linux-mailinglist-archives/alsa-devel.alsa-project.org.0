Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696967F75B
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 11:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA08868;
	Sat, 28 Jan 2023 11:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA08868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674902957;
	bh=yyt4PvyYhxxot5o4TpwTNwQN8G6kIpJP0IpgE2Z2nV0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dz/ei2cBwZPu+32IVBoNWeT7+rAgL3R3wCnDKey62nsdHaflaqKhkkYJ6T+zj2GX/
	 LOUU7b0rkz3TQRrCCa/IzX+Y4ZQQILmD7+dPaRrRl3pnAGEc7ROumqI8SJU2l/kbKN
	 x7kc8BTO+icsqoRRhsKaCTu9ZAXVkpNgk985RpDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B3FF803DC;
	Sat, 28 Jan 2023 11:48:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05FABF803DC; Sat, 28 Jan 2023 11:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2883DF8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 11:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2883DF8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xx14yu5u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4DFC360B39;
 Sat, 28 Jan 2023 10:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520A9C433D2;
 Sat, 28 Jan 2023 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902883;
 bh=yyt4PvyYhxxot5o4TpwTNwQN8G6kIpJP0IpgE2Z2nV0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Xx14yu5u5OpIVGLUsOd8u2qsotoJJJQJdJBboaPGS+5asPKMyJQa5zW/r2J3KrgxG
 4SCkusxAJQEnAMdDjvXrsgtP0NZTU0cACRFTwVX5+AnvhVqimNoZCLNLjjtkUp8ASd
 yvIZWI1Ou+odpvfsBDS3PhX1SzUt90tP9g6eRdbm8sWt5gSPsvK6sv231qk8L3DTvs
 2NRATlrrSoh3wT0o5pR+72L4mxPF312KuWFYvngM892dOAfWEWwdUmPjBTZHjnRPRW
 jSEL04s2xq754OTkEWf+HHvo1KBzw62f5hZ0xTpUQxykzkXhlx9hSUdoxUJ9a/4Kqv
 DekHkMiOlgpNg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, tiwai@suse.de, lgirdwood@gmail.com, 
 pierre-louis.bossart@linux.intel.com, cpgs@samsung.com, 
 =?utf-8?q?=EA=B0=95=EC=8B=A0=ED=98=95?= <s47.kang@samsung.com>
In-Reply-To: <016401d90ac4$7b6848c0$7238da40$@samsung.com>
References: <CGME20221208051818epcas2p122a0ce58691ac70d8a77b5e922e81fea@epcas2p1.samsung.com>
 <016401d90ac4$7b6848c0$7238da40$@samsung.com>
Subject: Re: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Message-Id: <167490288202.2145828.17434688245122287609.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 10:48:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 08 Dec 2022 14:18:18 +0900, 강신형 wrote:
> If panic_on_warn is set and compress stream(DPCM) is started,
> then kernel panic occurred because card->pcm_mutex isn't held appropriately.
> In the following functions, warning were issued at this line
> "snd_soc_dpcm_mutex_assert_held".
> 
> static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
> 		struct snd_soc_pcm_runtime *be, int stream)
> {
> 	...
> 	snd_soc_dpcm_mutex_assert_held(fe);
> 	...
> }
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress: Reposition and add pcm_mutex
      commit: aa9ff6a4955fdba02b54fbc4386db876603703b7

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

