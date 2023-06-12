Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F772CC8C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 19:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E984D84C;
	Mon, 12 Jun 2023 19:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E984D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686590931;
	bh=75UZyHjl2zJMxrVcs7DUjZ1qnlvax8FntHKvTPz3AcQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=seFNwvevlEm+B4zEJB21QBdSnl22EIVD/KUxRwEnoAF3ZFfdvIHaFN0aXe5QiFbCn
	 BO+t1vrJAiZUM1P96jAPeFuIG8JVLLHnuBummoAeIMRCWFGFl4EsrW7IEIOQveZ6fG
	 yubsM/OARxiB3UZDGW2+GsbXVD4ldT/buIfMLlZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF46F8057B; Mon, 12 Jun 2023 19:27:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79031F8055C;
	Mon, 12 Jun 2023 19:27:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98D90F80155; Mon, 12 Jun 2023 19:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6456F80132
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 19:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6456F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jOldAiAR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68D87620D7;
	Mon, 12 Jun 2023 17:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA72C433EF;
	Mon, 12 Jun 2023 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686590820;
	bh=75UZyHjl2zJMxrVcs7DUjZ1qnlvax8FntHKvTPz3AcQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jOldAiARikgSpZkEd1+M9+rsGHTXPW5+UZ83xA+hL79HPwCPMQz2G7we6H7STlSNa
	 UTPrU23qLA7E+u+nrGf5U6uZAWBAJAG/CWfbixDzVqtUhJ0wjvu1Yd6haofNXHbGgA
	 vLY2DQHSqvVVCCPb1s/NKPRCFDHrrUqKE1fvMYY6LKTDyZZyLfxv0hal8RTwBzNglL
	 bpS9bt69m8MkbHBBCRhLB2lt15OMI/dHwan4iLiqsaUJXSe4P2lFT+mke/9cKMcJVp
	 hcpTUbcOTpDgfPUfowyfYqrNzl6VbnIRMAuLqPlT9qDo5Sk4gz82RYh/sTo7te0bni
	 1FB+feAQFvWJg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 kernel@pengutronix.de
In-Reply-To: <20230612070608.836186-1-u.kleine-koenig@pengutronix.de>
References: <20230612070608.836186-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: Switch two more i2c drivers back to use .probe()
Message-Id: <168659081830.87413.8638944897505868465.b4-ty@kernel.org>
Date: Mon, 12 Jun 2023 18:26:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: QN3PEX7TBN443TKGRC53CWBXIX2UC7N7
X-Message-ID-Hash: QN3PEX7TBN443TKGRC53CWBXIX2UC7N7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QN3PEX7TBN443TKGRC53CWBXIX2UC7N7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Jun 2023 09:06:08 +0200, Uwe Kleine-König wrote:
> The previous conversion back to .probe() applied in commit 9abcd24002bf
> ("ASoC: Switch i2c drivers back to use .probe()") was created based on
> v6.3. Since then two more drivers were added which need to be convert
> back in the same way before eventually .probe_new() can be dropped from
> struct i2c_driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Switch two more i2c drivers back to use .probe()
      commit: 947e3960a72aa51d8643098851534baa5cc6538b

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

