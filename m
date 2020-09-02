Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2F25B427
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 20:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC401883;
	Wed,  2 Sep 2020 20:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC401883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599073004;
	bh=53oFrEOwT3W5ryLGIn9yWPPnLfNFg27GWJ0wl9kV5BM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WN3k5gbbD8zChrF4k1p1Le791Nja5VgNtUjJPTZRNTCH8/h4+GA7EHMjqMuPGg22D
	 rirPvPXq9nPwW1yXjuVKgSqd+AMzuQX3zV5khWHCQuL9ovGiw3l+leI2ZzKIcdNzUx
	 ey+VFs/sFpzlgzXXElXiO7VKJAFxmEv0h7VSqnhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A877EF80257;
	Wed,  2 Sep 2020 20:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27F39F800F3; Wed,  2 Sep 2020 20:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD87BF800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 20:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD87BF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kzuyQSp8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66ADA20773;
 Wed,  2 Sep 2020 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599072889;
 bh=53oFrEOwT3W5ryLGIn9yWPPnLfNFg27GWJ0wl9kV5BM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kzuyQSp856hnRdfrtY5NdJB6rox7WRPL26609ths+2FdSlmrQpjmzzUeTiPxRPMyN
 S0FW6ViOPBG03Z+QMQgNj+vtSFVQXa8O73Q9SxtRCDoD1mHFod8QqOO7rgcfeiqxpS
 yY27L9auhhOpqLvWPujm33Vo+r2kJfNVAEx4D8Us=
Date: Wed, 02 Sep 2020 19:54:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20200901080623.4987-1-hdegoede@redhat.com>
References: <20200901080623.4987-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9
 2-in-1
Message-Id: <159907284843.18024.12477839540387023285.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Tue, 1 Sep 2020 10:06:23 +0200, Hans de Goede wrote:
> The MPMAN Converter9 2-in-1 almost fully works with out default settings.
> The only problem is that it has only 1 speaker so any sounds only playing
> on the right channel get lost.
> 
> Add a quirk for this model using the default settings + MONO_SPEAKER.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9 2-in-1
      commit: 6a0137101f47301fff2da6ba4b9048383d569909

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
