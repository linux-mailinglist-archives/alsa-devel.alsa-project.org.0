Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56877647010
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 13:52:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0AB9173F;
	Thu,  8 Dec 2022 13:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0AB9173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670503928;
	bh=8hnNJ9DZ4igi+2oWkwMROzxxrbtcCPXUTfGBvpCICRE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t3XRnk1OWCjCHqFqkLdQJOFA24mh/anpil/jsDnbO6LmPhngELRwGAVWL1stUfe4a
	 i8o5gI9xRMq3Zd804ttyCVEg1DEue2+F6LPiMaQXfl52VTFLXkq7qvTeEvXuT/ELnS
	 wFWUjV3jT6vvPv29fFWxSBZP74JSwXe0y2Rslnow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 723DDF8024C;
	Thu,  8 Dec 2022 13:51:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04DC8F80121; Thu,  8 Dec 2022 13:51:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E281AF8020D
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 13:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E281AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OBB8ECup"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2F98B823AB;
 Thu,  8 Dec 2022 12:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6C5C433D6;
 Thu,  8 Dec 2022 12:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670503861;
 bh=8hnNJ9DZ4igi+2oWkwMROzxxrbtcCPXUTfGBvpCICRE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OBB8ECup1asPHUtDd+yv9pGEbglayCD8FXpWNbIJoFUPULofulix6CpBu3dqbOBoY
 BxOi0HBuoOMfPvTjCJUKZS5ZWSr0qgKs7COm+1p6psZRJ47CHztaa3V82SyqYzxrEY
 1KYUoPM6+wtYuE56voOqTrK9XER6DcejbAXSKOJ5LMkCvcXDjQtzfPD5qvuGyvcMlU
 JlMI36ez57pOOo6stAVPR+HDWSCjzyuCQunNq9BR27tIHJAAVBIEZkxaXfnrNwEIoQ
 mYDn5dGJedysCPvgPj1a258z3Wy1ZTX9KTjylY1V48WbJ0zTILXIFeHGMuTf3Qw2tb
 NEGWpkrb/h1uQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20221208035354.255438-1-marex@denx.de>
References: <20221208035354.255438-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI
 compatible string
Message-Id: <167050385979.139462.9635280378479288853.b4-ty@kernel.org>
Date: Thu, 08 Dec 2022 12:50:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: devicetree@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Thu, 08 Dec 2022 04:53:54 +0100, Marek Vasut wrote:
> The ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible strings
> dropped i.MX93 SAI compatible string, reinstate it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI compatible string
      commit: e85b1f5a9769ac30f4d2f6fb1cdcd9570c38e0c1

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
