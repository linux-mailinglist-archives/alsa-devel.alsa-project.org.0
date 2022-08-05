Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B0358AC69
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 16:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9937D1655;
	Fri,  5 Aug 2022 16:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9937D1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659710234;
	bh=lfXZ/p0FCY+j8S9HPEVxjbHWN8AAUf5J4lYHiCQiSs0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qyoNqLbAyj6ESh08wn+aYF4lOhChx9NTMwyPvhW35L3S6CGpcoGmYm2zMm6sAw5Nd
	 qv7cHnOMRAu8zk9BtIO9mMx9b4t15kf8eu9AHPQ7Zo6eKQpRYIdnxt+4DB9QNHePCo
	 f65SvfoJSubF03Qqb6ZGSf1vZ17RkMR2vWtBqZAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1C1F80506;
	Fri,  5 Aug 2022 16:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8A7AF8012F; Fri,  5 Aug 2022 16:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23FA7F8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 16:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FA7F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z4cono/B"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4FB461218;
 Fri,  5 Aug 2022 14:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B1FC433B5;
 Fri,  5 Aug 2022 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659710139;
 bh=lfXZ/p0FCY+j8S9HPEVxjbHWN8AAUf5J4lYHiCQiSs0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z4cono/B2Uc5zPnAKuaXMX0hrWcsl/68M90+ynup/C2wlTi2E9F3dKgmLqFcra3cU
 K8ypq3KIrL5NBj0m/rHnV4axVm+dR1iUmPIe1RVC3RHEoXTa0qXUratY92cBQCkAzS
 6vDMe1LkGDvAAoQfE7leDqtYS9wmphKHlhtlyA0pm3hoKp1SutxFmBcDpaPRdnWkAY
 4I1BQqg6vzJoL38OPKSvga6zq4FnWFEiX9vLTGvT58qQyA9KAINjK7c/4Sub1PJzR2
 JKt19CLtSb+jw2DLSgE0tc5tiVbe8ABKb823Sa9qchRSRAd7W1zlyK+4ea093TlInX
 36rqGkNZ3FlcA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20220801170510.26582-1-tiwai@suse.de>
References: <20220801170510.26582-1-tiwai@suse.de>
Subject: Re: [PATCH resent] ASoC: DPCM: Don't pick up BE without substream
Message-Id: <165971013808.1087218.9854826143815803059.b4-ty@kernel.org>
Date: Fri, 05 Aug 2022 15:35:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Mon, 1 Aug 2022 19:05:10 +0200, Takashi Iwai wrote:
> When DPCM tries to add valid BE connections at dpcm_add_paths(), it
> doesn't check whether the picked BE actually supports for the given
> stream direction.  Due to that, when an asymmetric BE stream is
> present, it picks up wrongly and this may result in a NULL dereference
> at a later point where the code assumes the existence of a
> corresponding BE substream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: DPCM: Don't pick up BE without substream
      commit: 754590651ccbbcc74a7c20907be4bb15d642bde3

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
