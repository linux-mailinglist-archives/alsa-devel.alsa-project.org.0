Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F0838E97
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 13:32:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EABD74C;
	Tue, 23 Jan 2024 13:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EABD74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706013165;
	bh=OwMt/QxJ0zuys89yLUHp3fh3qkYycWCrjOmnED7SkE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KUFkD3IOx+KSUNELrTjL4jNtRlTf4KNEocwoiHN8yx2SQZ2oVl9yDAtYqN3thpdK6
	 vgqqvYvwgoYsX8PVy4g/aCC5eqlXGM2Z/UEZkZx/bjbVxpC01TdBofEas7GyjOwRgT
	 vSjPUkJzfH8zlV6ZoCspnPAjw3GhVtpl0v9L4GxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B455F80588; Tue, 23 Jan 2024 13:32:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE851F80568;
	Tue, 23 Jan 2024 13:32:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F1D8F8025F; Tue, 23 Jan 2024 13:32:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 267CDF800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 13:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 267CDF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=toHXbA02
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F27961C63;
	Tue, 23 Jan 2024 12:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D883C433F1;
	Tue, 23 Jan 2024 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706013117;
	bh=OwMt/QxJ0zuys89yLUHp3fh3qkYycWCrjOmnED7SkE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=toHXbA02hB91TiQVcfwxFq2jfXlX3iWcaPi9kyLbZGC+ZvaGAcu9fB099uaK7HCEB
	 uHhC/qgmMYz0lVN/0xrFyfir6p2xL2/51CS8rnOPoJRrwv57T0IaE7IHx4Vnfba0Fo
	 emIMK/4eRE1Nb/kfXeMDzetlDM0L7S5T/fOuwhVtKkS8hQ8HSs2MizNQXB0TGGsCPK
	 81V/raAGTMRHMAi8veStzRt+NmpfYoZ48quHYjJlxMDjelzzKeXA4+m0q+RqTVbEB+
	 su+0BpfOVZj4144Y+AIy7jrDLli8LzCED6PB13r1JrbOOk1dv4Gv+06UAH++3hZPAS
	 tU9O/E3I3bGrw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhu Ning <zhuning0077@gmail.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com,
 zhangyi@everest-semi.com
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Subject: Re: (subset) [PATCH v1 0/5] ASoC: codecs: fix ES8326 performance
 and pop noise
Message-Id: <170601311603.19497.11836184914578593014.b4-ty@kernel.org>
Date: Tue, 23 Jan 2024 12:31:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: BTNLOQIFSNMEHFYM6N3S7KOQL7OMC2SB
X-Message-ID-Hash: BTNLOQIFSNMEHFYM6N3S7KOQL7OMC2SB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTNLOQIFSNMEHFYM6N3S7KOQL7OMC2SB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 Jan 2024 18:12:35 +0800, Zhu Ning wrote:
>     5 patches here for the es8326 driver...
> 
>     We get some issues regarding crosstalk, THD+N performance and pop
>     noise from customer's project.
>     Five patches are used to fix these issues. We did tests with the new
>     driver. The test results form test department met our expectations.
>     We fixed the AUTO BUILD TEST ERROR and modified the kcontrol for HP_VOL
>     in the new version of the same patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: ES8326: improving crosstalk performance
      commit: 523d242d4309797e6b27c708fbd1463f301c199a
[2/5] ASoC: codecs: ES8326: Improving the THD+N performance
      commit: 14a0a1ec3335ac3945a96437c35465e4a9616b88
[4/5] ASoC: codecs: ES8326: Minimize the pop noise on headphone
      commit: a3aa9255d6ccb1bff13c7c98e5d3bf10ba67f92e
[5/5] ASoC: codecs: ES8326: fix the capture noise issue
      commit: 8c99a0a607b5e0cf6b79b283d7bb2c2b84e01da5

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

