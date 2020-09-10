Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDE26465F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 14:54:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10BFF16B5;
	Thu, 10 Sep 2020 14:53:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10BFF16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599742440;
	bh=S+MdDdJ81Bh0I0+h8HcN1itJRMb2nWkM7fLmT9aGRLM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMRQ5uobuB8SFHWgwD2d1y3eSsLCANrkUZ3LfLQ65NuDFkkk8SClhwbpybpbKtU/t
	 lft/DDp+lSdSzxSjz23QJrOcKubNx5dOr8oB8bXZgSZtJhBuqTDcoCrpEewx1vI02E
	 lViL5WXIjFVzM/wVlDBEST0+rebTZXpCCXOEU6lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA10F8026F;
	Thu, 10 Sep 2020 14:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA34F8026F; Thu, 10 Sep 2020 14:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10071F8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 14:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10071F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yDpfXlEV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20FC920BED;
 Thu, 10 Sep 2020 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599742332;
 bh=S+MdDdJ81Bh0I0+h8HcN1itJRMb2nWkM7fLmT9aGRLM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yDpfXlEVHR1fTxd2Lgo3qgKjV0PUFhabJzB+piLjHJ4A9XDzW/7ycA8+VJ4apGe+5
 QiEy17v3V588S0Nax4O2Nm258SY2D+LP/oZBuRCJpvMOmcKyaTAMzSmomvXi9ud5m1
 B+9YPlzRApXNlroQBfYQ842AudyasjXj2w/VDJ3k=
Date: Thu, 10 Sep 2020 13:51:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200910042949.3795682-1-tzungbi@google.com>
References: <20200910042949.3795682-1-tzungbi@google.com>
Subject: Re: [PATCH 0/2] ASoC: rt1015p: add rt1015p codec driver
Message-Id: <159974228224.39114.2385163618024159317.b4-ty@kernel.org>
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org
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

On Thu, 10 Sep 2020 12:29:47 +0800, Tzung-Bi Shih wrote:
> Adds rt1015p codec driver.
> 
> Tzung-Bi Shih (2):
>   ASoC: rt1015p: add codec driver
>   ASoC: dt-bindings: rt1015p: add document
> 
>  .../bindings/sound/realtek,rt1015p.yaml       |  36 +++++
>  sound/soc/codecs/Kconfig                      |   7 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/rt1015p.c                    | 148 ++++++++++++++++++
>  4 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
>  create mode 100644 sound/soc/codecs/rt1015p.c

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt1015p: add codec driver
      commit: c07152d46b3b056ff182a0b5beb323fc2e6788fe
[2/2] ASoC: dt-bindings: rt1015p: add document
      commit: 36760d44be7eb2b65e302ee038ded89654abc0ca

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
