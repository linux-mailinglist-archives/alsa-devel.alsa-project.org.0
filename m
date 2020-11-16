Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4C2B551B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A60C170F;
	Tue, 17 Nov 2020 00:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A60C170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569738;
	bh=W4iJDW29qaYIvsy6pPudjqFsYGbUiXej+ClOVk6wkbE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hx+85E27MruJ0uerTXKAR94y2NHnj0oLx000jlq+GYHEpEWjrKRohVucGddwfigVE
	 +ptOLHbmorDThqk2Y09MOmAh6MZxNfNtJFm0lzqlQnz4JzgBuDhl9R9Lo2If/P1+o9
	 czak+YGsLdysuYiGNscyw1/ms1BqI/OLCrRjh7TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8221F804BC;
	Tue, 17 Nov 2020 00:33:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE4BF8016C; Tue, 17 Nov 2020 00:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 519FDF8016C
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519FDF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uyMntYXI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20CB02224B;
 Mon, 16 Nov 2020 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569595;
 bh=W4iJDW29qaYIvsy6pPudjqFsYGbUiXej+ClOVk6wkbE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uyMntYXIAHZCuB2k0gyDph9z4nbpMEFfvhFwqbzmppERcIXSzZrTYQiJ3bDKKWWR2
 Kgkavfj80xQPfypABwXMougZwGNm0R9c5LDP/75xIHcxg3/3EYTHxkPRqWovjZf+CI
 C25tAWg1uuECCySkCFc+otv8CtXXXJkmPeZZnRKs=
Date: Mon, 16 Nov 2020 23:32:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20201115122306.18164-1-kmarinushkin@birdec.com>
References: <20201115122306.18164-1-kmarinushkin@birdec.com>
Subject: Re: [PATCH v3 0/4] ASoC: pcm512x: Patch series to set fmt from
 `set_fmt()`
Message-Id: <160556956526.29683.6599781233206972727.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Sun, 15 Nov 2020 13:23:02 +0100, Kirill Marinushkin wrote:
> Set format from `set_fmt()` func instead of `hw_params()`, plus supportive
> commits
> 
> Kirill Marinushkin (4):
>   ASoC: pcm512x: Fix not setting word length if DAIFMT_CBS_CFS
>   ASoC: pcm512x: Rearrange operations in `hw_params()`
>   ASoC: pcm512x: Move format check into `set_fmt()`
>   ASoC: pcm512x: Add support for more data formats
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: pcm512x: Fix not setting word length if DAIFMT_CBS_CFS
      commit: 6feaaa7c19bde25595e03bf883953f85711e4ac8
[2/4] ASoC: pcm512x: Rearrange operations in `hw_params()`
      commit: 798714b6121d833c8abe4161761a94fdd1e73a90
[3/4] ASoC: pcm512x: Move format check into `set_fmt()`
      commit: 26b97d95a05d0346e1ad6096deedac3f24a4607b
[4/4] ASoC: pcm512x: Add support for more data formats
      commit: 25d27c4f68d2040c4772d586be3e02ee99eb71af

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
