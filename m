Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5919120D08D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 20:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9EC847;
	Mon, 29 Jun 2020 20:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9EC847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593454727;
	bh=PRzEUjCwFdEbb2h7LthoNz2Fd8Gh9/Q8utmKomXm5U8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEBz0Bo+LIeeOKixoZ8LHuz400q2Ltzk9TL2NkQML9K0Fh2UdzK2GFHfybGFo0/Ma
	 4Ea7plvJOxpeuoxlB8dWX1d8MPtnkvzEzviHm6cHjJhXawJmQfq31w3GbCIRosSP3s
	 G3qfTs27rBRbNHW1Hkxvk+zUW2kTvS4KdAy24aUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03064F802BE;
	Mon, 29 Jun 2020 20:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9EDF8020C; Mon, 29 Jun 2020 20:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8542F80256
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 20:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8542F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cjie/f2s"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9520255CB;
 Mon, 29 Jun 2020 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593454524;
 bh=PRzEUjCwFdEbb2h7LthoNz2Fd8Gh9/Q8utmKomXm5U8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Cjie/f2sybCATA4dkTGFcdf59jIZLIWBY4SBWEoNDYh68xvujTFZ817yIvQtB6lI+
 +9A/rMEaV7xPEijchgYYTDVRYRuTK28yEMdGLgZwWY15w/4gCz9kTkEzy03QVGT4ZI
 JDzvQ3bLdUv9oA55zVyE9o5Mvdwp5zqxSnqSsIaI=
Date: Mon, 29 Jun 2020 19:15:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20200626154143.20351-1-dmurphy@ti.com>
References: <20200626154143.20351-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/4] ASoC: tas2562: Add right and left channel slot
 programming
Message-Id: <159345450675.54191.5281354512647747070.b4-ty@kernel.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
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

On Fri, 26 Jun 2020 10:41:40 -0500, Dan Murphy wrote:
> Add programming for the tdm slots for the right and left. This also
> requires configuring the RX/TX offsets for the DAI format type.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: tas2562: Add right and left channel slot programming
      commit: d7bd40ae55ce339a3c9be7fc2087c671d3d80894
[2/3] ASoC: tas2562: Add voltage sense slot property
      commit: f10b6c99c08433861d1ed62267fa57ced7dbdf50
[3/3] ASoC: tas2562: Add voltage sense slot configuration
      commit: 09ed395b05feb7d0f77ab52c48d2f77c1b44d2ab

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
