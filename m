Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77D41F8A8
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A90716E7;
	Sat,  2 Oct 2021 02:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A90716E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633133900;
	bh=nsc2fpMzsGtZeukbSHUUyuCKpxx+JA+JABw8eC1Wmg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZMcvV95Byx9Y6GJyRwFOpvZMxL86TuILrc1DUFbS7ydF1nfOOS2wav04ly0l7z0M
	 TrjCOSLKequ2BsqqHGcaIUYlMicR9xc2BXRUMSbok71HfP5NHrTXm8QIUqebLQMH5A
	 qVDMkC6jHcZER0tdxae59vtKR4ggZQ3fpjUJMV1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B38CF802C4;
	Sat,  2 Oct 2021 02:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC967F8026D; Sat,  2 Oct 2021 02:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65877F80165
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65877F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nFt15lP3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE26061A02;
 Sat,  2 Oct 2021 00:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133815;
 bh=nsc2fpMzsGtZeukbSHUUyuCKpxx+JA+JABw8eC1Wmg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nFt15lP34RVnJFmjDkn7gD/T3yx7WhE/u9AZT6sYCeAoZKAu929L7+Oe1NeNNO5/m
 wGmuZFWRJKFDoHSe6CQR2F2U8xyhhyN7cDDK8RfPO6W+MlMkSV5JxISZYRRmm5K/B/
 jy9+hTweIqEeWHnWxoaJs8+x1GBQc5qg2csRsn179YK2RWhH+CHbblsphE76dStjXf
 0Ky6H0V9gBpMJJVi6G2SmwFxn+BHaehoLSvheZz9KjezeaC/AaLtmtWQdCXbrllG1W
 UoiRjlyXZumCBsZQMUrnwHWYLnI2S7ao6YPE2jQ2KwRK1ac4buZXjz6kLBXtJ27n8Q
 7Ty48dyEqdW9Q==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: apq8096: Constify static snd_soc_ops
Date: Sat,  2 Oct 2021 01:16:28 +0100
Message-Id: <163313339131.45396.15118766100261477417.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001115030.10402-1-rikard.falkeborn@gmail.com>
References: <20211001115030.10402-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

On Fri, 1 Oct 2021 13:50:30 +0200, Rikard Falkeborn wrote:
> The struct iapq8096_ops is only assigned to the ops field in the
> snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: apq8096: Constify static snd_soc_ops
      commit: cd96663bc27e1c94210b5b737de4d7cf233d90f8

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
