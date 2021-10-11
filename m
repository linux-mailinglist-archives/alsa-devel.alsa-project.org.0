Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B9429521
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:03:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B830D16BA;
	Mon, 11 Oct 2021 19:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B830D16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633971820;
	bh=5cqL9zWFZBEBMTUX4ZfpDqFN24XzofHHL51jBod0crk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCpAyVSTGokZ9h/U/fhRaqgUjMoi5np2inn0frYDPIMFhrxydEMSMrpw+oFsgJkpb
	 FD41g58gt+PGfIWa/jT2fM379qoqO4y3qhqYEhZBsbYY5+67ioRl6Iyhv/lIlVWnrZ
	 tJcSxDdCM1b/LA0UoRpzEjWPHDVvRuPoCA/LcQ6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD0DF804E2;
	Mon, 11 Oct 2021 19:02:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4BB9F80423; Mon, 11 Oct 2021 19:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1427BF80269
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1427BF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PB1fq8/V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C0A460F3A;
 Mon, 11 Oct 2021 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633971713;
 bh=5cqL9zWFZBEBMTUX4ZfpDqFN24XzofHHL51jBod0crk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PB1fq8/VYbqOg3HlflwTVaaHg9aibDKfx91ypOkx1H2qs1SxAs14Oj/+pdmMX/2ZW
 brEt4C2FEwsqsBRR2wJk6/CfEhXNvSbW+xvzt5CUru6Ek8vSXh5PI7+dLUKTZF6akp
 vaeTvsSl+1aXbAFgZoA5oCgVx7NPCmHNGkpTTj6e1wToSNsGMgn9Fyr5Lxv6vCTA3J
 hMjDCeQTqpuus+U6BHbjgdw76hYMlE0Yc+ufAz56CJp5D0DinR+gp475pqNWcLkp0E
 7iQx+glAMWVpPJHWT5JWOLBryz+KVevcIsCd9KMBhS/VpQ7a/RxkWLChuArXWtf5H8
 egSS6YVOe85LA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>
Subject: Re: [PATCH] sh: Use modern ASoC DAI format terminology
Date: Mon, 11 Oct 2021 18:01:40 +0100
Message-Id: <163397094549.6567.3207662556586178987.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210915172302.36677-1-broonie@kernel.org>
References: <20210915172302.36677-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
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

On Wed, 15 Sep 2021 18:23:02 +0100, Mark Brown wrote:
> The SH machine drivers have some ASoC DAI format specifications that use
> older defines based on outdated terminology which we're trying to retire,
> update to the new bindings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sh: Use modern ASoC DAI format terminology
      commit: 81a13ac7e3e490a76fafb7f62d1dd751ae94ca11

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
