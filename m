Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233D524FA9
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57CE1ADA;
	Thu, 12 May 2022 16:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57CE1ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364904;
	bh=QRw0vJQe/Y3qqkxPt78PHysjCoMKB1TpPrQrlGRfR8w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHKZzIZDIq7iPJh+1G1IN4tAQFwvuEM26nVtoXGCQcf+PuSyE0k8TlfsVoriW6j/J
	 WvOE8ez2q5IhdYpmN+n+QeBqhs9IsaW/4iQXs79okm8L7/JhFYqqIJMiL797W1RYh5
	 AwcJZ0eEj1IKUt6lHJgzJTnErPUO3TwoCVwQcpic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3790F80527;
	Thu, 12 May 2022 16:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 718FFF80527; Thu, 12 May 2022 16:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 864C7F80511
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864C7F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ulO6pW6i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C26061A01;
 Thu, 12 May 2022 14:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B769DC34114;
 Thu, 12 May 2022 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364771;
 bh=QRw0vJQe/Y3qqkxPt78PHysjCoMKB1TpPrQrlGRfR8w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ulO6pW6ic3WkBHGizVgzP+kAiJidKc7KMGAGOVq7UOybxd5diR+HsjQn/M1gcQ7dr
 qxFkF8KfXlvImlDa+TpzbmiQO810SDuULNzVSzu7vY9ShT3Fiol1Iqr+TpJrSXiBIK
 pECKNq6iUxtiQ82YdzzvHGPeAtDuqB2v8ZnU1aVtyRd44X3IYDKOzgR2713gwMSrKk
 r2uYKBDgWhM4pYS7DEXrTpbsbnU1gTPpfka6qjMIOnxhqBe27cO0vOTvvt4mLTjCRy
 H9dCQeJ3MF2QksoHPAUuzWor09yvifb8AmllavZxPKFRrvztqgNeEpqxlPogvStfg6
 n/CL+4aOu5VUQ==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220511134137.169575-1-broonie@kernel.org>
References: <20220511134137.169575-1-broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: ops: Fix bounds check for _sx controls
Message-Id: <165236477046.1016627.15470197691244479154.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 11 May 2022 14:41:36 +0100, Mark Brown wrote:
> For _sx controls the semantics of the max field is not the usual one, max
> is the number of steps rather than the maximum value. This means that our
> check in snd_soc_put_volsw_sx() needs to just check against the maximum
> value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ops: Fix bounds check for _sx controls
      commit: 698813ba8c580efb356ace8dbf55f61dac6063a8
[2/2] ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()
      commit: 97eea946b93961fffd29448dcda7398d0d51c4b2

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
