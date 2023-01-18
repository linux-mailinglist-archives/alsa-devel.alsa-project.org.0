Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F26671E4D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:43:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9743E489D;
	Wed, 18 Jan 2023 14:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9743E489D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049430;
	bh=aF1vAtO//C1XF9AQ5nzlkEx0tMeil3RfjeIi7EtuUu0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lXrFkg5zgO0nGVOCdngk7J8G8vu6vk7jhR9Zqd4cHqRhBZQOrxUuGPEjEEwdPOk68
	 tKmUSCrPGNEcEJ4hY25O40D6bXCldBvHtndzocRCDO5a4UAf7dQ8O69aFpG+9OqDLh
	 tRvMgDa9irWHeaz/pOfRoUbZcjCjm7qiXF1n/f6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EEA3F8021D;
	Wed, 18 Jan 2023 14:42:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB89F8021D; Wed, 18 Jan 2023 14:42:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A6FEF8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6FEF8021D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ihZWz81p
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 043A7B81C84;
 Wed, 18 Jan 2023 13:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497EEC433F0;
 Wed, 18 Jan 2023 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674049364;
 bh=aF1vAtO//C1XF9AQ5nzlkEx0tMeil3RfjeIi7EtuUu0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ihZWz81pyWzvJdsvlvz4m8Ur7xAg8Dde58yOtNO3Ha+GUPucbyX9r/Ik+lN6Gsz6K
 2AlQoLLjPYqAHppLT8Z+Y/MNGth0EfNLR9FWeJvHQyw6CVBblMhzu31K+e7JzUHb2t
 KzlBcRwsLNb6QPjFuWXF42CzdfFUewsRu1Y6ZClJhBMU47Jjzory8CvZdpSmbm4yxI
 jmnSEPMjJAmf7BQepzSPMdIi2K5RrbSs99f2Bp9ViHp0k3TVDOTTeWWyB13WFEwGGW
 e9FbBMXQJoQdqYLoMJa1PP/tojDac3ekIn3ESdu+HcmedkbdXrS1PhiqGd/RSXz4Uy
 ZhfAMuhtLFYuA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, Faiz Abbas <faiz.abbas@arm.com>
In-Reply-To: <20230117061808.18422-1-faiz.abbas@arm.com>
References: <20230117061808.18422-1-faiz.abbas@arm.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
Message-Id: <167404935974.749539.3058245186501349723.b4-ty@kernel.org>
Date: Wed, 18 Jan 2023 13:42:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
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
Cc: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 Deepak.Pandey@arm.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 17 Jan 2023 11:48:08 +0530, Faiz Abbas wrote:
> The simple card driver already has support for a simple-audio-card,plat
> property but its not reflected in the documentation. Add documentation
> for this plat property.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: simple-card: Document simple-audio-card,plat
      commit: e7e2b92e609f82cd164209509f852de941e1285b

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

