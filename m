Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B48434A14
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C1D16D2;
	Wed, 20 Oct 2021 13:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C1D16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729505;
	bh=FfhgtDYVyNHCcHSEhOy5i16MCYOtKPZkE4GgwNgqH4I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fXS/fsbVa7ddtjM0xk/nDJyJiNiq+OQnkUuErHp6KazR14lJNmAJ44GcCeAy5CkkW
	 84GII5r4tU4ZgOln9kDJvawy8bSfdFqMIcTW75eDfcnkK4SUoeFDwIbLGa1kjw4/xQ
	 UZhBn2xkRCBfCVEuCRF4vllPdObeU4qnTaN6mgR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23129F804F3;
	Wed, 20 Oct 2021 13:29:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D732EF80253; Wed, 20 Oct 2021 13:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35766F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35766F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V18vCLG8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1750C6136A;
 Wed, 20 Oct 2021 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729339;
 bh=FfhgtDYVyNHCcHSEhOy5i16MCYOtKPZkE4GgwNgqH4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V18vCLG8eYUjC6wP+1kve4j0OvK7oPHCXlPTcEFbt0TwJUXxOx2ttRODk8SkSCmU+
 ev9FLt86+pmC+Wmn4bQCUfWimiALBfslgerkEGvzVHQxKY/lGVFmTrPmuU0eOBjzwH
 UB+KwyxqrF0okF1bk2gB6EH+xLOboGU9/LaoMRho4hI/TwO1IC46Aq+qzX1e9xqqwJ
 lx8IF48Io9Fv47cpasakx6tqAIb++4lARZzrXHtT0riYwEhZrtWrUjUYlsfi8/jqcd
 8gnMCwapd7T5jt11EffJDjMZDn91igwWGBNYBBuK0l9C8RIp3dq6sBTsstY8T8NjD2
 bdaV/9siMlIdA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 matthias.bgg@gmail.com
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: rename reset controller
 headers in DT example
Date: Wed, 20 Oct 2021 12:28:39 +0100
Message-Id: <163472931364.2896549.9580992240702562423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018101608.3818840-1-tzungbi@google.com>
References: <20211018101608.3818840-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com
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

On Mon, 18 Oct 2021 18:16:08 +0800, Tzung-Bi Shih wrote:
> Commit f07c776f6d7e ("arm64: dts: mediatek: Move reset controller
> constants into common location") moves the reset controller headers.
> However, it forgot to rename the DT example in mt8192-afe-pcm.yaml.
> 
> Renames the DT example to pass dt_binding_check.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: rename reset controller headers in DT example
      commit: a2b5c48abd485b289d3502466a9e8e1785f5adf3

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
