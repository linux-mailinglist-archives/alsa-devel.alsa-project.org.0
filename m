Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75797280A8F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01AEE1AC1;
	Fri,  2 Oct 2020 00:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01AEE1AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592741;
	bh=VsGhgXRdCnWZqUDrSyjJV8kumHT0TEaqq/cLoqkAokc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ua4H7QeX+TW7r7TVu0aU7REG8l1CViC83UjonfQrn1S/YJnvJK0pjIwtLNLceVmKQ
	 KX+0u0lPvcBdf6/fFVpgCw1CWI3Y+IOmvipK3/+VZhLKUwtXVfDmXzP4SaR0ANu4kZ
	 CUY8YvhwZFs+J1/N6F6auFyQtKymebuuOhpr0YO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DE5F802F9;
	Fri,  2 Oct 2020 00:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE8A4F802F8; Fri,  2 Oct 2020 00:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_94,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC52F802EA
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC52F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V5k0sX3y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5DF42074B;
 Thu,  1 Oct 2020 22:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592464;
 bh=VsGhgXRdCnWZqUDrSyjJV8kumHT0TEaqq/cLoqkAokc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=V5k0sX3y/T4DbGcH9xwwRfc+7B3lMopdOq5qZ49bPLrijsAhSo3Gu6X6gyEInBBLC
 xuyIHSavc23u8xoR0Y4tIhM0PTFeu1P/gXAIVAe076NW8xwst5XAjZ+Uvv6iJj8aIi
 49ehqIXP7F0nUMY6XWtzee/uwS3ZaUxg4jhk3Xyk=
Date: Thu, 01 Oct 2020 23:46:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20201001152425.8590-1-ckeepax@opensource.cirrus.com>
References: <20201001152425.8590-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Pass full name to snd_ctl_notify
Message-Id: <160159237543.44588.14038213779147686140.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, Adam.Brickman@cirrus.com
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

On Thu, 1 Oct 2020 16:24:25 +0100, Charles Keepax wrote:
> A call to wm_adsp_write_ctl() could cause a kernel crash if it
> does not retrieve a valid kcontrol from snd_soc_card_get_kcontrol().
> This can happen due to a missing control name prefix. Then,
> snd_ctl_notify() crashes when it tries to use the id field.
> 
> Modified wm_adsp_write_ctl() to incorporate the name_prefix (if applicable)
> such that it is able to retrieve a valid id field from the kcontrol
> once the platform has booted.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Pass full name to snd_ctl_notify
      commit: 20441614d89867142060d3bcd79cc111d8ba7a8e

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
