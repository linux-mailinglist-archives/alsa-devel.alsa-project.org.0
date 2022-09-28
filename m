Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C65EE31C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 19:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FBB84C;
	Wed, 28 Sep 2022 19:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FBB84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664386090;
	bh=dkjJX3GmTUUEkX53QWs8rV3NWH4VfCMRbH6qGJMwdts=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVkwJIT2skJmVHzCnXSdXs9uFnfEEWdmhxMymx1AVYoUtu+IzvxCzcUnqBHCjT1uU
	 4w4wB0SuefZHq7to07PiirL5DMbhUsj2CGpSkhRxB8FHkCBoMLj81wbn6rR3sEVEU+
	 Zj2X1zTsB5ssmPr3/0U9UKzA6QnbumyqVa+jsji0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60A96F804B3;
	Wed, 28 Sep 2022 19:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E525FF80310; Wed, 28 Sep 2022 19:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A387DF800AA
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 19:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A387DF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A9sOr9dd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF79661F4C;
 Wed, 28 Sep 2022 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7EFC433D7;
 Wed, 28 Sep 2022 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664386021;
 bh=dkjJX3GmTUUEkX53QWs8rV3NWH4VfCMRbH6qGJMwdts=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A9sOr9ddn0zmiTF4Gq7/WqosRJlG6j/PR+b7EyX39g572sg+QfEpvDtSAyMjt6Rgw
 w+l7U7p3snIl0oxw8jw4HJyYWPos/rUJBqLBoiFa6moWg/PDPB+n1DDCa5D8UQkrUs
 oZxfDtDrFRiS5gV6Ayb+G8SkebthxyECwvxOrmZjDNQN8P1RPR8PJr4Gw2Gaf3Mq4/
 C1b3aHJF05hCXOPZbUgdTngmO8PrD/9VSRZBnxxUZ9eTBvwoeDwpVjXx37Mgv9UC3H
 pWD1O2rD00jyi3EkE6Mgue5lZIpPlTF/pSFILWoDA5PpjHyWUQtXwzkp/rUtECBoYr
 vvlJ3/96QANXw==
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com, tiwai@suse.com
In-Reply-To: <20220927151141.11846-1-trevor.wu@mediatek.com>
References: <20220927151141.11846-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: update audio tuner settings
Message-Id: <166438601946.235698.6774354071024623483.b4-ty@kernel.org>
Date: Wed, 28 Sep 2022 18:26:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, 27 Sep 2022 23:11:41 +0800, Trevor Wu wrote:
> Audio tuner is used to handle clock drift between 26M and APLL domain.
> 
> It's expected when abs(chg_cnt) equals to upper bound, tuner updates pcw
> setting automatically, and then abs(chg_cnt) decreases.
> In the stress test, we found abs(chg_cnt) possibly equals to 2 at the
> unexpected timing. This results in wrong pcw updating.
> Finally, abs(chg_cnt) will always be larger than upper bound,
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: update audio tuner settings
      commit: 7ba6546b547c75b0196029c7e0aaaab2eb6694a4

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
