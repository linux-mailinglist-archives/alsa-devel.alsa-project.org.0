Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DE2EAFA7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 17:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBCB316CD;
	Tue,  5 Jan 2021 17:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBCB316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609862989;
	bh=wJQJGEVMiFp+U9i3KB68KovC4I4ZjyrsTucyHvp+mYU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVlCPwYNniQNBGC9jWuKhVIh/OuYS3SG0KHYte8mToE8g2Axr+fZqGH/f9HkOBC8N
	 L/lroVdz+BYfwsWOxbBjsMVDECwLUDKlO5g3MVUVxkNBYCwvZQr7Zeo4Ik1mHP5gmV
	 jTuWz/6O11hGRUQ/U/ukedoNpYwnFgnGstEIjYoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2CBDF801F5;
	Tue,  5 Jan 2021 17:08:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B014F80271; Tue,  5 Jan 2021 17:08:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BB02F801F5
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 17:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB02F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RAq1XL/B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 519B722C9F;
 Tue,  5 Jan 2021 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609862927;
 bh=wJQJGEVMiFp+U9i3KB68KovC4I4ZjyrsTucyHvp+mYU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=RAq1XL/BRN8XRTSri4cXSrqvujM81ioR4+GUq1AHhXecaj7QiUWiQ88dIVugFlchl
 PLj0Tjq2k++ZbgqOoM47jhkKnKK69EB4dWwbb4SWWCCEgHFfJaIdqiA9j1o8CIDFGb
 VmlHy1C+y878dkjkF4kZd8pHUgF6pphBI9JLc1TNqEr7Y5H/GxrnO2q9j6hXU6/0O6
 F/BC+FOE5W7Pq7VFBMxUdC2Yx5x5dsQz87UyJo6xH3cai7eqArOI3dLNh6M9KIfFCe
 bMnxRc9j/jnfB58g5Lt3IlL35kE9dM38IFdhf5NXVGmzl9LHHUkqI+ApfU/oQDMsjA
 e2FHKR5qKJKMQ==
From: Mark Brown <broonie@kernel.org>
To: linux-rtc@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, alsa-devel@alsa-project.org, dmaengine@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Dan Williams <dan.j.williams@intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Jaroslav Kysela <perex@perex.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-watchdog@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
Subject: Re: (subset) [PATCH 00/10] Remove support for TX49xx
Message-Id: <160986289007.50207.17900821173530027212.b4-ty@kernel.org>
Date: Tue, 05 Jan 2021 16:08:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 5 Jan 2021 15:02:45 +0100, Thomas Bogendoerfer wrote:
> I couldn't find any buyable product other than reference boards using
> TX49xx CPUs. And since nobody showed interest in keeping support for
> it, it's time to remove it.
> 
> I've split up the removal into seperate parts for different maintainers.
> So if the patch fits your needs, please take it via your tree or
> give me an ack so I can apply them  the mips-next tree.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/10] spi: txx9: Remove driver
        commit: 74523a5dae0c96d6503fe72da66ee37fd23eb8f5

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
