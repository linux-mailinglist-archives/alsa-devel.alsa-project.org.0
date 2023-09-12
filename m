Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9179B8AC
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D280150D;
	Tue, 12 Sep 2023 02:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D280150D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477328;
	bh=b7QKl0a0AEHRzG/6bKiidEwJZlxjVK/5NxsY7VlNA8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cPUvog6/77/cz6OzINlr9pjWnBilTK96rbW8VbrZGbjkHbbBlNxUZ6KDUkrdM73jy
	 YlZAGIfMDr//MACggrhuJi5GJEtyk4WAfjKaXZ1VOhq2xQ34GvSBIR+vApk5H99onX
	 DqTqW2FvcyXMR4LpqYm5JoRiuIyoIABbjEvGkllw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AAD0F805BF; Tue, 12 Sep 2023 02:02:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51426F80568;
	Tue, 12 Sep 2023 02:02:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 260CBF8057D; Tue, 12 Sep 2023 02:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7421F8057E
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 02:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7421F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H2B1meau
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20C7E614A4;
	Tue, 12 Sep 2023 00:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27E0C32787;
	Tue, 12 Sep 2023 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476916;
	bh=b7QKl0a0AEHRzG/6bKiidEwJZlxjVK/5NxsY7VlNA8Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=H2B1meaujGjdupBvdKujlqBDeO+9jyKuGE747IQuFVPFFSmruNXZYdxPcCcDW2aCE
	 SX3TIKkNBV1YjsBqRpxtvCmmFuHcPksCKc1PHACOUz7yB9mx84z6xOuZ6xvrC99V0R
	 SJ2se1JUKRlOA+p6cawZzrRkSAkNGq43GTJhR2Qs59VLEAsCis1d1i2zG1UTRwj4qE
	 j2NOVEqjqXstwTczrGuj+GF0S4g6WYZi0x2mlYqfVL54mx31Zl0xI7t62E2bvoGUqI
	 ip4Qt4O5if/a02Zyd/RegMMGZ67J/MV3AzbMxlm7znXn3it3v/kes7+7XNcR2b2LEd
	 ttonejNGSDKtw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1694414287-13291-1-git-send-email-shengjiu.wang@nxp.com>
References: <1694414287-13291-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH
 flag
Message-Id: <169447691360.2390116.6423554135052140931.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 01:01:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: MM6E643GRXWOC24GZXGIBBBPNPPSKVM5
X-Message-ID-Hash: MM6E643GRXWOC24GZXGIBBBPNPPSKVM5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MM6E643GRXWOC24GZXGIBBBPNPPSKVM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Sep 2023 14:38:07 +0800, Shengjiu Wang wrote:
> The rpmsg pcm device is a device which should support
> double buffering.
> 
> Found this issue with pipewire. When there is no
> SNDRV_PCM_INFO_BATCH flag in driver, the pipewire will
> set headroom to be zero, and because rpmsg pcm device
> don't support residue report, when the latency setting
> is small, the "delay" always larger than "target" in
> alsa-pcm.c, that reading next period data is not
> scheduled on time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
      commit: 2f9426905a63be7ccf8cd10109caf1848aa0993a

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

