Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DB1FA4BD
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08181676;
	Tue, 16 Jun 2020 01:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08181676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264773;
	bh=HCMgLrkq762gZav8QxH4QvTqyfuNNmMXp3IOi92cHuc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MIBLmeB2KsdK3rUVuvNNjksYeXAl5ZN5oy25USKa1w/3OG7COrMMhBYGlVyalcVp/
	 hLfpASKOcqbedEOUZIqurwaxwimQSUv15h188qdw+ZGV6s8qbL6RJptOxyF+L5Kb87
	 6vLYDq6IvA5Fcj/R+fY0y+CfstAoU2ciicxy0huc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A243DF802FF;
	Tue, 16 Jun 2020 01:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ECBEF802FE; Tue, 16 Jun 2020 01:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF17F802F9
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF17F802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XFs2kV76"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAF12207D3;
 Mon, 15 Jun 2020 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264436;
 bh=HCMgLrkq762gZav8QxH4QvTqyfuNNmMXp3IOi92cHuc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XFs2kV7653RL3D++y2TDm5PqDDQ6AnUrQ1bq/i5kPm8QxHA5A+0HPS1QEq9b/AsKa
 NSqBq7Yjuy20UWq0cnwByMgGzygtAn4sr5cZTRfOLsrxlHQsjbBRyTVxcZLPW4roR7
 oJOI11Du/mFHIsE/kMqPoV+q/zFW2g3iFt7paJKM=
Date: Tue, 16 Jun 2020 00:40:34 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200605034931.107713-1-tzungbi@google.com>
References: <20200605034931.107713-1-tzungbi@google.com>
Subject: Re: [PATCH 0/2] ASoC: max98357a: support MAX98360A in OF
Message-Id: <159226439189.27409.4876644528029797996.b4-ty@kernel.org>
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

On Fri, 5 Jun 2020 11:49:29 +0800, Tzung-Bi Shih wrote:
> Commit 1a0f2433d738 ("ASoC: max98357a: Add ACPI HID MAX98360A") supports
> MAX98360A in ACPI world.  This series supports MAX98360A in OF world.
> 
> Tzung-Bi Shih (2):
>   ASoC: max98357a: add compatible string for MAX98360A
>   ASoC: dt-bindings: add compatible string for MAX98360A
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98357a: add compatible string for MAX98360A
      commit: 3aad07b87ac3fa1c67a75403f7f9c576da8df71d
[2/2] ASoC: dt-bindings: add compatible string for MAX98360A
      commit: 3e3b803f9e76b2ec386c0f3f0618fb7d0bca4ffc

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
