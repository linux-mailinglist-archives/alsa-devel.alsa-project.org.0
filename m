Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B229C37A23E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A721767;
	Tue, 11 May 2021 10:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A721767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722162;
	bh=4cFqGgBdAbBe0GybCv/aBA0bJnpRTZe4yHbphP7wiXE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmvM1CuI2xB8u5Q32OEClEehQ+/0hxfmTRavP7H/waqiFaZ8muG9Gj0HYvQGe5+mT
	 qJuD+PV4L2PfY02329Qi2n2Ms8NpWJYCLdhBx8o/3rtlf4VhSc8AiqBUOBlBgZ8CCV
	 k9XokyfdBUKUilj4D0ZIX1gkMjeJu1xxhp8dKQI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8702DF80538;
	Tue, 11 May 2021 10:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C7EEF804DF; Tue, 11 May 2021 10:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BC36F804D8
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BC36F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jynQ+wBd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D68361943;
 Tue, 11 May 2021 08:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721700;
 bh=4cFqGgBdAbBe0GybCv/aBA0bJnpRTZe4yHbphP7wiXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jynQ+wBdyHTV4wColpT3K+33k7SQI3CioTON0DCXJwQJEViOyc3uRkuJJJDqAWREz
 fg4ZP7cLfys3Ae0ECK6wNl1odn36jCmHpiMw6HXFfreWLli2uzQgJgR7y1KIjgzAD6
 +BEIFhfv3rSAAV2d3vW05YqHK406NVllKk1lY7qh+il6+07D+dcnRdsjLno5mmMQ0x
 O58cDdY303fXyULGaX+b3IZn5GMYtmJ+2vkkbSQPbu0QvkFY8J3P+m4gIgnpDEA+Io
 Ys76PY5EDXTJ2nwRImeke+iug2nQcDtJeYhRchHqOTuv+qPmlTw0XRxeELQFkGhYw2
 ceWbH3NKRodZg==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH v3 0/7] PinePhone BT audio bringup
Date: Tue, 11 May 2021 09:26:02 +0100
Message-Id: <162072058168.33157.16217732000222184745.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430035859.3487-1-samuel@sholland.org>
References: <20210430035859.3487-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Thu, 29 Apr 2021 22:58:52 -0500, Samuel Holland wrote:
> This series uses the additional DAIs added to the sun8i-codec driver to
> add hardware routing for BT SCO (headset) audio on the PinePhone.
> 
> The BT audio connection is represented by the "dummy" bt-sco codec. The
> connection to the Quectel EG-25G modem via AIF2 works as well, but I do
> not include it here because there is no appropriate codec driver in
> tree. We have been using an out-of-tree "dummy" codec driver for the
> modem similar to bt-sco, and I'm not sure if such a driver would be
> desired upstream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
      commit: 880e007f15a31f446b9e1713720c6ae5a539f3f4

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
