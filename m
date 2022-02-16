Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D8D4B8FD1
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 19:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA3F1949;
	Wed, 16 Feb 2022 19:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA3F1949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645034590;
	bh=WVgN2U+mLl41uR6SAT7+qakZtHd3vfQQyCqycQFbs00=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBaiI76+Vz1kVmUXifdGzpOPML1QQjIlxBGQ3ScRW5uCwNOlAh+QLTGqoJvircvzs
	 xmZiikV4Lo3N5XVp/pKkqLIOEx6hv7m2n51qTgFnfbKYRLlrHrCn80+KadWHVH79H1
	 3I5aadIexZQJx+qGKFtL/MLBgGe5copWmLa3cLIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C14F80245;
	Wed, 16 Feb 2022 19:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B81A4F80128; Wed, 16 Feb 2022 19:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C393F80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 19:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C393F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AOUAvu0n"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E68CD60AEA;
 Wed, 16 Feb 2022 18:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE896C004E1;
 Wed, 16 Feb 2022 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645034515;
 bh=WVgN2U+mLl41uR6SAT7+qakZtHd3vfQQyCqycQFbs00=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AOUAvu0nuysOfusZ57OwDgdcL4pj2WEUGP8Mk5MboAdMElP1BK7nTF5acWvHBVjQW
 T88lZwg3+wnW57Cv6voWRBiqTFLhVYzLwGBz2PolcBFvilKaNkc64yKood6dbru81U
 eX64dZjXDjY3/rtk53YpsW8LvMkOL+fV38TCCl29pR6bRjuxB/stbPl2qr3cy3442Y
 xazzeIiRg1D8kOegQ97ZZvvy6F47Uqunf5Zjei2xRMIYxMVzsoqIAhNJtChN5BVw9P
 /iUepa1H5ZlZufeLR2w7UOGaAgMsse6q5rmy2zerpkMq1bSyu9HDzEyPJTBMb/aEOM
 za/pVS1LBsZdA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20220215130645.164025-1-marex@denx.de>
References: <20220215130645.164025-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: ops: Shift tested values in snd_soc_put_volsw() by
 +min
Message-Id: <164503451442.3088802.17577982526948199324.b4-ty@kernel.org>
Date: Wed, 16 Feb 2022 18:01:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: stable@vger.kernel.org
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

On Tue, 15 Feb 2022 14:06:45 +0100, Marek Vasut wrote:
> While the $val/$val2 values passed in from userspace are always >= 0
> integers, the limits of the control can be signed integers and the $min
> can be non-zero and less than zero. To correctly validate $val/$val2
> against platform_max, add the $min offset to val first.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min
      commit: 9bdd10d57a8807dba0003af0325191f3cec0f11c

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
