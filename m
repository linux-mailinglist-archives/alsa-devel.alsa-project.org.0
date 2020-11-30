Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A582C8A1C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:58:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCA21771;
	Mon, 30 Nov 2020 17:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCA21771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606755508;
	bh=b+x9s3I7ptvxcFj0SBZF3PC0IR2WjNoBnaNfNj77cAE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AuHxANLWbriI45V2B6JeXG3Z+sClHCdHpmpckUUg5A7G3bFVzPp00wMDO7DrfgYeJ
	 NWZxz+fQzQHGGkruVWi6BmE/6VImk0aE00p3xMMas7pNPjPo3LLRTft7066iIyg0I4
	 4nJhHXnSs8UnAHVskTpMVv5MMw/5Olj57BTN3BTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 211AEF804BD;
	Mon, 30 Nov 2020 17:56:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54361F8025F; Mon, 30 Nov 2020 17:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08098F804AA
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08098F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MQoAewjd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C46F02076B;
 Mon, 30 Nov 2020 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755354;
 bh=b+x9s3I7ptvxcFj0SBZF3PC0IR2WjNoBnaNfNj77cAE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MQoAewjdK0/e/PGQag99kTw7b5MYmYJQwqupiZ67UZxxSc6MjdH82NGP60mgXcN5+
 fkeG/7Gk+AP1OhauhNkBZu5ih3cb3lF8yRwM9f8SU4aiJX9Tf8cH0E/uaNfy4ukt8E
 bmS8HMIkgBXd7jCxxgid4ezyIdNgy68ZgV+PNMfI=
Date: Mon, 30 Nov 2020 16:55:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zh2zu40a.wl-kuninori.morimoto.gx@renesas.com>
References: <87zh2zu40a.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: tidyup for jack.h
Message-Id: <160675530955.30326.5961866712081934902.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 30 Nov 2020 08:44:56 +0900, Kuninori Morimoto wrote:
> These are jack.h related tidyup.
> 
> Kuninori Morimoto (2):
>   ASoC: soc-core: tidyup jack.h
>   ASoC: add soc-jack.h
> 
>  include/sound/soc-jack.h    | 132 ++++++++++++++++++++++++++++++++++++
>  include/sound/soc.h         | 122 +--------------------------------
>  include/trace/events/asoc.h |   1 +
>  sound/soc/soc-core.c        |   1 -
>  4 files changed, 134 insertions(+), 122 deletions(-)
>  create mode 100644 include/sound/soc-jack.h

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: tidyup jack.h
      commit: 9e8434a0083b135b7fc34bd8fbd7cb99a47b3c08
[2/2] ASoC: add soc-jack.h
      commit: ddfbe828f2ed13f9145c5c5fa17cb0a1b58e0bc9

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
