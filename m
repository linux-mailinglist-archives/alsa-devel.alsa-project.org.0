Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB044655A4
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:37:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C27270B;
	Wed,  1 Dec 2021 19:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C27270B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383855;
	bh=PfF1ZbGqojIqd81E4sa6m2TdJFsCdNL7JDfpIeyyf3Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cSrYa/snsWc/aWqEDwR+jHJ/Zc8x0Wuk1Ec+FyUtVjypaB7c7hB/iBT8Ly069mWGI
	 e/vCfRPVCaaUOYqPK1LzEsDBv3hDf0x9RamoEoGI1pW0wJOS9nviu3WOYGIHLVkFbP
	 +Gq0xAY5d+UIP1O1ui0K9w8rYK4FK9PAPFjeyi7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22411F80543;
	Wed,  1 Dec 2021 19:32:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6A8F8053E; Wed,  1 Dec 2021 19:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1369BF8053C
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1369BF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nK07L1NS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CD45FCE2082;
 Wed,  1 Dec 2021 18:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D6FC53FCC;
 Wed,  1 Dec 2021 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383544;
 bh=PfF1ZbGqojIqd81E4sa6m2TdJFsCdNL7JDfpIeyyf3Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nK07L1NSTP87kOIVF1+ADsRKuW8YRgHyNEaR1dp1O7BIDVuUV6336Ptti1H+budv/
 GGbkJlHqCkduu3qeiEmINs0cUqnYbBhZfA+q3y0sT7yH9ultdmKIJT1eQhEJt86ws3
 i36/D/kYKNHppyqL/bulWesQlpG3t0hEBHL7oLDtgJrcYrGl63ivVSFGNjVBWIlCaa
 EVgOFgP9XJu93873OuPMnD8ecjns+JhbbU/Kbid4L4dM3l58cztulYBU124G/dJuS2
 f/5OKox0+8RDuh5dyDiRW8PpwhCM8XvuA4QbjDRurmv6aEHf/7AJoUZ/eF9wtUQpRE
 kGyBzXcxMAwag==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20211130102842.26410-1-ckeepax@opensource.cirrus.com>
References: <20211130102842.26410-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Move lockdep asserts to avoid potential
 null pointer
Message-Id: <163838354329.2179787.4955128030042960297.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Tue, 30 Nov 2021 10:28:42 +0000, Charles Keepax wrote:
> Move the lockdep asserts until after the ctl pointer has been checked
> for NULL, to avoid potentially NULL pointer dereferences.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Move lockdep asserts to avoid potential null pointer
      commit: 043c0a6278ca443b1835726239dc2814c1313a9e

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
