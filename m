Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB176116C0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E911EF6;
	Fri, 28 Oct 2022 18:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E911EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666973030;
	bh=Oxti1A+2ZLM13LWu91bH36f/Fx13AJFSM+jY4B3mE7U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vtU7be/mf8dZGTlZBhrsKixu2AP2/dZDaexLAW4sC/67rSrV8I9bN7wrUUUqBrDDW
	 PKFp4ZlnqFRVMk4G9Hyaz6EV/hFo50g5fx8GsC+8Yrhz47uc2H/IE3SXv1Qa134Bwp
	 wIEcwKxb2x6u0XRy7TGMrmGcSOePQUmP7b7WttGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF715F80095;
	Fri, 28 Oct 2022 18:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2D72F8024C; Fri, 28 Oct 2022 18:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F55F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F55F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DkLDaKvF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7553FB82870;
 Fri, 28 Oct 2022 16:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A35EC433D6;
 Fri, 28 Oct 2022 16:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666972971;
 bh=Oxti1A+2ZLM13LWu91bH36f/Fx13AJFSM+jY4B3mE7U=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=DkLDaKvFD2Rwrze6hxXZRo9+kKLB8sEtVs8hwjQHbqkL7Q7ijbMoDuq/gFBKUR0Or
 H0sImDSmMB4S2UDXg5jApERzjViHb30R5L1bHrFOoGA7P0aiVypEnvCfR+J78sdtJj
 najlz55vlJ/guZaA5vJGCboYQn5O0+giD7iNJgIQ2IboHXAcVV7C1NCrAc6N4WIxHZ
 D4LS+cONMnpTQrQGeP++D4qGyUh+ypmBFjINQTFR0/4nM07JEpW7hBXvpk1a0TUSGx
 ai3K4gJso5h9quUOPIwPb75OdU7+DaspFSqjYHONOaM07jhkZ0YAWFuma6u0l9TyI0
 syLrAx8KFkcpQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, tiwai@suse.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, 
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, Xiubo.Lee@gmail.com,
 shengjiu.wang@gmail.com, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 Chancel Liu <chancel.liu@nxp.com>, perex@perex.cz
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/3] Add support for SAI on i.MX93 platform
Message-Id: <166697296821.717517.14812404041210557854.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 17:02:48 +0100
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

On Thu, 27 Oct 2022 14:03:08 +0800, Chancel Liu wrote:
> This patchset supports SAI on i.MX93 platform.
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
>   ASoC: fsl_sai: Add support for i.MX93 platform
>   ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
      commit: aa8289fda86ede0e164a260316647c8bf0400d41
[2/3] ASoC: fsl_sai: Add support for i.MX93 platform
      commit: 67d5c6c19923ad26def8a001e86fc0f42264a8b5
[3/3] ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform
      commit: 870b89d118a29bd845ea706a74e313f9b83f5a45

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
