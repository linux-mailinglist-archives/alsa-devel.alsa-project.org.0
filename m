Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF45509243
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BC01B22;
	Wed, 20 Apr 2022 23:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BC01B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650491013;
	bh=7QRfVrCEKqRJBhIOT39b+us9XDpvDmsvc9P5y3uEIgQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejYL/22MfDnrhjtXYZ5ZifzEYLFTdzOSPu/K+X1UysUvaQpRvxrYN1xEOfu4mnw76
	 6aRwEdgp+1DN2u5gbDzNQ2YxughrsX8YWqkcmrYp7tp19b7YACFu3SXY27hSpfNzlq
	 8ZAfcaOvnihu3pEV6Iott0ajSwmGcSFOVAWy0jZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2277F80537;
	Wed, 20 Apr 2022 23:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC764F80508; Wed, 20 Apr 2022 23:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AF0F80506;
 Wed, 20 Apr 2022 23:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03AF0F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dw4PX0/Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E9E761972;
 Wed, 20 Apr 2022 21:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C055AC385A1;
 Wed, 20 Apr 2022 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490854;
 bh=7QRfVrCEKqRJBhIOT39b+us9XDpvDmsvc9P5y3uEIgQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dw4PX0/QOfCA9Axml6+wtRwf0dWzIhjobeBWuNexSWb2iCB43+dVAzPmkLJzmQ9N9
 2V+iDC2pfywqVMyhv607Obsj4sjZYJE9AeVyZIOMZ2R8ESmL+90w+kYqV8ZSvfs38l
 uymh9PFzC/Kdtmg581d2skPwxUu8Ui8oLhLTsazTxRw3pNFIlCNmkGkno9Ite8YNJQ
 QkjSVHofmBRP58Y/eEAoReOzW/fRBH/+2mxzqItUijuU68A5hOYyhYKlzpDOEPXVPp
 ftoyuq9Ii2ZNJPOs0zo5lF2oITuiNPbXAh23tQNDVfZiF5v+3eHr7Yc9ElOOMecSgM
 Xn35nEO9gdzmA==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220407153813.1231866-1-rf@opensource.cirrus.com>
References: <20220407153813.1231866-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: SOF: Kconfig: Make SND_SOC_SOF_HDA_PROBES tristate
Message-Id: <165049085249.138067.17008390714250645371.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On Thu, 7 Apr 2022 16:38:13 +0100, Richard Fitzgerald wrote:
> SND_SOC_SOF_HDA_PROBES must be tristate because the code it builds
> depends on code that is tristate.
> 
> If SND_SOC_SOF_HDA_PROBES is bool it leads to the following build
> inconsistency:
> 
> SND_SOC_SOF_HDA_COMMON=m
>   which selects SND_SOC_SOF_HDA_PROBES
>     but since this is a bool SND_SOC_SOF_HDA_PROBES=y
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Kconfig: Make SND_SOC_SOF_HDA_PROBES tristate
      commit: e18610eaa66a1849aaa00ca43d605fb1a6fed800

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
