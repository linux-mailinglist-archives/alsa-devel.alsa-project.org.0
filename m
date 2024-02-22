Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C185FB08
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 15:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA06C9F6;
	Thu, 22 Feb 2024 15:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA06C9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708611648;
	bh=4sH5v+ZMdGS+5cx2T7gwpvtfeWvziYaZFTJijfU8mjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z8mOfGc5to9XEZKnD18+nMtLmTAZiNDGdyQEu14K8B+NnMAVVLMvr/AVvf2f+JG0r
	 IiEhWDJq89gqNryihX4GsCQ8U97lsl/CVdHn1Eo0RIRzzYxeqLgew9Osvh1QEmtJN+
	 zhZYy90c5BlVPxqI01iPAXqqVey2blFhwJhpe6p0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A37BF805AD; Thu, 22 Feb 2024 15:20:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F97AF805A1;
	Thu, 22 Feb 2024 15:20:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49CECF800ED; Thu, 22 Feb 2024 15:18:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AA39F800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 15:18:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AA39F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Dh1IaErF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61CE7CE27C2;
	Thu, 22 Feb 2024 14:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B867C433C7;
	Thu, 22 Feb 2024 14:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708611514;
	bh=4sH5v+ZMdGS+5cx2T7gwpvtfeWvziYaZFTJijfU8mjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dh1IaErFQC3KZAaCSr9t1s2CAI5kwufOviIScCh4ZLJOOdjVGpX9typAdLVEnw+p0
	 T5tPoee/asNdT/VU59PB6ryjkh10ypmIBJLvts02AH825jUX8d7DQcZCGZJLSgNqqm
	 VlqqCMEDGM2+qmZw+bJ9PJWKAkTh7RvN5cd2O20drx2KSYimF5hN+8Sb1kDttRzzML
	 BB6PyU8dhh9P0po4lZKmncGxTWE6UN5ttxlHFN+S3pJ5OfWmLRuC7PWffx68bcu/M7
	 R7HVnzBOefDyGr7qPoImbqEeBHZM5kExV+b12Ff0898Zclt2seT0FXL9DXxgFMpXkJ
	 FPNkLBQXODXXw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v6 0/6] reset: gpio: ASoC: shared GPIO resets
Message-Id: <170861150977.56623.15929903004855832989.b4-ty@kernel.org>
Date: Thu, 22 Feb 2024 14:18:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TZA2EG75T75OQQ65KFBYX5KXG5VRTPJM
X-Message-ID-Hash: TZA2EG75T75OQQ65KFBYX5KXG5VRTPJM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZA2EG75T75OQQ65KFBYX5KXG5VRTPJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 12:52:10 +0100, Krzysztof Kozlowski wrote:
> Dependencies / Merging
> ======================
> 1. Depends on !GPIOLIB stub:
>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowski@linaro.org/
> 
> 2. Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and patch #4
>    (reset: Instantiate reset GPIO controller for shared reset-gpios) depend on OF
>    change (patch #1).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/6] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
      commit: 26c8a435fce6ef8d1dea39cc52b15cf36c7e986b
[6/6] ASoC: codecs: wsa884x: Allow sharing reset GPIO
      commit: 0dae534c48239be0a99092e46e1baade0cf3e04a

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

