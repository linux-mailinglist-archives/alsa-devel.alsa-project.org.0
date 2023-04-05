Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926276D7CF1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 14:49:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D32C200;
	Wed,  5 Apr 2023 14:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D32C200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680698946;
	bh=y8D4JsSVPlGId9eNBSR3wx7RWUtrjJxcw38jfOGksRI=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ob33QycGvksigjqzZ/jrC6OAzOOJ9R0u/XA644i2qRZ0kFU4UO+Qnm0fyYxNEXLbw
	 h1SD1TIeUPZPGSBUhDMbs08+/ps4f2F2GNtfBS0CImNs6TpJoDPHVpACYsKr5IHkFs
	 P3HbJckjaBZY60n5m+DK/eGNtrqj4mzXpTMjLLik=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CF4F80249;
	Wed,  5 Apr 2023 14:48:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF99CF8024C; Wed,  5 Apr 2023 14:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C64B9F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 14:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C64B9F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QR1rOQlb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADD3463CBB;
	Wed,  5 Apr 2023 12:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EA6C433D2;
	Wed,  5 Apr 2023 12:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680698883;
	bh=y8D4JsSVPlGId9eNBSR3wx7RWUtrjJxcw38jfOGksRI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QR1rOQlbWS2YXFXg8W7CviYUw2rM73reuzZSdVNEFRJ1FFRKSCnWA/Kt5buVjPUtX
	 gUxn+fFlbbgSnHXdRbgFs96ZQy9mgYg5ncBESfPNlxMTKk6UYH/uww1bLvtR+9Y0N4
	 Ph35dF5yEKvjYjfD/Yb1OexqIhR09USJFc6pDxVgm7lAn2BN35VZ3yRLEEGcGGoEHw
	 wKeq1ZTL4f3UFF9jaHmby7vWrxx5/FScCvsHy7XqmnSEzufrgQdFTUi2l482xveQe2
	 suGVxB5B2wvuEXW/jyJalotxfPBELkbK4Iez9kXWZzax1ggRbWvyi8tn8ePyrnof0R
	 v37uBR5Usmjvw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski@linaro.org, daniel.baluta@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 shengjiu.wang@nxp.com, Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230328091831.55690-1-danascape@gmail.com>
References: <20230328091831.55690-1-danascape@gmail.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: ak4458: Convert to dtschema
Message-Id: <168069888086.54726.4811007524578047000.b4-ty@kernel.org>
Date: Wed, 05 Apr 2023 13:48:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: PXM4VXPKWKCZ2LDHZ5LEGRP3ETRLWU7D
X-Message-ID-Hash: PXM4VXPKWKCZ2LDHZ5LEGRP3ETRLWU7D
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXM4VXPKWKCZ2LDHZ5LEGRP3ETRLWU7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 14:48:31 +0530, Saalim Quadri wrote:
> Convert the AK4458 audio DAC bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak4458: Convert to dtschema
      commit: 009e83b591ddcd945f0d48209debfb8dca967166

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

