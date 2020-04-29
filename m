Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E81941BE3D3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E2C1692;
	Wed, 29 Apr 2020 18:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E2C1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177682;
	bh=pEbrmIswVyccn7pcll0ZqDv96VFk0WJzWxqs+hO+orA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsqlSEMKeOGxbxwTHrUziDq3FOAzQq60nX7S/0NiW8D9Xd/RZOMStw6wmIafPB8P4
	 FnfC6arwSqhZLFwrB+e1jQl0LQRlwUaDy86hN7Ld5tda8UViaxwxUFoSCH1WwWKWpA
	 Y6kwCetwXJdJPr0LeYqbeZe7uRsblpWiBtEwKXQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A54F80217;
	Wed, 29 Apr 2020 18:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB961F80232; Wed, 29 Apr 2020 18:26:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C46F800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C46F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bDixAiel"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABFDD2076B;
 Wed, 29 Apr 2020 16:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177569;
 bh=pEbrmIswVyccn7pcll0ZqDv96VFk0WJzWxqs+hO+orA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bDixAielSDNhTG+NMPOqLNDc+jJnN/n22O7Rg23e8T+UH700Y3k2KN8uzM0qxLPkx
 EwY2WTEvHfVrWxTTEYEIKmzwa3K9ZbjjjpjUoLXxGVPqNjZqMGFPlb0kjU8+etwO+i
 HUyqHKP0FJgSeL+bOlXJktU0zY0TYIbvPfKZk8Tk=
Date: Wed, 29 Apr 2020 17:26:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20200428214754.3925368-1-arnd@arndb.de>
References: <20200428214754.3925368-1-arnd@arndb.de>
Subject: Re: [PATCH] ASoC: component: suppress uninitialized-variable warning
Message-Id: <158817756637.27768.10087269743867746681.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
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

On Tue, 28 Apr 2020 23:47:31 +0200, Arnd Bergmann wrote:
> Old versions of gcc (tested on gcc-4.8) produce a warning for
> correct code:
> 
> sound/soc/soc-compress.c: In function 'soc_compr_open':
> sound/soc/soc-compress.c:75:28: error: 'component' is used uninitialized in this function [-Werror=uninitialized]
>   struct snd_soc_component *component, *save = NULL;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: component: suppress uninitialized-variable warning
      commit: be16a0f0dc8fab8e25d9cdbeb4f8f28afc9186d2

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
