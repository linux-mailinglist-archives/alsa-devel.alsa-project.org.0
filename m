Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3921B9BC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 17:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E9F15E5;
	Fri, 10 Jul 2020 17:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E9F15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594395838;
	bh=31SRA1ojL9GpcKLyUiLwLpHPGG0dcpgvSQatvym/bPs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RNTSukeq+tzhz1RfWcEsH9qEn6hbUadnBBZhF7U390RodYcKBoB5coJG89K/O1KQm
	 4hbGObJsDrt9Z04ZDC5kjvDqvPt0mHId9uPLQU04WbpaxVIXOyDdfvs6/QY8PZ9hwQ
	 8/PLR+Maaii8J1mmcJ7oz9ck5CJg5JScmMlaX8Vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C6EF802DD;
	Fri, 10 Jul 2020 17:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4292CF802C2; Fri, 10 Jul 2020 17:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F6A4F802BC
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6A4F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LZMhp4bX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F80C207BB;
 Fri, 10 Jul 2020 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594395604;
 bh=31SRA1ojL9GpcKLyUiLwLpHPGG0dcpgvSQatvym/bPs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=LZMhp4bX0rgy7ASmfQ8w6c5qwZi78zTA53J/RT7BpqPcGjen1sXLzA1Aou9pff3wT
 ECKaLD/lzBs3Wn5/zzrSlOTYRQDPX2/4Qa4CVJfoGvkTZtm4sbJeSQ0mGjNBwGQ/3f
 OEPXq9ouCjLqHgNvdka7TPnZ7xWZFuTCwODcsYYg=
Date: Fri, 10 Jul 2020 16:39:58 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
References: <20200710052505.3664118-1-tzungbi@google.com>
Subject: Re: [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
Message-Id: <159439557864.48910.15353677231173679587.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Fri, 10 Jul 2020 13:24:59 +0800, Tzung-Bi Shih wrote:
> This series is a follow up for a long time ago series
> (https://patchwork.kernel.org/cover/11204303/).
> 
> The old series bound too much on the patches of DRM bridge and ASoC
> machine driver.  And unluckily, the dependencies
> (https://lore.kernel.org/patchwork/patch/1126819/) have not applied.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: mt8183: add a property "mediatek, hdmi-codec"
      commit: cc07e14b149e4260075093c06b371bcb31574ccc
[2/6] ASoC: mediatek: mt8183: use hdmi-codec
      commit: f2024dc55fcb743469238aa11f9967e0752ac600
[3/6] ASoC: mediatek: mt8183: support HDMI jack reporting
      commit: 88abbf627a56efcd7f24aa119f07069d3d10bd0b
[4/6] ASoC: dt-bindings: mt8183-da7219: add a property "mediatek, hdmi-codec"
      commit: 5653841d1e6bace7897a0b5ca681fa37945fa11b
[5/6] ASoC: mediatek: mt8183-da7219: use hdmi-codec
      commit: 5bdbe977117741a6bf4958c8dfdcb6b9263e9f1c
[6/6] ASoC: mediatek: mt8183-da7219: support HDMI jack reporting
      commit: e25f8afd8869bd97a4d0baea5d8da730913c8541

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
