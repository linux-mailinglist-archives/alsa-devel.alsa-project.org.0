Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37BCC819E4
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Nov 2025 17:39:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C066860210;
	Mon, 24 Nov 2025 17:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C066860210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764002360;
	bh=sx6ZS+uXGa0YXKexZPrQNvi2wnVAH2o/Ce/wCiyZeI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uOUqAaN8rZWuo2nM2Vt+qe9VR2Pc5q5leanU6KJ77VV03rL52rOVi4pV7kIFi3PY0
	 FN31sBC7roS/btGofUSBq3SNNuMkdGhTH7VXsAIIsAsO88FjT1rVhXkayesZoIhDQv
	 07tShu+RkYrJQVRYAu9N5QcrTqn9uoSdZLkBYLqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CEE4F805F1; Mon, 24 Nov 2025 17:38:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DA4F805F2;
	Mon, 24 Nov 2025 17:38:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32336F8026A; Mon, 24 Nov 2025 17:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D228F8016E
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 17:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D228F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BxPJaltz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B18540955;
	Mon, 24 Nov 2025 16:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CC6C116D0;
	Mon, 24 Nov 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764002295;
	bh=sx6ZS+uXGa0YXKexZPrQNvi2wnVAH2o/Ce/wCiyZeI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BxPJaltzKsrxvnjL+m6DnEgb/Ib4Su2+Xv4CVLxyP2enIGyZYDHA4NHghT0WLgNX5
	 eRrWo5M+O1RO3+b3ayJ9Z6J+B+e+FnLYFgXfqYmPQack0FN0cmUWp2MFh2hxlHhr+1
	 mcFXGXpYitmLehU82ljjjqM6BWQC4Z9IP+ozm+6KmatZsXYtgQCqyJL8HiL5OSLpUF
	 xi/IfKlEN0eSwe7fmxE3UQ5MwfMe6ecvhoaZCWRsWeRnxuitq9V3O0mCxSVZRAz81P
	 Ne0aXv9rVUhvT7UQ+CWtT/DWYh2MgWPyXD3Q7xA9iHfqlPIkF0OwoUFCGDdfFFiyz2
	 BzMPzoAbMtTWw==
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com,
 henry.lo@ti.com, robinchen@ti.com, will-wang@ti.com
In-Reply-To: <20251124031542.2793-1-baojun.xu@ti.com>
References: <20251124031542.2793-1-baojun.xu@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Correct the wrong chip ID for reset
 variable check
Message-Id: <176400229349.72424.1392117575410206186.b4-ty@kernel.org>
Date: Mon, 24 Nov 2025 16:38:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
Message-ID-Hash: G5UCMCBZHEWRDF23BNJNP52DLLAGQ7N6
X-Message-ID-Hash: G5UCMCBZHEWRDF23BNJNP52DLLAGQ7N6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5UCMCBZHEWRDF23BNJNP52DLLAGQ7N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Nov 2025 11:15:42 +0800, Baojun Xu wrote:
> The new variable of reset was added for TAS58XX on TAS5825 first.
> And TAS5802/5815... was added later, so this reset variable check
> should be changed to lowest chip of TAS58XX.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Correct the wrong chip ID for reset variable check
      commit: 34b78ddd78428e66a7f08f71763258723eae2306

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

