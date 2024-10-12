Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238499B4FC
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2024 14:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AA23851;
	Sat, 12 Oct 2024 14:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AA23851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728737475;
	bh=v8NCU068r9dRn1DQIRAWChXlgs5/3w1Xkzg3alhshIk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JgwnG4ac4UQGjCoxuaCC+ZxTsxb+2/jFTPKhl+IgFkAc9C7OMdvgB1WCpY5dFsM5Q
	 UIbqf5FLOXv2oqjPd9tAOlvwWLDJmAnadIFf/VcJtDI39+ylk40tqjthdLvHUe2BZS
	 42aqWo2QB872WxsTYg8Di5E4ViS0PiEtkOGc5B7E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3660FF80580; Sat, 12 Oct 2024 14:50:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7541CF80579;
	Sat, 12 Oct 2024 14:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B10F7F80528; Sat, 12 Oct 2024 14:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A97A3F80496
	for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2024 14:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A97A3F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EIptPkVk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DB93A4017D;
	Sat, 12 Oct 2024 12:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E4AC4CEC6;
	Sat, 12 Oct 2024 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728737444;
	bh=v8NCU068r9dRn1DQIRAWChXlgs5/3w1Xkzg3alhshIk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=EIptPkVkRSmm/GUI3d9hQ5wMrt2rbjdH63dw8268TGBhzLxitDTkOFy5aHDLDY5pk
	 Dn1ZOlGIRRf+S55RhnHmr9W+YDDuUmaiWnSOAnHp6NyYVAiCfk8jJ4UJTupIx08RKM
	 vbwiZolNs2DVrbm8UmElREWMuIH4quCjSEGpuGg62URhot6Sxp4iKMcMkvj6xHOUCR
	 5Nw3IrtffKh3gAm0/BtXW3Lz2rt01ZGBtJnjgGOKFWyrnXi9CCmdCgms9wFeUM4yac
	 RdBrjqb4sUcXSr4en4tI+OdMK+nLb3iB5YxnyGD9e8HWn3oOFMIIBQQBdUSQmh7nLO
	 TL5AxSfxFoW3Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 chancel.liu@nxp.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: add cs42888 codec support
Message-Id: <172873744192.3950734.11628347626617222095.b4-ty@kernel.org>
Date: Sat, 12 Oct 2024 13:50:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: J2LUULAOZM7WUJSCWUGSM4NIYVT54MTX
X-Message-ID-Hash: J2LUULAOZM7WUJSCWUGSM4NIYVT54MTX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2LUULAOZM7WUJSCWUGSM4NIYVT54MTX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Oct 2024 15:46:42 +0800, Shengjiu Wang wrote:
> add cs42888 codec support
> 
> Chancel Liu (2):
>   ASoC: imx-card: Set mclk for codec
>   ASoC: imx-card: Add CS42888 support
> 
> sound/soc/fsl/imx-card.c | 59 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 52 insertions(+), 7 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: imx-card: Set mclk for codec
      commit: 892373e4de626c61e91816e3d3970d82beb50c4b
[2/2] ASoC: imx-card: Add CS42888 support
      commit: b39eec95b84d5dc326c3d7c89e4e08b898dbc73c

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

