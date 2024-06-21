Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B385991171F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 02:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56F0DEE;
	Fri, 21 Jun 2024 02:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56F0DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718928429;
	bh=VNSCHiO08SIk0htqWDW6NDFuvYyhidq/ovhyfUV5Kwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ovaUZAcmCmbNX+viG1Gv/98I9UrMy2ixAaCdqcAYd6v9fQ411ItT5AzR96f5xVsHE
	 SrZOXfnb70o+7RefTatiqyz4REI4Urf62YX/qt1yHlyPkBp5M1j3d8Gvp/YR18fUs+
	 lPNAqxnAvJw0diwpBhxyM0crULoGRaaU3VzvZFcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17E2EF805B6; Fri, 21 Jun 2024 02:06:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E108F805B0;
	Fri, 21 Jun 2024 02:06:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEE97F8023A; Fri, 21 Jun 2024 02:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1D9BF801EB
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 02:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1D9BF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HneLpggF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFF75CE288F;
	Fri, 21 Jun 2024 00:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A7C2BD10;
	Fri, 21 Jun 2024 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718928375;
	bh=VNSCHiO08SIk0htqWDW6NDFuvYyhidq/ovhyfUV5Kwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HneLpggF5aKAge/YLzIW5cLkwl1JRmjRPAHCL9AVCFqQnPr25XKP9Z/YFuOrHFRQM
	 Z8WthZPFSd05AbkIJE7UTae1fx3IHUq3s75yr3U83zQfEU7QtJmzJG4jZ8kmRpLC7g
	 GnaeNLH2rHkUxgRcg5o5IBMpWKQ/TttntERYGpR3LDYgcAM/3dsaPM6l7wBTgQGhA/
	 neiEPwmWUsUSVCSmbh9khUQsFK/ciT5j9FvzPL9Bf9Mf7fJu9oYg+fsrARZuPkG5Mc
	 9+IhU4KVKb2ttRGmnF0TsxJugRTTvceAmV7z+zF4iyxnLV1CDS4yio89WNd6nDyYyV
	 k6sIw0QXHXRaA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org,
 Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
Subject: Re: (subset) [PATCHv5 0/9] ASoC: fsl-asoc-card: add S/PDIF
 controller
Message-Id: <171892836830.273016.4379202325839599426.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 01:06:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: MEPJPHQUUDHB6CSP2OC6A4OUPNPSP4EL
X-Message-ID-Hash: MEPJPHQUUDHB6CSP2OC6A4OUPNPSP4EL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEPJPHQUUDHB6CSP2OC6A4OUPNPSP4EL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 15:25:02 +0200, Elinor Montmasson wrote:
> This is the v5 of the series of patches aiming to make the machine
> driver `fsl-asoc-card` compatible with S/PDIF controllers on imx boards.
> The main goal is to allow the use of S/PDIF controllers with ASRC
> modules.
> 
> The `imx-spdif` machine driver already has specific support for S/PDIF
> controllers but doesn't support using an ASRC with it. However, the
> `fsl-asoc-card` machine driver has the necessary code to create a sound
> card which can use an ASRC module.
> It is then possible to extend the support for S/PDIF audio cards by
> merging the `imx-spdif` driver into `fsl-asoc-card`.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: fsl-asoc-card: set priv->pdev before using it
      commit: 90f3feb24172185f1832636264943e8b5e289245

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

