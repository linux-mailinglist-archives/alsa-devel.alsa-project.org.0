Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F344EEA1
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 22:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4F91616;
	Fri, 12 Nov 2021 22:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4F91616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636752594;
	bh=eoAl5B/8h3ZtzbA9rB3nBcwncqWuJUxuT/UFumATqZQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMaxhGOu4I8vH32HdzpSR336Y7RYl/YbbV4LIVAxbDZdxkdKYq6M448D0fgGSZuxM
	 LOBiQQ68V9Hsq6LQevoYa6wYcUAwn7nYmZ3pAPmcfYjcu4A/DXwze8ZYgWEnrElzJu
	 jwmJPkzYSg7bz/vhcrqUWaLH16huZrfHkY6UL0tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A74AF804F2;
	Fri, 12 Nov 2021 22:27:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2ED4F804EB; Fri, 12 Nov 2021 22:27:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26332F804C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 22:27:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26332F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PyDHCooH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25BF0610FF;
 Fri, 12 Nov 2021 21:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636752446;
 bh=eoAl5B/8h3ZtzbA9rB3nBcwncqWuJUxuT/UFumATqZQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PyDHCooH3k3+HIQuMCsauOX0epOaMV29t1rOZWKdBiawNsX7KVbHe0BZDf+VJwlvD
 3nCRB1RWAkUvTKWfOjJQ7k+Gic5ysfd64D7RTx1Iotg8FUvzvEKiKXxZiaI9OODWFk
 rJQXpWhFujB8vhG+H46Vpwcioq5p1II9amfUdXHq+yqiicVTulezO69s8llcFmmQIo
 tqQjP8G40R9SwbuQPcLVEMNoYRCAYEkPKmrJyk3O4TkHR0xk3SIA4EtHKJ84k/zW8G
 XZ8phQJ+dNfrJ6b37g79SH3cxZg+lTAQ7jS+sCr41cmfZ+YXLMSMJqdkHbCRKJOPKh
 mgpxORkd/4lUw==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
In-Reply-To: <20211111161108.502344-1-angelogioacchino.delregno@collabora.com>
References: <20211111161108.502344-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Fix debugfs registration for
 components
Message-Id: <163675244389.742274.1874559646597511024.b4-ty@kernel.org>
Date: Fri, 12 Nov 2021 21:27:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 dafna.hirschfeld@collabora.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 11 Nov 2021 17:11:08 +0100, AngeloGioacchino Del Regno wrote:
> When registering the mt8173-afe-pcm driver, we are also adding two
> components: one is for the PCM DAIs and one is for the HDMI DAIs, but
> when debugfs is enabled, we're getting the following issue:
> 
> [   17.279176] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
> [   17.288345] debugfs: Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8173: Fix debugfs registration for components
      commit: 8c32984bc7da29828260ac514d5d4967f7e8f62d

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
