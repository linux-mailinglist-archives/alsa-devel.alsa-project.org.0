Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E142FDDAD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DDA318BF;
	Thu, 21 Jan 2021 01:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DDA318BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187896;
	bh=8FKYosXPvv3FUOJpSS4TQL6/pMTyAw/0IsBrN+udhPw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qoq7w3qbX6d702I/WLNU9HqqWY2jbDO5ZwL9EIVpqgmfAix02hqccPAAIf29Y7a/i
	 HRq0RiVCQ6r9sXkJTQCctcGxnpHOqN/EbqIJBeuNI4h1eXY1BiM8LMLg1qp6Sakseu
	 7bln73QpPuOki7m/WCeR7kOyMJsFWhsbY40zhgXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B27DCF80253;
	Thu, 21 Jan 2021 01:07:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26866F80515; Thu, 21 Jan 2021 01:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7658F80253
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7658F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gdvtbe+8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D266E23719;
 Thu, 21 Jan 2021 00:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187643;
 bh=8FKYosXPvv3FUOJpSS4TQL6/pMTyAw/0IsBrN+udhPw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gdvtbe+8eGrpAOj4KN+Et0uer2Vm1lXoFwKueZUFL32p8SDMfpMUu5t+/O3PbyHSr
 7BChQlPzicvM2R/IzUHKZr2uJgpBoTSt7kZTr53VkUHd+/MzkDAfL6j7y5419AC9c0
 qq3PA/OvZ6JJy9JggHWx/I0i3d6imBx/95iQUhsR/RCIScMQWwH7ZxVmVODAlPtH0C
 9oL1TQRMRE0diauObEHal926C17qoxtwOXnDDd5DvJxRLxdMT8Pevcb3di9uHdYr2e
 uj8CyqykFyUOkXNte+3JNeaG0KwXUaq0EhnX66sJol9WtoXERgEOtYd3OVHl6quLDb
 XnMHgedfIz96w==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20210120162553.21666-1-arnd@kernel.org>
References: <20210120162553.21666-1-arnd@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: remove obsolete drivers
Message-Id: <161118753484.45718.5745796421689353764.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@arndb.de>
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

On Wed, 20 Jan 2021 17:25:51 +0100, Arnd Bergmann wrote:
> A few Arm platforms are getting removed in v5.12, this removes
> the corresponding sound drivers.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/
> 
> Arnd Bergmann (2):
>   ASoC: remove sirf prima/atlas drivers
>   ASoC: remove zte zx drivers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: remove sirf prima/atlas drivers
      commit: 61fbeb5dcb3debb88d9f2eeed7e599b1ed7e3344
[2/2] ASoC: remove zte zx drivers
      commit: dc98f1d655ca4411b574b1bd2629e7132e502c1c

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
