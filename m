Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264F625E8D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 16:43:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901CD1669;
	Fri, 11 Nov 2022 16:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901CD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668181413;
	bh=GXXc/YkrgyCittXoI3dzyMhfx9G+SEtZA29qawbDu0Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=remnL+NDVJHnQwYhfa1R34vixb4Z+3FYmHUv2CKYLhHJXJn6PqIOMUc1ABHM0MseX
	 8kaVhqIJsjfiEyuDf5fuJpogDDNvzm0lYJWvn+0tYYbI1Sn3DydlaT3KOkimmZig2H
	 u0SrPWlxqWbH5JVJ78Pzs3SGIYmjuDBF+tf90V40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CC7F804AB;
	Fri, 11 Nov 2022 16:42:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E75F800CC; Fri, 11 Nov 2022 16:42:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA37F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 16:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA37F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g42q1yfL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EAE5662026;
 Fri, 11 Nov 2022 15:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA1AC433D7;
 Fri, 11 Nov 2022 15:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668181345;
 bh=GXXc/YkrgyCittXoI3dzyMhfx9G+SEtZA29qawbDu0Q=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=g42q1yfLeWX1aElcDEgHpy2fn6ocZm39/ztrtJ9/y+GN5lTLkgSAglFXN4ps/AWMp
 WoE0ea9O8L8UeE/wFNdkUZJVkuoC6Oe0YtdQPU6HKdmjC1I/e3ykbLUN8q9P25gCYe
 nhz9TAK6tAziLyLJ4/U6G9X1noX9NOL6tDgTWbE++OpxTcpsX0G49z4HPw4WQPBeUl
 50GNBmxjovMovEVwYMgVzQ3vmdNTyNb22hTFyTJ+uRUbQpVeYBxzqTHcch9r2d0H+4
 EZZvvTKGjpn46ndysZHwDiVOnsjsVsGyWBgBmTOHh7KSXRRA4gs1lIN3rdxFizERbF
 UT2W6Fq2VDWEg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Andy Gross <agross@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
References: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,
 lpass: do not hard-code clock-output-names
Message-Id: <166818134230.428331.5344875121746787370.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 15:42:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 3 Nov 2022 15:53:39 -0400, Krzysztof Kozlowski wrote:
> The purpose of clock-output-names is to customize desired clock name,
> not use one, same name.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,lpass: do not hard-code clock-output-names
      commit: bcdc73e167b68cb494977cdb2b92f05ab6455fc2
[2/2] ASoC: codecs: lpass-wsa-macro: parse clock-output-names
      commit: 9f63869a5682d5fa9bc5563577fe3270e7cbf4f2

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
