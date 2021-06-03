Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9582D39AA63
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 20:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3B8E173D;
	Thu,  3 Jun 2021 20:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3B8E173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622745974;
	bh=0K8Es+G8lj02pn3FpkK4cLI99DHbFbizWUH7y6bSbgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qdjfrpXlFKM0Yr27jSrK8dKFzqD++LIaAyTKOlXqoat7wCZt//0+5p5GU8EKlMhkx
	 TCK0ELPt1QJJTJmGanPJAXmVyuYpUe0ewriP3eP5Nrjj4ElUN3jFI1p9tnDn/sj8RP
	 vkZSO6v1mNv90dX7SyhM7WGejJmmLu2mIY/l0JHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0AA4F804D8;
	Thu,  3 Jun 2021 20:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48AE1F804CC; Thu,  3 Jun 2021 20:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87476F804BD
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 20:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87476F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cz+9o/wq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AF70613F6;
 Thu,  3 Jun 2021 18:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745783;
 bh=0K8Es+G8lj02pn3FpkK4cLI99DHbFbizWUH7y6bSbgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cz+9o/wqkhy+cc4IjLKLx4h4UQ9rZuXRiHIRBphB+YVF3NRua0ISmSmFQSpU1lUIF
 /y9NtHhSWQMVZLg/v7eCfFP00ccmITnSsXChKUhrAZN12ATDKmoFHtZ0Re1Y6RaHM8
 g4QQqgrU/VmnJeh+tZro5ElK5Dy+AYcI2w73N74wxnS2bm85N4H8uu0dc435hxj7p3
 PQItT0r/mktYTRlh/ujxOimbQLXiQFd/bMKbpEhSnsGr9X9Ku/ZgU3vhTXSHeV2uc+
 MGR3p6T5QPtpy/C+HzNrq/+nwdfynBD/ZagLgHAkMHUHzjeZ3CqnUP8ixHfvQYbFyZ
 KRhl2r6OUF0VQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Pearson <markpearson@lenovo.com>
Subject: Re: [PATCH] ASoC: AMD Renoir: Remove fix for DMI entry on Lenovo 2020
 platforms
Date: Thu,  3 Jun 2021 19:42:02 +0100
Message-Id: <162274557551.14795.18378266514386800154.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210602171251.3243-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210602171251.3243-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Gabriel Craciunescu <unix.or.die@gmail.com>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 stable@kernel.org
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

On Wed, 2 Jun 2021 13:12:51 -0400, Mark Pearson wrote:
> Unfortunately the previous patch to fix issues using the AMD ACP bridge
> has the side effect of breaking the dmic in other cases and needs to be
> reverted.
> 
> Removing the changes while we revisit the fix and find something better.
> Apologies for the churn.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: AMD Renoir: Remove fix for DMI entry on Lenovo 2020 platforms
      commit: 320232caf1d8febea17312dab4b2dfe02e033520

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
