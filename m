Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31321AA3C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE20415E2;
	Fri, 10 Jul 2020 00:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE20415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332271;
	bh=yUJ6j5WjQRrE5AVdb3fA0p+w+6twBV/hlDzA98oNUVM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OG9xpcvQXScXbVAjDLY9RRi9bxcY/C5GqvlNO8eWpSc7PIx13xOBlagpBJ5CDdPqv
	 8fDBMlXV1xcydwF4LeZR7a//rV61H+aA22OaPC4WPPwakgw/K/bUjcodySeaiKA/md
	 411kzsqFtLABsWc/9aDwcTPDZ/4d8ZjDnqX7dJxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F8AF802E8;
	Fri, 10 Jul 2020 00:00:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DDB5F802C2; Fri, 10 Jul 2020 00:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03C9DF8025A
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C9DF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kPwMqEXg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08D6320774;
 Thu,  9 Jul 2020 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332028;
 bh=yUJ6j5WjQRrE5AVdb3fA0p+w+6twBV/hlDzA98oNUVM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kPwMqEXgehtuG7TAZYY+oZ2MsReJ7SsJ44mVJZT/g5qkP288wiBiiIeHjny41FApR
 5vheVuaTjY/HyaKRLaBKJzBKYg/ivxhZ9qy5PXZuBAtO19Cy2STALUpKDBNEf0y7p5
 ROU7RS+V4cz+y013LPVA8VX7KJ1FBjswRiNUSTyU=
Date: Thu, 09 Jul 2020 23:00:23 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200709185129.10505-1-dmurphy@ti.com>
References: <20200709185129.10505-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] ASoC: tlv320adcx140: Add ASI enable for channel 5-8
Message-Id: <159433200032.57213.9046850356730797696.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 9 Jul 2020 13:51:28 -0500, Dan Murphy wrote:
> Add the ALSA controls to enable the ASI for channels 5-8

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tlv320adcx140: Add ASI enable for channel 5-8
      commit: 91cb940c2c953b9282700178b32300e4da84c636
[2/2] ASoC: tlv320adcx140: Add tx offset slot programming
      commit: 336c129139cd50faf5bd68acc343da817d13839b

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
