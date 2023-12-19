Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E9818F3F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 19:07:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA085E75;
	Tue, 19 Dec 2023 19:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA085E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703009247;
	bh=2AlFxLi7oJh7Wa2NVO96A7tL3W01cNMV+NcW1zh9qDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AMB6meUnYLUwkLd6DdUjJ7YtaUlvKKVKSmh3op0GZoGSs3vU3alq72hhLYZ0EaGi2
	 cZg4lQrCnyi4yJnIRY3a5d6LBH1aUSE1HL4ijkJlNRJFw4z+hXM1Un5Ws8k0YwooBw
	 p6sRreYUXMmmaeQawg2Tj8b6Xg1u3dzakun6IWFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9DFCF8058C; Tue, 19 Dec 2023 19:06:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A84F8055C;
	Tue, 19 Dec 2023 19:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3BE3F80425; Tue, 19 Dec 2023 19:06:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAA9CF800D2
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 19:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA9CF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n0x1jHOM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 40CD5B81A3C;
	Tue, 19 Dec 2023 18:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC1EC433C8;
	Tue, 19 Dec 2023 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009199;
	bh=2AlFxLi7oJh7Wa2NVO96A7tL3W01cNMV+NcW1zh9qDM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n0x1jHOM5g1uy9hxI58NgHZwTsQEJjCGuV3K/cBxMRRFgUyHp/TndRdTCsbAlSNud
	 F2fV1NFM8jwNWonTXby5r/bEyKmcc4qTFXE6RhHQRHe7k2Wfa9u4snAogXXEoU2sbQ
	 jULiZXGkQ1uzOzqf7Nol9zwJ9O/8EFhmdGcgUFSqeAVv26irpJ62lzFHFo/wTJe/a9
	 g59D7OcAyl+B+YvhpMbR+WqGwmRYWEnS1J/R56kDJuWceOcFJvomejes37rlEZxYYu
	 i38C2M1kPKzrR6OG+/hbCSczVKLbDAOqgR89+V2tkvMzeJ4XDtIukGdjfBif5LmLQk
	 o5V3yMKRvh5SA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: 
 <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
References: 
 <20231212-topic-sm8650-upstream-snd-card-v1-0-fbfc38471204@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qcom: add sound card support for SM8650
Message-Id: <170300919611.125466.12203726463843347252.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: U6RYX3Y37LNFD5HZ5MUI5VRSRTIAQARY
X-Message-ID-Hash: U6RYX3Y37LNFD5HZ5MUI5VRSRTIAQARY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6RYX3Y37LNFD5HZ5MUI5VRSRTIAQARY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Dec 2023 09:08:18 +0100, Neil Armstrong wrote:
> Document the SM8650 sound card using the SM8450 fallback
> and add the SM8650 compatible to the sc8280xp sound card
> driver to use the sm8650 card driver_name like SM8450 & SM8550.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: document SM8650 sound card
      commit: 773df207fdd6e17d7a43abf83ea155ade9a95f79
[2/2] ASoC: qcom: sc8280xp: Add support for SM8650
      commit: 7211094dd065908747a143f9adeff41cfdcf37c0

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

