Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F516614CA5
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 15:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA04B168D;
	Tue,  1 Nov 2022 15:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA04B168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667313295;
	bh=5wW5fMffXJgRHGmoyZvOIkPaV2Johu/1uvLcafbGSG0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pH55OooDLMXxO1SfYOU6ZVXnLYv0+TGPO23WQOhrXPe7m3BbAd9teU1JFCYIp9UEj
	 cofED+9WqM/WN6GshTq8gtbOtKPo5wVIEwmwHa/42MTMJnESboI4o/ZFTU060T+5ld
	 +3hHKK/p5TRlc5q5Qg2TNZtlg+Tz0Dg7CvdWWS0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 219F4F804AB;
	Tue,  1 Nov 2022 15:34:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC4EF80423; Tue,  1 Nov 2022 15:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABCFF800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 15:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABCFF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OHqr7Vo/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF3A6119B;
 Tue,  1 Nov 2022 14:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2CCC433D6;
 Tue,  1 Nov 2022 14:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667313233;
 bh=5wW5fMffXJgRHGmoyZvOIkPaV2Johu/1uvLcafbGSG0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=OHqr7Vo/xB2puwUuLILh2ggR5FlTfNTzr+bxUpXT1Q2MyStbEvdrIz+u1euEv6J5C
 8dCmpItF0Qv4j0reelkFGia/zaYAbr7s/Nke8I8m61t15DacLt3ERd6AY7szsYhGkR
 Z7DeaheSdF2O0g4qti0p6HiB75qEjfIPow9TH+Hd9X0qaCBnj3xVydFjtdOsk2IuA7
 FVroEkRxkUTzjlvyk4IrzK8QZ0wO/3XKeHrDcSIJ5PFN06GO2ei+zNA02XymRv3cce
 sQxpeRV4Gg4TnVstaAzlmSQ8ANtNjuZPDSDiKmxJKuqD93ygeKoUmuaQ5JnqNC0cu0
 8JRE86XpHOAmg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, festevam@gmail.com, perex@perex.cz,
 Xiubo.Lee@gmail.com, robh+dt@kernel.org, 
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 nicoleotsuka@gmail.com, tiwai@suse.com, Chancel Liu <chancel.liu@nxp.com>,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com
In-Reply-To: <20221028082750.991822-1-chancel.liu@nxp.com>
References: <20221028082750.991822-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/3] Add support for MICFIL on i.MX93 platform
Message-Id: <166731323052.255497.10142620061824758896.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 14:33:50 +0000
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

On Fri, 28 Oct 2022 16:27:47 +0800, Chancel Liu wrote:
> This patchset supports MICFIL on i.MX93 platform.
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93
>     platform
>   ASoC: fsl_micfil: Add support for i.MX93 platform
>   ASoC: fsl_micfil: Add support when using eDMA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX93 platform
      commit: fb3425689699daebecf27a37d729ae43ef66ebab
[2/3] ASoC: fsl_micfil: Add support for i.MX93 platform
      commit: a10a52541f644a1fdf8876d474f31a54c4142ccc
[3/3] ASoC: fsl_micfil: Add support when using eDMA
      commit: 77a7a6e9a94df0ac7ba46677b5ce4a743a931fce

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
