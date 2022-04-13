Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A24FFCF2
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 19:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4182E17EA;
	Wed, 13 Apr 2022 19:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4182E17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649871438;
	bh=83gawc2ryUKhE6nTyQqw/IKIOP5+eSo7X0LmsnEkxxU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IStMoHDXrwqya2L+wrPO49vxKtvZxYRZ8sYYGMAS/5cTxCY315qYgeR9sQgOsm7hQ
	 fDZsHna3wFtIHgACLnMAvJw4Mjhte2KGayxwxlCKh2bfgAyuerrIS/A15D1yND6prM
	 bvXcEXBl/UorQvUYZXU+FfByTuYSeDy0v4ozhgWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D36F804EB;
	Wed, 13 Apr 2022 19:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED335F80248; Wed, 13 Apr 2022 19:36:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F5DDF80095;
 Wed, 13 Apr 2022 19:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F5DDF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hMlgxCqV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7DBCB82694;
 Wed, 13 Apr 2022 17:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C00C385A3;
 Wed, 13 Apr 2022 17:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649871368;
 bh=83gawc2ryUKhE6nTyQqw/IKIOP5+eSo7X0LmsnEkxxU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hMlgxCqVBchlxxtQtNi462qSDjM3PPMbcYvrY2aav4Z1yrBKaZiz8PY37R+jcTOuc
 BwMAMCtObxzPuFsXRalmx7zq5VB1lqHEPda8Swvh3c7dXrZwdKC4uJqJHpZJSIt12N
 zUZC1wrG0bIWqLOkoNLKAzTJHuWuhkSS+U6a/ZcF64cG4QLL7mB7ZZ5SoDYotishQd
 Z8ta77FD7r/sBPCVOnZRvblCwsLoUgftWsaLmDvQGuxQJdMFL0AXuIdwPmdL50D+YW
 Iaf7gZO+tgrXEJGuuCvwRxWo6K5vBANnXHMYxeOWrd64iPtB3lhE552pMq6JdnDi09
 nawLRpT3cOjhA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 perex@perex.cz, kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, zheyuma97@gmail.com
In-Reply-To: <20220409143950.2570186-1-zheyuma97@gmail.com>
References: <20220409143950.2570186-1-zheyuma97@gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Check the bar size before remapping
Message-Id: <164987136564.69869.12166607399991821172.b4-ty@kernel.org>
Date: Wed, 13 Apr 2022 18:36:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Sat, 9 Apr 2022 22:39:50 +0800, Zheyu Ma wrote:
> The driver should use the pci_resource_len() to get the actual length of
> pci bar, and compare it with the expect value. If the bar size is too
> small (such as a broken device), the driver should return an error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Check the bar size before remapping
      commit: 5947b2726beb61fe7911580f239222ec9c4f6967

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
