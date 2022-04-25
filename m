Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3E50E767
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:36:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8943217E5;
	Mon, 25 Apr 2022 19:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8943217E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650908194;
	bh=bYWxp86yEGzbQn8eD1j5yqiUJArxGCVCT/zbXsHXE6k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrQThB9dqjXHgbxV7GEPxu7Zo9s91YcJr7xv5nkUADdZHIHaE+YpV45t8NilppcVT
	 hbwoLcaANQzsw6rlWHZcl66j2m1wfbDtBU/EEpcB4x8qR2I5dXXJr9cjvp3tD6YP1I
	 D0b/uI5yg9OZPteCDpQAJCF9eg5fjJ++WP5PAsNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED772F8016B;
	Mon, 25 Apr 2022 19:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00672F8016A; Mon, 25 Apr 2022 19:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6616FF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6616FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iGuFZRr3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 508436148C;
 Mon, 25 Apr 2022 17:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8C5C385A7;
 Mon, 25 Apr 2022 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650908127;
 bh=bYWxp86yEGzbQn8eD1j5yqiUJArxGCVCT/zbXsHXE6k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iGuFZRr3o5yqrsGy9xKjiFikZNaLarNxFtz3dSamikF+/xD/NP3TgE00329MugOuo
 W3uK/AyZ6WPnarkbgEm/B8pUevRiGGCOGgJyPysQhQIT5p6KzJUGfPNlS1VFHn4am3
 k5TeuP1kBNsVxJpaGjw1YfDx5pCYc/I+5OjUHJHvpWgwALMhIlgSPCuo96VJGsAfcX
 Z5BFpidg+5IZB8SLxQfE8kBiN+K90mn4DozImePCYhOenSohOKV7WgHnbMsYLQLL60
 RbnUcENVCCsdj0xOZoBnbAbPKKv8dLrYuidRej+ZwNn5TCnMVN/1hPx0W1LL0knhNj
 iC+VHHANHWMxA==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 AjitKumar.Pandey@amd.com, daniel.baluta@nxp.com, lgirdwood@gmail.com
In-Reply-To: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
References: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Rework the firmware ready message handling
Message-Id: <165090812582.596854.5673409405640321824.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:35:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Thu, 21 Apr 2022 11:07:29 +0300, Peter Ujfalusi wrote:
> The firmware ready (fw_ready) message is sent by the firmware to notify the host
> that it has been booted up and caries additional information about it's
> configuration.
> All of this is IPC specific, the message itself is IPC version specific and the
> information itself also.
> 
> Move the code to handle the fw_ready message under ipc3.c since the parsing and
> interpretation is IPC specific.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: ipc3: Add local implementation for handling fw_ready message
      commit: b641fb7e019214d3fa2f44c3e562ba388e2a3933
[2/6] ASoC: SOF: Do not check for the fw_ready callback
      commit: cf64b67eebc222c9388adddc0038f9a59cb9511c
[3/6] ASoC: SOF: amd: Do not set fw_ready callback
      commit: 473dd4ea340c237e59d0c4d1973cf129a1bae504
[4/6] ASoC: SOF: imx: Do not set fw_ready callback
      commit: b5054161ebd168894b5a1d9d7eb97cd58dcbbb7f
[5/6] ASoC: SOF: Intel: Do not set fw_ready callback
      commit: 0fc88b5d42c646ecf4040f65c0f22cb9df42e69a
[6/6] ASoC: SOF: loader: Remove the old fw_ready related code
      commit: 19faf9ee06224c5db669539a10eae7c63f52f2e6

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
