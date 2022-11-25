Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C7638C2B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85EC11757;
	Fri, 25 Nov 2022 15:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85EC11757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386574;
	bh=/wqlR+lYRL7ED2go0Mvf1BEEA1ZardAS9YIM0gRZxZY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jsh/yNQpMtSSk2HVqIG6nvW+/+FTDDR0fsEV+7aPq3BnfyBMShTjfp0O0FBE+WfEL
	 rNRmYZNdwNu4QBty0AflEauCS8yT9DsfN7GrHf2Z6DDEQMnu4u+J/F53TtJcCVxKi7
	 r1ek14iGl65CchDjS2SwZypgjKofV7Lq/AjQ1nrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A5EF8057B;
	Fri, 25 Nov 2022 15:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D5AF80566; Fri, 25 Nov 2022 15:27:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08E31F8055B
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08E31F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pk+WQRz2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E204E6247B;
 Fri, 25 Nov 2022 14:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C8CC433C1;
 Fri, 25 Nov 2022 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386420;
 bh=/wqlR+lYRL7ED2go0Mvf1BEEA1ZardAS9YIM0gRZxZY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pk+WQRz2A6p1A3a2SHaVze0e8wd9rBNcdXQxkwhD4q2vBBczETLGoTUCXcrjMzTFx
 XYGaqiINds4EOue4iGXLniOLdTNNpmY1zYWjMRFv8vXihjTHoS8tPZfZuoxdM14cep
 P6cR2wOvGlODne7ObN2pXrHlap5Ti+jgKRo117ftMKQEEB8uiJT6zclOw110OEzzoM
 GZp8jHBZCEAAv268XBvi321v116O35dwElnyiPYZok/zqeQsgCvwDghJyWfA00sMvD
 C0m+jh+FKqBH4Ju6t0c/GE2h44cySimozgRHM1fu2k/E65rcXWv8uoO9rK0Jti5LSI
 FEPvX7v49VCIw==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20221124120330.55845-1-CTLIN0@nuvoton.com>
References: <20221124120330.55845-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add compatible string for NAU8318
Message-Id: <166938641824.506633.8126280193984517885.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On Thu, 24 Nov 2022 20:03:29 +0800, David Lin wrote:
> The audio amplifier NAU8318 is almost functionally identical to NAU8315.
> Adds compatible string "nuvoton,nau8318" for driver reuse.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: add compatible string for NAU8318
      commit: b992f35568cb5768c5944fc3b4f02df337dc1ece
[2/2] ASoC: nau8315: add new acpi id and compatible id
      commit: 9ffe8bbb8fcf93d1bf0a948635de1ced9247a811

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
