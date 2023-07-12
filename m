Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E97506E2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B5E84D;
	Wed, 12 Jul 2023 13:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B5E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162576;
	bh=JXAMcZrpRoE91F6XTSvxZwcYhk6D31xbdpQ1w4SM5Ns=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Y+xzkBRN7VW+DKn1w7ApBI8v4EvomQdY0L7GqVgyodJgyDk2tCfa5MXkFhWo16bD7
	 4/Gvb9AdNQ3aCNB7PSyjAQ1d5m8HEWlPV7TPMBQbpzf4G1cpmXrhkyTFUGyEbq5mjD
	 h3WpHdJ9MK2lsQZdeSOKqdgsuoIt+AgLJibaOerQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 704E0F805C3; Wed, 12 Jul 2023 13:47:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBABDF805BD;
	Wed, 12 Jul 2023 13:46:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7702F805A0; Wed, 12 Jul 2023 13:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2571DF80579
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2571DF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ug77po3J
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C692961797;
	Wed, 12 Jul 2023 11:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE21C433CD;
	Wed, 12 Jul 2023 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162411;
	bh=JXAMcZrpRoE91F6XTSvxZwcYhk6D31xbdpQ1w4SM5Ns=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ug77po3JMwPWMfa4AgH0aTo577IWr7JHKnVhLNkT7MaYL7jRKqyYx9n7qmXYFms1F
	 voLs+23dPqdWNMKTdRUW9Lti7Ynb2Te3lqf+1WarjmTBFRD+actcKwAE3Ht/QjArKi
	 Jwa0dPaTXTU4WLNowXxlbesUOiY1YGQdey9ZNtdhQsQCVOEaOkV79J9bC+C3U1LitF
	 1vlUyevOEuItBBWnt9mwXwolZG9ucqQfWvdxMIv5mxEIc4K37NtC0Q7vi3N9qrJUX3
	 ZfwIsHV7tl3wm103IrqoN57DbjNBT+kTdH4MFQImTByu6QCJ8TBg5Hobmf43jgO3Gb
	 sdufjRjTIFVgw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230625065412.651870-1-chancel.liu@nxp.com>
References: <20230625065412.651870-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Set PCM hardware parameters
 separately
Message-Id: <168916240829.46574.4591447025609181967.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: OL6K6TYMIEAPHVELPCCH7UX4DCWVK53H
X-Message-ID-Hash: OL6K6TYMIEAPHVELPCCH7UX4DCWVK53H
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OL6K6TYMIEAPHVELPCCH7UX4DCWVK53H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 25 Jun 2023 14:54:12 +0800, Chancel Liu wrote:
> Different PCM devices may have different PCM hardware parameters. It
> requires PCM hardware parameters set separately if there is more than
> one rpmsg sound card.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-pcm-rpmsg: Set PCM hardware parameters separately
      commit: 82770b76abae2ff9d70f354a61983b921e63bae1

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

