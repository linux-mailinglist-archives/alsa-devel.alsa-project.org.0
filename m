Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9056351353
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EFD16B3;
	Thu,  1 Apr 2021 12:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EFD16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272539;
	bh=iGe2D6LmDdlgkmtGlkeKkA0BI73HLks02AeTtmGexeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLDVnMz/xSpnmgAe3Bv7jqBk81joPUT07tFjmlnnwM5rzdjfQa6eDpBmbWFIU2MN0
	 Asr7ZGVgwiPRyADIALA8tMZvAZCfQmvTp13wkloNrkPeH/t59IUVhdlk0YQz8T874T
	 pZ1rBBds08SjVP2l5huYE9XUq0ZrVtpRkEjpLWuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2E5F804EB;
	Thu,  1 Apr 2021 12:17:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0708F804E3; Thu,  1 Apr 2021 12:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EAC3F804B1
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAC3F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CNr++wyo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68F2F610CB;
 Thu,  1 Apr 2021 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272250;
 bh=iGe2D6LmDdlgkmtGlkeKkA0BI73HLks02AeTtmGexeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CNr++wyovjzSXGlXGahNRn/Km+uHzzxSPHMQYhZqTqhoVfGL/hJdHhn3BUfHscxWn
 j09PKw+v+sTtUuF5lmr0O83focANOYr+Y4lZke1fL8mmjohgU3SpmSD91IPfXTKDYj
 oEiZ3n0fAR03Gfpa5SextKvLLkwoyEC/0b6RgYtFjjw2fUwELOTK/z/gRTXWzhwBPh
 8wjdJ4rG/6rRUXPnmkzcHJTwwmDy3aSU9G5BZSQSkYefyzxoNyAlno5+Qkgt8sCXGe
 9Nlii35snv4jJXXYP57/VgXSezDbGmdndl2+NqhcmjR8i6OLOvTBH86wXIpnBZ/lhF
 no7f+gf0MTAGA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: soc-core: tidyup error handling for rtd
Date: Thu,  1 Apr 2021 11:16:28 +0100
Message-Id: <161726938995.2219.15320712658549513721.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <87tuotxlen.wl-kuninori.morimoto.gx@renesas.com>
References: <87tuotxlen.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On 30 Mar 2021 14:25:52 +0900, Kuninori Morimoto wrote:
> These are small clanup patches for soc-core.
> [1/2] patch adds missing explanation, and
> [2/2] patch fixup error handling of rtd.
> 
> Kuninori Morimoto (2):
>   ASoC: soc-core: add comment for rtd freeing
>   ASoC: soc-core: use device_unregister() if rtd allocation failed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: add comment for rtd freeing
      commit: f1b3ee789f4b7a41ad93ff42d4efbae607622ae7
[2/2] ASoC: soc-core: use device_unregister() if rtd allocation failed
      commit: 5fa7553dcd83c576c589fd3e617dc599e4fe15dc

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
