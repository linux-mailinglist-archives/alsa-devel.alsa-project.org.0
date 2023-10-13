Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD717C840A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 13:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59345828;
	Fri, 13 Oct 2023 13:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59345828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697195217;
	bh=eGAtyRlXAVUecXGIt7H+uURp8VICOPfevYB16UyiTU4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jI8LXOCCnm87/xsCXG9jPrrsnRPuj/ulBly5TNct+o8BzDKfQRD5dnABIkCSXR7mF
	 ymZlGF+aQjmRqq/Mx321dOLHImaGPjmkbpwGLwpRsx2E5roCwbERTqxfep8hR2ayQ+
	 0gqNkUwBJWvY0F94NUHlIQSyOv/kTD4IHwO9gmko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BC65F8019B; Fri, 13 Oct 2023 13:06:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BFAFF8027B;
	Fri, 13 Oct 2023 13:06:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98AB4F802BE; Fri, 13 Oct 2023 13:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0E22F80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 13:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E22F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E3FJT+2f
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 240C362063;
	Fri, 13 Oct 2023 11:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695B2C433CA;
	Fri, 13 Oct 2023 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697195155;
	bh=eGAtyRlXAVUecXGIt7H+uURp8VICOPfevYB16UyiTU4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=E3FJT+2fWzVmFvXGIYA1CAeHXoNK/dm23LL5qx+CLmdwxXeC9II7rFzvbW616s3r3
	 WEZJ1wIeYJjRi0RcLs2MbJ83d7o5UFTKpf9BgshB7of0/u/FikKtnJ37t9TCOaveOv
	 HrAKF5Kbu5bZmLx+SS5FP9WJTEHRC0x39BPZ+SB730jARrGDULmKciakpHkKtEXHFk
	 qrMinGooTH1CLnHX5lIqoDTFD5LBPzmq3fxtiH3cAbSp6htx/R6RoYtWFuZ/0U+hiY
	 RU0T+9qiUBvvvjtvgWzGV+KHCyj0fTzaLLzdCRtOS+pff8tAsKbLcoE93+IegOTcT4
	 gUcZZrFhYodZA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20231007040117.22446-1-hui.wang@canonical.com>
References: <20231007040117.22446-1-hui.wang@canonical.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Add comment for mclk in the
 codec_priv
Message-Id: <169719515512.8348.18011143212699216789.b4-ty@kernel.org>
Date: Fri, 13 Oct 2023 12:05:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: FI5OK4T3FBCF7JHHFVKDGZFI3O3JKZ2O
X-Message-ID-Hash: FI5OK4T3FBCF7JHHFVKDGZFI3O3JKZ2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FI5OK4T3FBCF7JHHFVKDGZFI3O3JKZ2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 07 Oct 2023 12:01:17 +0800, Hui Wang wrote:
> Otherwise a warning will be detected as below:
> warning: Function parameter or member 'mclk' not described in
> 'codec_priv'
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Add comment for mclk in the codec_priv
      commit: fbfe616ad40c06d68b83b657a94cd2e709dda37b

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

