Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71191E46AB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 17:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8535516E5;
	Wed, 27 May 2020 16:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8535516E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590591644;
	bh=u2lDoZzGDayxtcZjIvEEOU3TwyrSTCxS9YF+ccmxFgI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/j2FaHGAuCPwbhf/nm9xEixTXquRNdlop7iLU7F9E5ZNGp9p1sA3QAhnYF6peUx4
	 c8bScCUHhDbCKZveUJvXEMbYKdCBKc/IL/Id6kk3FSvzwDjKKgFlFEw+kZ13L5RhgW
	 B9Y6JuPGJXJxtyPbCvbnMSRMYlKFhhGl/lKZyz2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4AEF80290;
	Wed, 27 May 2020 16:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 955B2F8028F; Wed, 27 May 2020 16:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F073F8016F
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 16:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F073F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kmFYNI8v"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03D56207CB;
 Wed, 27 May 2020 14:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590591487;
 bh=u2lDoZzGDayxtcZjIvEEOU3TwyrSTCxS9YF+ccmxFgI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kmFYNI8vmreNjgNmLh7kzEKqFdOwBfTIO/weUhPifpJjOaXfr5hc9W0JU/97B7wfl
 4C4Um1kgnay0VTQKlDKaQw75Z0u//XA11up42fz+ZwR9syaSwEsDxU/ZgX6ZeOYaJh
 V6qoD4rJSSo1HSePBbm88Xjn8ioZWZuihv8ftsLk=
Date: Wed, 27 May 2020 15:58:04 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, Dan Murphy <dmurphy@ti.com>,
 perex@perex.cz
In-Reply-To: <20200526175247.15309-1-dmurphy@ti.com>
References: <20200526175247.15309-1-dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix warnings when using W=1
Message-Id: <159059147354.50918.15790917523378380090.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>
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

On Tue, 26 May 2020 12:52:47 -0500, Dan Murphy wrote:
> Fix the warnings when using the W=1 compiler flag.
> 
> sound/soc/codecs/tlv320adcx140.c: In function ‘adcx140_reset’:
> sound/soc/codecs/tlv320adcx140.c:570:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>   570 |  int ret = 0;
>       |      ^~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix warnings when using W=1
      commit: 850ba84b5c6d4ad4d1259584ebc0338eb769f2ef

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
