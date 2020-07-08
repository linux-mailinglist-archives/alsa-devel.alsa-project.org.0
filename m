Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA953218DD4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2736E1683;
	Wed,  8 Jul 2020 19:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2736E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227836;
	bh=Z9DgEq3OumaTes4V1hG+JINH/hbtnJhyzZpunoO5NFo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gv4wbBFFoer4HRdumjJ8UlgD/S/XHmauwTSr4lXozMcf/UBvWdRjfGHABJWqAMIN5
	 Xb/t4sk1DgX34eEkPEFUXtE2E/REnLY3Cv54xxxBPkwFWgZ4OEigx83GWCIVGX9Qw1
	 D0+F62WjCpXYup8TGMHqk2eIojs/AmYAEe5gmirY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA6EEF802EB;
	Wed,  8 Jul 2020 19:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42173F802E1; Wed,  8 Jul 2020 19:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75791F802DC
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75791F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GV1WrsND"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66523206F6;
 Wed,  8 Jul 2020 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227614;
 bh=Z9DgEq3OumaTes4V1hG+JINH/hbtnJhyzZpunoO5NFo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GV1WrsNDk1SRcL7vHjlpjNy2/KZPYLEEdru3NCYYeTT94vdMwrr6APK87YRjdrv0y
 lzsIhNAEh0MFzWk5VWTE+hpIy3PVzNMtDx1SLUMJgDh4tD5DIsMZp2VY+UGDsGv/dC
 luYzxe/daWNGwbKo19go8WuKpV285lmQ9nyiK7ts=
Date: Wed, 08 Jul 2020 18:00:08 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
References: <20200708113233.3994206-1-tzungbi@google.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for
 rt1015
Message-Id: <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Wed, 8 Jul 2020 19:32:30 +0800, Tzung-Bi Shih wrote:
> This series tries to reuse mt8183-mt6358-ts3a227-max98357.c for supporting
> machine driver with rt1015 speaker amplifier.
> 
> The 1st patch is straightforward: re-order the header inclusions.
> 
> The 2nd patch adds document for the new proposed compatible string.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8183: sort header inclusions in alphabetical
      commit: 4dae01c2e5df7beb8dfd5deb9560e42f19d3cfb7
[2/3] ASoC: mt8183: add compatible string for using rt1015
      commit: ab1ba5252f611c0efabca5fca81f5717445da47b
[3/3] ASoC: mediatek: mt8183: support machine driver with rt1015
      commit: f4fb4fef49664e64f4f40e9e8db11f785fbc79a4

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
