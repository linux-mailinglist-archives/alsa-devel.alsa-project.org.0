Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B17D5AF5
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 20:54:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323371F2;
	Tue, 24 Oct 2023 20:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323371F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698173693;
	bh=vNxqHm+60eB8KhMUh9Gts9QrJudWp0vLSzq/SyPgb9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nfbr6QUQXr7wQEzuhgfcAK90IgL+WOCk5qwKvDSdB1kzc9pVCW5sxcRfcF6JP+C0e
	 X+OajTWX+I4/jHDscvJY9pxXAK3svtzsiCJW1F+sOvi8N3OLzkB9qbo6xBeDOi/T2E
	 W5VWvP5jXvqqZc2bSFfn6w53OA7o+XsTvQQN2UAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9711AF80224; Tue, 24 Oct 2023 20:53:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D170BF8012B;
	Tue, 24 Oct 2023 20:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91711F8014B; Tue, 24 Oct 2023 20:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75DF4F8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 20:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DF4F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Df/Mdjjt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B9E3D61470;
	Tue, 24 Oct 2023 18:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A831C433C7;
	Tue, 24 Oct 2023 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173608;
	bh=vNxqHm+60eB8KhMUh9Gts9QrJudWp0vLSzq/SyPgb9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Df/MdjjtBjHXdzu8gyZCLR+qbzbJ+rtTSIZSmkxrJuNSpYBxu3WiD1mWua8jXuYTl
	 S7MlswdBhgZxOABQlERluVoiEhG2s07j5PNOpBMxYOoD9nbxVq7o1qDiibw3k4DpGR
	 HZ3JO/i5X2bIlX05gD/iuTNuCtnjJBEOZi8mSIIMvonMaRMXMtrfun5n3NpHHWYZhu
	 2pzz/Dpnor4U42UfpytCXIDtPWsYHwlXLQZofYgmzSUs7WxmpY//QPr5Tk1J/3LkoP
	 7hC2rPOa2Di7wY6jzEHP0m4LqhGYWzXOpXdgzYdg8uj8wk43SQmQqkC5dTfOeqaN9A
	 dDPybsgpKbcAQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231008135601.542356-1-jmkrzyszt@gmail.com>
References: <20231008135601.542356-1-jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ASoC: ti: ams-delta: Allow it to be test compiled
Message-Id: <169817360687.82257.16546449649446463449.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: D3E2J6O77FTVWQPARIMIL2UNJL73KCVL
X-Message-ID-Hash: D3E2J6O77FTVWQPARIMIL2UNJL73KCVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3E2J6O77FTVWQPARIMIL2UNJL73KCVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 08 Oct 2023 15:53:10 +0200, Janusz Krzysztofik wrote:
> The driver is now built only when MACH_AMS_DELTA is selected, which
> requires a very specific selection of ARCH settings.  As a consequence, it
> gets very little attention from build-bots, if not none.
> 
> Drop the driver dependency on <asm/mach-types.h>, no longer required since
> conversion to snd_soc_register_card() and drop of machine_is_ams_delta().
> With that in place, allow the driver to be built in any environment as
> long as COMPILE_TEST is selected.  Take care of not selecting
> SND_SOC_OMAP_MCBSP if COMMON_CLK is not selected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: ams-delta: Allow it to be test compiled
      commit: 7790bccd7bac3af28bf044e188215041eb142d56

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

