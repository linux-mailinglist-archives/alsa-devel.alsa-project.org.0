Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC57C038F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC7461536;
	Tue, 10 Oct 2023 20:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC7461536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696963208;
	bh=RnAeWFSPNmSQHUEKF9rxZXSSL3teUWbbpK33kX3hFBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gMsI7W2wy+DHmkKhtGhFipdI3petlNaLhSJzhtjDjOmxJW9XfkZLdjS3LewqUt+jw
	 u7zQw3bg9Wv7k3/j26pGnzWnDXGMkG9+jQFJAZ2Bpxk0fQdUDcqi6uRxrwRMOybTGI
	 URf1fBKwStx+tymVeaYH6JJgb2ceqbShvDtg7Prc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECDE0F80589; Tue, 10 Oct 2023 20:38:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BB9F80580;
	Tue, 10 Oct 2023 20:38:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DE58F802BE; Tue, 10 Oct 2023 20:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8370F802E8
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8370F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I4nNc9A6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89FCD617C8;
	Tue, 10 Oct 2023 18:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A805EC433D9;
	Tue, 10 Oct 2023 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962818;
	bh=RnAeWFSPNmSQHUEKF9rxZXSSL3teUWbbpK33kX3hFBo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I4nNc9A6QFniBKbFcoU3DvS20HkPLYMnCjiWvfbKGKmPhSAJHVQ2r3TsoSVea97pL
	 qfzVQ5dSZRIx6O8Q9Mwq7FIbH/FKAvkk4evCHHhStITbzFHgwDiqv5d2t0258agKX/
	 bV69x6ZzLgMuiV2HpinwM8eyp0/ZoqF+aNP8UKLglSf4w7wozEyG35bJ+CEOknA4tD
	 rcxeFvExYkryZqbHd1o3rD6F8hgqTftp1K4eoX5IM5rLITTELQp8EyDGCFuSIldbkR
	 mDHiEVtJ9NKisTRyI8gnXe9uEQX5FNz4cNMEi/LT+iV8Ecb2BlaY6jyyeKBjw4Op0f
	 5wSYlj2bFIvxg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20231010102425.3662364-1-ckeepax@opensource.cirrus.com>
References: <20231010102425.3662364-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: cirrus,cs42l43: Update
 values for bias sense
Message-Id: <169696281640.221758.6369087889872245460.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: G6UMQUNFYGTXMFKZDBJFH4CGT64ZQHJX
X-Message-ID-Hash: G6UMQUNFYGTXMFKZDBJFH4CGT64ZQHJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G6UMQUNFYGTXMFKZDBJFH4CGT64ZQHJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 10 Oct 2023 11:24:24 +0100, Charles Keepax wrote:
> Due to an error in the datasheet the bias sense values currently don't
> match the hardware. Whilst this is a change to the binding no devices
> have yet shipped so updating the binding will not cause any issues.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values for bias sense
      commit: 53ba32acb5ab137ba333c20e0c987bdd6273a366
[2/2] ASoC: cs42l43: Update values for bias sense
      commit: 99d426c6dd2d6f9734617ec12def856ee35b9218

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

