Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EC45DB39
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:37:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6CB18B0;
	Thu, 25 Nov 2021 14:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6CB18B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847479;
	bh=jxmFhSak3x0D2jmlAoXoCpezcEiGF+lrOW1vA5iV5ns=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObxA0El/dxovrwhho435PVOiG8VHMbYZJjmQSiZUwz9OYnnpavvkCclDYUyM8KBrO
	 H5S9RyhK9Dy+j970mPRB1VrfW6JxojlM/fs3mr8WTxEcafbI/eKPBu/myw7KwvGD0R
	 1T1XeK8GANC1tVmVLrESBOcxHmq2sw6YKfpBmH6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FF1F804E5;
	Thu, 25 Nov 2021 14:37:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C35F804B1; Thu, 25 Nov 2021 14:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E720FF80430
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E720FF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rVm30AQI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61C9060F58;
 Thu, 25 Nov 2021 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847411;
 bh=jxmFhSak3x0D2jmlAoXoCpezcEiGF+lrOW1vA5iV5ns=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rVm30AQIwPSxsE7pL3WHUG7CW9VIYdrFXeF76TDbplVi81YC2HHP+fIS3RNB8z47P
 7331yFJeY89S79EVYDgvnR0eidX7+zqqBjaBOIVY526bOeCbg9XqHp0n/N6/nwEM5f
 O36+4eFBiCMbgSwOc5zB2xM6PWi69wOXPag55jYC9Z8EMZOXqAJf243x3oZIO23MBj
 S44hsJizxQhbKojcWVk1TNTEQNJtjh2GqobgeqaIKtmjhhZxg3LY2PNzxl7FCUKEpC
 AkdCoNLRXJJ9hyCdfFtJGpLUue+w5Tw8anPQoUkSLmKPOeVbLkdanXSIoEjeH4gYwD
 ZWo/zMPZYp84Q==
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Heidelberg <david@ixit.cz>, - <patches@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20211124155101.59694-1-david@ixit.cz>
References: <20211124155101.59694-1-david@ixit.cz>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,
 wm8962: add missing interrupt property
Message-Id: <163784740913.3101786.1880598598821673766.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ~okias/devicetree@lists.sr.ht,
 linux-kernel@vger.kernel.org
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

On Wed, 24 Nov 2021 16:51:01 +0100, David Heidelberg wrote:
> Both, hardware and drivers does support interrupts.
> 
> Fix warnings as:
> arch/arm/boot/dts/tegra30-microsoft-surface-rt-efi.dt.yaml: audio-codec@1a: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /home/runner/work/linux/linux/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml
> 
> Fixes: cd51b942f344 ("ASoC: dt-bindings: wlf,wm8962: Convert to json-schema")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: dt-bindings: wlf,wm8962: add missing interrupt property
      commit: 12dc48f545fd349ef2cadcc4d816706951b87998

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
