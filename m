Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF658FD95F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 23:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323507F1;
	Wed,  5 Jun 2024 23:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323507F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717623953;
	bh=3MQrdpD7iV1KDjW3kAGXieRxnfAenZ67QSUIaKCrQHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dsIW24NhwK87adHqSNtCNp0/ktEQAwWFwTlN+VeZES+ng/omuuBJieaXk9UrNwm2H
	 lynuXS80qJlkuKo1kRL283z71agSDF4aaUX1ISX8Kvzyrqcyt9xshlKy+niJPpkS3R
	 EpzAu8oytzilvEfw1CTC+NO0Ebmdi1BxEVP57EQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54621F80602; Wed,  5 Jun 2024 23:45:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 737AAF805AA;
	Wed,  5 Jun 2024 23:45:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD47CF804B0; Wed,  5 Jun 2024 23:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 829D9F8025A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 23:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829D9F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+7S62m6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A360CE1942;
	Wed,  5 Jun 2024 21:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DC8C32786;
	Wed,  5 Jun 2024 21:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717623503;
	bh=3MQrdpD7iV1KDjW3kAGXieRxnfAenZ67QSUIaKCrQHg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E+7S62m6lA8IdAbQgaEptCdtxVdC1fz9DQH2aTPGIFeEJTbQx/pNcxI5iqcoLw1El
	 YEFDW1VXwUvj+dVKegDaRqjkYtKhtbftfgO3dfS4G9rDsFP7llqWjwGFXqcVIUFiRC
	 gWq44QH6CvrGkCwbsmWPu8ZMHhR2BMNIZtwINpfyuOM9vUZ1i0YQGuet6KSlB7mWdc
	 kciNgB6nSVZUdQtn2MS8cWJT5mw77HRG9j7zvK+rxF9if7WWjORnQb3r9nazZSOG95
	 0Yu7R1Khusw3p/6QP+iXQxNT95xbn5yWGXnwDeO4HFPAepVGoUYTwac0arLL5vkdq5
	 4mWb551VaDEtQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux@treblig.org
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240601225446.183505-1-linux@treblig.org>
References: <20240601225446.183505-1-linux@treblig.org>
Subject: Re: [PATCH 0/3] Dead structs in sound/soc/codecs
Message-Id: <171762350145.565712.5432496930272405498.b4-ty@kernel.org>
Date: Wed, 05 Jun 2024 22:38:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: YBHDSEFIK4KS34ZYQCJJ4ZXSTWMGQ4JJ
X-Message-ID-Hash: YBHDSEFIK4KS34ZYQCJJ4ZXSTWMGQ4JJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBHDSEFIK4KS34ZYQCJJ4ZXSTWMGQ4JJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 01 Jun 2024 23:54:43 +0100, linux@treblig.org wrote:
> Clean out a bunch of old structs in sound/soc/codecs.
> Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> 
> Dr. David Alan Gilbert (3):
>   ASoC: codecs: lpass-rx-macro: remove unused struct
>     'rx_macro_reg_mask_val'
>   ASoC: codecs: wm0010: remove unused struct 'wm0010_spi_msg'
>   ASoC: codecs: cx2072x: remove unused struct 'cx2072x_eq_ctrl'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: lpass-rx-macro: remove unused struct 'rx_macro_reg_mask_val'
      commit: 44e55f9de9950dba091401898a931fc1a3a99146
[2/3] ASoC: codecs: wm0010: remove unused struct 'wm0010_spi_msg'
      commit: 62ccbe8cbe2a1b6911ec47bea8b1510dc1f82dd5
[3/3] ASoC: codecs: cx2072x: remove unused struct 'cx2072x_eq_ctrl'
      commit: 8080dde80a2d3657529c2172471c06cfcd9a228e

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

