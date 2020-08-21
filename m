Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17324DB92
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31ABE1726;
	Fri, 21 Aug 2020 18:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31ABE1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598028231;
	bh=eeD33E/GM5/WtGmv+bjQ9EqZZdzjh3+IGMJzdajAfKk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PnAqJpp1i/A0uNJ86L6PDCljduTUjkGTJAo7EU1ekYfW1LjOurqH5wEOqexLyUN0W
	 TaMBptA87sBZtCgVqy3CBmBdw7VMplw5ptud7aG69nnO1P8TrZ+JuPpdeutlJPfqPF
	 VlMDdHu8UlqW2uRoMHH2JIDlSdZnopUJoARi95Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C95BF802C2;
	Fri, 21 Aug 2020 18:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0FFAF8028F; Fri, 21 Aug 2020 18:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A56F8025A
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A56F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="So0tK9r4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ED4820738;
 Fri, 21 Aug 2020 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598028030;
 bh=eeD33E/GM5/WtGmv+bjQ9EqZZdzjh3+IGMJzdajAfKk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=So0tK9r4QCjDNUgTZ/eg3qedxTbwmYbxb50oP3TgYxxRoEvV38q69vk0rsrwy/RBl
 sWtJzrkOI5yoyFlO37/Txe2OY/aQJz/54m/eJUqQla0YcV5WE0cNJBOMZ1ntjRM2On
 nVyCOpqof/gih7HGjjkqfAFg243X3YaGIr4UXFiM=
Date: Fri, 21 Aug 2020 17:39:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200821142259.C2ECE3FB96@swsrvapps-01.diasemi.com>
References: <20200821142259.C2ECE3FB96@swsrvapps-01.diasemi.com>
Subject: Re: [PATCH] ASoC: da7219: Fix I/O voltage range configuration during
 probe
Message-Id: <159802798182.25503.9768924803803430146.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Fri, 21 Aug 2020 15:22:59 +0100, Adam Thomson wrote:
> Previous improvements around handling device and codec level
> probe functionality added the possibility of the voltage level
> being undefined for the scenario where the IO voltage retrieved
> from the regulator supply was below 1.2V, whereas previously the
> code defaulted to the 2.5V to 3.6V range in that case. This
> commit restores the default value to avoid this happening.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Fix I/O voltage range configuration during probe
      commit: fcea8b023a5f06ea0180ae65b01520b0414ee325

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
