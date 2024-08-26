Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC795F936
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 20:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B7B828;
	Mon, 26 Aug 2024 20:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B7B828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724698343;
	bh=uiz9Rtx8Hk7QAj5m6TJJAmxSW3fHU5X0XY4yHCbzD+U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g45S9v/WaPpESSu37NS3qhAfZ868gHh5GNW183irBAD7kjhCDD+JuVVx/NmulXjih
	 +4f2VHsvRbkCAm35bZ6LevtZH8PV77XpvPdhvnaX4s06i31PLWetZ/O1luhYbJ3q1V
	 9RWsVJq2u/ZL5/qFROOgYzkQgCQ6A5KMLXBduNHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0EE3F805AA; Mon, 26 Aug 2024 20:51:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2260F805AE;
	Mon, 26 Aug 2024 20:51:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B63CF80087; Mon, 26 Aug 2024 20:45:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEEA7F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 20:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEEA7F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HU+Orevh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4BF5A409EF;
	Mon, 26 Aug 2024 18:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C26C4DE03;
	Mon, 26 Aug 2024 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724697344;
	bh=uiz9Rtx8Hk7QAj5m6TJJAmxSW3fHU5X0XY4yHCbzD+U=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HU+OrevhAiyoh5RN5Q+28yH8zKif9sHT8wYEZ6NA0jhbngTn9JRWD9UJIF2zwsyQ4
	 QCvfsalG41fopxdOXF1F+gXbj1ZCmBcA484bXZiDgxRnNgMnSlBmrdDvd3FdXnZMsN
	 z0Xq7cHEd4B2xVqowu0MljhJWn+JUxCKAyLvhP3v0xztp3v7T7k6A7D2riWmnhb8ID
	 18P60NenfqQbnyXTYJrExvlpsXGWX67y5NsBuTQNhfKimFyh4v2wwxzSvtZFLMxxCV
	 0SvJqLrBq1D5lDTN5rvl06BWLRNBrse8Sr90vyTLaWxgUmkWDRFJY51OfOKOnRq+IS
	 ovP30tYIJeq+A==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240825085745.21668-1-krzysztof.kozlowski@linaro.org>
References: <20240825085745.21668-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: MAINTAINERS: Drop incorrect tlv320aic31xx.txt
 path
Message-Id: <172469734019.858128.1291012242968483621.b4-ty@kernel.org>
Date: Mon, 26 Aug 2024 19:35:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: CUXVMNGJWJ6356ZQ33PCEFISX2FV6ORV
X-Message-ID-Hash: CUXVMNGJWJ6356ZQ33PCEFISX2FV6ORV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUXVMNGJWJ6356ZQ33PCEFISX2FV6ORV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 25 Aug 2024 10:57:45 +0200, Krzysztof Kozlowski wrote:
> tlv320aic31xx.txt was converted to DT schema (YAML) and new file is
> already matched by wildcard.  This fixes get_maintainers.pl self-test
> warning:
> 
>   ./MAINTAINERS:22739: warning: no file matches	F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: MAINTAINERS: Drop incorrect tlv320aic31xx.txt path
      commit: 0225d3b9efe3daca332befaa0c4ce2f119297d5a

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

