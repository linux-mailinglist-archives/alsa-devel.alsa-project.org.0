Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA78919893
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 21:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5FFB1930;
	Wed, 26 Jun 2024 21:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5FFB1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719431616;
	bh=rNDLMS+vya2aLaa8DFgO3Tum00J0/6sLmaarSdgOpGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P+elHyeur/mF/KvrSjLs/PCsXtJh+7yzofSe0o/9gNEW8a3U5KAkOyY4EXUAuF8c2
	 G/Yi1HxfJPfqLFBhiS3o3PsYCFdgZPuT9vaUVGO82N5tAgM0IbwN2D5qqKWsuUvWil
	 moOge8TK3054Fdbv9W88fp7wTxUinDtExw2wayTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02803F805B0; Wed, 26 Jun 2024 21:53:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFA6F805AF;
	Wed, 26 Jun 2024 21:53:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57C89F80495; Wed, 26 Jun 2024 21:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 216ECF8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 21:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 216ECF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aCnsA5BE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5AD761B1D;
	Wed, 26 Jun 2024 19:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A11C116B1;
	Wed, 26 Jun 2024 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719431567;
	bh=rNDLMS+vya2aLaa8DFgO3Tum00J0/6sLmaarSdgOpGg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aCnsA5BEAvrQdzPkI3MIGW6fne4PO2OA9XFxxXSnK1lduqFfzP6YBFZ0jbc0iOK4O
	 17F3NPUunj9X8cpC6aPJV7p6iH34hZ4b6wk7bSKkzGtVF3SG0popNge1rv0Ezjsxdv
	 mr1MDu3CyOfLLmCxMlx6fUvUFk/96KI9LHB02S63ZwojuhmoatyZ3oAdn3gKsHxbNU
	 rZEr6ZYfys61gPuW3pG+Ww0eTKb/7j+ZPQBDwG7y4Rqs1+z48/Hn2ooLJgvZo8O+QR
	 bZHf47PvWo0wMkXfAR2BOne+E1GIRpEcXAGPUa8D+L1seViOogfiN1ROl7hSlvbkDI
	 DGjDmlmU9tdqw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
References: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop
 minItems for audio-widgets
Message-Id: <171943156536.1690751.17356861338866008648.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 20:52:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: TGTYABV4FPAB6K5FT6GNSLAWO5MP6KRS
X-Message-ID-Hash: TGTYABV4FPAB6K5FT6GNSLAWO5MP6KRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGTYABV4FPAB6K5FT6GNSLAWO5MP6KRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Jun 2024 11:40:51 +0200, Neil Armstrong wrote:
> Like "audio-routing" drop the minItems: 2 from the "audio-widgets", because
> any limit here - lower or upper- is rather meaningless.
> 
> This will also fix `dtbs_check` warnings like:
> sound: audio-widgets: ['Speaker', '7J4-14 LEFT', 'Speaker', '7J4-11 RIGHT'] is too long
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems for audio-widgets
      commit: 4faed8ca581c0307af4a58e6c0027ce2b2cbd5d3

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

