Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD643FEE0
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 17:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851B316E7;
	Fri, 29 Oct 2021 17:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851B316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635519674;
	bh=R5FzHwmSwQfQlpdo5i1wIaXeUju+mJBwvASYAGgavDA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NYlXb7mUX6YzXIzVRerpyVbxXwY5nSUeKP3k8/xGZPeAFAWfo/xzVBv2GlLz9YYdY
	 JpRcQbZx5tfB1ykiq6W/Swj4YavnbVImOy9WIos5aROI5vG43lsprBoXx7wqnjn27R
	 iPhaF7MF8pb5AbQErKn3aG1PKJSO7if7ErC0q5Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F84CF804E3;
	Fri, 29 Oct 2021 16:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 911F4F800D1; Fri, 29 Oct 2021 16:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50A9FF801EC
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 16:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A9FF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="taS8SPLP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DB51610FD;
 Fri, 29 Oct 2021 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635519537;
 bh=R5FzHwmSwQfQlpdo5i1wIaXeUju+mJBwvASYAGgavDA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=taS8SPLPWZXwfIEGI+GHSRCUfwkkGDlzisA08qBpDDbzMh4i26Q40AH2HwqIzy/2Y
 CpXHCt5C5nkkDkr1lPEmsxJcw4rtAZplhC84oL06IAGqAcRIp7vqyPqNKawgcPR6h3
 0MesEC/uJrUi1y5M7ETPZ9xQ0z4pmZTDHNpv8RaRP2ipSqwQES70hgAIWotsy5wMmq
 fsPCMgpYBUsr23VpN5mZvQtl1IpNBQ0HwwCq/m1IDWn4hduLdGcf+McQ1ZehpTzRba
 dpYhUINIi1u6ryqXyfI6fRV5WB9sXLDslfv+keKKP+qx8Knalr33DkKDZ31qDNSCV7
 xOVcPcrrpmV1Q==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20211028140902.11786-1-rf@opensource.cirrus.com>
References: <20211028140902.11786-1-rf@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/3] ASoC: cs42l42: Fix definition and handling
 of jack switch invert
Message-Id: <163551953598.3555751.8698233177978916153.b4-ty@kernel.org>
Date: Fri, 29 Oct 2021 15:58:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, 28 Oct 2021 15:08:59 +0100, Richard Fitzgerald wrote:
> Summary: The driver applied the opposite of the DT setting to the
> wrong register bit.
> 
> The jack plug detect hardware in cs42l42 is somewhat confusing,
> compounded by an unclear description in the datasheet. This is most
> likely the reason that the driver implemented a DT property for the
> wrong register bit, that had the opposite effect of what was
> described in the binding.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: cs42l42: Correct description of ts-inv
      commit: 2a2df2a755172afb25f0883a52aedba3b67d8a48
[2/3] ASoC: cs42l42: Correct configuring of switch inversion from ts-inv
      commit: 778a0cbef5fb76bf506f84938517bb77e7a1c478

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
