Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02105738738
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 16:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EDCE1EF;
	Wed, 21 Jun 2023 16:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EDCE1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687358304;
	bh=2o5j6v/emnX/Oif0fJW/tVVLeXgGPcSr8Gmqls6z5pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f/tsa0VR/nxBtHbGnZRmKNIMVDM/KVxTfawvQt/gfbUUkiLogh+3N/XF2lOY94hNI
	 j4e2lQCBTNjIVx/tchpdUWLxGQvTKmSfUo6xGIzky5pcUk/sLGEITbLqAEuAei2vXr
	 T/eZABkWPGteYO37MXHUV/fyjctN2vcPP4PWTukI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E2CF8057B; Wed, 21 Jun 2023 16:37:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EC4F80563;
	Wed, 21 Jun 2023 16:37:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84919F8055B; Wed, 21 Jun 2023 16:37:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2645F8051E
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 16:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2645F8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CnMWhdgX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 891E461463;
	Wed, 21 Jun 2023 14:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD04C433CD;
	Wed, 21 Jun 2023 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687358228;
	bh=2o5j6v/emnX/Oif0fJW/tVVLeXgGPcSr8Gmqls6z5pE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CnMWhdgXMn7Krr05YGUgMs1S93nIfqqJjmELHVLjLzq1KLju3rKqBELByYdK/5lux
	 mDmsKvOdIB7ue5oUSuRYh/gSi8tjYOGSiZw4ETHA4krFORFpIlvETsD0V93w1I/5Yo
	 HPXiiNgajVRTcBBxl3h6eYWIRecUbm9GARuS/UB2La9qDdfrMXGY/TLD81uNaXv6Av
	 73lvvl2+nv9IwuN+z/h7AuoNWHivypExAy6rF28aQU62uAW6idrKUkJOcZxehuU48v
	 zglHKT15ZXF3gkiGSXe0/JvpmHeWYKB39iU9g6iLJTILuO0IWz3JUMUIuXI+M/psCE
	 IKFShLO33jIOQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Mac Chiang <mac.chiang@intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 htcheong@chromium.org, zhourui@huaqin.corp-partner.google.com,
 bard.liao@intel.com
In-Reply-To: <20230616063617.25900-1-mac.chiang@intel.com>
References: <20230616063617.25900-1-mac.chiang@intel.com>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: sof_rt5682: reorder quirk table
Message-Id: <168735822623.116117.18039385676102264937.b4-ty@kernel.org>
Date: Wed, 21 Jun 2023 15:37:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: VKI3XWAY7G4WSAZ2PKHUUZ46JDDTXVLO
X-Message-ID-Hash: VKI3XWAY7G4WSAZ2PKHUUZ46JDDTXVLO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKI3XWAY7G4WSAZ2PKHUUZ46JDDTXVLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 16 Jun 2023 02:36:16 -0400, Mac Chiang wrote:
> Reorder the entries in quirk table to group entries with same platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_rt5682: reorder quirk table
      commit: 1f583cbdc342e15bfbde61ba142480c70e7694b4
[2/2] ASoC: Intel: sof_rt5682: Add mtl support RT1019P speaker
      commit: b20c81371a96b87478d2430d80615df189d17cd8

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

