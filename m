Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4122662BAB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:51:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D7018EA;
	Mon,  9 Jan 2023 17:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D7018EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283069;
	bh=DXzx4CNv2chUEU2incZa90cyOE5Pn9XEg8JMTsYyue8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUXYPpYtLQSmKILtrHRc0r4ODkNhIe+qbPOF3wg321r33tKnO48coj5XerXvDna4U
	 IOWqiBHC+Iy+9A8zlwveWLuwmUntuXeuremN8mD8941JecVWwPk2UCnz3Jj7iKYfhD
	 6ySd0O0R0VujZQRXNedYO5bUNgnF1i+RIiQ4xufA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D912DF80548;
	Mon,  9 Jan 2023 17:49:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D2CEF80524; Mon,  9 Jan 2023 17:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F2BF80524
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F2BF80524
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ttnkkIco
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB1EAB80E7F;
 Mon,  9 Jan 2023 16:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1B8C433F0;
 Mon,  9 Jan 2023 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282952;
 bh=DXzx4CNv2chUEU2incZa90cyOE5Pn9XEg8JMTsYyue8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=ttnkkIco2rzsDwWwQXYUHdG+C57D1AHwmz2k0DtimzBcY/47pQiMlhSB9BORq5Bgl
 NyiqSXw+Le4yi9UhN/gVP3p0j2Fo0xskUxu+zcbBTCR3IudGZHEILw8ioI4bwsojhU
 ywpvrymd4x4oQu8BMePUA23Fxt0PtKF42ZxsKLqMngdui/N4YXCQOe7C5ByxfJj/hH
 c4++K3I4fV4FHrNg61UZsdmd9cYvqXIK6sc+UxstP1KQdqZxen8ha8qnykb8qmEXhx
 raQHeaYqITGoEOcOrrTICOKCH7Lpo+3nAtntAeJwP0EHSaD5m1IE3ntjeaCa8B/cct
 3nw/XDPltrS7Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230104023953.2973362-1-chancel.liu@nxp.com>
References: <20230104023953.2973362-1-chancel.liu@nxp.com>
Subject: Re: [RESEND v2 0/3] Add support for XCVR on i.MX93 platform
Message-Id: <167328294977.323147.11170247431537947432.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On Wed, 04 Jan 2023 10:39:50 +0800, Chancel Liu wrote:
> This patchset supports XCVR on i.MX93 platform.
> 
> changes in v2:
> - remove unnecessary code which causes kernel test robot reporting error
> 
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX93 platform
>   ASoC: fsl_xcvr: Add support for i.MX93 platform
>   ASoC: fsl_xcvr: Add constraints of period size while using eDMA
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX93 platform
      commit: 0a22003c637b71a1dbd8bb521c09736b52349256
[2/3] ASoC: fsl_xcvr: Add support for i.MX93 platform
      commit: e240b9329a300af7b7c1eba2ce0abbf19e6c540b
[3/3] ASoC: fsl_xcvr: Add constraints of period size while using eDMA
      commit: 1760df5b7ee6a0bfc8ad47f4db490c36c5546be8

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
