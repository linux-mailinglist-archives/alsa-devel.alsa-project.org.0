Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20C5AD6B4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:40:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49D01661;
	Mon,  5 Sep 2022 17:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49D01661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392453;
	bh=BLZGHzBh5oYUyLXC7SF+E4GBdswvlK4T1kxFL5aA+CE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6jtmp0ZyyZ/xEA/e9lvA49d1kUqLRE3IR0MbIVH9yQUulmGltCtYPzcPkYUEpC0S
	 YawSeHj9tHeLNMEyr3VT3cBnGVgnneQWiWn6A8ktYy94dHqwfhGmnMBL9EsII8lw0A
	 Ir+/7mJ8g43hjTZ67tWfBgHi2/Cqul++lXRWCVuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09264F8053B;
	Mon,  5 Sep 2022 17:39:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EBC7F8053A; Mon,  5 Sep 2022 17:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB201F80482;
 Mon,  5 Sep 2022 17:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB201F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a8o6eMNW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D603B81158;
 Mon,  5 Sep 2022 15:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E30C4314B;
 Mon,  5 Sep 2022 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662392336;
 bh=BLZGHzBh5oYUyLXC7SF+E4GBdswvlK4T1kxFL5aA+CE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a8o6eMNWU3T1UHA1gu6f+bZ3Ryw5DsQc/qecNv3j4hVyvWtWwtt3Z800BAefUyT7d
 KnQLoiWSrOvVMR9XYN5t2aWmJGIzHB/KjmrFdlnrPQTIaLkuhMZtRtYc4YTsrsfsiy
 YFGcKmeU4S6kUmq2orrZVbneD6ilVTgWuZVcIjJ76leNX0OKUDsKrmpHmaAhCAUH+N
 aLVi/i0zF6Xhei4lg5OElfbzwYXb7PKoq+krdVZdCUxnnJDEfsxG/96jNGYPb5jvUm
 W/rp9I9Sxt21q2BoglpyyEdUTxuJAwAuGu7rvcwp6P47qDUFzJYh/Xm9R4XEWRpwG0
 B6H2QbtuSmQvg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, angelogioacchino.delregno@collabora.com,
 daniel.baluta@nxp.com, 
 pierre-louis.bossart@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220903032151.13664-1-chunxu.li@mediatek.com>
References: <20220903032151.13664-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: Introduce function sof_of_machine_select
Message-Id: <166239233387.736206.8864417821862907650.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Sat, 3 Sep 2022 11:21:51 +0800, Chunxu Li wrote:
> From current design in sof_machine_check the SOF can only support
> ACPI type machine.
> 
> In sof_machine_check if there is no ACPI machine exist, the function
> will return -ENODEV directly, that's we don't expected if we do not
> base on ACPI machine.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Introduce function sof_of_machine_select
      commit: 354f6008b730a217a3e6ad982eda42e90e6f7473

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
