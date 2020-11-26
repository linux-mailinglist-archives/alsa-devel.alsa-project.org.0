Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EB2C5CCD
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 21:07:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF2B17A5;
	Thu, 26 Nov 2020 21:06:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF2B17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606421267;
	bh=+zo+VG8YGS02hHbv3OYXR4KG0Z3uDAocQBTocN1v1hU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G426r4gTzX2mnpv//RTLPRcATHxlvcRZRRGGJTDb5SndpIoUn+gbI6aG5pLqZYg4X
	 2qjjH0MG9GWAVoXzRHiXbGMn6uABmJhCSSv1bTxnAznQivMKyEoX5Ht3Uq76ycvUJb
	 sK0x7nWCTydG/A6aLvjRBB4ukPQLBe3VOrbvvd1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BA0F804C1;
	Thu, 26 Nov 2020 21:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57DFAF80128; Thu, 26 Nov 2020 21:06:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D55EAF80128
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 21:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55EAF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GuI9iUE6"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F65621D91;
 Thu, 26 Nov 2020 20:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606421155;
 bh=+zo+VG8YGS02hHbv3OYXR4KG0Z3uDAocQBTocN1v1hU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GuI9iUE6SClaCN6n+FbnnpHL2tAk6X+EFZQ/BjAl5oUVz8yn9gGEvIZvQZAD6W7jU
 Yk4IoebugP6A4E3W7jazjEez12KIm3w4Y27wgfiPfY40wotJNQS3yJDyvhizZjFfa0
 musNtktoFJrV8EairzN2Alab1AMMifS1xuZ7I6/M=
Date: Thu, 26 Nov 2020 20:05:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pn4a5ixl.wl-kuninori.morimoto.gx@renesas.com>
References: <87pn4a5ixl.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: merge soc_compr_open() rollback and
 soc_compr_free()
Message-Id: <160642112480.9090.18156704858684446117.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 19 Nov 2020 08:49:32 +0900, Kuninori Morimoto wrote:
> soc_compr_open() does rollback when failed (A),
> but, it is almost same as soc_compr_free().
> 
> 	static int soc_compr_open(xxx)
> 	{
> 		...
> 		if (ret < 0)
> 			goto xxx_err;
> 		...
> 		return 0;
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-compress: move soc_compr_free() next to soc_compr_open()
      commit: 15a7b8c13653cc88de2db89af486e904aedc75ec
[2/5] ASoC: soc-dai: add mark for snd_soc_dai_compr_startup/shutdown()
      commit: 1e6a93cf74979e167cef8d29f6689705d9ec6735
[3/5] ASoC: soc-component: add mark for snd_soc_component_compr_open/free()
      commit: f94ba9ac20fab9af08240fde3741edf73655411d
[4/5] ASoC: soc-component: add mark for snd_soc_link_compr_startup/shutdown()
      commit: cd7c7d10e8f4ab1dac0bdb2019abc0fad995a788
[5/5] ASoC: soc-compress: add soc_compr_clean() and call it from soc_compr_open/free()
      commit: 453d32c2f7f7375c223eaf3a0a32efbb71bbd3f3

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
