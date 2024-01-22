Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA0837442
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 21:45:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDED07F8;
	Mon, 22 Jan 2024 21:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDED07F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705956328;
	bh=lozOmd/cqGod0cy3wd2A6y+CaR5n7riM80HCoDoyZuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ATHnpf1GKASVp/VmHLwefGrM62rjGCmRSHJSbSVgLccbladKlO5HbSAo578Z7IpYo
	 TRO+S3QbjQxPQUPkobPn/jFJMd+Msb0xe4peNde9EFyn0FEQF4/wBZIVOyyBE3YqV6
	 9+N7cK+gACcPb108Xh3DmS+Ab/bjNhyrwqYKfJgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8100EF805D7; Mon, 22 Jan 2024 21:44:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A755F805C2;
	Mon, 22 Jan 2024 21:44:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2586BF80548; Mon, 22 Jan 2024 21:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6904F800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 21:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6904F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ESppTKry
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52A0161959;
	Mon, 22 Jan 2024 20:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49C8C43394;
	Mon, 22 Jan 2024 20:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705956259;
	bh=lozOmd/cqGod0cy3wd2A6y+CaR5n7riM80HCoDoyZuM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ESppTKryqkRXLyxvtT1SCiVm+RGydcihr8lSh1lpoHOYJ0qH8j67gaVF1cLOmQCJq
	 fD0aWHqGwuYGGAkbduME5fOHtYMNkz+F0hD90SWaDn83OoPZbbe16t1MCJ5EG2Vc1y
	 +ttFpWsXlLAwHwqK67ozQnSCGuFhSyo7MzLqfOTy8mhTFC+5IvYpZxbs5mkYyep6cD
	 pNhHOOt5NE6WNzrbO42enP5QjlGU5BLbBVq2Nsed3xbh05mjEKF9eN9wA2Ls1JdAtH
	 mAtsaY+qa2rxCeKbXrFlTBm50VbGZ8RycBnE9H0i3StP2Izz0JwihTy0wQRo+E7Y5z
	 s4oD1T1bkCXSQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-0-1c3bbff2d7ab@linaro.org>
References: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-0-1c3bbff2d7ab@linaro.org>
Subject: Re: [PATCH v4 0/5] ASoC: codecs: add support for WCD939x Codec
Message-Id: <170595625545.145475.5243509079608923207.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 20:44:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: OVTGG6XBL2TSKTEXYTGTW6NSFB7MNWTX
X-Message-ID-Hash: OVTGG6XBL2TSKTEXYTGTW6NSFB7MNWTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVTGG6XBL2TSKTEXYTGTW6NSFB7MNWTX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 13:45:33 +0100, Neil Armstrong wrote:
> Add the main WCD9390/WCD9395 Audio Codec driver to support:
> - 4 ADC inputs for up to 5 Analog Microphones
> - 4 DMIC inputs for up to 8 Digital Microphones
> - 4 Microphone BIAS
> - Stereo Headphone output
> - Mono EAR output
> - MBHC engine for Headset Detection
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom,wcd938x: move out common properties
      commit: 166ee0b3bfbb3611579c77fc84e44cd27a0099ef
[2/5] ASoC: dt-bindings: document WCD939x Audio Codec
      commit: edf647d1335fd55c81cdb8cc8cbf1da7d97739df
[3/5] ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux
      commit: 0c105997eefd98603796c4e5890615527578eb04
[4/5] ASoC: codecs: Add WCD939x Soundwire devices driver
      commit: be2af391cea018eaea61f929eaef9394c78faaf2
[5/5] ASoC: codecs: Add WCD939x Codec driver
      commit: 10f514bd172a40b9d03d759678e4711612d671a1

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

