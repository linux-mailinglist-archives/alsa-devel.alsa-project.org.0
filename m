Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1543624D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 15:02:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F04A1684;
	Thu, 21 Oct 2021 15:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F04A1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634821348;
	bh=VmP4B2lo3kUf8wlKV5Je0VpFexZcN7wm6MRyVXxp394=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3+1J+pT7KhXsePQz3oMf8qyASvYVx/dOGL0gC7NIqzN8conWdQ5S9ZxhnSk34HAT
	 8w6o9ATMCgHAFxP8h2zQoQss/RNW5f8lKFcaOz16Im7v/H5fY22hnRGK7xSmM1s28e
	 7is1JunJjpJ98iclGojL9GIVoSI9KdFV33yvbkBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB74F80246;
	Thu, 21 Oct 2021 15:01:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82099F80240; Thu, 21 Oct 2021 15:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B514F80155
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 15:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B514F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UhLh9j79"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B728611C7;
 Thu, 21 Oct 2021 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634821258;
 bh=VmP4B2lo3kUf8wlKV5Je0VpFexZcN7wm6MRyVXxp394=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UhLh9j790U93XfKQcSc6GJbwnJ/K0De8FudO62AbuZS/qm209mkd5sxFwOhXuJguM
 Z8xEkPW0xzZvz1/3ssC94A+56s2s2XR6T1qP7cWDdn8DN0zgx/cqhKOi0pFvw0E3XV
 Uv/srdW/MVGo1lrcgO+cDjjq7gElobNcZMxCWfr2aHZqmkWZGgMgER/MFPqu3NL6aP
 bLCp7mtSK7nwAwFZ2tfEAZrQMiLmAtZwO15F+OP4vZoGSvj7AR5Qk3/Znf5TS8P2i8
 pLnsS4iMCrNQjDa0Kww+ruxniVKkzPjUjLl/pE557GYtit8jpH1KYd0xOVAKXWvSG5
 HCrnr46vX51vw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qcom: sm8250: add support for TX and RX Macro
 dais
Date: Thu, 21 Oct 2021 14:00:55 +0100
Message-Id: <163482123862.1407406.1935219292132897705.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
References: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

On Wed, 6 Oct 2021 18:27:43 +0100, Srinivas Kandagatla wrote:
> This patchset adds support for testing WCD938X connected via TX and RX Macros
> on SM8250 MTP.
> 
> Srinivas Kandagatla (2):
>   ASoC: qcom: sm8250: add support for TX and RX Macro dais
>   ASoC: qcom: sm8250: Add Jack support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: sm8250: add support for TX and RX Macro dais
      commit: 961e7ba550c7a1f51012713afb75fb8d86a636eb
[2/2] ASoC: qcom: sm8250: Add Jack support
      commit: 810532e7392e764be5ee1b85603585065fa3e86b

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
