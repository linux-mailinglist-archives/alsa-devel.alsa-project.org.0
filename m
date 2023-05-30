Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30C716B58
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 19:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41FC91DF;
	Tue, 30 May 2023 19:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41FC91DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685468494;
	bh=Z6D/5uzYpSL70zHtKS1o/zAljvJP+MVPP/cIfYT7yO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SXLF7jgTCS31F+xwA9MNxhocChF9wbfq1sOdSSfmbRPnvpXIz0RFW1a4ouqCe2VAN
	 HvenKlKLK0sy5Zw5ROmBDK9m5XAxkPCnrDeH8heFEJ8pXaK/BMVZhytaC1EMZ1KUQH
	 eQ8S5dgTgoScwje2jOa7G/hJkDN6VCuITtyVIZ7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B19FF8042F; Tue, 30 May 2023 19:40:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E93B4F80510;
	Tue, 30 May 2023 19:40:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7B55F8042F; Tue, 30 May 2023 19:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CC5DF8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 19:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC5DF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JQLSs2d/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1FB06290A;
	Tue, 30 May 2023 17:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCDEC4339B;
	Tue, 30 May 2023 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685468428;
	bh=Z6D/5uzYpSL70zHtKS1o/zAljvJP+MVPP/cIfYT7yO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JQLSs2d/iWlceF7dw4Q9zQVSkH4EeyTsiPJfLlcqU7iMj0FmSS1wVGVyzMnFPpcWy
	 JyamttMKEK5LiTrCCyMW+68+YK6jlTQdtLLpBKu6gF4MWbC23aY/xPKBZ5ydBkZVHX
	 0ckJ9xjRKA4Fh9WTvnNy2TcDgWGgp9ox2jZuU2bwD+8nbIp9C04uaMnwZJKx3foAQR
	 TjfyhLc3Sc+GN7L1DY5EjRcHUZBawW7S2v7q22KMDJnp+sXu0BSSBPqJxlHZzYfdeQ
	 /+5MHeu0yvBYDp7fsEvv+UrfnLkKkPILnQJdMGQoKO88qwjBb646Ep1kQ6K7wkmx+l
	 596V4Ry1LBuZA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: vsujithkumar.reddy@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 akondave@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230530110802.674939-1-venkataprasad.potturu@amd.com>
References: <20230530110802.674939-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: vangogh: Add check for acp config flags in
 vangogh platform
Message-Id: <168546842506.690777.17939601844913832559.b4-ty@kernel.org>
Date: Tue, 30 May 2023 18:40:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: QGRGSB4UGNANKWWAQQE6K2U6FXC7T4CG
X-Message-ID-Hash: QGRGSB4UGNANKWWAQQE6K2U6FXC7T4CG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGRGSB4UGNANKWWAQQE6K2U6FXC7T4CG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 May 2023 16:37:58 +0530, Venkata Prasad Potturu wrote:
> We have SOF and generic ACP support enabled for Vangogh platform
> on some machines. Since we have same PCI id used for probing,
> add check for machine configuration flag to avoid conflict with
> newer pci drivers. Such machine flag has been initialized via
> dmi match on few Vangogh based machines. If no flag is
> specified probe and register older platform device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: vangogh: Add check for acp config flags in vangogh platform
      commit: e89f45edb747ed88e97a5771dd6d3dd1eb517873

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

