Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1587671E9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 18:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D40207;
	Fri, 28 Jul 2023 18:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D40207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690562184;
	bh=xrqCJGqg9GSk7yIgP9HX1dUpZQzOD1ks7daCXe0tR8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D1MFbwnXOf49tU1qmrn/xQDMkkGwY/qASvTrbNN/eiNGVXNueqIGoDPtFNNa0yj29
	 Kk18fK9df2kh9wAO2RIRM0rxFqFIz315+XgCqe+L17HKUCXfd3fD8oTARxJXLfzewz
	 xAIQP5NIdOThq4DBEuUaLBU4Eb8Hjaor9xWj0PuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E459CF801F5; Fri, 28 Jul 2023 18:35:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED507F80163;
	Fri, 28 Jul 2023 18:35:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDB04F801F5; Fri, 28 Jul 2023 18:35:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CACFFF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 18:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CACFFF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lInnsgVg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84978617A1;
	Fri, 28 Jul 2023 16:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82637C433C7;
	Fri, 28 Jul 2023 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690562115;
	bh=xrqCJGqg9GSk7yIgP9HX1dUpZQzOD1ks7daCXe0tR8Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lInnsgVg0s6gCJmt2W7LegK//i6KTblUiWJ9oAi4PZeguVbV82PEAidBzMjYUA6N4
	 2VlK1heX36m7f37VLx9OYCNLC6KESeWvI7wvjblJ9AB16pHN3ywYiWNNzR7esDRwT0
	 aJAY3QMeR6SwQtb3JweSqf3oSicT5k8kRjdSI9iaPjHFIOvHDV61bPYaMsRYX+O9+H
	 J7sZ5qJ5oVxkXcGyOqvb2Oht980wec+uh6qmFpX4zMI8CwEBp/QkMNqAzYwiQJf7Ve
	 BvBn1OWiXgGpVsoc4JMd+Agf33X/fZO3yujSMJlpvbTfg8hMPglipA3o8rHpWFkWEl
	 RiNH4hcuYHjTw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Justin Stitt <justinstitt@google.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
In-Reply-To: <20230727-sound-soc-codecs-v1-1-562fa2836bf4@google.com>
References: <20230727-sound-soc-codecs-v1-1-562fa2836bf4@google.com>
Subject: Re: [PATCH] ASoC: 88pm860x: refactor deprecated strncpy
Message-Id: <169056211423.208880.7188858639779288535.b4-ty@kernel.org>
Date: Fri, 28 Jul 2023 17:35:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: TZMGZCPICE6QS3ZVGFH7EUDBPJ26U7PA
X-Message-ID-Hash: TZMGZCPICE6QS3ZVGFH7EUDBPJ26U7PA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZMGZCPICE6QS3ZVGFH7EUDBPJ26U7PA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jul 2023 22:46:13 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on its destination buffer argument which is
> _not_ always the case for `strncpy`!
> 
> In this case, though, there was care taken to ensure that the
> destination buffer would be NUL-terminated. The destination buffer is
> zero-initialized and each `pm860x->name[i]` has a size of
> `MAX_NAME_LENGTH + 1`. This means that there is unlikely to be a bug
> here.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: 88pm860x: refactor deprecated strncpy
      commit: a9a65b87a5553a4ecabad7093ef6a1088bb71b88

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

