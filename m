Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EBB33DBEF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91B0D1920;
	Tue, 16 Mar 2021 19:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91B0D1920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917790;
	bh=38WyV8v4iq0F8oP0e3/RtPJ7rN9AuwnlWyMS9fqp3qc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZkiJuqIopOTHPOpdWvCxHpbV3ZVaDrDgUj18QwIYJqHhaC8afpzg0K6c0scKAgdJ
	 qj+tuKvg5UgZTBbMJbaU7+rtLiujqytuEmSpXkiI8uhXjz/rNMOler3s00zXIGvKqS
	 6j6aNYKbH2nVWTtNQyHhQEATNqY6y2VMvTKS2r6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECF5F804AD;
	Tue, 16 Mar 2021 19:00:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1FC5F80171; Tue, 16 Mar 2021 19:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9802EF80156
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9802EF80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X2IDI0I9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05DCE6512E;
 Tue, 16 Mar 2021 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917610;
 bh=38WyV8v4iq0F8oP0e3/RtPJ7rN9AuwnlWyMS9fqp3qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X2IDI0I9IufjRTUobZUc873zt6QC3v2ggmqGdlVPUoz2bBpTmfViwlu+JpKpke/FM
 phf1QTaAdYt0GOsRr51iWzA36ob4M9qKOMbUfZNICP0xwy4XFOAhAVBqbdTmJoB7AX
 iKBws2psWUqWTozmwZW6/vmRvNqNd9ie/ET+TpO+oWsM+DseE6rO4wW2E2N/HPAH6Z
 6bGneEmoyXsAIHD4ItJegofEQvOCOAn8RvSGKmXeoPuBKRVpxE2TBTPP5gy0nyKo5i
 F+xW4NvznjCOU8LN7ggOCd4iYhA1mtGN+kcEBKtjyWIN5Y4G96mmHwmrELcD8D0A9N
 G/ywUHWkhcr/g==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, mikhail_durnev@mentor.com,
 mdurnev@gmail.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH v0] ASoC: rsnd: core: Check convert rate in rsnd_hw_params
Date: Tue, 16 Mar 2021 17:59:45 +0000
Message-Id: <161591744696.13544.2360957689864131715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615870055-13954-1-git-send-email-mikhail_durnev@mentor.com>
References: <1615870055-13954-1-git-send-email-mikhail_durnev@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Tue, 16 Mar 2021 14:47:35 +1000, mdurnev@gmail.com wrote:
> snd_pcm_hw_params_set_rate_near can return incorrect sample rate in
> some cases, e.g. when the backend output rate is set to some value higher
> than 48000 Hz and the input rate is 8000 Hz. So passing the value returned
> by snd_pcm_hw_params_set_rate_near to snd_pcm_hw_params will result in
> "FSO/FSI ratio error" and playing no audio at all while the userland
> is not properly notified about the issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: core: Check convert rate in rsnd_hw_params
      commit: 19c6a63ced5e07e40f3a5255cb1f0fe0d3be7b14

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
