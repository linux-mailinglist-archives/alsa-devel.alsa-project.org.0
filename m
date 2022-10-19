Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1B604559
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6113BAC;
	Wed, 19 Oct 2022 14:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6113BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182799;
	bh=aPyHwGpQDqp6mV6GQOgzNraXtKVfjsqOQJ4BjvZ2zTA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvehX+Wf5ycKBFNRqUF5Nx9RTQSPM7UuCIbslw3DGAmgvshfeJmZheaQ94YQD73/L
	 Y2AjxZy34ax3f89ckjbBnVqiqCggsqhEE1ejwIcRSDAESP9gYtK5zJtmB8atcgkw7S
	 oku84EOrFGZnql3olOgpN9qUNxR94w5yZOzv4ics=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23629F804E0;
	Wed, 19 Oct 2022 14:32:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA51FF804FA; Wed, 19 Oct 2022 14:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D7A9F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7A9F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iG93Gu2b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13769B82221;
 Wed, 19 Oct 2022 12:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8642FC433C1;
 Wed, 19 Oct 2022 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666182739;
 bh=aPyHwGpQDqp6mV6GQOgzNraXtKVfjsqOQJ4BjvZ2zTA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iG93Gu2bfMUNZwgNlb+pNorOTo64/d98ZsG5WL1WKR+NQOCrjBsKUyJthff5n8x0h
 yIFZD1rvubrS8Xk4J8VolpO4klkCIOP1YuFcMjw2Av3VTPsPmCx3Sl6pVjjjhKKhIw
 fmtILI6n+hffQ4LKmhh1SGj/T3KkumcFB/WkW3s+nW3/nhNoLS1kg/v0CYH/mfyHdS
 WiLaE5Ad/fnHN41FAnC4Q6hZh21wcje8eM+agmm2/wTU7HyMX0MuVOxEf87R7XEcOD
 YbcqaXpcNwSIowLFWZ0TXvtrjyb79tSxEXH5NXjMKhsGb2+BEe9A3u5POpCZE/e0Kt
 MNNlqMXrMHLNw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221017204004.207446-1-pierre-louis.bossart@linux.intel.com>
References: <20221017204004.207446-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: pci-mtl: fix firmware name
Message-Id: <166618273827.118898.2737087405360727299.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:32:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Chao Song <chao.song@intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Mon, 17 Oct 2022 15:40:04 -0500, Pierre-Louis Bossart wrote:
> Initial IPC4 tests used the same conventions as previous reference
> closed-source firmware, but for MeteorLake the convention is the same
> as previous SOF releases (sof-<platform>.ri). Only the prefix changes
> to avoid confusions between IPC types.
> 
> This change has no impact on users since the firmware has not yet been
> released.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-mtl: fix firmware name
      commit: 73189c064e11137c8b78a825800a374924ebb7b7

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
