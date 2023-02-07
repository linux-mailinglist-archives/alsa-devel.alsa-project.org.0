Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFEF68E45C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:24:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 640B820B;
	Wed,  8 Feb 2023 00:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 640B820B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675812274;
	bh=YqDF29yTDTzZofC0OrRusN/jw+sSqFWwWjB3YnAN8mA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=urvw8rykGjyLHc7tPBrzVkhctOXE73MFeDL19cRCgILUeTNOUKWg8/bGt4b/E4OQ3
	 +dJnITcrIPW0I24EXewodbK9HsvUmIDSIbnA1SJnGyo/JMUAqHe8rXsF4owOEFW+kU
	 R0yCROxIkmbioZgfTwBrwbGV7CUnxeq3KZWLtYzc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2EBF8010B;
	Wed,  8 Feb 2023 00:23:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F428F8012B; Wed,  8 Feb 2023 00:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C399DF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C399DF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=asZxJim1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1DD2BB8198E;
	Tue,  7 Feb 2023 15:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A4AC433EF;
	Tue,  7 Feb 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675782365;
	bh=YqDF29yTDTzZofC0OrRusN/jw+sSqFWwWjB3YnAN8mA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=asZxJim1OThPT7N/ebQJty/PhYOPN7aFj6sKP/aVDIQUStFsecBWjYU/z1Fwo4eor
	 6ElGV8nV1q4aW+V2wdnhw7ENQbNQqV5fVShFAZRy5vAFuFaU3miDJKqOQYnAE5mD/P
	 vCvk5dFDVixQFm4zarCpiEraFsialIIpxdIHrAoBxmldRTYNwRxUNU+jHEQUqV8LBW
	 MA8X0lf0/kfczCAOln2DWdu4hac1ib2WjoD1HploTeNTz+P8BxL3QqPjjRnjPY1kGN
	 O06lj23OOqxzUp9BStpP+K+64A38HMwWIhbbrUnlNS938ik+nXlmz9H5vdQKG21cRO
	 iTTTOoHtOR3nQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20230206153449.596326-1-jbrunet@baylibre.com>
References: <20230206153449.596326-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH v2 0/7] ASoC: dt-bindings: meson: covert axg
 audio to schema
Message-Id: <167578236315.223502.6627129328138282057.b4-ty@kernel.org>
Date: Tue, 07 Feb 2023 15:06:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 7HPQ47UWUZDWNPD2LIMFYC5RBJ6E7HKM
X-Message-ID-Hash: 7HPQ47UWUZDWNPD2LIMFYC5RBJ6E7HKM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7HPQ47UWUZDWNPD2LIMFYC5RBJ6E7HKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Feb 2023 16:34:42 +0100, Jerome Brunet wrote:
> Convert AXG audio dt-binding documentation to schema
> 
> Changes since v1:
> * Drop 2 patches applied with v1
> * Drop node name patterns
> * Fix examples indentation
> * Yaml fixups requested by Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: meson: convert axg tdm interface to schema
      commit: cdff91122de52f480bea730fee6665a7404d758c
[2/7] ASoC: dt-bindings: meson: convert axg tdm formatters to schema
      commit: c5536e7be70cf2ab55c674b3c2120565e9559c50
[3/7] ASoC: dt-bindings: meson: convert axg pdm to schema
      commit: 4d37c72ec42374c5ad416f851b572a9fb794e8ef
[4/7] ASoC: dt-bindings: meson: convert axg fifo to schema
      commit: 6b6f5ea7ab0062d152a3bc9192cee45c7fc31387
[5/7] ASoC: dt-bindings: meson: convert axg spdif input to schema
      commit: ede6aa4087abfac527267c4ac5bb6eebdfe958ba
[6/7] ASoC: dt-bindings: meson: convert axg spdif output to schema
      commit: 32f7b9102bfc48a210bf655e049145f6450b03a0

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

