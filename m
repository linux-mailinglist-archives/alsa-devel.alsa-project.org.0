Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E1441F8AF
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C5C16FA;
	Sat,  2 Oct 2021 02:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C5C16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633133946;
	bh=N5hEszx5y0b/1BTKlULPRntIWovz5UNiVzuxIKHXINs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRIhSLETX48licgm2a13pNj33BLJ7JEOlxrypvU2OQN6eyVzQ9ddKYkEQ7FJRm6CA
	 pNoP3zs6g9WW9UG3+x+D/cxqtzXjXZZ7k8pSu1QS7yTlaO93Z573zKabvxDR2qSYa+
	 qNc3Oqdg+flO0bo+a1STC1tyqGCblU1gEYL0lO5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9454F804E7;
	Sat,  2 Oct 2021 02:17:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FAD9F80165; Sat,  2 Oct 2021 02:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A4DF80165
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A4DF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X4z4SNnw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 722AF610EA;
 Sat,  2 Oct 2021 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133818;
 bh=N5hEszx5y0b/1BTKlULPRntIWovz5UNiVzuxIKHXINs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X4z4SNnwQs+hqF45oz3NrOfh2gixpvNc392kv3QAsWb1RUoMlrGwCaP/vBhysbFsq
 rS7KiS2dJXqi1OigNefP7im8Ts4eItOW7CzFrX8EEVS2hNU5X/0WsPEaQIuEUrZebM
 QjM7P7YCpdeCIxcssErbLZZn/a8J7FeYEUf2ZTHonJFYWRGiSVmRXjvfGEnxMEPx1e
 EIpRCSc9kduI7ZrLqBXSQUXyIOZB7LB/u56bhXAk4/jB8McUuovpjIitJU2/V+bNe9
 KVbzqr9DdeZOgaroNWzohecn3aDpMsZPYdOCfJCCngu/omo6+WInUj5SpFE8DqSTD9
 E41lXxoRVn1iw==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Constify static snd_soc_ops
Date: Sat,  2 Oct 2021 01:16:29 +0100
Message-Id: <163313339131.45396.6427425261003311553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001114517.6752-1-rikard.falkeborn@gmail.com>
References: <20211001114517.6752-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Svyatoslav Ryhel <clamor95@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
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

On Fri, 1 Oct 2021 13:45:17 +0200, Rikard Falkeborn wrote:
> The struct tegra_machine_snd_ops is only assigned to the ops field in the
> snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Constify static snd_soc_ops
      commit: 620868b2a0bd56ae814bdde2598d7d7b20538e6d

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
