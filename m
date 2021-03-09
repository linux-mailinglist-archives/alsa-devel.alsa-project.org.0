Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B4332EC2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 20:09:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF3EA846;
	Tue,  9 Mar 2021 20:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF3EA846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615316959;
	bh=kL8V2tIiFOJatpiuDn9iQM2rKrqezgz7PUjeotjXIWU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uq1yxt/fLWChfi/u6RUKK/cDGZCNB5hgNjonayNkbEGigv4qYuVx8qjoL4qsTb8n5
	 2uyHiCdP+dd23mnNFG8oraa3JHnbPd3m8LF1DCioGyRKECt1vPnAtHzHcsKjxIoyQc
	 xhhLfBRK0FQqsnYyso7JhH7wGqOV7FcHvMasvYSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F5DF8019B;
	Tue,  9 Mar 2021 20:07:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34802F80256; Tue,  9 Mar 2021 20:07:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 541E9F800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 20:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 541E9F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kaYyKoqv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91DBE65230;
 Tue,  9 Mar 2021 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615316855;
 bh=kL8V2tIiFOJatpiuDn9iQM2rKrqezgz7PUjeotjXIWU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kaYyKoqva9Q9G6T97vdJYbuLWwR0klxD2GpP+GdiD15CJWxXN/4igYEckquHNNc7Y
 e+1RDhgaoYmHuyLD0BEUa9DOwxlBZioIhHalJg/i9ZqFIAFjcYDpDTVLOqoeXgRD3l
 NSRSaUmr76RLqxZC962zul+R/M+CiODa9lWOMqJnVuTOd/a+3QIqTYcU/M0gunCABX
 fNCz4QkOmB1xv1bwgERmG+3i/XsDJOc5IQBQbyC5oiBAKJktznOd6DVCqi0M15Cos1
 TLuNh7bCWOhuGSMuVf44B6PMQtD5f/AYzaq6wGC/NEgTORA25wds1UP4hfso4uaXE3
 i1DcXgiHQZSAQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Takashi Iwai <tiwai@suse.com>, 'Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20210309131455.1883120-1-weiyongjun1@huawei.com>
References: <20210309131455.1883120-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt715-sdca: Remove unused including
 <linux/version.h>
Message-Id: <161531678411.49117.10283512358773519203.b4-ty@kernel.org>
Date: Tue, 09 Mar 2021 19:06:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 9 Mar 2021 13:14:55 +0000, 'Wei Yongjun wrote:
> Remove including <linux/version.h> that don't need it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: Remove unused including <linux/version.h>
      commit: a29ba32ac97760822a0a664d1ec521c6be8d632f

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
