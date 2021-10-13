Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940542CA92
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 22:02:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A854E169A;
	Wed, 13 Oct 2021 22:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A854E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634155371;
	bh=PbioJUSgrHswROc8bHM1Hz526HYB0Fa9UFSIVps9jJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4+I1SkqYIC9YKPDhCWycOfFcNZOTfWx+Fa7u8FAjAkgJRI0907I6Kti2F3cM7qYM
	 QZEI0R9BRaUiWtafLtz5JeR9DAeTtqvP/4Veu64+AnWMFTfcILY9SrGDSyNjWk0s4N
	 qoUDwlnmY9zYPbOoXphgRFkx5OesOTe+Cx9z1Slk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80795F804FA;
	Wed, 13 Oct 2021 22:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C427DF804EB; Wed, 13 Oct 2021 22:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28EF7F804B4
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 22:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28EF7F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nI2INLRS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F2C5611CC;
 Wed, 13 Oct 2021 20:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634155217;
 bh=PbioJUSgrHswROc8bHM1Hz526HYB0Fa9UFSIVps9jJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nI2INLRSGzBt06O/pBDE5Sy+EZh75tLEQXq/OhqVaXVbrpuAnuXHrjFZloogtDNLX
 OKGbneFh777Xc8AIK4GMO17Hu7199qV3fwW6/TyV2VObM67p6hMAtreEcqnlDQaP+H
 9ckR4BySj2or3UqvkcG5M7IXkO2OMKYuz/pB/NHsaKYesp7xv6R6oziJl7dxCMd/I0
 BWATO4bRfRH77wbgkOEQdj6MOf40lAiomavsuG+h9RbhEXdU74AhZglDpLt93vztSq
 nlnHz6gFcD3KM6eG2EHKyXUnsx4KnfeE0pQyj78KMdcLXbnjLcxU0z1OSbq3Q/XBG3
 Nvm0MiHK7SMNA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, cy_huang <u0084500@gmail.com>, oder_chiou@realtek.com,
 robh+dt@kernel.org, perex@perex.cz
Subject: Re: [PATCH v4 0/2] ASoC: rt9120: Add Richtek RT9120 supprot
Date: Wed, 13 Oct 2021 20:59:51 +0100
Message-Id: <163415517074.1358186.14156300933559857070.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1634088519-995-1-git-send-email-u0084500@gmail.com>
References: <1634088519-995-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 Mark Brown <broonie@kernel.org>, allen_lin@richtek.com
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

On Wed, 13 Oct 2021 09:28:37 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> This patch series Add the Richtek RT9120 support.
> 
> In v4:
> - Add 'classd_tlv' for 'SPK Gain Volume' control item.
> - Unify the tlv declaration to the postfix '_tlv'.
> - Fix 'digital_tlv' mute as 1 to declare the minimum is muted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: rt9120: Add initial bindings
      commit: 126a76ada98f17c7f4ed1cc8b8e0429c574924e5
[2/2] ASoC: rt9120: Add rt9210 audio amplifier support
      commit: 7228d83531fcd801aeac97db99a028a386a2e828

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
