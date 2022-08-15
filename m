Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EB593320
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE90415F9;
	Mon, 15 Aug 2022 18:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE90415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580743;
	bh=sVw0jX2MDbbtxdw3C7N48E1ZHL6zGdjBiKamZBFLaoA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMFsIdlxKp6DKmxfAbnY2lebTYmYIgtHt0xNY3JKlp4PPkCspe7C8tIKZluDVYLfM
	 00iWzpwJ75Hax2/5SviHivgmwahev+lGDv5i+kQKe6TkWtmCQZRyW9ZJDiRDkJR6Qe
	 H/PJAStbCWYZuo9p85DD3uOzRcjqRg+Lfn6JEPqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87F8EF8056F;
	Mon, 15 Aug 2022 18:23:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00AD8F80578; Mon, 15 Aug 2022 18:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93650F8055C
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93650F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o9tAnFaE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC37D611B7;
 Mon, 15 Aug 2022 16:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD97C433D7;
 Mon, 15 Aug 2022 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580588;
 bh=sVw0jX2MDbbtxdw3C7N48E1ZHL6zGdjBiKamZBFLaoA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o9tAnFaExPSXTyRBiAxWXv+fgfGnQRgJIs4/Y+AT47nw+QMibM9bsfkUSr23qz7i4
 EpJrNbvhV+sEZdnS3yWNFXDbMYWW5VKphYVIe3Lp2M1dCX98SnW1J5cCnfFFlcG8LU
 i3Xtnei8VmL0yF9og2KubxN4tgPXY/NwBdQfEZjk3KZ0ALnB+5xhR0XYSP+XKCVqSq
 j6dqLl2SJG30+ImCqHWIevyheqhSqcv9wyQhzLHklDiX6pYPRbvF6098NlVHSvfpHe
 Fi0ppRp3S/Ww2eK+pJTNICA1MQvUX47gyNi4vrn5RhySJ2Evu5aOpmhEPuJWyKlSnF
 RPgTvzlN5cz5A==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <63efe8fe4e25a8ac386762d2d7cfe9bb9482333f.1659814389.git.christophe.jaillet@wanadoo.fr>
References: <63efe8fe4e25a8ac386762d2d7cfe9bb9482333f.1659814389.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix a typo in a comment
Message-Id: <166058058662.769843.9592183911230477031.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sat, 6 Aug 2022 21:33:22 +0200, Christophe JAILLET wrote:
> s/TLV320ADCX104/TLV320ADCX140/
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix a typo in a comment
      commit: 98c17a01bc5965047890bd30c95966007234e6d1

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
