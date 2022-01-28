Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C366349FD6E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBA016B6;
	Fri, 28 Jan 2022 17:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBA016B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385656;
	bh=SG0hgFKjqWwBCUkDI0TEOtxJTRzQD+ug6SvmhGJoPNE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruZo2E1sLNT72rBzXYnVsQFrluuowo1yea39oG3oAbuVgSftxJQfKsMDOaKdo2Iwj
	 W7tl8tO902hjCFF/X5nt6xEsnt6jBtOCTxSSqSJ1FsChQnFeEOOiyMsy3g77YjlezB
	 e1ZjPFvJWqFriZdmv5y+QOF/DSpcqm0VK0v/gvJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F548F80510;
	Fri, 28 Jan 2022 16:58:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1371F8050F; Fri, 28 Jan 2022 16:58:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30580F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30580F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dM7FKElz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1686C61EBA;
 Fri, 28 Jan 2022 15:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3741BC340ED;
 Fri, 28 Jan 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385527;
 bh=SG0hgFKjqWwBCUkDI0TEOtxJTRzQD+ug6SvmhGJoPNE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dM7FKElzgK5/EIrq4HLLjJRGcdxqdwJHyMketq/GIVO3YulxTdDJ69awmByZDEtCa
 ot/1O2+PBWng50JkL65onkOEIUv6SPv5jYNKGGzVG5R54X0fAvHb4aZLayFbJUrs6a
 quj3IMsdUoAJ2eQU9FKOH1pWLBfjTCjOsl6Z4wbYQG5Mrd9ZY7NJrFveXyaieRikb6
 keTNUKTdbh+4GocJLOS0UEczUmz4B60wjScCJEEyjjIKqOnjH2FoqxVq7a9svCasDQ
 mZXpY9MN69nQYfcQTcvPT5nicayRBGr/HvFuDYFTGHaPRxkuogFnRaWxwJbznq3/hj
 TXCK228dndnCA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, thierry.reding@gmail.com,
 perex@perex.cz, Sameer Pujar <spujar@nvidia.com>, robh+dt@kernel.org
In-Reply-To: <1643268455-15567-1-git-send-email-spujar@nvidia.com>
References: <1643268455-15567-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v2 0/5] Tegra234 APE support
Message-Id: <164338552494.1711274.10416282145153327937.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com
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

On Thu, 27 Jan 2022 12:57:30 +0530, Sameer Pujar wrote:
> This adds APE support on Tegra234 and enables sound card on
> Jetson AGX Orin platform.
> 
> 
> Changelog
> =========
>  v1->v2
>  ------
>    * Rebased patches on latest linux-next
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: tegra: Update AHUB driver for Tegra234
      commit: 4fcc8710fdd91b37760ccd99bbfbe10352df7600
[3/5] dt-bindings: Document Tegra234 APE support
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
