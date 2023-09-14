Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E27A026D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 13:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20F4B84C;
	Thu, 14 Sep 2023 13:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20F4B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694690500;
	bh=ecaTzIFO43R+JdO9sreiQ6O5aV7ggwAdyxXyH65zNL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=otslwprlwOkUjrkY6tXX4Dzs1rU6ToySHveQ8hWPnLsS7mWyrhdgejTQcl4uTTjLd
	 +bstCns0AxKPPuNd716ehp6zayslaQST2tPOPozsVw0Arls8BgPDO4mmu/nP18DNYZ
	 Bo91/yaEXj9GZAjahO1UDiuhUaGQj7CCezrCv55Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1000F80578; Thu, 14 Sep 2023 13:19:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D410CF8055B;
	Thu, 14 Sep 2023 13:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CFA8F80537; Thu, 14 Sep 2023 13:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 641A4F80425
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 13:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 641A4F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ucop6zmJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 99FE9CE2485;
	Thu, 14 Sep 2023 11:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC8DC433C7;
	Thu, 14 Sep 2023 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694690382;
	bh=ecaTzIFO43R+JdO9sreiQ6O5aV7ggwAdyxXyH65zNL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ucop6zmJGTt+OBbpAjlJAu9AJF2JHDvoExkPbQRRhWe5OK1y0UgFPyIlG5yhb9aeY
	 bZCkB6rSQVcjP7Is7UcQsVuzV+eI2nceYg6h7clbaPe0SnV9t1FKcuPnVCDB7hXNDL
	 iRLERa+8QWlmONKAYWk8YqBr9LUMu0q7dlMbGLfQahB2NlDzZGXUGOkiy/RDRzG/of
	 4w7wrUw/bRkrCOxteII2DtXfIz5UD+n1Epq1l6TlaqlfR61+C7LZM2/S2Etvdc9ogi
	 NbgC1F2ZvIEm4GjJ59ClODcHwDn+DwR1MwI+o977iikUmfcOLmyl+26uHwQR983EGG
	 nrrh3yfaotaYQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230913160250.3700346-1-rf@opensource.cirrus.com>
References: <20230913160250.3700346-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix missing locking in
 wm_adsp_[read|write]_ctl()
Message-Id: <169469038143.23670.735867835837223806.b4-ty@kernel.org>
Date: Thu, 14 Sep 2023 12:19:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: EF6EWVZVMHWJNHHR4UZFRCTAJSR47BUO
X-Message-ID-Hash: EF6EWVZVMHWJNHHR4UZFRCTAJSR47BUO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EF6EWVZVMHWJNHHR4UZFRCTAJSR47BUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 17:02:50 +0100, Richard Fitzgerald wrote:
> wm_adsp_read_ctl() and wm_adsp_write_ctl() must hold the cs_dsp pwr_lock
> mutex when calling cs_dsp_coeff_read_ctrl() and cs_dsp_coeff_write_ctrl().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Fix missing locking in wm_adsp_[read|write]_ctl()
      commit: 781118bc2fc1026c8285f83ea7ecab07071a09c4

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

