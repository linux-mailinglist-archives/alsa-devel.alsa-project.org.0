Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1D6E10C7
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 17:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C10F15;
	Thu, 13 Apr 2023 17:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C10F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681398928;
	bh=wHnJNHVmb7RqxHn81PnrsufS4lvuIofxtxlWj1muxss=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tX/E4yt2Q7rS1UbzZolJAnpxNr9oLWmrdf5YLiO6jVyQAEPcADViLIHqQlNe1EQMh
	 w47ad7d+OO9gZk01SUeIpZlQNb35mc2UqRJOOLmJvrcjnP+bZwMJcbpTBWs1OZnNi+
	 JTZoYZppNO1g3dZcTilvhIVYfkG/AdS5sd6pVeVg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA4C2F8025E;
	Thu, 13 Apr 2023 17:14:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E53AF80448; Thu, 13 Apr 2023 17:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26D90F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 17:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26D90F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=haZCSPfI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5802463F83;
	Thu, 13 Apr 2023 15:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7FBC433EF;
	Thu, 13 Apr 2023 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681398866;
	bh=wHnJNHVmb7RqxHn81PnrsufS4lvuIofxtxlWj1muxss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=haZCSPfIcIuOhMYMjYaPXwhiWiKE7R2JCpEVH3CTDM8noDd6o45zMQhk/M7iWA7fN
	 fTeTcgNPG20b83Ak8519RWPN5zxIfKbNmMiiP1zrXxVNQ8GcS9J89sIiYtRhw3nldf
	 FVBG+Rbdf0lxZkgarsc8czYRAnzczuRctsaFIynS6jf6P5tdYdvdqw2FyDRoENjpwg
	 pnfBZo8dBoVyMwTcfTRTNigVvQ7lhOqUMorwFJGFWGEHVuGNwOCOQdWc0YGVc0kZsr
	 HBwVl3s+d7jGiL4TqVPhZLmXzP7ArPyi1q7/Q6zKNVLYDWjaYRDr+tAT0Plg2ZjOr6
	 fr95PaEtlsBNA==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <51976b2515d7007ba5c8aa7524892f147d7cdd51.1681363691.git.christophe.jaillet@wanadoo.fr>
References: 
 <51976b2515d7007ba5c8aa7524892f147d7cdd51.1681363691.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: da7218: Use devm_clk_get_optional()
Message-Id: <168139886490.3579559.9766383367823502218.b4-ty@kernel.org>
Date: Thu, 13 Apr 2023 16:14:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: 3QS2QK4O352SSJY7MBR6DOPDOCWNN6JG
X-Message-ID-Hash: 3QS2QK4O352SSJY7MBR6DOPDOCWNN6JG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QS2QK4O352SSJY7MBR6DOPDOCWNN6JG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Apr 2023 07:28:33 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7218: Use devm_clk_get_optional()
      commit: c6c3581a3e178882c8815462ca129e60be50fde8

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

