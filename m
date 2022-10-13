Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B11945FDB47
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 15:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F97E5B3F;
	Thu, 13 Oct 2022 15:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F97E5B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665668613;
	bh=CgjVDRPLLDY0nzJJ73FalYoKdxZlMOPZptlSF0/G1gk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ALmR0iQAtuL2xbGzR0iuZjaALj79aMUzqXYGdWvIkMO10nGN2JtiIA2YbOOhaH/U2
	 NtXi6FCHEofcQVMmhijxx5SxzEPden6Sx56F+D5n3YEK11iYvqKOfOkbqVt0tc6dPF
	 pEQxlYZ49/ybiQwt3jrv3uFeS00Lvqe58eZrvEEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16D10F8053D;
	Thu, 13 Oct 2022 15:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B376F804D1; Thu, 13 Oct 2022 15:41:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E60BF800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E60BF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kr7eNSmp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D2E4A617DF;
 Thu, 13 Oct 2022 13:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F160C433C1;
 Thu, 13 Oct 2022 13:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665668508;
 bh=CgjVDRPLLDY0nzJJ73FalYoKdxZlMOPZptlSF0/G1gk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kr7eNSmpr9EyQ3F/OG7rju4f4oJAi/t7qxQPhGDk+NH6rXc0aIv5izvwPPXQe0e9z
 LDX9I8AGsXr+/OAMnEg5R2uwJLIuPZFIdwTSnzQwoexMPp++lXaOYpE3tXRIsvOJPr
 j+7Hhl7U/uuHhfuZ088WIQ4FTQI9FN8nJyTnaIEGrO8utF7nI5RnWGfAgEC2tLp7cx
 Y5seOxc1lt7AdOZTYiB4IWz+C3jNS463d6EWKbsTJFe/zs2I2n5CEZWYEyOz/s5zmw
 z51bRB9QntPEjXX5HFmD4/RZBsHsCqYL+NsgtN0AuzM5x9zozY3hwiRbAw13ePsX0T
 7esBhoQRolNdA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Jiangshan Yi <13667453960@163.com>
In-Reply-To: <20221009074816.2641162-1-13667453960@163.com>
References: <20221009074816.2641162-1-13667453960@163.com>
Subject: Re: [PATCH] ASoC: cx2072x: fix spelling typo in comment
Message-Id: <166566850637.143340.14997967171152371491.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 k2ci <kernel-bot@kylinos.cn>, linux-kernel@vger.kernel.org,
 Jiangshan Yi <yijiangshan@kylinos.cn>
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

On Sun, 9 Oct 2022 15:48:16 +0800, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> 
> Fix spelling typo in comment.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cx2072x: fix spelling typo in comment
      commit: 29eb79a9a6283d661ea1f70ab012809fdbf057a7

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
