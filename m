Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE58512506
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3EE825;
	Thu, 28 Apr 2022 00:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3EE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097171;
	bh=jGR3MtKiwYyR+lUnJSaAaDsNLiw4lH+yX1MtYnOs/i4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glX0JLU3gDSoDBZkaWLVTxg2bxu0AJ1//6JtUmNWlbeIHNmST52Ix4tCAqLQu+Kiz
	 C2IRVxgS4CeTZPXB9tlDUlX7lOs9PPxPnKNv4cIsYv2HL+kdbk7+uIO9t3Vik+dNWF
	 DfHTpK/+HdlyKMSuRne/WvW2ItU5o1H2YanYzhfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51523F8053E;
	Thu, 28 Apr 2022 00:03:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76E85F80542; Thu, 28 Apr 2022 00:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3411EF80536;
 Thu, 28 Apr 2022 00:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3411EF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KYAsSER2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E24D0B82B06;
 Wed, 27 Apr 2022 22:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374A9C385A7;
 Wed, 27 Apr 2022 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096962;
 bh=jGR3MtKiwYyR+lUnJSaAaDsNLiw4lH+yX1MtYnOs/i4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KYAsSER2fa68mS9DGuKJMxkz2YSD++pSrMvoxGWqBZ5FXe3TlAtwgsOqiA4aJk+7P
 FuC7iZnPgJiRFtfG+2TqFhKDB+aB4DF9nCvdnEZwf4nt1QKW3etyqCmmBh3DpTgIZm
 wFPwoKtcIqCFyYKxr8vgd+ej8mL9eM5Kz0ftgvB0h+bNI2N9rWu6XiD0pSWSBp8lS9
 Op3mySF/PDzwazx7lnmoYQibcQyvh6ZJbp9xQeZHubDMvGDQRgM7Q+s+BQWXFdt8b1
 gp5kEKwMNBA4bHkInGCJQiEozfrj5VYJpiGnY2D0C6L4paMmJuzSHS2r9Cdic0GlUW
 1mFKxLwcqiTVg==
From: Mark Brown <broonie@kernel.org>
To: yc.hung@mediatek.com, tiwai@suse.com, matthias.bgg@gmail.com,
 perex@perex.cz, allen-kh.cheng@mediatek.com, ranjani.sridharan@linux.intel.com,
 yangyingliang@huawei.com, daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tinghan.shen@mediatek.com,
 lgirdwood@gmail.com
In-Reply-To: <20220427071030.10172-1-tinghan.shen@mediatek.com>
References: <20220427071030.10172-1-tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] ASoC: SOF: mediatek: Fix allyesconfig build error
Message-Id: <165109695894.498174.15533470381534539256.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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

On Wed, 27 Apr 2022 15:10:30 +0800, Tinghan Shen wrote:
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o:(.opd+0x18): multiple
> definition of `adsp_clock_on';
> sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(.opd+0x60): first defined
> here
> ld: sound/soc/sof/mediatek/mt8186/mt8186-clk.o: in function
> `.adsp_clock_on':
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Fix allyesconfig build error
      commit: 9ce170dc9c08895846c5828addb724e42bf98484

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
