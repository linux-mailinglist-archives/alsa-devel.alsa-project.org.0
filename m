Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D982368D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 21:25:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E74E99;
	Wed,  3 Jan 2024 21:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E74E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704313542;
	bh=7vxiVQamR3pRKvlcOZeP+eFNosrKWWV5Djb3Z0x4Wa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wnj10VDM8Siu68KC50hAijRXsoU9EGOEpIvu3zM6gj7Jh/ogxsJiVbk8Z45b2t7OZ
	 Sz9gSHS48KofUf1mvTYk93OiF3Jsai79Rl4vvjMu56/cjqTQshuhc8eAcXHMhe9xft
	 s3gMhtKr/hsxMLZDP2HHnOIWV09KLaUjhrFzSMSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 394E5F80580; Wed,  3 Jan 2024 21:25:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB34F8055A;
	Wed,  3 Jan 2024 21:25:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A2EBF80537; Wed,  3 Jan 2024 21:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FD44F80086
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 21:24:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD44F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UsfZ5GLY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 38AA4615BF;
	Wed,  3 Jan 2024 20:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DDEC433C7;
	Wed,  3 Jan 2024 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704313495;
	bh=7vxiVQamR3pRKvlcOZeP+eFNosrKWWV5Djb3Z0x4Wa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UsfZ5GLY4QmiNBLcKHbUuoGVupm7p8Kps4Q30yw/O78ZuO1Rp+Nk0o4JmditS5dAC
	 EpZKGZLk3FPOk/mDj2JbHjPPdXTeD/EeT2GC9Kyyq2xFbrJD5jlz5c+gfXTsTTv1ge
	 L2Zpc5ldsfTj2lMupkyHNhu4tH0KGt8U+XGjyu0xqjZXomchIQ3PsMKHo1F91+EkPO
	 Ca8xH1Bg1TSSQlnum6PqcpK6Hy5gbbGd+qE+cwprYoDdTzDWwSArztU8rVJZ5AplRj
	 1YnPmqBKB6NGZKEHMuZIu6+lWG5uuhUOA/4l2BKL5JKLFpaKUZsXgrF206ZqZ9pO/U
	 MNllPsFqa+A2A==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: meson: Fix issues with LibreTech Saphire
Message-Id: <170431349265.3159626.5476717975051420559.b4-ty@kernel.org>
Date: Wed, 03 Jan 2024 20:24:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JFWXZL736BFNGJARDOFTAQS3YIHTZQAK
X-Message-ID-Hash: JFWXZL736BFNGJARDOFTAQS3YIHTZQAK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFWXZL736BFNGJARDOFTAQS3YIHTZQAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jan 2024 18:34:00 +0000, Mark Brown wrote:
> This fixes a few issues I identified when integrating a LibreTech
> Saphire (based on S905D3) into my CI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: g12a-toacodec: Validate written enum values
      commit: 3150b70e944ead909260285dfb5707d0bedcf87b
[2/4] ASoC: meson: g12a-tohdmitx: Validate written enum values
      commit: 1e001206804be3f3d21f4a1cf16e5d059d75643f
[3/4] ASoC: meson: g12a-toacodec: Fix event generation
      commit: 172c88244b5f2d3375403ebb504d407be0fded59
[4/4] ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
      commit: b036d8ef3120b996751495ce25994eea58032a98

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

