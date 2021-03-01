Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3733329554
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE9516B9;
	Tue,  2 Mar 2021 00:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE9516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642291;
	bh=giRNibx8UMkg76ubdWLBG8i0Hm5P8hvlHVh8cF1awrk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qwbc2SFhzf3p+I0L2IGP4pLV1pSGPOpzI5DQrb4vnPzATtgVjuDZI5EaV/inZ4Bqg
	 AhJ1sggB9nAf2Ccszpu+O1oj3XieAJg1dytC4tXbeDp4RdyWJzTPqQ3Monf+lCggJ7
	 /SlzcsXNFvo/sxZ7xDCGiS6a3nO02Xfuz/fvxr5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0183F80534;
	Tue,  2 Mar 2021 00:37:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6ABEF80536; Tue,  2 Mar 2021 00:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93993F8052D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93993F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X2pAH5QK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 823376024A;
 Mon,  1 Mar 2021 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641851;
 bh=giRNibx8UMkg76ubdWLBG8i0Hm5P8hvlHVh8cF1awrk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X2pAH5QKtQHCBP3xTkRq4rgHqjEnKIH8LRADOJHHti/Yltgqm0tO6DbTBwzS9+BYp
 UFuvTzKWbnNY29jyshdCv02elfiachBnPQ/MVZ3AWcYGMWYlRdirsYcpn8tTVZ2FzR
 m+S7CAnvfzDAf1DtHEI2gaUVjo0zFWwJPoiDoPqIiOzml3TwWnwaswHGfZ/HnsWmfV
 IEJojZlCicGp9iFIw/ME3XquWCiuEeeR8KjM+KscREMBOqbZxEs0kJGzILENOkz1bV
 jl2WsheKeczbK//tjjRA7asSts/slN0v+UHRmEEQzaYHMGWcmkjAkL8ZGllYLD9hM8
 B93zX7AzvGUNA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, dingsenjie@163.com, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20210224085407.22120-1-dingsenjie@163.com>
References: <20210224085407.22120-1-dingsenjie@163.com>
Subject: Re: [PATCH] sound: soc/uniphier: Simplify the return expression of
 uniphier_aio_startup
Message-Id: <161464168096.31144.10521204916240412508.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: dingsenjie <dingsenjie@yulong.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On Wed, 24 Feb 2021 16:54:07 +0800, dingsenjie@163.com wrote:
> Simplify the return expression in the aio-cpu.c.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc/uniphier: Simplify the return expression of uniphier_aio_startup
      commit: e3fdb6288dd08d965dea4bf00186e20f79153b2b

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
