Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 143215620A2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 18:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7776316D9;
	Thu, 30 Jun 2022 18:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7776316D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656608220;
	bh=OX+KE9gn+blAoAm6LZ6lJfKiyy8z7eGc9S/R+DW2HpQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlIUgntYW2f0RGjO9f3aKVUE3c4Pv1K3R1IFGKpz84KikXJG+ZYoTGky7G5Ks8S3d
	 SEFmrJ4mKwAmGwgAndLi0bPvKPaomT1OCWj57uXcoZ0OMMFZqjzgarZc5IhBTDhS6H
	 7FBX0P5bNnlrhcPr+7rSymCMHeF+aBc3WaWNolBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A7EF80535;
	Thu, 30 Jun 2022 18:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04BB3F8052E; Thu, 30 Jun 2022 18:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C177F80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 18:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C177F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tKEeEd8u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1765B82CAD;
 Thu, 30 Jun 2022 16:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEBAC34115;
 Thu, 30 Jun 2022 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656608145;
 bh=OX+KE9gn+blAoAm6LZ6lJfKiyy8z7eGc9S/R+DW2HpQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tKEeEd8uzhS7vXf4PLxERqRSg79l+1NaDTVc5dtBVWpYo8usPtRSgNzssKmJkWLDr
 978gJgDjQ3TWZUErwZS3X/FBzehyqxukMaAzx992IHYKgiaQ+yw5e8UE+7uITu6bWQ
 bDMV2vcu7pqxii8Kh8zjookS3B0qwBENCz9bZGRtU6Ty5psNfc3EN7tZyh1G6uoq1l
 VYJoIHq52GeJh+GltRY5hXICj9UOG77yNG+a7D90t+468PcJqHL2LVCfIG4vKpd8/1
 vua+ZcraNRZ7/8cTAyiEVXkgou1ZLY2QkxmpNRQahdOe04Qh6lc20Z/yo+lJw7c4Fn
 /UaBtpXG8z/iA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
Message-Id: <165660814442.771023.12313397324180249293.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 17:55:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, geert+renesas@glider.be
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

On Wed, 8 Jun 2022 02:09:16 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Renesas is the only user of ak4613 on upstream for now, and
> commit f28dbaa958fbd8 ("ASoC: ak4613: add TDM256 support")
> added TDM256 support. Renesas tested part of it, because of
> board connection.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4613: cares Simple-Audio-Card case for TDM
      commit: ed0073bd0fccec459b526918be70bf9dc551581a

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
