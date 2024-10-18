Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273429A478C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2024 22:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05604B65;
	Fri, 18 Oct 2024 22:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05604B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729281726;
	bh=QWhvm43q9x9Ypgb8zjF1c/AGKh9cPO/2PMOjR56h6Ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DdIhYnCzKNzg8TuFxYwc0Dw+P6UkercibKjf+xbo/OaMbCzZ+0H90qNXmppqTDfMk
	 qCIbq98kQ/4kHD3Nq/0a8OCVu2pugI1YQgcsx8HZA16zfYYR67gIGteobEnL6fNb34
	 x1mJwaNvd//MovO+cMmoVsvdljI6v/fr3sheGli4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C208F805BA; Fri, 18 Oct 2024 22:01:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8533FF805A1;
	Fri, 18 Oct 2024 22:01:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB292F80448; Fri, 18 Oct 2024 22:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFF17F80104
	for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2024 22:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF17F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mVYrMDQz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0BC8A4138F;
	Fri, 18 Oct 2024 20:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6810BC4CEC3;
	Fri, 18 Oct 2024 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729281684;
	bh=QWhvm43q9x9Ypgb8zjF1c/AGKh9cPO/2PMOjR56h6Ls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mVYrMDQz7GFGpXSoqROtkQhYHA7pJL2KL4K1oy6GTCQxr3oi8u8Qgw/oB8TwNs7fv
	 6QND6ZmhJalDRlJqh5Qr7GGXeCN0C4cVsiXzA8KmV9wnUepGTxZq8oxOvWshUQjYbK
	 2Qa6F3IYM10sCy2b9NDpRetUYpOYrOBT+uPsqI3OixJBtRswa3rmS6hcegj+nfgn7S
	 HS8L+4YxTirlbp+ybB4gN400lK9gLsfOXhTa2utJM01GmmWr2KplMS9blg3MU+Nh5Q
	 o/g4Rz0fBTlbEIPX4oceBsmFdpfupeAjJWWobTD3DOZwdlYyFl0yVWtrInwzBPTAzp
	 RUEdPWJh1bZjw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@gmail.com, Liu Jing <liujing@cmss.chinamobile.com>
Cc: jarkko.nikula@bitmer.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
References: <20241015074938.6247-1-liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] Use card->dev in replace of the &pdev->dev argument in
 the dev_err function
Message-Id: <172928168210.188041.8550134088626737627.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 21:01:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: V6FOCZ3A7KQLRUFJEBNYTI67ZJAP6SCC
X-Message-ID-Hash: V6FOCZ3A7KQLRUFJEBNYTI67ZJAP6SCC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6FOCZ3A7KQLRUFJEBNYTI67ZJAP6SCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Oct 2024 15:49:38 +0800, Liu Jing wrote:
> Because card->dev = &pdev->dev is already defined in the rx51_soc_probe function,
> and then &pdev->dev is still used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Use card->dev in replace of the &pdev->dev argument in the dev_err function
      commit: 4d003b81f46737620c7f9194d305617dfdfce8fb

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

