Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9C425F50
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:40:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2381687;
	Thu,  7 Oct 2021 23:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2381687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642825;
	bh=Q/3Zh6BeJ0iOh2f8WH4pqEQ0/pyFSZZFE+3zbz+hEPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwuvYU+jHVxO0GGoaGmgI75JEg9Nw41TGlOu+4ogtYCjplKICdYbwQtonK+bSJ9KB
	 tRpSIlRQajZnsaA+RKg08rA7qQhSXMDTtCHO4WV6RMWVXQtY5tGuOUq3ZeJQNGZsQQ
	 klWTivp473hPOrOTJB0M7asz6p/iTgoujYr6Qeqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B868F804F3;
	Thu,  7 Oct 2021 23:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC6C6F804F1; Thu,  7 Oct 2021 23:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A45F804E5
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A45F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uH5ZTUDg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD3B961175;
 Thu,  7 Oct 2021 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642675;
 bh=Q/3Zh6BeJ0iOh2f8WH4pqEQ0/pyFSZZFE+3zbz+hEPw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uH5ZTUDgYLLeQ6DNOL/qeaXP9z8tc0HzqBKxO6xHh2yQZOR3LreWcUd0Yu7r3mkm8
 Erdg9MED1gPeYR901gUffb/RmGcER8vwGrfsuc48ApRdDhF2c7RPwYpvhIyxjWabAb
 lBVN3xpp97qqwCJYqyuGaRIuboDebSrkjykmFRCtSMLI0Go0xRDnBy8OcbGjAJuFFh
 IMe5nJR/aupA2pCgh33BOo+mh8+QMF0TxP+w9RL/DtlYkUsaW7+SUNKZynNi20dNV9
 jl/B2zgYLh125yuMGLD3wsOqltHiQwPDIUpjj1ls+Y/isIjCaKe/AIIwVp/3tJqV6g
 wYS59zGy3g1cA==
From: Mark Brown <broonie@kernel.org>
To: =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v4 0/2] Add reset-gpios handling for max98927
Date: Thu,  7 Oct 2021 22:37:28 +0100
Message-Id: <163364264607.649699.766377916130433507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1633572679.git.atafalla@dnyon.com>
References: <cover.1633572679.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
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

On Thu, 7 Oct 2021 04:38:54 +0200, Alejandro Tafalla wrote:
> The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) requires
> hardware-resetting the codec by driving a reset-gpio. This series adds
> support for it through an optional reset-gpios property.
> 
> v4:
> * Correctly assert/deassert the GPIO states
> * Wait for the i2c port to be ready after reset
> * Reset device when removed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98927: Handle reset gpio when probing i2c
      commit: 4d67dc1998f1890a9d22d03208037075ea9f2562
[2/2] dt-bindings: sound: max98927: Add reset-gpios optional property
      commit: b23d3189c038c091adc8de382d20a8f5321645a1

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
