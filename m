Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32DE248C6F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5736517B9;
	Tue, 18 Aug 2020 19:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5736517B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770367;
	bh=xekM5kRz9UCjLJqA6E1zFK+ssQoQ+wQqM7QItEQ3XaM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KreVlW26O8JC7DJ5DZF4ijIzxXfYpm8lt5IHcy2orJLV1+KRKV5r4vIAi9bUba7EL
	 GYk9ZwdIrcXX2xZr8AFDI/GP/p+UrS3kDm9x0Rqf6dB3EoFA/s73jZ+4tGVb1iaQXP
	 0F/W6D+Be00MuLs1xMTgOmO2auRlBrYS65G4n4aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BBACF8035F;
	Tue, 18 Aug 2020 18:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0CEBF80361; Tue, 18 Aug 2020 18:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF79F8034F
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF79F8034F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T2ho4vW9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6BDD220825;
 Tue, 18 Aug 2020 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769735;
 bh=xekM5kRz9UCjLJqA6E1zFK+ssQoQ+wQqM7QItEQ3XaM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=T2ho4vW9XR5fJqyPNbypj/3ggltFOcmtUKJAAICqBbPWHWLdAszvEDVHW0hHCk+L9
 FKn9YdIWSeOq/cMBGkzABBVWwnDK0qnsTMnwCZlcFbQcdP5OziyJkBzG/rAY57iWU8
 zShhTHNOuJRhngF8ukkCB/eCzqvFKdzfXZmcdnh8=
Date: Tue, 18 Aug 2020 17:55:05 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200813175442.59067-1-pierre-louis.bossart@linux.intel.com>
References: <20200813175442.59067-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: wm0010: use DECLARE_COMPLETION_ONSTACK()
 macro
Message-Id: <159776961933.56094.2198814210491994428.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Thu, 13 Aug 2020 12:54:42 -0500, Pierre-Louis Bossart wrote:
> Follow recommendation in Documentation/scheduler/completion.rst and
> use macro to declare local 'struct completion'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wm0010: use DECLARE_COMPLETION_ONSTACK() macro
      commit: 093513b8ed12d3f074c846cfae5ca4e34f3b37f4

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
