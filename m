Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8DC5BD7F9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC02482C;
	Tue, 20 Sep 2022 01:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC02482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629290;
	bh=LDsKxnhbQrE/ZqXth8SExE7uHfC+ker6gidpn7m6tdk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ujS0iM11MHWEeDMuZLfQ4afvX2f1RyQmzgoW7ZEW9Vmjwu86DevasbgpjxkmgafiP
	 7S1arNdNXHnSHw28jgIsKHbvRmmhRQeSGBgZVeJrD5KGUB8Mg4v/FxLFCliykXZu5D
	 DpUjPVJb0uKrrh7SXVkdPEXHW/8isxOxm8nONmco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA93F805C3;
	Tue, 20 Sep 2022 01:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC7BF805BF; Tue, 20 Sep 2022 01:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2E76F8023A
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E76F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uSYOA+wP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1C5F62101;
 Mon, 19 Sep 2022 23:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13111C433D6;
 Mon, 19 Sep 2022 23:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629029;
 bh=LDsKxnhbQrE/ZqXth8SExE7uHfC+ker6gidpn7m6tdk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uSYOA+wPCMHEmFG1c8Twijc7L11gTw+AjncUz9pieSr1usTpz9AzWvHUXRoXKdfQI
 EihOvbmiHN+gPoYVn+Q9uD4jsBbR+fJT47Hw9PFe+Pm3BZ6eneiirvrwOmv3hVjilK
 Oz5vn/jUHAang5JQfNunoc9kTepfKDY2Ux7Ri2YgHg347z8ddWvR7/fyzW68wpnpvp
 nYwnFocZStbzryxP+K82FpKzyAKgF0OL3ngL7H7Y/oH9JDIidSNbTsYJj43qE1Ylis
 WWfGNHe1ha8mxAWgz1BChMzPeAht6vXLJV4tuICE4meS1o4wRmpuxeaL4AyUMW8LB6
 oiR1Seigm0jlQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 0/5] ASoC: qcom: add support for sc8280xp machine
Message-Id: <166362902680.3419825.7703076569523626210.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, bgoswami@quicinc.com
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

On Fri, 16 Sep 2022 14:24:22 +0100, Srinivas Kandagatla wrote:
> This patchset adds support for SC8280XP SoC machine driver.
> 
> First patch moves some of the commonly used code to common from sm8250 machine driver
> and the follow on code adds minimal support for sc8280xp.
> 
> Currently this driver is only tested with SmartSpeakers and Headset
> on Lenovo Thinkpad X13s.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/5] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
      commit: a25f4e2cdd5d64408b0fa56115ebebd8cc5cb6c0
[2/5] ASoC: dt-bindings: qcom: sort compatible strings
      commit: e4f10cc23cefe16ed69987cb2648f5111e6eacb4
[3/5] ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
      commit: f19097cc5adfd29bf2aecd8e0137331fab36946b
[4/5] ASoC: qcom: sm8250: move some code to common
      commit: 3bd975f3ae0a245e4b851c2b0c97b0a71e5359d6
[5/5] ASoC: qcom: add machine driver for sc8280xp
      commit: 295aeea6646ad6cf26c24f5c493ddb60b8f5a0f4

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
