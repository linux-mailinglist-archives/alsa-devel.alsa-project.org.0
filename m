Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BC280A8B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0167E1AC3;
	Fri,  2 Oct 2020 00:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0167E1AC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592654;
	bh=RD9luzNVf87Ca4XP2KaY9cKwpw8KleHtx/3I8dHND3g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=We5lBrgg305wtwpTNcLmZCZHR0ox0OaPmlyjaImx3HpSzbtG8UskUlj50kGdmPpRV
	 UsWkp7uIPV+s2nPNDsYE2t8f89i49Hn0PSm8E9UDxdyq62docBwvoMYbcxjssGAIxd
	 Mve4n1s8DAhlrdIxO/pQ1UA0ZxKHh3SDVnl493KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C843F802E7;
	Fri,  2 Oct 2020 00:47:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD003F802E3; Fri,  2 Oct 2020 00:47:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DB0EF802DD
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB0EF802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bC4IL06q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BF322074B;
 Thu,  1 Oct 2020 22:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592454;
 bh=RD9luzNVf87Ca4XP2KaY9cKwpw8KleHtx/3I8dHND3g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bC4IL06q5ztwxIlThfO4r0IhpcbwSrbH6FvwhXGIzhA/ZaO2tNNXqhwfKFOP3XqKD
 U0A9VOmjPyI9lG3ki19ppoZUCDD6bp+RYgcUSHwCFkm2tAQY+oP+xpl/k27/zRQv2i
 1b/6oDieDJbXJsdbtjeksfge20SG1+eNfvcb8u+k=
Date: Thu, 01 Oct 2020 23:46:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
References: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()
Message-Id: <160159237545.44588.1261211481702482189.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On 01 Oct 2020 14:07:41 +0900, Kuninori Morimoto wrote:
> commit 140a4532cdb8c ("ASoC: soc-pcm: add soc_pcm_clean() and call it
> from soc_pcm_open/close()") switched to use soc_pcm_clean() at
> soc_pcm_open().
> 
> But it removed "return 0", and missing "ret = 0",
> because of it, it always return -EINVAL eventhough no error.
> This patch adds missing "ret = 0" for success case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()
      commit: 8e7875ae373a3690397c4e593629d3b9ad5ccf42

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
