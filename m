Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915F79D934
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 20:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F797DED;
	Tue, 12 Sep 2023 20:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F797DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694544898;
	bh=42xcdlbrjyVky2/tm5xi0r/vdFecT+EUTCaruqGYrrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=trLd/3+SGUmx9rXBsbvf3qi6WuWG7D9Ze2/lcx8WcTpaCWpbS8aT2hLM4RhwqVG2f
	 1Prr1kid66ebv0xBiVxZUvCrCXNgzbX7GCzGw6T4RDV+9XPv4vZPhveJvZjNNIfNV/
	 g8qNyQ08WWH8Lnt18JH5qj3lY7YqJX/S+3L+9YAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38195F80564; Tue, 12 Sep 2023 20:53:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAB07F8055A;
	Tue, 12 Sep 2023 20:53:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2146F80425; Tue, 12 Sep 2023 20:53:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 33601F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 20:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33601F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tnBXOzns
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B7660CE1E47;
	Tue, 12 Sep 2023 18:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C397C433C7;
	Tue, 12 Sep 2023 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694544784;
	bh=42xcdlbrjyVky2/tm5xi0r/vdFecT+EUTCaruqGYrrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tnBXOzns3TRJQ3v2DIWxovHmqpLyVkrdcfa60aU16eqotefX6AAO9ny+VhyOzVTwa
	 vMVlIV1+6hNvf1rt+deYVUX7gXM9V9QdeaZOgSX9LLWJ84wCPMzwus4JETKqLHDFie
	 tNpBDpsy59MWbR3IhREh716peEmbR1aCuxc7C1wfvSsRx7qe3ReSzhUFhI9KWrnQcp
	 vhq3FBdz78lg7Sj/1q4JyfcVMiyyQqFfkbDnkIETWv8F1/V1yLvzVcL9nkwoSAgdfP
	 Z2sb/yqMAUcJnQZSl6mp/qwECmAcbPMIC3tcTyLmmNv/UdA30S0hVPhkz0BS7PcLom
	 g6rQL+BgRt33g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
Subject: Re: [PATCH 0/2] SM6115 TX Macro
Message-Id: <169454477946.2415953.15150744982318349138.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 19:52:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 7372EMILLS6QNOMPMFZNQJJU2LRMWV3A
X-Message-ID-Hash: 7372EMILLS6QNOMPMFZNQJJU2LRMWV3A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7372EMILLS6QNOMPMFZNQJJU2LRMWV3A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Aug 2023 19:23:11 +0200, Konrad Dybcio wrote:
> Like most Qualcomm SoCs, SM6115 has a TX Macro.
> 
> Only some minor changes were required.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
      commit: 9ff143aaabba989f275612de0d83cf9d39274828
[2/2] ASoC: codecs: lpass-tx-macro: Add SM6115 support
      commit: 510c46884299cf8da8e9d7db27572eafa9a0c567

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

