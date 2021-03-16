Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25D33DC10
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 19:04:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BBE41926;
	Tue, 16 Mar 2021 19:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BBE41926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615917871;
	bh=2fj5dGP/zR4wsXfm/xMcNJRjrHOV0o0B85I5JwH7B8w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLIi0fxotMHgGmqjUmEXY4xdGD0L+5lkC1mgyDXjScPeFXm4FZFV2EmEMxtmt2j3t
	 C2c20Ok8nr1IPYCo2oFsk8uMwal7JiKzqPrzvkh4swflPdifpZLMjek8fNnF3nkG9v
	 YeURUSVD2Lk6kNuWEHQNiALZJK7kimksrVyysBEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D957AF804DA;
	Tue, 16 Mar 2021 19:00:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7D4DF80430; Tue, 16 Mar 2021 19:00:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9BDFF804AC
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 19:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9BDFF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ub1xhw31"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 028D265132;
 Tue, 16 Mar 2021 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615917623;
 bh=2fj5dGP/zR4wsXfm/xMcNJRjrHOV0o0B85I5JwH7B8w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ub1xhw31G3hDSFXh3nmvfyFz4lO2Vs+DZYFRysrHpPmnp0rtBB08NTpy2oHEjCJBE
 eIapJfg444+I+dfIMEeDqaj2+imDgOVlQOgkeYg8PM6uAcUrSjUOXbtyFn8GPb6bm9
 Gy5piqvH7c2iX6TLLgVcQxfAWjCndU+3frVmmJrPnyqY9Eq8ALFVirGAP8sYaPBWGB
 tac9+NcVLvfgIA/K4LMcxaIsD14miW+zJJAqupzXUqNtiQJkcPLHEdhGxvSSROwEZL
 6nXcxKHnfWbYOcPWprCoG3cDtaVM7YhvclV0brEOWLEheJf8V2yO+nJ73SZkai7zCA
 8Ypm1BUohDlsg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: debug: cleanups
Date: Tue, 16 Mar 2021 17:59:49 +0000
Message-Id: <161591744697.13544.17063116713760183518.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
References: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 15 Mar 2021 11:39:29 -0500, Pierre-Louis Bossart wrote:
> cleanups of allocation and error handling
> 
> Guennadi Liakhovetski (3):
>   ASoC: SOF: fix debugfs initialisation error handling
>   ASoC: SOF: only allocate debugfs cache buffers for IPC flood entries
>   ASoC: SOF: remove superfluous NULL check in debugfs read
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: fix debugfs initialisation error handling
      commit: 11fd6d8e097b5b179ea445e0206aaefc47e62845
[2/3] ASoC: SOF: only allocate debugfs cache buffers for IPC flood entries
      commit: 72c35856b5edc3f734be5699e9f6737190a1d897
[3/3] ASoC: SOF: remove superfluous NULL check in debugfs read
      commit: 97f53046d746bef513d5fbaac53eedb011968407

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
