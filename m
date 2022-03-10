Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D1E4D45CB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C3018B1;
	Thu, 10 Mar 2022 12:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C3018B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912179;
	bh=Kzo5oQox5Nnel/38kZiqDln1P20PREc101+795Z1V7c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=petm6Y1XDUmdt3P22Y+iHhTdRe6xsKgvl4lPp771tqVmCc09qSvGqKItR7Se6xttS
	 mfEdPAafWflC7n+VuJxlWWcGOXZwUzNlKiswXysn3oWiYzWMDVu+CPJ5RTSOmn7n2d
	 X6y3udj/lNZd3/bU6EfyAKQ50UALZyhpPEx8LQe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D55B2F8013C;
	Thu, 10 Mar 2022 12:35:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AAD1F8012C; Thu, 10 Mar 2022 12:35:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A450FF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:35:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A450FF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qFauxTg1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6A8F61625;
 Thu, 10 Mar 2022 11:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB15C340E8;
 Thu, 10 Mar 2022 11:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912105;
 bh=Kzo5oQox5Nnel/38kZiqDln1P20PREc101+795Z1V7c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qFauxTg1BU2FdfoSiVOiocSCMlFeo9MhYRkQ2oTbBtEVRfevq0tJyK9krLjZVYmJt
 bzjREotceLzp785GLQ83/HildcEa4Rj190aiEOcQpgrWAhmsVIaHMP26RnYxfaFKGt
 4xupO7YzOiLibrRAzbP1LTUPzicZoPtkX6rojHn7WKHhyEOrVnacFOW8yaxGGnAUI8
 6pcBNd22XaM7nSTZHrAuqzksrhWLndv+jAKHrIWvdUW5m+/vCSwJcwXizn9ELmtU0c
 L1icLh0bl1DK+86gmDsiwEWh7tjNh/wE4gluBpahLtB3/GbkjYxJ6m7zmubpBsBL9B
 sozGB3lQkl7zQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20220309130017.2816-1-simont@opensource.cirrus.com>
References: <20220309130017.2816-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Compressed stream DSP memory structs
 should be __packed
Message-Id: <164691210413.13776.14038216361749418209.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Wed, 9 Mar 2022 13:00:17 +0000, Simon Trimmer wrote:
> The compressed stream code has a bunch of structs that are used to
> represent DSP memory but have not been marked __packed. This isn't
> safe, they could get padded on a 64-bit build.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: wm_adsp: Compressed stream DSP memory structs should be __packed
      commit: 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4

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
