Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2368C47E86E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 20:41:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F771908;
	Thu, 23 Dec 2021 20:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F771908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640288476;
	bh=k9GLyyBuOQ9Sm/cdmFUcfY4OryXSOQK/ki79q1v2xQs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHZz2ytXyDGVXLeDwD8WWIc8aZbC+s4KQ4BIe74DAoqjcozV3yFqngwTAwiDyQCb4
	 SbQSTY0VeibDs/SnEsQu4qYWa2TDwM3heaLIJX9Uox/yRYdTgbRDw7G5vPOplWLS+V
	 zdhczmo9HvvYE0FGH+Tv2kDYCjgULQU6MiJq7pNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3ED9F804EC;
	Thu, 23 Dec 2021 20:39:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAE53F80084; Thu, 23 Dec 2021 20:39:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88A4DF80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 20:39:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A4DF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="teCi81Fa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 04F7BB81B55;
 Thu, 23 Dec 2021 19:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE51CC36AE9;
 Thu, 23 Dec 2021 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640288370;
 bh=k9GLyyBuOQ9Sm/cdmFUcfY4OryXSOQK/ki79q1v2xQs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=teCi81Fa9JLCqnabKNsg/PrAlHemns/yU09FMCuiPyVEoc4luFHDOqy6qbNfnGHKJ
 ZoJr7MZzFZWiYLXcmmHGy/KRNQEXHPE/WMkuW0nld4DkxvbM3/qWP54lK5IfDlK/vL
 ali+mRB4ark07IqM5aZvCSkqogySVXBe2AQC0WSqWgVZOiLqZTfn2TFPVZg6amuIeV
 VVCikWprG9dLQluQVCfebfusXBJN4At8jeoCvdDrseJoeGgAedTXkJZLx+6Irxd129
 TPJIfMdaZUIDz+QQuNXK1Rl3d7H8pQnjGHoy6a4cuQ0KhvYPODYq0g1TiD9oTgMlEG
 LHKBL9FuYlndg==
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
Subject: Re: [PATCH 0/4] ASoC: qcom: Parse "pin-switches" and "widgets" from DT
Message-Id: <164028836762.13551.16534248024583184241.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 19:39:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

On Tue, 14 Dec 2021 15:20:45 +0100, Stephan Gerhold wrote:
> Some sound card setups might require extra pin switches to allow
> turning off certain audio components. simple-card supports this
> already using the "pin-switches" and "widgets" device tree property.
> This series makes it possible to use the same properties for the Qcom
> sound cards.
> 
> To implement that, the function that parses the "pin-switches" property
> in simple-card-utils.c is first moved into the ASoC core. Then two
> simple function calls are added to the common Qcom sound card DT parser.
> Finally there is a small patch for the msm8916-wcd-analog codec to make
> it possible to model sound card setups used in some MSM8916 smartphones.
> (See PATCH 2/4 for an explanation of some real example use cases.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: core: Add snd_soc_of_parse_pin_switches() from simple-card-utils
      commit: 3d4641a42ccf1593b3f3a474ee7541727acbb8e0
[2/4] ASoC: dt-bindings: qcom: sm8250: Document "pin-switches" and "widgets"
      commit: 37a49da9a7d5ac1f7128000de42ff222da46ba7a
[3/4] ASoC: qcom: common: Parse "pin-switches" and "widgets" from DT
      commit: 2623e66de125ba153e41be6a0b8af24cae8aa436
[4/4] ASoC: msm8916-wcd-analog: Use separate outputs for HPH_L/HPH_R
      commit: 319a05330f4ff3f951f9c42094958c6cdef393b3

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
