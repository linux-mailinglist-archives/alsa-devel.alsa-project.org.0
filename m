Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C517A0771
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 16:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BD2DE5;
	Thu, 14 Sep 2023 16:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BD2DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694702121;
	bh=9S7VIQV7YxfxsrOKvFr7Zd7ehjJmNmiY2E7KkfD5TvE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UBSmShNgjO1h+PeYeQttRbDlgd6vwYaabpDqv0wC6bdwGVKt14ntXFlQnaTx0q2LY
	 28Kwuu8RU0u9oeICDRqLBjrCS2ZiruZWBecj+rssMa6lW+6CuhDVbq9DyZJnyZCyiC
	 uL5VY5BJOSZnyGxrXBmS1qgZ5WP4dw+qgcuIC09Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5293F80564; Thu, 14 Sep 2023 16:34:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72983F80537;
	Thu, 14 Sep 2023 16:34:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 272FAF80558; Thu, 14 Sep 2023 16:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CFFF80141
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 16:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CFFF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DstQJ4b9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2243BCE2703;
	Thu, 14 Sep 2023 14:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3CCC433C7;
	Thu, 14 Sep 2023 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702051;
	bh=9S7VIQV7YxfxsrOKvFr7Zd7ehjJmNmiY2E7KkfD5TvE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DstQJ4b9OBCNoWWvU0xCDU0aEnvcxyudZYIHGCRUJJqqLg9y5HoR9sxwszcOI1gT1
	 /O7mQOKgCgZ5xjBIENcYxyK3jGoeG3+lNsLRRgWEcHn3n2cHtcazZe/y3O3PTQxIDp
	 LRn5qXgvuSq5+gMhkYzbdyqrekN2kAbfakpk4z837Y+S6aWXrexkLndqe0v6zbIxc9
	 TaGkX3OwtCobkBWY1L4Ex0n5YAeAJvQONPlAPOTXpzp1YKSDZuYVQsMfVuMXtzCxM4
	 L16OaTA/vFhMyMYFYOgofXD+3xncI3VZSTTvuuEjfQ9SIcoG3wdXG/PexvJG1m/+ju
	 eKmfkqGAgvP/g==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230913102656.2966757-1-chancel.liu@nxp.com>
References: <20230913102656.2966757-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Set ignore_pmdown_time for
 dai_link
Message-Id: <169470204840.386807.4356692554775825839.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 15:34:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: TVMQ2SXHX6SVOQVYZ4IRBJW75OPOLFB5
X-Message-ID-Hash: TVMQ2SXHX6SVOQVYZ4IRBJW75OPOLFB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVMQ2SXHX6SVOQVYZ4IRBJW75OPOLFB5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 18:26:56 +0800, Chancel Liu wrote:
> i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
> by CPU DAI driver in hw_free(). Some codec requires MCLK present at
> power up/down sequence. So need to set ignore_pmdown_time to power down
> codec immediately before MCLK is turned off.
> 
> Take WM8962 as an example, if MCLK is disabled before DAPM power down
> playback stream, FIFO error will arise in WM8962 which will have bad
> impact on playback next.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
      commit: fac58baf8fcfcd7481e8f6d60206ce2a47c1476c

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

