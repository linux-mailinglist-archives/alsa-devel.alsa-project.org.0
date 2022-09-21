Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD045C0429
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 18:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E461679;
	Wed, 21 Sep 2022 18:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E461679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663777845;
	bh=7kgl3djZh5Ukp8fvVJOXIPsXSTMOiScsoj5xfm/EVqo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hu3REIT+sGsbghd3OocrD2UmX9jjxgR9EWi+Y5z28gGnQ2rLQEAxFopaB/9CSnOA0
	 kydRPtV35p1+vnf5RBZRDOJOCZhQTHw40mTEhtzZ3+5xtRS9xkRYa+2Lz8NJ859Rxr
	 /7TBZgxFhloa/UgU4c+Bt5D7gEoeFDt/UFweTxsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92670F80535;
	Wed, 21 Sep 2022 18:29:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EBAF80425; Wed, 21 Sep 2022 18:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03086F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 18:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03086F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oN7ekmxI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B108262420;
 Wed, 21 Sep 2022 16:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9983C433D6;
 Wed, 21 Sep 2022 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663777745;
 bh=7kgl3djZh5Ukp8fvVJOXIPsXSTMOiScsoj5xfm/EVqo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oN7ekmxIAQJRnB0TY9KCgLZRzCIsUggmu34F7hSZRLTSTSgM3gAj33zK6qKqxQjz8
 ojwsbTu6YypGWXzHBYRBJ6mdnMiKSvC+/kUscqiGqP+MRSJf2alzGXhZPCW1cKvSOj
 6YOWzuJd7NbbBmlpuxj6NFOaS1iRtX0msyzfP3TgStGbCJBBsSrYdcsLeY4pDepI6b
 pHjqrFLgE4k4Pq8MRDfDkiFztPXr6DCS6TZaNrSvxVu/CmfKujxbTdnVnESXsir8KE
 r30h3YcbuUgtzAhm8/WWtoBwAsNdPGdz82g+u8vn1kdorD0fvnfYFq97UM/tQypHj3
 vlA0fmOefu9aA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Astrid Rost <astrid.rost@axis.com>
In-Reply-To: <20220921081834.22009-1-astrid.rost@axis.com>
References: <20220921081834.22009-1-astrid.rost@axis.com>
Subject: Re: [PATCH v4 0/3] ASoC: ts3a227e control debounce times
Message-Id: <166377773859.591459.5595500353811129379.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 17:28:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Astrid Rost <astridr@axis.com>
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

On Wed, 21 Sep 2022 10:18:31 +0200, Astrid Rost wrote:
> From: Astrid Rost <astridr@axis.com>
> 
> PATCH 1 - convert ts3a227e bindings to yaml.
> PATCH 2 - add ts3a227e bindings to support debounce times.
> PATCH 3 - add ts3a227e driver to support debounce times.
> 
> v3 -> v4
> Removed the comments on enums in Patch2.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: sound: ti,ts3a227e: convert to yaml
      commit: be541bd473618f64fa14138dc7f63b0643363f7b
[2/3] dt-bindings: sound: ti,ts3a227e: add control of debounce
      commit: 6a47412d0798735b0715d224574d216dba9e630c
[3/3] ASoC: ts3a227e: add parameters to control debounce times
      commit: d20fa87e80c363a1c9534afb31df2fa90087e51d

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
