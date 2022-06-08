Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4C542E54
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 12:50:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4880C17B2;
	Wed,  8 Jun 2022 12:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4880C17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654685416;
	bh=ICzWBUombM8VrEBxOIUs4mixgLnSH4SNFWZmAFZqFNk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMNalE4d0Aw7AOfk8ZwFXPbRH9WLMPsIh/szKZ9O8XxUnBT6xsmmGV+FI1C3fmqPY
	 fCpwGy2gjhF/Nf/wcYqNr764e7r5RosGMUu49vHTh7aXfsWx7peOZg/ccKh/TQL83B
	 iISZNgyK8C51FOJJzD5Uang/QaahPbWdT75D8c5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E3AF8026D;
	Wed,  8 Jun 2022 12:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA49F8024C; Wed,  8 Jun 2022 12:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 576BDF800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 12:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 576BDF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t1Yq2NIx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6C67B826BF;
 Wed,  8 Jun 2022 10:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF558C34116;
 Wed,  8 Jun 2022 10:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654685350;
 bh=ICzWBUombM8VrEBxOIUs4mixgLnSH4SNFWZmAFZqFNk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=t1Yq2NIxku/pkLZPvHZT6HU91MS+ZwD7wwuWYWtDdLQiuLyo2b0EczmBT9z7zgczQ
 xDjOrCF3Pac2JGd/2SQKF2fO06brT1hOu1sWFZw2BezTN+gT5AW+Xt6dNmgRw8RyEu
 TrcZYjZcWOJ/9qzDFcW+SPgyhcmvH9ihLvN6R2MZKbKPhgriKeMsbyDIY/HzRNYYaX
 HSktPRXdTvCzphaETcSZ5CUvyy6k4SYnLLi66us0X6CoEPad0nmoklPSwZ7ytgpKDS
 qNDt2cFXRaGSQdrohm2DQdlL3iu1o6lMTxGZw/z7LqvHUCG7Tz++EKrK/vlzlDSSMC
 CIk/SXdJXPxjw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, broonie@kernel.org
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
Subject: Re: [PATCH 00/20] ASoC: DAI clocking terminology modernisation
Message-Id: <165468534957.140553.3349098809992883345.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 11:49:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 2 Jun 2022 15:52:56 +0200, Mark Brown wrote:
> Update the last batch of CODEC drivers without specific
> maintainers to use the new defines for DAI clocking.
> 
> Mark Brown (20):
>   ASoC: cx2072x: Use modern ASoC DAI format terminology
>   ASoC: max98090: Use modern ASoC DAI format terminology
>   ASoC: rk3328: Use modern ASoC DAI format terminology
>   ASoC: sta32x: Use modern ASoC DAI format terminology
>   ASoC: sta350: Use modern ASoC DAI format terminology
>   ASoC: sti-sas: Use modern ASoC DAI format terminology
>   ASoC: tas2552: Use modern ASoC DAI format terminology
>   ASoC: tas2770: Use modern ASoC DAI format terminology
>   ASoC: tas5086: Use modern ASoC DAI format terminology
>   ASoC: tas5720: Use modern ASoC DAI format terminology
>   ASoC: tas6424: Use modern ASoC DAI format terminology
>   ASoC: uda1334: Use modern ASoC DAI format terminology
>   ASoC: tlv320adc3xxx: Use modern ASoC DAI format terminology
>   ASoC: tlv320adcx140: Use modern ASoC DAI format terminology
>   ASoC: tlv320aic23: Use modern ASoC DAI format terminology
>   ASoC: tlv320aic26: Use modern ASoC DAI format terminology
>   ASoC: tlv320aic31xx: Use modern ASoC DAI format terminology
>   ASoC: tlv320aic32x4: Use modern ASoC DAI format terminology
>   ASoC: tlv320aic33: Use modern ASoC DAI format terminology
>   ASoC: tlv320dac3x: Use modern ASoC DAI format terminology
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: cx2072x: Use modern ASoC DAI format terminology
        commit: eff8f2aeaf0c1b529d918c9f9569577dff600dc5
[02/20] ASoC: max98090: Use modern ASoC DAI format terminology
        commit: 573a9a37b6fcef6dc3977ca11a671f82b1c1b606
[03/20] ASoC: rk3328: Use modern ASoC DAI format terminology
        commit: cd0df1706d181bf103d0f02e6c008c2386772eb1
[04/20] ASoC: sta32x: Use modern ASoC DAI format terminology
        commit: ef08b481ae78eb89672bdf67ed306a43065253b3
[05/20] ASoC: sta350: Use modern ASoC DAI format terminology
        commit: def5b3774a48ed06e69b56af8317cb563bbd9ceb
[06/20] ASoC: sti-sas: Use modern ASoC DAI format terminology
        commit: d7e98b570e801375130ed4796bcbb35a39669d44
[07/20] ASoC: tas2552: Use modern ASoC DAI format terminology
        commit: 6b486af2ab946cbcad5c95f8daa1f4a8a53f25c5
[08/20] ASoC: tas2770: Use modern ASoC DAI format terminology
        commit: f8a4018c826fde6137425bbdbe524d5973feb173
[09/20] ASoC: tas5086: Use modern ASoC DAI format terminology
        commit: 7c5c399fb97e3f7a88d1b154f610cab4d9253955
[10/20] ASoC: tas5720: Use modern ASoC DAI format terminology
        commit: 9f6654c3162a4e64265c62bea433550fce4beffd
[11/20] ASoC: tas6424: Use modern ASoC DAI format terminology
        commit: f025fcc466cc03fa4f5ae245b6848629b846edff
[12/20] ASoC: uda1334: Use modern ASoC DAI format terminology
        commit: 5fc4ed4bda465fb826bea7c6a7b15657154787ce
[13/20] ASoC: tlv320adc3xxx: Use modern ASoC DAI format terminology
        commit: ad60ff09801fa1841dcdcf1f6ad1fa0e09ad0693
[14/20] ASoC: tlv320adcx140: Use modern ASoC DAI format terminology
        commit: 10649fa392c9abb6e9b258f7af9577596339fbe2
[15/20] ASoC: tlv320aic23: Use modern ASoC DAI format terminology
        commit: b9ff35c7afc6ae1bddca3f84fb23a3d903a62a23
[16/20] ASoC: tlv320aic26: Use modern ASoC DAI format terminology
        commit: 8d322f170b09989f47614c1a663371647f03176f
[17/20] ASoC: tlv320aic31xx: Use modern ASoC DAI format terminology
        commit: 2fd8298aed2228b8c6b94edf820121da25b3f5e2
[18/20] ASoC: tlv320aic32x4: Use modern ASoC DAI format terminology
        commit: 0cc5a137f7a3ba6fec069d8d222020f0927a18ef
[19/20] ASoC: tlv320aic33: Use modern ASoC DAI format terminology
        commit: 83a5f86903fbaf9c47c13975eb6f2fbd16d7f865
[20/20] ASoC: tlv320dac3x: Use modern ASoC DAI format terminology
        commit: 894bf75bb1f6c274cdd877879d9215abd6ed4b1b

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
