Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC844EEA6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 22:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07AC11682;
	Fri, 12 Nov 2021 22:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07AC11682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636752627;
	bh=mf1NFqehFwwHUnvV8Idqyi02NlZ+oErngaqk4fic4S4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUc1SJpBwDzmQfl7WgLRDbKntPGkWqI+4NBb5Fxa7l/Oxcr5b84Ky82aTY7rVOxZ+
	 pZo1L5TqVPpSNMkxCfavKy07w/HSI6FmF1gWmj6QGZOFw4ypqxvwLpMNg1wu8I7pZR
	 zouXJYCjAbirvbyPrnsFe56ExxUU9ISREjuJ0Yew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9172BF80506;
	Fri, 12 Nov 2021 22:27:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAD20F804F1; Fri, 12 Nov 2021 22:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D601F80227;
 Fri, 12 Nov 2021 22:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D601F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aDvpP+DF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94C24610A2;
 Fri, 12 Nov 2021 21:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636752441;
 bh=mf1NFqehFwwHUnvV8Idqyi02NlZ+oErngaqk4fic4S4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aDvpP+DFJB4bvRNscJMY96pS4qYVLznkd7+8ok6kJBnfEWAG6Rs/zP85uScisafOM
 46pLOY/FFDOT/1wXZK0DaCEQyUsM12cnD+i/GLMayaIDICqfqGaaGZB4Qpg76yJSP+
 5rdDFu6I0kWG6wyXtucDnhxWYhLy9iqpx2x6P+AsjwLnvsapkiFso/9MKWas9CANA7
 8Vr2e9ZBgnUZaHkRgMcgfaUt8YWDmqRwznBQmt/SOktpPwpkkyri0OISTug1cJb5pL
 4IgWcF5po7zI6YEXX7bqZaR4C/cfd8+EMTnyUqKmnSFUKcVq+7agKp/uOACy7e8hBb
 F90d4kadE61lw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211108111132.3800548-1-arnd@kernel.org>
References: <20211108111132.3800548-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
Message-Id: <163675243834.742274.3363954435285911217.b4-ty@kernel.org>
Date: Fri, 12 Nov 2021 21:27:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Mon, 8 Nov 2021 12:11:14 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With CONFIG_SND_SOC_SOF_COMPRESS=m, the compression code is
> not built into a the main SOF driver when that is built-in:
> 
> x86_64-linux-ld: sound/soc/sof/ipc.o: in function `ipc_stream_message':
> ipc.c:(.text+0x5a2): undefined reference to `snd_sof_compr_fragment_elapsed'
> x86_64-linux-ld: sound/soc/sof/topology.o: in function `sof_dai_load':
> topology.c:(.text+0x32d1): undefined reference to `snd_sof_compr_init_elapsed_work'
> x86_64-linux-ld: topology.c:(.text+0x32e1): undefined reference to `snd_sof_compr_init_elapsed_work'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: build compression interface into snd_sof.ko
      commit: 1218f06cb3c6e2c51699998bc17c0d9a41ab37a6

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
