Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8807F48F5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 15:30:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3409EAEA;
	Wed, 22 Nov 2023 15:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3409EAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700663424;
	bh=0/z0t2JF8PlcN2JPqmU491oJkQrRrv5Qp/yEPfyB980=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cwZjHdnr/De7r5UWslNHx1mwrbM5mCLr28WZ6onEdvKE+iHjLODIzTI0D7MuQTkSl
	 BFeyX+Lif7KlLmM0dUD7H0KHaFx4+RZREWZrNFF14R/lMTUgR4qG52J65CXsTyaZws
	 xzbKHTpOJE06eNxJd86QZf+6Kboe9+GUI5rnyGIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15875F80254; Wed, 22 Nov 2023 15:29:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C3C7F80570;
	Wed, 22 Nov 2023 15:29:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 139A3F802E8; Wed, 22 Nov 2023 15:29:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46057F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 15:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46057F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KKGgRVou
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF14FCE208C;
	Wed, 22 Nov 2023 14:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8380C433C7;
	Wed, 22 Nov 2023 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700663365;
	bh=0/z0t2JF8PlcN2JPqmU491oJkQrRrv5Qp/yEPfyB980=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KKGgRVouTQCir2q60Kx3SSl85QVVMiPQzMZITMRG/7p3zyzRF6deLTUs2NnlGOfst
	 wtypqY9zi6L5Ck2/AictC9PhHrnqlNqVcmjrhGbe2LBjtTlchCJ/soRHQafuIMnkDD
	 GbKhXwRF8avjnWbk4WXX7Yqre9dlszq79bqr0WAYsROi8Gq60gIm/GSSg0LcJVefBM
	 yIOWY2KFWYRCwHwxf22uprpYorRmNB6nBs9tF5LnBp0khl/5P67qAZGWpUQ5HQbVvw
	 KAkdwgCNBwLBUAN3PWVPVyoP4A6a7CA7UgGQrm1sBKqOHSwJ8K6PhUhra7Yu9P3Rvt
	 LOmDCHyX7f/DA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20231122101959.30264-1-chancel.liu@nxp.com>
References: <20231122101959.30264-1-chancel.liu@nxp.com>
Subject: Re: (subset) [PATCH v3 0/3] Add audio device nodes for i.MX93
 platform
Message-Id: <170066336159.2181401.18066539425902688042.b4-ty@kernel.org>
Date: Wed, 22 Nov 2023 14:29:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: VCBXNDNLPUXDPQI4FWNRV6X47EIKRK4Y
X-Message-ID-Hash: VCBXNDNLPUXDPQI4FWNRV6X47EIKRK4Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCBXNDNLPUXDPQI4FWNRV6X47EIKRK4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Nov 2023 18:19:56 +0800, Chancel Liu wrote:
> changes in v3
> - drop unused compatible string in fsl,mqs.yaml
> 
> changes in v2
> - Move MQS device node under "/" root node
> - Convert fsl,mqs.txt to yaml
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/3] ASoC: dt-bindings: fsl,mqs: Convert format to json-schema
      commit: 9996cd782a602f2542e110e2a4035dd6627bd520

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

