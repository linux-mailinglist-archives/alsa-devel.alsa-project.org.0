Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A13835133C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69400169B;
	Thu,  1 Apr 2021 12:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69400169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272318;
	bh=p6DXvYw/NWks+3yW81H6NJ3+qPvCkGqzyavkprDtv5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=udHkbKsZ6Nt5AB6VKzT/JefD0YEAD93/6l5Vc2y/CjhV7CKuDRDi4ZJEtypD4u5P+
	 bYLzkTPjJV8tisstiSZXggYX7CD2i9QX0bOCokoHNa9RXlvoVBAY8A/iNQwE4Fm+xD
	 shLtMNV1ZNYdSzDzybs/FaQrzJLqzoBcUXTIiGrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 019D3F8027B;
	Thu,  1 Apr 2021 12:17:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A7DF80240; Thu,  1 Apr 2021 12:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF286F80240
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF286F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XWRuqdmR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C63B6108B;
 Thu,  1 Apr 2021 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272217;
 bh=p6DXvYw/NWks+3yW81H6NJ3+qPvCkGqzyavkprDtv5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWRuqdmRTVO6SAqZaVePgGdfWrXHmPYMSIhnujMnbbS7AYEVdQpZLRp5n9bMmMXRi
 FllodJlmASwQX1EtigweHbOc5LnxTxmPzYGWJHYV4+naV9kKR/I7m2uyjMvuZGl4XX
 sIGmq7F5XaHPgQZbTW64iY4KsykjRsp2kDNI1C883/TxKOV4gJ1i6yZWRqtavfz/5t
 2ejUA46HSCJynFsLdf7GvxTdqjlpMW8AZTvGd9YjFbuIu1e10qBUp0ejYfPd8dbv5s
 WxxKclW23vuHDRviZqams2Krdx+zX2zlC3gYRTyIzsB5V97fegSymF+8HAqGxejAGE
 wyGkp7r8+UhZw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the Chuwi Hi8
 tablet
Date: Thu,  1 Apr 2021 11:16:18 +0100
Message-Id: <161726938994.2219.12630891887594506871.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325221054.22714-1-hdegoede@redhat.com>
References: <20210325221054.22714-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Thu, 25 Mar 2021 23:10:54 +0100, Hans de Goede wrote:
> The Chuwi Hi8 tablet is using an analog mic on IN1 and has its
> jack-detect connected to JD2_IN4N, instead of using the default
> IN3 for its internal mic and JD1_IN4P for jack-detect.
> 
> It also only has 1 speaker.
> 
> Add a quirk applying the correct settings for this configuration.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for the Chuwi Hi8 tablet
      commit: 875c40eadf6ac6644c0f71842a4f30dd9968d281

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
