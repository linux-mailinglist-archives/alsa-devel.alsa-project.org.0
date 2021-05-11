Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4528637AE63
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 20:24:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C54A18BC;
	Tue, 11 May 2021 20:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C54A18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620757447;
	bh=Uw8hsDGMWdFoqrkXWoAq4pDRF5iQaFJRHfiWp/r+0k0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcHKD6P/ywZUwfTXkFhu/okYQDdOz+A0GMwHpoN278i/s+4ad6j74XodzlOdCYeiH
	 8h0D9iRhnPUz6s/9BxcVbc432ms882cFuw3xEfhJWrMxt+nVOlOf8rvhOCT1aPVdIj
	 9nvWJjBPpOmi7NDYwNiFtYgfDFNWY8/t0tusINmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 409D9F801D5;
	Tue, 11 May 2021 20:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600A5F80163; Tue, 11 May 2021 20:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEDF4F8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 20:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEDF4F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I5z0TeK8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B81861207;
 Tue, 11 May 2021 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620757344;
 bh=Uw8hsDGMWdFoqrkXWoAq4pDRF5iQaFJRHfiWp/r+0k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I5z0TeK8lfntTLwn1hiDzHZpXxCl+p6hcLXN1u3FqVync0FV7/wBxQJDPhLf2AXxw
 6BtlB4oCmNBndxdGupB2u5FpMK07kbCHpd34amI+Z8uwcLP3dTpAv3Wbpg8Ql2GYWV
 hH5bypkYxa+DFWq/FP2WQqG3J/2AK9NZG0N8cPRNHxY8P9088z3VmZp7vnftcGEhSM
 KXIssY5BbtGuTIpc4Qztmoxzva2coOp6jmS/r+LABv/H0Vz5mBTvTAwZZRAv+RpJhc
 7NVygrPS69p3itqpAAWhH2xL7FFzzJCuM5kNaXt0n3ewtb6BtQW4BK42nAcH3g+El0
 AYXTOBoiADz0Q==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH v3 00/14] spi: pxa2xx: Set of cleanups
Date: Tue, 11 May 2021 19:21:27 +0100
Message-Id: <162075727215.18180.8620014243960066654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
References: <20210510124134.24638-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Mon, 10 May 2021 15:41:20 +0300, Andy Shevchenko wrote:
> Set of cleanups here and there related to the SPI PXA2xx driver.
> On top of them, adding the special type for Intel Merrifield.
> 
> In v3:
> - rebased on top of v5.13-rc1 and/or spi/for-5,14
> 
> In v2:
> - cover letter (Mark)
> - drop moving the header in patch 5 (Mark)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[07/14] spi: pxa2xx: Introduce int_stop_and_reset() helper
        commit: ab77fe8935c57d1339d3df64957f32e87f0d5ef3
[08/14] spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
        commit: 4761d2e7e51cfbe6fdb4e95903d407927f519f50
[09/14] spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
        commit: 0c8ccd8b267fc735e4621774ce62728f27d42863
[10/14] spi: pxa2xx: Extract pxa2xx_spi_update() helper
        commit: 1bed378c6b9116c51ae59b970cf3d9b4e9e62ced
[11/14] spi: pxa2xx: Extract clear_SSCR1_bits() helper
        commit: 42c80cd439a938569a86f6ae135d38c1cda5569b
[12/14] spi: pxa2xx: Extract read_SSSR_bits() helper
        commit: 6d380132eaea536bef641f21847c8a7987e96ad8
[13/14] spi: pxa2xx: Constify struct driver_data parameter
        commit: eca32c3974c0664f88fed90b327f473bd18a4809
[14/14] spi: pxa2xx: Introduce special type for Merrifield SPIs
        commit: 3fdb59cf10b020b32b9f1dfc78611320623dcb3e

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
