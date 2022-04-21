Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4750A839
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 20:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9811316BB;
	Thu, 21 Apr 2022 20:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9811316BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650566409;
	bh=eZRFyMDmeIvRWEyQlHw0jVTUfhNriCOuiHUr3UhliUg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMNO3NZMZReQ4KKr2zo8GdQ9GpKy+w6rzZiXOjZirg8GsPZ4Rxqhq7zzdBNsqEhC6
	 yJy3tp5nEnp71Og6AMM8SI/WHGxW8w0SeP9ScaLuD+k1Iiz4/pby4LwuTSvClsZ3Xv
	 OsgyWoh/9Pv83UwPMSlWvKwGVkcpi4kFBceRVK+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D20FAF8047D;
	Thu, 21 Apr 2022 20:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B56BF8032D; Thu, 21 Apr 2022 20:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4136F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 20:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4136F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A2kKhyPN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DFF0FCE21D6;
 Thu, 21 Apr 2022 18:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88601C385A5;
 Thu, 21 Apr 2022 18:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650566340;
 bh=eZRFyMDmeIvRWEyQlHw0jVTUfhNriCOuiHUr3UhliUg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A2kKhyPN5zyu7ohqBffvwGzEDLlmArb5Y19O113IAqf7Vy0nhOUlkJ6Hk6dEB1ccf
 IWAAQMRBJJ1C+YzJj1LB31mQfpt4wiesLYNiPZH3cnBuMyDFzcSLhoG+5/ZDlOggDo
 gvI4faWycB8U3gDystpKN5GXFPG3WcNfaN4ujUR17+t3jSO3Ob8eukn5fRU+3sZ4f+
 1tzzeY7zNjMdOgs/QB4XLNzb2/D4PrZN58BvvyKPmEBtfe+PPU2mqWg5EUwUIm0V6u
 nH0WAtKEpXkQyyVruhS4C5LWsTpjAR4tSzNg3VKpDjA5YCvZas7ep07w0iS4HfQ0ss
 dFQZYLe+9OO1A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
References: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: SOF: AMD updates
Message-Id: <165056633924.400654.15859497123792696051.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 19:38:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 21 Apr 2022 11:58:18 -0500, Pierre-Louis Bossart wrote:
> these patches were originally submitted in the "ASoC: SOF:
> AMD/Mediatek updates" series, but there was a bisect
> issue on the first patch.
> 
> sound/soc/sof/amd/acp.c:176:29: error: unused variable ‘sdev’
> [-Werror=unused-variable]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd() callback
      commit: bbdcd3d590cad744db46cb94649833db3575df49
[2/2] ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP communication
      commit: d2be77b382328b46a79635bfd9e959a96bb6ac29

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
