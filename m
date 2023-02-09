Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7069106A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43DE1DF3;
	Thu,  9 Feb 2023 19:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43DE1DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967892;
	bh=P3p3nQT18iB5KgEcNBU65v36D9Khuq9im6IUZT0tPnk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T9rZd9KFwxP3be+ibRsOvVd0fC95PEkqnix9ZTbBBko3rR5iYWtNJXEZ8UUNDRJ0T
	 klh5C9Uh7rOac94bkpSU6lMI8zXlW8Izuo9tssboG7qQjCPhkF1L5BN0CkC/L1iGql
	 IaM4RRbzShwvTLAjSDal4Myzb7gCtkdY0lYJk3qE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCDAF80529;
	Thu,  9 Feb 2023 19:36:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8245F80269; Thu,  9 Feb 2023 19:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1ABDF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1ABDF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g4QVe/AL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5642F61B80;
	Thu,  9 Feb 2023 18:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7170AC433A0;
	Thu,  9 Feb 2023 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967783;
	bh=P3p3nQT18iB5KgEcNBU65v36D9Khuq9im6IUZT0tPnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g4QVe/AL+TAnwYSc4YCElFAX9/qtKqwrG4JP7XSpkKtpZ0I9LT4qG9bL4aXXLJbq8
	 eRBDxsuxoY0f62lDt1ch+Ibo8jEZFHvJa+D5y+eQ9FSQfvOLGdWtZtuIjokErjp6wJ
	 wz/nGbHugKD1YcE54LEqlcY9wOB3yVUlxkoFYiPu2AtJMguc427UKhClTkjOubsyFt
	 r047BhG1c2gcN5lbraZNdxyrX86DIsxDWn+dJnYMMX2meZshLszMTqZnR3mvE4CLEj
	 VjzAzJrK9B1rmuM7vMkmG8glUBul1tB+PfeL+zd3KKG8iDdiQ6NL08WUYOJbtdISu6
	 TWkSqu/I3JZvg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206180805.6621-1-krzysztof.kozlowski@linaro.org>
References: <20230206180805.6621-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH 1/3] ASoC: dt-bindings: qcom,wsa881x: Allow
 sound-name-prefix
Message-Id: <167596778018.879652.6223173953232819619.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: YS744ZQIDHWZR6XUYFHPVNBVFYBBXF2Z
X-Message-ID-Hash: YS744ZQIDHWZR6XUYFHPVNBVFYBBXF2Z
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YS744ZQIDHWZR6XUYFHPVNBVFYBBXF2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Feb 2023 19:08:03 +0100, Krzysztof Kozlowski wrote:
> Reference common DAI properties to fix:
> 
>   sdm845-db845c.dtb: speaker@0,1: 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: qcom,wsa881x: Allow sound-name-prefix
      commit: edcda9a605bbfdd78d8d79043e01544d8b742828
[2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
      commit: 636caca3583923b75fa538bc43ce57801fb8a1a2
[3/3] ASoC: dt-bindings: qcom,wcd934x: Allow usage as IFD device
      commit: 7ee35b6b099ce6b51c6ac249d19b5b405f8e825d

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

