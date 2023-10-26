Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E217D85B7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F18A4C;
	Thu, 26 Oct 2023 17:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F18A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698333239;
	bh=TI0/EViWn+QYi6nNh367rfBcGpgqIjH1+F4SEmPMVXo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eLQH2Krj42pNyE6fS+TLpUUwNhqcyWCuaj9snIppG0TIcE74YqwmRmKxnTdWNlTZk
	 eHViDKfX5Npz6JHPKKNJrjuV1B2cwLPbM54Ga6j2K3+8gB1CF62/Egj2A1gwxPDJaV
	 iXewrOLDjB6TcORUh0PRADpYBCWTKAs4k00XXk9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18662F80557; Thu, 26 Oct 2023 17:12:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE233F8055A;
	Thu, 26 Oct 2023 17:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1A6FF8055B; Thu, 26 Oct 2023 17:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 283A9F80558
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 283A9F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RTAuC68C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77BF6CE2102;
	Thu, 26 Oct 2023 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124EFC433C8;
	Thu, 26 Oct 2023 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333134;
	bh=TI0/EViWn+QYi6nNh367rfBcGpgqIjH1+F4SEmPMVXo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RTAuC68CAyw810g+HHd7082URkfHzlAoB7K9N0r+Ru9YrD3GfZgYCAnb6XW2kv0Nl
	 BXYuEdJ8M29jGohBpmVqV51t8AOH5rnPTb3gNHsrmhniAOhAX62GKbtFZvnMh0X+m+
	 B/vhsYa4vpxY8ZFXpb72NI8Gzj+S93tN0HBaeNeYhR6hKsR2UaxkZHROoCyYyNdc7T
	 GkgknSV+M6F9Qrwv6i7qeaR0byCgDO4au34byi30hyUsnaCPeEpDCQzccf7Ha76P0r
	 md14bdq0BeXcXp+kyqkKiyr6DNNnhtcTUW46CPP9yAV0POgj5yBH+LCp84yzkhIysM
	 fbmsVEs1o6LTg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231019144108.42853-1-krzysztof.kozlowski@linaro.org>
References: <20231019144108.42853-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: use defines for entries in
 snd_soc_dai_driver array
Message-Id: <169833313276.133649.3664120134410239820.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 16:12:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: D5ACBHARGSMGIBZQFNTXEQWULCOAQJJY
X-Message-ID-Hash: D5ACBHARGSMGIBZQFNTXEQWULCOAQJJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5ACBHARGSMGIBZQFNTXEQWULCOAQJJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 16:41:08 +0200, Krzysztof Kozlowski wrote:
> snd_soc_dai_driver array in wcd938x driver has two entries whose order
> must match order of wcd938x->sdw_priv array.  The wcd938x_bind() and
> wcd938x_codec_set_sdw_stream() rely on this order.  wcd938x->sdw_priv
> array is indexed by enum with AIF1_PB and AIF1_CAP, so use the same
> defines instead of raw numners for snd_soc_dai_driver array.
> No functional impact.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: use defines for entries in snd_soc_dai_driver array
      commit: 7618ab524935667699afed76fb83bc9bb38710ec

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

