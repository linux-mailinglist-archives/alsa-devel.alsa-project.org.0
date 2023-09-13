Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D079F09E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA270886;
	Wed, 13 Sep 2023 19:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA270886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694627284;
	bh=6RQLwm9+y0/pjTEP8oYtSeOWaSaM8z+j+IMHHzvs4IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xy5DU0SjB5jbTSOHSKL8Kcc1RyocXTEHs/PwaRTqf2yMTpdfbJ1Pl0ey8SL5xwk16
	 /J+2KYQXLQ2LjE1q6OqNmmBgzVEhlaNYGUQRYNvVe76Yu/wKU4uUeCXNjkl1bYJtmW
	 lj6uAmagPMGo3YxbuUHhhrX+KnqTbDG7GJAaC1Qs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECD4DF80537; Wed, 13 Sep 2023 19:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA38BF801F5;
	Wed, 13 Sep 2023 19:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3796EF80431; Wed, 13 Sep 2023 19:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A51BF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A51BF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MXKAplrA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0C01CB82410;
	Wed, 13 Sep 2023 17:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E45C433C7;
	Wed, 13 Sep 2023 17:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694627199;
	bh=6RQLwm9+y0/pjTEP8oYtSeOWaSaM8z+j+IMHHzvs4IQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MXKAplrAetGPjfxNmSciWt8ol/UlnaVaGb1xTkcfa9zoMQgsP8xhzUPxy1vJDhPhj
	 1llVebSBlwhirtTcAxlyolhl1zlsMvIP23EG5pSTPe+rwIo5BOuImY1QzjbVkE1F4p
	 WqaScJkoBxa4fLJvvWFnnLl8NLtGBiLbKTHhCwpfFeYDEU49qENOUyHnGtlyKIcw7g
	 4vGmHZlSfN7V/YDFOFawm5fXzHSTK+sO9nzWm0CSYbcmGKy77MT/IoYt2lRzp/zfDz
	 9OunRFzWvMlUOTsfhx8bq33/QYxS3+u7xiPE1Mwyxb7BEZ8BKPf9hNuueWopBvQcwS
	 SaiDOyEvz4a8Q==
From: Mark Brown <broonie@kernel.org>
To: Weidong Wang <wangweidong.a@awinic.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nick Li <liweilei@awinic.com>,
 Colin Ian King <colin.i.king@gmail.com>, Ben Yi <yijiangtao@awinic.com>,
 Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
References: <81476e78-05c2-4656-b754-f314c7ccdb81@moroto.mountain>
Subject: Re: [PATCH] ASoC: codecs: aw88395: Fix some error codes
Message-Id: <169462719734.54382.4099179509276849892.b4-ty@kernel.org>
Date: Wed, 13 Sep 2023 18:46:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: TWVZ35Z6X6JFV36US2T4AKSGABGZYVMF
X-Message-ID-Hash: TWVZ35Z6X6JFV36US2T4AKSGABGZYVMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWVZ35Z6X6JFV36US2T4AKSGABGZYVMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 11:18:22 +0300, Dan Carpenter wrote:
> These error paths should return -EINVAL instead of success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88395: Fix some error codes
      commit: cf0ba445f5e4dd74c1e9d7a83ca721ba69204a11

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

