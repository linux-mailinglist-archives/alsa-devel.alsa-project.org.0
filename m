Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78F419D71
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B557216AF;
	Mon, 27 Sep 2021 19:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B557216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632764986;
	bh=1+HnbYq2r5S6/YxD1rEEfSEmLRw8mQqnB4sfUS8JJIE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAFlb2Wjbvqw4Lov86BVFLhLSEBkAyHJqSzx2aiRB4mQ3NlClK6G1uiAbl33fLEVO
	 yDNVvHfdfzpHaExSdB8qyvyid+LLFk56sakAdGDaHonIEfGcIsIhbpck6Hc4bkML4m
	 c2WGkffVJlGweR6U9Re9v4qN/Q5oOueDwtSq8qM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B62EF804F3;
	Mon, 27 Sep 2021 19:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B368F804ED; Mon, 27 Sep 2021 19:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C56C2F804E5
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56C2F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rZV58TEv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FD36113A;
 Mon, 27 Sep 2021 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764836;
 bh=1+HnbYq2r5S6/YxD1rEEfSEmLRw8mQqnB4sfUS8JJIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZV58TEvPhny7vkpwr6aiMybU2c6C9RLhaMjwd0iT+0JYul7Pbm++xXlsf0U7rW5p
 RTfJpxnGk4taHvDYUofughMdEVoZEawzvl8tZNbRcwCgPUu5Ya8D+aYY83hdi2sKWF
 p+98bDDFmWNzJ9XrVTNGh3RaMJOMf74YhFguCOB/MkI4MiYqsZwM8U7/KLD6Tiu8hG
 VpNScts4X4wmXksDTSN91HhiUSsoAgFcu+xm/XN1G/t61bzAeqxkMTtvXdO6Pe696s
 Pdzwsanl8nUZMjKQl8TrWcPI5kK7wLN4VBGiSRxxUUbof2ftBH6o0ck1ZEeQZ+HOnW
 FvbjhrhcQy70w==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: Re: [PATCH] ASoC: ad193x: Update to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:28 +0100
Message-Id: <163276442020.18200.12925068407442212285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916142232.33914-1-broonie@kernel.org>
References: <20210916142232.33914-1-broonie@kernel.org>
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

On Thu, 16 Sep 2021 15:22:32 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ad193x driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ad193x: Update to modern clocking terminology
      commit: e3a0dbc5d6d99020b41f26d3ca73235ba57256c0

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
