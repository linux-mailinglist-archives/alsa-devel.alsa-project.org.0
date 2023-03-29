Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFA56CEFDE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D2D84A;
	Wed, 29 Mar 2023 18:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D2D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680108756;
	bh=CKOyZDv3JQWgNTEg9VeWLRnaO9byzwy9arbDVJ5dC3w=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qARsIppROHwCN7HdQp9IIihOF4MZ4Qp2HF5iEBgY6Gn3JJW9KRqOsXwe4YUGLyZgS
	 iJbw/+n8nmzZBsTsoXTdQHIGQnpkF+YvBIxo5reZ5Kif0LdZPWWAH3318uLQQEW27A
	 iOzueV7KQqHGgOw6g0LVoZsgRw+a22p/lyK5EcLg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA7AF8053B;
	Wed, 29 Mar 2023 18:50:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50E45F8052E; Wed, 29 Mar 2023 18:50:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE325F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 18:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE325F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bhs4Pi2/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA00F61DC6;
	Wed, 29 Mar 2023 16:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C88FC4339C;
	Wed, 29 Mar 2023 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680108647;
	bh=CKOyZDv3JQWgNTEg9VeWLRnaO9byzwy9arbDVJ5dC3w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bhs4Pi2/PPGsfONY6o5af/Sz8FfzQTQ6DdoLP78cTkekzpSYQ7Jp+kb/d5smuOi1w
	 OP31cZhs6hUvo4olsJ2a1mwoY6hE72ke+3B326NZWbqb3IZdRDGZ9ihQ0MP8jg/1vW
	 6DM3YOzl8B0Omyrtta2sirtNrP7S5Rzs96iyrJNj8gMiWAqKbl8V0JViuXMEshZNps
	 qk5msvzc343cjRR1yIt1G7E413aThAqe3T4TD/2/C9zukHMTAUsBP5UrnqwNhb4x+9
	 1F58WP58KT9wyMKIh+OTda9p+vApAxbjlTb7wyGMwzfjJB2bByTMDgu33phbU/r0qr
	 TA8wwPfuLREZg==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/10] ASoC: add audio digital codecs for Qualcomm
 SM8550
Message-Id: <168010864198.3244592.2114017565664183933.b4-ty@kernel.org>
Date: Wed, 29 Mar 2023 17:50:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: QSXYJLBPYLVJO3MP7TX3FX74CD3QFMDQ
X-Message-ID-Hash: QSXYJLBPYLVJO3MP7TX3FX74CD3QFMDQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSXYJLBPYLVJO3MP7TX3FX74CD3QFMDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Mar 2023 15:22:44 +0200, Krzysztof Kozlowski wrote:
> This patchset can be merged as is - no dependencies.
> 
> Changes since v2
> ================
> 1. Rebase.
> 2. New patch: ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock.
> 3. Add Rb tags.
> 
> [...]

Applied to

   broonie/sound.git for-6.4

Thanks!

[01/10] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
        commit: e4cf7805f084772cccf2094b634a16bccf2f444f
[02/10] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
        commit: 0fc109f875721f9cef29bb68095f50d67343b4b7
[03/10] ASoC: codecs: lpass-rx-macro: add support for SM8550
        commit: 492fe974fed0754f7076580e069e1e182e7b3603
[04/10] ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
        commit: bf4afbf950938d42cf0df1ecd915affeb26f4d76
[05/10] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
        commit: 050578c6f18c28e95f9659493a52a67b68b4b667
[06/10] ASoC: codecs: lpass-tx-macro: add support for SM8550
        commit: 5faf6a1c5256559af98c998b7416e4db8fb09b75
[07/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock
        (no commit info)
[08/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
        commit: f769fcefa683e150456555e2a280668509d834df
[09/10] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
        commit: c1bda22bd2f382f9c3b27fb7a899f8804d92f897
[10/10] ASoC: codecs: lpass-wsa-macro: add support for SM8550
        commit: 6b004b836ced4d9ce655b5f1c810833c1a880369

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

