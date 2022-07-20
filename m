Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD957C0B5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 01:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 132771749;
	Thu, 21 Jul 2022 01:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 132771749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658358846;
	bh=tkIAwLdRLlKrtzjlA/APq42GsWiNdQp09ixV23X/Y0A=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLJUHqS0iyv7kGaoLp5TGVdSX561ip0NtuqseUqeFJ0bRT5m9uOuESuy+/3bX31dL
	 LgE3RJaIufJwycAkK3TBMqZv5QIh8pYgSTWC/Tvdr1P3nIC6ANz9m69068jh2fdDoj
	 1u1a2NZU1ZEEZLBfaKbsxWTNTUvH6wFIlgStjUcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF82F804BB;
	Thu, 21 Jul 2022 01:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC852F80269; Thu, 21 Jul 2022 01:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17EA7F8027D
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 01:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17EA7F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ffPRcU+O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F50A61DDC;
 Wed, 20 Jul 2022 23:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04523C341D0;
 Wed, 20 Jul 2022 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658358736;
 bh=tkIAwLdRLlKrtzjlA/APq42GsWiNdQp09ixV23X/Y0A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ffPRcU+OPp7EMgkx+QqIwS+b6gFBjuR7vxPCXU1BDNgOc0WFvq0UBKI/w6vtF8t7v
 WhaW+BWSJP6FgFJFkC/ujfH8SeNoOCIUjfTcsGhNziirtxP3ZDX5GgU7KcjSMVvnFX
 jieK5b5NMA5hPP1D1Eua17LNp7WMwOijLJ/XNx35ZT7xAwag+rjdWDWYIaSg4jNCwB
 +VPeAcxblFpRgPMXpgor10j7ln720X0Gc8F0bP9jppUFNRen2/u2/3D4LJqHtWsCoR
 GGg+VMWJfmGAnugQM2JYeD8ggQY8DXozrLjEMaP0XieToVXxeOvlu9BaioLk8sbpnY
 e0LQVNOVpsHBQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, paul@crapouillou.net, lgirdwood@gmail.com,
 aidanmacdonald.0x0@gmail.com
In-Reply-To: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
References: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
Subject: Re: (subset) [PATCH v4 00/11] ASoC: cleanups and improvements for
 jz4740-i2s
Message-Id: <165835873474.1007579.2143422827851423635.b4-ty@kernel.org>
Date: Thu, 21 Jul 2022 00:12:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
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

On Fri, 8 Jul 2022 17:02:33 +0100, Aidan MacDonald wrote:
> This series is a preparatory cleanup of the jz4740-i2s driver before
> adding support for a new SoC. The two improvements are lifting
> unnecessary restrictions on sample rates and formats -- the existing
> ones appear to be derived from the limitations of the JZ4740's internal
> codec and don't reflect the actual capabilities of the I2S controller.
> 
> I'm unable to test the series on any JZ47xx SoCs, but I have tested
> on an X1000 (which is the SoC I'll be adding in a followup series).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[02/11] ASoC: jz4740-i2s: Remove unused 'mem' resource
        commit: cd57272c4e686d4ad2d2e775a40a3eac9f96ec7c
[04/11] ASoC: jz4740-i2s: Simplify using regmap fields
        (no commit info)
[05/11] ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
        (no commit info)
[06/11] ASoC: jz4740-i2s: Align macro values and sort includes
        (no commit info)
[07/11] ASoC: jz4740-i2s: Make the PLL clock name SoC-specific
        (no commit info)
[08/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
        (no commit info)
[09/11] ASoC: jz4740-i2s: Support continuous sample rate
        (no commit info)
[10/11] ASoC: jz4740-i2s: Move component functions near the component driver
        (no commit info)

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
