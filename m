Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6F299B02
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 00:48:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C390316B6;
	Tue, 27 Oct 2020 00:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C390316B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603756118;
	bh=NspwDaZqy3nAkIB43DAYA/ssB6nBIB+pWbF77pV9LjQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7R6owDzcdJzawwt+bcc3nUs+nRK9yD9JLG5vtY/a0gb8uwsaBl13JF17s6LgWN0E
	 ZinIU32sVYDvYea5CW1M4UNyyKijz1nkMucoQENY1bXCkYJC/pg7UJOx4JxM7rC0Kc
	 dJu2dcrhgreJKaniSPV9tDNoKAiD+ffvdn900oro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B65F804D2;
	Tue, 27 Oct 2020 00:46:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43FABF804CA; Tue, 27 Oct 2020 00:45:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18AC4F804C1;
 Tue, 27 Oct 2020 00:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18AC4F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bzSAfGmI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA53120714;
 Mon, 26 Oct 2020 23:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755949;
 bh=NspwDaZqy3nAkIB43DAYA/ssB6nBIB+pWbF77pV9LjQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bzSAfGmIMkHfTLpzcgfLtvnLqtZryeWeCdrUoXP0fBu0wiOKdYy2FXg2VAvzqsrb/
 BbHRIO7H0X1omRzF9Yui+gT0F+O2b39PI4ScS/5ckgE9YHz1wZoWwixqhbxjmZll2F
 iCUELKGQigTVfChcMTDFYl4qlXNWJGAdd83DPKBc=
Date: Mon, 26 Oct 2020 23:45:44 +0000
From: Mark Brown <broonie@kernel.org>
To: sound-open-firmware@alsa-project.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 0/8] use semicolons rather than commas to separate
 statements
Message-Id: <160375592345.31132.6591979922895862381.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Valdis Klētnieks <valdis.kletnieks@vt.edu>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>
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

On Sun, 11 Oct 2020 11:19:31 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.
> 
> Coccinelle ensures that braces are added as needed when a single-statement
> branch turns into a multi-statement one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: wm8350: use semicolons rather than commas to separate statements
      commit: 2db5fa77cd7ea4bd18c7e1afb49417debc9f498a
[2/6] ASoC: Intel: bytcr_rt5651: use semicolons rather than commas to separate statements
      commit: edc3f5b43a4446c84069e59df7e48663ec28579d
[3/6] ASoC: SOF: Intel: hda: use semicolons rather than commas to separate statements
      commit: bed5ed644c741fd69a19a3cb811b5c1da1d50755
[4/6] ASoC: samsung: snow: use semicolons rather than commas to separate statements
      commit: 40faaca03bf7d7ca1480677f0c8c543016cf426d
[5/6] ASoC: madera: use semicolons rather than commas to separate statements
      commit: 94fa760d01c21350261388f404e167d5cb752573
[6/6] ASoC: dapm: use semicolons rather than commas to separate statements
      commit: a1344daeab95b93dd1d19fcfbc7dbaf2a4735129

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
