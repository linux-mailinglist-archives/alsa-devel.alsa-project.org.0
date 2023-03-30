Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3EE6D0F9B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 22:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765771EF;
	Thu, 30 Mar 2023 22:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765771EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680206565;
	bh=x6NOVdTaz7CGWvps81jobrp9t31g87Tz81IuQnxXTB4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Cbsh9J6Kfe2gwTmEtcXA2QQCq77hou2go4bxGlHHkoUvTh/wBO8OgBwik+6F9nOFS
	 sJjoIGjK50bky99wRPAMMGsNIsDvd1/UWehgnw6Eu4hTO0UXZSXNZzKFtIqEDo4i1i
	 x+7NpQmPphoAMExVu30Ab+jhrd0tUKCHlCO/ThrI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31144F8024E;
	Thu, 30 Mar 2023 22:01:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE80EF80272; Thu, 30 Mar 2023 22:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEBABF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 21:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEBABF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lndkGvrH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6CD4762174;
	Thu, 30 Mar 2023 19:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D566C433EF;
	Thu, 30 Mar 2023 19:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680206374;
	bh=x6NOVdTaz7CGWvps81jobrp9t31g87Tz81IuQnxXTB4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=lndkGvrHqy7SgEdw+IG71XbctymOJR02QCIJddo28Ncdwtnqnh6iWxEUH9omZccG7
	 /EeDzZ9EQ1cbWqhVFK4KwagNntpz7NCfxdqwiDTGWCb7cV2zMoNiZLdiHfQCPilt9i
	 zer6XqQgVFyeOH87qi5oBNtaM6xjS7aOxLw/u3Jfzfgba5QipAHAjygiBio8srJyWa
	 Ywbh0Us391GZ3NnY3PyIVsiY4CuNYBwlqEuSus18Twx/Vg38bNrgCkzXf3DFSJ0D/I
	 +vxDcZJ99gNVwWVYeS2jSPOi6KJ2GhAwUIOH2XCow+5guMfQlkrpixA39y3eaJzgGU
	 DF5QIqNHtLW+A==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
References: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing
 NPL clock
Message-Id: <168020637190.3358032.1777866754231167015.b4-ty@kernel.org>
Date: Thu, 30 Mar 2023 20:59:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: V4HTYWXKEWWOFBIQW53GPGMOMT3EUVJA
X-Message-ID-Hash: V4HTYWXKEWWOFBIQW53GPGMOMT3EUVJA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4HTYWXKEWWOFBIQW53GPGMOMT3EUVJA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 30 Mar 2023 09:03:42 +0200, Krzysztof Kozlowski wrote:
> Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
> clock.  Add the clock and customize allowed clocks per each variant.
> The clocks are also required by ADSP in all variants.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock
      commit: cfad817095e111b640c7d538b9f182d2535ee065

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

