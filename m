Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC069106B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 19:38:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A972FDF8;
	Thu,  9 Feb 2023 19:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A972FDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675967913;
	bh=PYzwfwbt25AUIPUiQXcfnToLFsGRS71rob+5nQm8OG0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kSUGZCdilBE62vVa5cej67TuA5pvoM+87erhrh7YNv7ckqo9DcSk5E5VkSx5z6o9x
	 cX2RqMhxYySt4aWqryt991gW8vmw/4b8QnPuxfHq5snrmfFtJqnUoYXstWtZUzHx3P
	 8LBbVY2y1QnWpTygQRMlmYBORVTF/ZIu9nBwcgk4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 076E4F80549;
	Thu,  9 Feb 2023 19:36:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E38F8051F; Thu,  9 Feb 2023 19:36:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C8FF800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 19:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C8FF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TJlLYevr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C876B8227D;
	Thu,  9 Feb 2023 18:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6F5C433D2;
	Thu,  9 Feb 2023 18:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675967780;
	bh=PYzwfwbt25AUIPUiQXcfnToLFsGRS71rob+5nQm8OG0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TJlLYevrQyb2Tdd1yL0Ev60Lni+wpyJG39vDWW1WjG7Rer1/Of9l4pAKwsQtZd3dR
	 mY5XL7sc3bMKuTyOd+XT1rWtb61xAcgnm5ukOxQb27rqx48akqZVr16xjrXIgDj989
	 ZoHlUn8Bo0xqk7TgIXDpx5LLkTHJIpTP7vqGkP0CX3x3kdaW1murrDOqWNwwlM3mnX
	 BgNri4bmCk/QHQZ4E77NlTkzLfJWEHywccGrGHOjzWZ2Z3PiQRL5T2sDPnIc8b6WTu
	 //GVfBxIcLIqLUe2ltcn/cgEF9GL+iZE4DmE8SHu/0Teudsm1C+JV+tiMnh9vkQKuR
	 jqM5lKfty3lww==
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
In-Reply-To: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
References: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,q6apm-dai: adjust iommus for
 SM8550 ADSP
Message-Id: <167596777728.879652.15119522144585944550.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 18:36:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: P6L6YHRIEY3OLFEBSTQVCUPZ7K2PNNIK
X-Message-ID-Hash: P6L6YHRIEY3OLFEBSTQVCUPZ7K2PNNIK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6L6YHRIEY3OLFEBSTQVCUPZ7K2PNNIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Feb 2023 16:05:32 +0100, Krzysztof Kozlowski wrote:
> It seems that SM8550 ADSP remote processor uses two IOMMUs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,q6apm-dai: adjust iommus for SM8550 ADSP
      commit: b2c0c45d9255b4444df65c5f69b4939835fee019

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

