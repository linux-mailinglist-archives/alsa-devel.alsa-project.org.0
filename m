Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1C757B8B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2E0DF1;
	Tue, 18 Jul 2023 14:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2E0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682301;
	bh=Bwi6+hxv+njlD1feI8RZMPqKlUapw7YCTAxkf6ATuhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONpjqQjSMdnYE5o72PXb85xj8DOPba//JU0RWgA7/LqK9Uld09DJo2k8thKvJypwX
	 3hO5Xs34SqLliHwKpYuVqdrrgpuh96/xdofoi0ATSEpsE4uIFiQ+6BMlccMrYMy6yb
	 vwyDvL1A7zd3PqtTX9tzlS0R9HT1KgwqDbxsIj+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E86DF8055A; Tue, 18 Jul 2023 14:10:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E59F80544;
	Tue, 18 Jul 2023 14:10:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 045A5F8032D; Tue, 18 Jul 2023 14:10:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 17093F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 14:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17093F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SQVguFhE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACF1C6154E;
	Tue, 18 Jul 2023 12:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6476AC433CA;
	Tue, 18 Jul 2023 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689682203;
	bh=Bwi6+hxv+njlD1feI8RZMPqKlUapw7YCTAxkf6ATuhw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SQVguFhEExz6ZaiyvqImE9Y5tzDDd9cS8Oqp3xWI+3BHvcZ1S/fWg0cp/zisODT8s
	 SUUXsPv2BtkZDB+sYjPd9PjuhZYBvsQwOxpbG15GgIklVR14n587oAkPMAuHW8VZQ+
	 PmlXbPoRw8M6On/lXN+aHXBsgJisTiaRkKrosKzxrQJPa1N+LqwvJVza33HOLxq8kU
	 IRhVJMecozYtWQG7uCc1Gehj+OPcIWCnMcWUuTcXBBH+ZgQoPWOaSVkXPat17eME5N
	 Exy1txTw1eU/j6dd+iiDtXvBYZHJUcGssUiePQlKIiq/y4Zj+kVgVrgxH8EJCMUCNX
	 XWyLvgN5p9Hcg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vladimir Oltean <olteanv@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Wolfram Sang <wsa@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, shengjiu.wang@nxp.com
In-Reply-To: <20230713222513.1636591-1-Frank.Li@nxp.com>
References: <20230713222513.1636591-1-Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] ASoC: codec: wm8960: add additional probe check
 for codec identification
Message-Id: <168968220008.40723.6109543633673896312.b4-ty@kernel.org>
Date: Tue, 18 Jul 2023 13:10:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: XWAQL7O2UTD7GIH3EJGVNAGCUMWLPQ7K
X-Message-ID-Hash: XWAQL7O2UTD7GIH3EJGVNAGCUMWLPQ7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWAQL7O2UTD7GIH3EJGVNAGCUMWLPQ7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 18:25:12 -0400, Frank Li wrote:
> The wm8960 codec is not readable, resulting in a NACK for address 0x3d (8-bit).
> This can partially indicate it. For example: wm8962 codec use the same address
> but is readable. This additional probe check will help prevent loading the wm8960
> module incorrectly on wm8962 hardware.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wm8960: add additional probe check for codec identification
      commit: 8b30cdbe0b911562fc1496078162dc9547b69be5

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

