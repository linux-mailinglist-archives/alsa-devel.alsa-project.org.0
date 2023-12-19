Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56991818CB2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:46:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED874BC0;
	Tue, 19 Dec 2023 17:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED874BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703004367;
	bh=YshGhGatuu0XiNpZYItbZPJD2MbgKrCUH+6Ej4/eD/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qbc+EBS2HFE9KXVog5MJvq5dcq3EcQfOpbQibZu0TRnvmijbkr/JQHhzNJoSP7Hzh
	 4bAZN5FKthHa2JE7mdDiJ/J2jUGtI8F/baTCu94jip4yS2lyAVC4WgZNm8Mfs3aRyq
	 dPV9+0ZOGZBCOyEXmNk7lXgXHLPMvpnbZstO+ShU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7941CF805D2; Tue, 19 Dec 2023 17:45:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA612F805C3;
	Tue, 19 Dec 2023 17:45:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE8B5F80425; Tue, 19 Dec 2023 17:45:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E378F80212
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E378F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LrqBKPcq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 610CF61414;
	Tue, 19 Dec 2023 16:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F59C433C8;
	Tue, 19 Dec 2023 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004304;
	bh=YshGhGatuu0XiNpZYItbZPJD2MbgKrCUH+6Ej4/eD/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LrqBKPcqgPoV0qNw9Xo+lHKYZoOUYOAmUKMfNh6KDuj+00QqYzBLdqxvNs6FskFUc
	 BuN9r6l24sahQFlvTimo2FJ51ChGu/ommKHG2rTIWurP5haG1wUNICyJC8KTRRqtQp
	 PDogK3syEoY9CAepcBYLEKyH71+pSuBB71y5sRB66HZ/uf85bgKS+rL8GcAp9fzTcw
	 AWeQTOY36Ri42521gdewarHr/75FOqFD9J6RftJ4VZeAnfewjLVB1NEU7jilALNK1u
	 hqoQ07dAnwFuyABDWdWlAJ6cZMJT1yqpQ9Vo4dMmKPyebckGaAsK0HcLsQo4rZJD0r
	 xqErbISMcB4Mw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: 
 <20231219-topic-sm8x50-upstream-va-macro-bindings-fix-v1-1-ae133886f70e@linaro.org>
References: 
 <20231219-topic-sm8x50-upstream-va-macro-bindings-fix-v1-1-ae133886f70e@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,lpass-va-macro: remove
 spurious contains in if statement
Message-Id: <170300430078.102048.8496688469911862862.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 16:45:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: HWT54V37LOHL6A375M7ZAFT7NBEFVPCD
X-Message-ID-Hash: HWT54V37LOHL6A375M7ZAFT7NBEFVPCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWT54V37LOHL6A375M7ZAFT7NBEFVPCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 14:23:37 +0100, Neil Armstrong wrote:
> Remove this spurious "contains" which causes the bindings check of
> qcom,sm8450-lpass-va-macro compatible to fail with:
> codec@33f0000: clocks: [[156, 57, 1], [156, 102, 1], [156, 103, 1], [156, 70, 1]] is too long
>         from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> codec@33f0000: clock-names: ['mclk', 'macro', 'dcodec', 'npl'] is too long
>         from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-va-macro: remove spurious contains in if statement
      commit: c13cf1991f4231d38f1c43fcf51ec1cf29c8c82d

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

