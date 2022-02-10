Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F594B16DF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 21:21:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47CB190B;
	Thu, 10 Feb 2022 21:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47CB190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644524467;
	bh=Z6kRlzBdrrxjA+NIo+rcCn/qe+dYKICm+h6nQYowURk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQMPpKf0ca6SdwXMvDa/GS9KS1JtHfaLQDE1VV4sqUBhgN1a/me11n3Lu1RHteGvp
	 N7lfTx+XfoGIfjVhS5v6rg9qAGNMlJ+erO+QAVUmzND3NKpr1Frwknuw+6oh0JEhfk
	 8AObtMnopwrbftYJY+Zmb1/elnsY7r74jyF8oP2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42E54F80302;
	Thu, 10 Feb 2022 21:20:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8ABFF8028B; Thu, 10 Feb 2022 21:19:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AA66F8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 21:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AA66F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lywv7e1Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A92BF61812;
 Thu, 10 Feb 2022 20:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1133DC004E1;
 Thu, 10 Feb 2022 20:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644524393;
 bh=Z6kRlzBdrrxjA+NIo+rcCn/qe+dYKICm+h6nQYowURk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Lywv7e1YceBsMVJ1ycNPjWb2OE0SF/XswO1jKYTOGOHXCVUXKnhWS23bvaUhYSnSC
 VVmCetHqA5V/bX2Zuu00Wt9JAmOMkJdlYWU2gW1Y1wGTcffYVk9zIzf0Gastd02hsm
 8d1QQesXMrSiEfS/a07xi3GDHfuU3Qq3kBHSD1fE1ksMUQGo02fdFzavEuruBukEej
 5ulfC8JABQFShutEDw0wLu3oZzQNA+PXXJO0DOHvneyu2nB57tz15lYf25s53bdR8M
 Slpg5w9376aHvih1BVTdU3tn5NIK8oUSZMRgJy078ah5Ao3/VRNglJoF3LBNAwOwMN
 017AG8WN8TXeQ==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
References: <20220210172053.22782-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/3] ASoC: wm_adsp: Correct control read size
 when parsing compressed buffer
Message-Id: <164452439180.1098326.4968635038186775717.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 20:19:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Vlad.Karpovich@cirrus.com, lgirdwood@gmail.com
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

On Thu, 10 Feb 2022 17:20:51 +0000, Charles Keepax wrote:
> When parsing the compressed stream the whole buffer descriptor is
> now read in a single cs_dsp_coeff_read_ctrl; on older firmwares
> this descriptor is just 4 bytes but on more modern firmwares it is
> 24 bytes. The current code reads the full 24 bytes regardless, this
> was working but reading junk for the last 20 bytes. However commit
> f444da38ac92 ("firmware: cs_dsp: Add offset to cs_dsp read/write")
> added a size check into cs_dsp_coeff_read_ctrl, causing the older
> firmwares to now return an error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/3] ASoC: wm_adsp: Correct control read size when parsing compressed buffer
      commit: a887f9c7a4d37a8e874ba8415a42a92a1b5139fc

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
