Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D27A77BE9B7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 20:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E63ED9;
	Mon,  9 Oct 2023 20:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E63ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696876702;
	bh=OvUCm/3E4vQGGxaOWPx5pkG4KYY+4a8QMGU5u5En9VM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=irFDgoFv9YXKmVd8YDQBdq7d6+IJ9LeLGtaPYzbc3iMqi96FkODk9fN0M9XCUj5UO
	 bjZDbKrSP1b/U+23jjfNYp68KH6ybMnYdgIrLk0QdGwrrpW/WYjhs4gTQ8T0sqAGMb
	 kry07d1f/WL82sAORyfsqLFDnMGOQYUd1EYJn9GA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ABEDF8057C; Mon,  9 Oct 2023 20:36:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 195D8F80578;
	Mon,  9 Oct 2023 20:36:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81107F80536; Mon,  9 Oct 2023 20:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB1F3F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 20:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1F3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h8UU138Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E90BCE19C3;
	Mon,  9 Oct 2023 18:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24CFC433CC;
	Mon,  9 Oct 2023 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696876580;
	bh=OvUCm/3E4vQGGxaOWPx5pkG4KYY+4a8QMGU5u5En9VM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h8UU138ZAULBx2K/a/pyweRcxOK0U1bwoJKf/Giz6U3OoNs9U7XyBOm7ypKDBOXa9
	 uOHzgONzGGHXc2iEpbf+hp8i0jNcFuhc6uRiSbGmmVxQVqQEl53jeD8j6fpbNSiMoD
	 U9GYrGPQqcab56dUNdCUPdU292k4eiS12mk0b9Dr5VanzlF5Hz6EOYkrXnnMIBS+Fb
	 cu2tbQ38rmhzbxX/cmkXZK0AzxhDjKWoHwwziP8NzCA2MG9EGFhns3Dwko0Cn8KDpl
	 0QO5Z+G81YFEC86m79WY9GcswD2kIu67/m5GaS0aXM4M1XUZI+TPfRUJ2f2aeRbYjz
	 UqPRlMOSK653g==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231003155558.27079-1-johan+linaro@kernel.org>
References: <20231003155558.27079-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/7] ASoC: codecs: wcd938x: fix probe and bind error
 handling
Message-Id: <169687657762.138823.756591490715328419.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 19:36:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: A6I5WQTMENELIQRMRGEROPXH46PJCXSG
X-Message-ID-Hash: A6I5WQTMENELIQRMRGEROPXH46PJCXSG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6I5WQTMENELIQRMRGEROPXH46PJCXSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 17:55:51 +0200, Johan Hovold wrote:
> The wcd938x codec driver happily ignores error handling, something which
> has bitten us in the past when we hit a probe deferral:
> 
> 	https://lore.kernel.org/lkml/20230705123018.30903-1-johan+linaro@kernel.org/
> 
> Fix up the remaining probe and component bind paths that left resources
> allocated and registered after errors to avoid similar future issues.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: codecs: wcd938x: drop bogus bind error handling
      commit: bfbc79de60c53e5fed505390440b87ef59ee268c
[2/7] ASoC: codecs: wcd938x: fix unbind tear down order
      commit: fa2f8a991ba4aa733ac1c3b1be0c86148aa4c52c
[3/7] ASoC: codecs: wcd938x: fix resource leaks on bind errors
      commit: da29b94ed3547cee9d510d02eca4009f2de476cf
[4/7] ASoC: codecs: wcd938x: fix regulator leaks on probe errors
      commit: 69a026a2357ee69983690d07976de44ef26ee38a
[5/7] ASoC: codecs: wcd938x: fix runtime PM imbalance on remove
      commit: 3ebebb2c1eca92a15107b2d7aeff34196fd9e217
[6/7] ASoC: codecs: wcd938x-sdw: fix use after free on driver unbind
      commit: f0dfdcbe706462495d47982eecd13a61aabd644d
[7/7] ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance on probe errors
      commit: c5c0383082eace13da2ffceeea154db2780165e7

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

