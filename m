Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA489BD291
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2024 17:38:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DE24E9A;
	Tue,  5 Nov 2024 17:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DE24E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730824732;
	bh=hDrFZw9uwycMnOrf3d8iOWixrHH10HaQCIpFHOiwZUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=om/bO1rYtdLZyBtxqcm4HoyCTZZJliNcDCFBSjI6Hsd6QiL3b/nXU5pgkq3WPDqrx
	 flEYRibIIE5W6XogQEH+B3c+tRLETQmkzRdyEaDSO1OAtmAl/hh/XvfjT9mC0J4jVx
	 7zgl2/a9lxB8iSvgqUY5nq7wdjZ4+svI62RP+ZCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CA76F805B2; Tue,  5 Nov 2024 17:38:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9163F805B1;
	Tue,  5 Nov 2024 17:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9027AF8013D; Tue,  5 Nov 2024 17:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA0D5F800C8
	for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2024 17:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA0D5F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a6XnL2fi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4BCC5C55BF;
	Tue,  5 Nov 2024 16:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A97C4CED5;
	Tue,  5 Nov 2024 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824688;
	bh=hDrFZw9uwycMnOrf3d8iOWixrHH10HaQCIpFHOiwZUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a6XnL2fi7qlMSRZP6MCwcspTFAxrVPWHC/Jk7MDbDsbE6RUw+Rz0mbfpc6O1MrD3/
	 zHVoywqcNlRQVOpViL1lNbEGDQekdyRTBOJe8vsE6MF++tC2S3VWE8qUAdBmX2XAcp
	 zjmNixCP4xK0LSuvuGmGohNAgUZEbMGJ7OVR+if3RhoWUrp5Bv8ql/XxftNGmBN/fL
	 PkPLI0FyhJviUsePmMY+OC/aPGwGV2J3G6we0Zo33j2gp/bFIzNzmMGsZvl8CvzTt9
	 2Uk5ZRMdYY8qNnmVX+rpO5whGZGNDXSeSqFAoGGsSpoYsmRhdLUVgrzOd2iru0nut+
	 2AVJq7Ez6E+2A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com, zhuning@everest-semi.com
In-Reply-To: <20241031060253.21001-1-zhangyi@everest-semi.com>
References: <20241031060253.21001-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
Message-Id: <173082468692.77847.13077376688222087136.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: ABAVNXAFUQIU3ZMVTLMNKIC5VBG3F7NU
X-Message-ID-Hash: ABAVNXAFUQIU3ZMVTLMNKIC5VBG3F7NU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABAVNXAFUQIU3ZMVTLMNKIC5VBG3F7NU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 31 Oct 2024 14:02:53 +0800, Zhang Yi wrote:
> We modify the value of ES8326_ANA_MICBIAS to reduce the pop noise
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Reduce pop noise
      commit: 8f5fab5329b7e966344d59fd1c17adbf9f025c52

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

