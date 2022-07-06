Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E280B56866C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778B0169E;
	Wed,  6 Jul 2022 13:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778B0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105742;
	bh=57+IIFMCOJgxTrNyjjSpEHzoTqQk48pg/9WlJ8B9Hss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dlkZ8GP1zZesKw5x8IZqjoCF2FqChzSHFVWAqMBaKTcFie3mrpLmsCunh0cG66/8c
	 3S0mkdWp/4sRaWpUHpaqnM58EeRTT/jQH7vEYNkxCnX0L9fGXFSDMUMSuhsSI3DR5A
	 9cDUWfG6D/VqrdoaQiB7TPlDbPwMdkJS6fRfVWn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F4DF8032B;
	Wed,  6 Jul 2022 13:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF2EBF804B4; Wed,  6 Jul 2022 13:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415B3F800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415B3F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HhF+epXM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3C999CE0764;
 Wed,  6 Jul 2022 11:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15CEC3411C;
 Wed,  6 Jul 2022 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105670;
 bh=57+IIFMCOJgxTrNyjjSpEHzoTqQk48pg/9WlJ8B9Hss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HhF+epXMG8KWIa3I0W71AAmPpb0KmibjMO/OMAaGXzlffBzAFnnAjpekhOmxf5Nu2
 WSKxHfLYAMxz/Dzt9BUT275H+sh2p5/vyPz1pWAiJqYPdArVuOy+haglQDqT8VRjWG
 FKwwa6+MPhRV0zMen51CDA8IGis2lkZD48VVLe9ZxmK5TsTBCYiBI1Vrzr/QfsEc+4
 Rcqenq/nog1UndpF7kImKT/TlosE/t8REsz7M+VasqVmZ3iLsAzfIlb2Dmln9jz2Jg
 ELq63znCYbdNcgViyYWeu1Ve83+TCSfbae0WiP+ITl4xpYt15Dk/p5sXyPbQ2wBiAG
 WcF2doDIxhv2A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH V2 0/5] I2S driver changes for Jadeite platform
Message-Id: <165710566863.237380.14611432933578872657.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:07:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com
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

On Fri, 1 Jul 2022 17:11:02 +0530, Vijendar Mukunda wrote:
> Jadeite(JD) platform is Stoney APU varaint which uses I2S MICSP
> instance and ES8336 Codec.
> This patch series creates I2S platform devices for JD platform,
> adds I2S MICSP instance support and Machine driver support
> 
> This patch set depends on:
>         --checkpatch warnings patch
> 	--https://patchwork.kernel.org/project/alsa-devel/patch/20220627125834.481731-1-Vijendar.Mukunda@amd.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/5] ASoC: amd: add I2S MICSP instance support
      commit: 3eb8440d0d268437202ccbd28a3ca3212e02e57f
[4/5] ASoC: amd: add Machine driver for Jadeite platform
      commit: 02527c3f2300100a25524c8c020d98c7957e485e
[5/5] ASoC: amd: enable machine driver build for Jadeite platform
      commit: f94fa84058014f81ad526641f1b1f583ca2cf32f

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
