Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE79509A4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 17:59:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3762423CC;
	Tue, 13 Aug 2024 17:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3762423CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723564786;
	bh=ksXyluLLYgdlqdn91WjgN2vBXtQGAqRyYBlq8qUlv20=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mdPY8Y2uShvEt6tfnFrWa1J5lljdNaSI3nzOnKNAV/MM7HEX2j/1B/CSewEa6DUGV
	 U9rRPsGAGHqGVImMaKnc92hkzmB1OKKcHW9YlvtsjqfLaUx529W4P5v7a8M+4v/ELG
	 FSpoZfiXlOHd7rA+Zzjosvj2S9LtRd+ai0uevmqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A265F8049C; Tue, 13 Aug 2024 17:59:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2136CF800B0;
	Tue, 13 Aug 2024 17:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE911F80517; Tue, 13 Aug 2024 17:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6BFEF8047C
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 17:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BFEF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pn6iQWG6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 221CA6175C;
	Tue, 13 Aug 2024 14:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB58C4AF0B;
	Tue, 13 Aug 2024 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723560775;
	bh=ksXyluLLYgdlqdn91WjgN2vBXtQGAqRyYBlq8qUlv20=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Pn6iQWG60deVyCYZm963Lp2xMpbZeR0kPmWcgWKo7LfxYQ+CWxjtt+/16wdtKNCad
	 COyvaaCQeDaBBaoUwAQGsGiPIJBAaYMsbYxXDBnn4k+I25PprHtaYNcUirOeZzbjxD
	 YEoNOtrCLyNsm/6qGuYcVZ5DxJWp5NBpa79dR8FUS1eL/ALQ9CQtgTTViGLwcCRxrl
	 Rsm+Zm+uXXQJvTPbKipzzvGc7xkUFn9LDbgWY0tAKFvYUjOW3wTpDLOKlETIvVpaCl
	 3x8Mq3v+72TsvOo0sjiCLyjEhhd4Th9qWyOnG2MNT8n7v0HMmK479ltVBVFDj8g1NU
	 KQ7Lpp6kLVfJw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
References: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm
 sound drivers
Message-Id: <172356077381.62411.63886383103399038.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 15:52:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: KN4XOQ7DYAQRBCCUZT7QOHTCQREQJGO4
X-Message-ID-Hash: KN4XOQ7DYAQRBCCUZT7QOHTCQREQJGO4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KN4XOQ7DYAQRBCCUZT7QOHTCQREQJGO4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 12:35:11 +0200, Krzysztof Kozlowski wrote:
> There was no active maintenance from Banajit Goswami - last email is
> from 2019 - so make obvious that Qualcomm sound drivers are maintained
> by only one person.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm sound drivers
      commit: b919a27fab37e108164d657ac6e77bf870bf95e6

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

