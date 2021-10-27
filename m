Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C621D43CFC7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4886F16B8;
	Wed, 27 Oct 2021 19:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4886F16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355987;
	bh=cJp8gs8AleZxnawpuHmN71D6zTfYnuA2fLvcbSbgeBA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNnWvdg71RBXn6p293fg8S/E4T30jcV5kk2Vw2LZKSsjH4tsRUY42GOhUbnYhjT9V
	 EjntdQATyZ5Vo6vCUzhXNbBlZCUGTs1RQQix019RtpaLjMuapoN+MxCrtXl/4VfxQg
	 4TdfqYXtZixmrShV4EzD6w0zkRGpcO4bTXCDbfDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B38E1F80507;
	Wed, 27 Oct 2021 19:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49EEF80271; Wed, 27 Oct 2021 19:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06BA1F8049C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06BA1F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EN8VG8ko"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78CCC60F02;
 Wed, 27 Oct 2021 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355761;
 bh=cJp8gs8AleZxnawpuHmN71D6zTfYnuA2fLvcbSbgeBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EN8VG8ko9h6CuFi9zsIHTIWsQHENACoDoFdOak7dAwr+wVZ3a0e7Ae/L2ntB3YGUh
 VfywyLYcWTnaM0e3LV+aaftmofiUpxkljlAGa3a8mhQiRY/qixyA5MwWTVAibydUVP
 OzNKKbbQ6F6VpeiRNxmlZ71fcLl6onWdCaa7xpQGdrNJCpg/OKueOBZLwR1Uzug0U7
 +36ObdpcYcgtqChrCbEtjOGUQnxvb5FWHTKafrQjwjMfO/fwuLfqXwc5Z5ABXJEj+r
 qkRfe91gIDMdrsghKotYKR4+JhaxMR1R3YmZmgTP6khvTwq98dhAMGaaHy2FCJF3Zb
 ze1MgD3iyfrmg==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander Stein <alexander.stein@mailbox.org>
In-Reply-To: <20211026182754.900688-1-alexander.stein@mailbox.org>
References: <20211026182754.900688-1-alexander.stein@mailbox.org>
Subject: Re: [PATCH v2 1/1] ASoC: meson: t9015: Add missing AVDD-supply
 property
Message-Id: <163535576023.4012075.11294627556140470131.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Tue, 26 Oct 2021 20:27:54 +0200, Alexander Stein wrote:
> Fixes the schema check warning "audio-controller@32000: 'AVDD-supply'
> do not match any of the regexes: 'pinctrl-[0-9]+'"
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: t9015: Add missing AVDD-supply property
      commit: 5d03907bbf9ccf10e0d2cfb4f4d312b7cc4274f4

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
