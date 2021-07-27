Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DD3D7A27
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 17:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78D31F26;
	Tue, 27 Jul 2021 17:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78D31F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627400917;
	bh=7pKKp0c9wj9oxWdXxNeGrJtMc8AaqmYFHD+qJ+yK0GI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qGkrWEWZLv7om97mcNthnlAV5My7jzBKH4ngJGKsDQHWOIT3rTwb7XTHgZU1hnfg4
	 neZi3TkcLonO1HfRZfABEQthFYVnLlrsv8QL5umtHh78GHxYhzvHwfQ8VNAUB0ivqP
	 H4ytUZgXgu5A/U7l2rxwyMSzFXLAxCjhh7BP2Ytg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9157CF804E1;
	Tue, 27 Jul 2021 17:46:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B80F804E0; Tue, 27 Jul 2021 17:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3192F802E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 17:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3192F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LswfajWB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85BC461B4F;
 Tue, 27 Jul 2021 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627400804;
 bh=7pKKp0c9wj9oxWdXxNeGrJtMc8AaqmYFHD+qJ+yK0GI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LswfajWBkPQCCvtlUF4tyMMUec6IrTnugvgqQfC4nElpFR5TLwjd9PuIQdkXb+95m
 SMy62BGicwXpz+etQtM7ythmWJZbadG1GB/WV1mX6CEmzxE2laf1tlyoTCsb0PqkFI
 cTOGgSSllOGaF3GjPPGPGmWLDMZXaYvFUR15/wwmdAY3S/A/hVAxxxTixEjSrYXyJr
 1Yn8DjsLGQxPIpFOQGWnEGJL+UHRwWaujvXPM6xgkw+WA61c288ODicR5xmUxSgTit
 epVfJOnWENb9/MDEPkgiMdBc5/2sKSP3ERj1wLAdWDGZB54O09C9BnJ527bBC4XEfW
 qni5Q38q/XESw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: soc-pcm: cleanup cppcheck warning
Date: Tue, 27 Jul 2021 16:46:24 +0100
Message-Id: <162739969149.18968.5244236513904812228.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87v94wzf37.wl-kuninori.morimoto.gx@renesas.com>
References: <87v94wzf37.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 27 Jul 2021 11:05:16 +0900, Kuninori Morimoto wrote:
> Now I'm posting audio-graph-card2 patch-set, but it seems it needs longer
> discussion. Thus I want to post more easy patch first, and reduce my
> local patches.
> 
> These are cppcheck warning cleanup patches for soc-pcm.
> 
> Kuninori Morimoto (5):
>   ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_apply_msb()
>   ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_components_close()
>   ASoC: soc-pcm: cleanup cppcheck warning at soc_get_playback_capture()
>   ASoC: soc-pcm: cleanup cppcheck warning at dpcm_be_is_active()
>   ASoC: soc-pcm: cleanup cppcheck warning at dpcm_runtime_setup_be_chan()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_apply_msb()
      commit: 2bc3e1f21b06802e70d9ccd5f8756099ffd04eb2
[2/5] ASoC: soc-pcm: cleanup cppcheck warning at soc_pcm_components_close()
      commit: 33be10b563dc56c33d28562ff83065a89647e443
[3/5] ASoC: soc-pcm: cleanup cppcheck warning at soc_get_playback_capture()
      commit: 940a1f43572316ba3320fea361db2a5200e2de0e
[4/5] ASoC: soc-pcm: cleanup cppcheck warning at dpcm_be_is_active()
      commit: 7931df9bf07bfe62831e559e5ffdca6f3657d92c
[5/5] ASoC: soc-pcm: cleanup cppcheck warning at dpcm_runtime_setup_be_chan()
      commit: 9bdc573d84d8fcfe50b223350598efe4fe1cad08

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
