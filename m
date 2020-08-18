Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56459248C32
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00EE7171D;
	Tue, 18 Aug 2020 18:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00EE7171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769906;
	bh=PMfzfiAqcPXlXu5+PpIhojgS7cmHoB6sX8LG4lMXi2w=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MgTh9fTWAHc2Sp1gITgBRJmSoaoSTQO5V2j+Wghpsc17k/73BK+yrPNFnLVKr3RdS
	 z7lOFA/RymQIGPlkwIe+yB9RqoQmzEriy/OxybuhQMFtaPJ7rum5JhCLez+I9ukxMg
	 9ybvuvFVGBiAHluk7Maeul4e7XKdiKmYMxgMMNGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3132F802EA;
	Tue, 18 Aug 2020 18:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 311C9F802E8; Tue, 18 Aug 2020 18:54:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E32F802E3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E32F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YFq50sSU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5FE207D3;
 Tue, 18 Aug 2020 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769670;
 bh=PMfzfiAqcPXlXu5+PpIhojgS7cmHoB6sX8LG4lMXi2w=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=YFq50sSU6RhGrWc8t9xZbk8wknnIp+Ww/9n7oWuNyKIZZbeAPtGN4NZQc4ZZ5rd6Q
 zQG4Y2V5KY26/BDLJIX3GqzgqJzQEfsazBMxEADKagIDb2LaDbfXpD/5e9YIQSkdG1
 IfNVshfsGPXBVidoAt8+RmCd+motEqtqWb6Vf/xE=
Date: Tue, 18 Aug 2020 17:53:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20200808012156.10827-1-rdunlap@infradead.org>
References: <20200808012156.10827-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: SOF: delete repeated words in comments
Message-Id: <159776961931.56094.1084906977146137662.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, 7 Aug 2020 18:21:56 -0700, Randy Dunlap wrote:
> Drop the repeated words {that, the} in comments.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: delete repeated words in comments
      commit: 8932f0cb20e815478a5aaa6ff2850ff25f10a2fe

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
