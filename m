Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE33399E3
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 00:03:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F77418A9;
	Sat, 13 Mar 2021 00:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F77418A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615590227;
	bh=YjpH46E5wsNV0V6as8mJ95+AjvUcvV/u/mVOZl8KRBg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MYKjCJAG/A4Bdtkn1CzpPiGBYAeJyuQ/MI3PxZKLpfIAE1vLAWBNYTsIVE3L3Qpxb
	 hzC5jKBDKBRQCpibSgwjLmKhIiP92VKNmUq45OR9MSuIJFJ39vBCxKjPbviygiSiyS
	 YuKEkJcXLhGb4qxBsB9z68pj8XCHXr7HSZZ+LqnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A79D8F8016C;
	Sat, 13 Mar 2021 00:02:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E48CCF801ED; Sat, 13 Mar 2021 00:02:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DFBEF800AB
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 00:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DFBEF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UOmoNrl7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6CC164F4D;
 Fri, 12 Mar 2021 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615590127;
 bh=YjpH46E5wsNV0V6as8mJ95+AjvUcvV/u/mVOZl8KRBg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UOmoNrl7OW/V8jOFswOIRyhAM8sQ5o9vYGhD/fmFRK5WLqZCmJ68tjNsEaiUsVnmw
 vHxZmeX9O/idptY5NwkhF47YUIHbVKEylfzHlb5ahKME1hlazi2HkXY2RVDOC0Q5DS
 orkVU42K+1JZsL9jOZwGF8qtyc1M0Vr6FArGZchcWZ+XwV7/Q6xNcV12rSd28oQeMk
 EiPje11w5WGeR0E0jx1mG61xBtTTEq5UYhAYpyhifuCC7GXw2ui+tTCsY7GUxI2CP6
 niSgG9YfFmSG6kFkZnXm4cneZv+2f4V8qN7aHM20rJWIdDY+8QI19EENcknga49RNi
 jvKhV3r8FwnRg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 timur@kernel.org, alsa-devel@alsa-project.org, nicoleotsuka@gmail.com,
 festevam@gmail.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: request dma channel from specific
 controller
Date: Fri, 12 Mar 2021 23:00:49 +0000
Message-Id: <161558981190.31753.12828472795254829304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
References: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Fri, 5 Mar 2021 17:19:37 +0800, Shengjiu Wang wrote:
> Request dma channel from specific dma controller instead of generic
> dma controller list, otherwise, may get the wrong dma controller
> if there are multi dma controllers such as i.MX8MP.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: request dma channel from specific controller
      commit: ee427ea4f12672e5d7874abaa634ddee0ff2bb97

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
