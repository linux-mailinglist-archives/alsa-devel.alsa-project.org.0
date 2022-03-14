Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E514D7DE5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 09:56:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BECA186C;
	Mon, 14 Mar 2022 09:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BECA186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647248172;
	bh=pOJJw1xO8gJXjWgBRnxa5bjvsoFtsXrMDM88AR9YVYs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3H49xAwqTYKHt2PWlC0Y3sDaHE4KeoKB7AUnpYcrxRnDZZVYpRgsbMmaLZlqlCxa
	 R9HiKpTKbmGA0UvmUnQZo7hFZOOLaQcAIPdUSfwIq+OtZv8frLCDum+8p4n+cwoxH1
	 I9dCJeLce4p+ZIvHH16hMSvM+YMzEnxdiTtVWG90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5302DF804E4;
	Mon, 14 Mar 2022 09:54:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96CB9F80475; Mon, 14 Mar 2022 09:54:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15CEF80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 09:54:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15CEF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h9yMSvcs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9886ECE108B;
 Mon, 14 Mar 2022 08:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70F3C340F6;
 Mon, 14 Mar 2022 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647248064;
 bh=pOJJw1xO8gJXjWgBRnxa5bjvsoFtsXrMDM88AR9YVYs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=h9yMSvcsMlqsjB/0bz0VkbzBh7ZYDkkImBHp/r5frg0YOIiSdj5e9H8HZydZNAqNG
 GB5OLl8/ejWx6WR/MTIZxFc4qP+B0uTJfR8v1m1rgbJofLJXslHGY+Jxs+2OVJa4Wl
 +4WvYgAyStpZVYvyHc7XRrlNB4LK3X0SfWN5HjG2+7OU9bmLOCB5eEyQ3QFen8eVCP
 oOc16u0ClC7qotQaBYoOh0SrFB6/5VS2qZyXZMN92zM1qgQ9he3foRnl5bFyPquGDc
 eYZN1dNPeg6wgURs7QAa+BwgfPiYGsOjl8PbcTl7iJFBZkHKLrXR1UGYvDl18hnqQS
 XaBuUU4nBsTWw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>
In-Reply-To: <20220311234802.417610-1-robh@kernel.org>
References: <20220311234802.417610-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Fix patternProperties with fixed
 strings
Message-Id: <164724806240.972788.14565468208010113949.b4-ty@kernel.org>
Date: Mon, 14 Mar 2022 08:54:22 +0000
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

On Fri, 11 Mar 2022 17:48:01 -0600, Rob Herring wrote:
> The simple-audio-card and renesas,rsnd bindings used 'patternProperties'
> with fixed strings to work-around a dtschema meta-schema limitation. This
> is now fixed and the schemas can be fixed to use 'properties' instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Fix patternProperties with fixed strings
      commit: 910f42bfe96783fc633196bd975731a420c7a066

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
