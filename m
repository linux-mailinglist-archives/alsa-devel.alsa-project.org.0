Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAEB57BECA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 21:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756701753;
	Wed, 20 Jul 2022 21:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756701753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658346257;
	bh=RzWVDJljyuYtz/wuc3UwRzqp1JBga9tqKqYOdngdl+M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nKadU53LhJKPn2sns1+sO09aeDGg8F+S+SRtSyYVwy1EwG/85FDcwj8ibxmGJ6W1C
	 Y4Gk3/+WfbLVT90eQrhDb2OHQgRvlJh0laRhyabZUu+sA7nS6L7/gKVJNkr6rVhJh2
	 I1VXQbkRVs70Z3EvdnLfdGVee/1qV7ktwAQhHyVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DD7F80269;
	Wed, 20 Jul 2022 21:43:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1DA0F8025D; Wed, 20 Jul 2022 21:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A2FF80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 21:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A2FF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L8UVVyci"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E315B821D7;
 Wed, 20 Jul 2022 19:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0B8C341CA;
 Wed, 20 Jul 2022 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658346188;
 bh=RzWVDJljyuYtz/wuc3UwRzqp1JBga9tqKqYOdngdl+M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L8UVVyciCVERphvxpf6h/I78Wrw+/l6S/uAQICLHimwI8zPlAoB8faepX4EngxWMW
 7+OGyKk4RMF5SL7xcHVlnVHOMfywIXBbQxyjSHRMQZf5Hr8I/kZEN6kzAgwOJtbbOZ
 zSuf2RT7ZICqyFvJl0aXsgdpTBl9yvisa8aBwJHunzoCDqWtcaPlnk4LfleESr8vEA
 UD9NXeQAqCvdr6V58k21fgkuRxmbZYTXdqV+GffgNgSkN4P9alykoAJRNmAcg9yZCb
 LoZ5ZJmZ1o6S5TRXY8iyC6KFzk7/Qf/GPlic0m5+9yclkcnOG7YJr5xHuIUdiaAlUQ
 M9i/m+gRb+G/w==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, festevam@gmail.com
In-Reply-To: <20220719215134.1877363-1-robh@kernel.org>
References: <20220719215134.1877363-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: sgtl5000: Add missing type to
 'micbias-voltage-m-volts'
Message-Id: <165834618702.685508.4578685174512904321.b4-ty@kernel.org>
Date: Wed, 20 Jul 2022 20:43:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Tue, 19 Jul 2022 15:51:34 -0600, Rob Herring wrote:
> 'micbias-voltage-m-volts' is missing a type definition. '-m-volts' is
> not a standard unit (should be '-microvolt'). As the property is already
> in use, add a type reference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: sgtl5000: Add missing type to 'micbias-voltage-m-volts'
      commit: a6229b53194fda971213f7f0be00f3d6c70a79c2

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
