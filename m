Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDD6D7C86
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 14:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E331FE;
	Wed,  5 Apr 2023 14:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E331FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680697609;
	bh=bAwNBCT1MGIbFhfi1b8vQ7dGwmdleZML+qyHObqZRQk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XP8wIj4QTOAnxWu3yto3qxzrO7i8p7dmSc5iCu7Pnek1TPv9EwWg2ntHGi1AX7yh4
	 Ys21svOxaxM2DyJblAGQqLsxnmV+yYq9dfGPWRgZJlF29Q7BJVURZYNMmQYY1/vX7E
	 PjIMa7vpS7CT5005Za3/sr+ZtuRI9X+sSrXnZBJU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F86F80249;
	Wed,  5 Apr 2023 14:25:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46E1DF8026D; Wed,  5 Apr 2023 14:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 384D6F801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 14:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384D6F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPOtQy8E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2894B627D5;
	Wed,  5 Apr 2023 12:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FBEC433EF;
	Wed,  5 Apr 2023 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680697545;
	bh=bAwNBCT1MGIbFhfi1b8vQ7dGwmdleZML+qyHObqZRQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KPOtQy8Ee4LrHoVqOczsriag5PVojCKmXM94FJN53cCN/Kjhca3liQPkl1EK70DoR
	 Jx6ap1CJdrLIJWJQUafLgOF43B1AMwDdDIKsTChWkKyqbGxpn+wZG/XYvHPteNrixv
	 FX3o3y1OnI4dTIJylk4XYwRuprXpAcqbVD1I83P/da1l8nQRscfiUVKlYcJi5ttGrX
	 ukqnp9uvc/IjzCVMNSm1G5GF6culM+CoEDjaz6nWDuszHwKMcR96tOCN99ustwAM2Z
	 y5MjhdnhvizTLHtLpKGEfz7HKqHxX4KAHlVS+BFhLlnvt/wN/7pPZTFuoG9uKyhjPs
	 a4I3oUAKayhAQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20230405092655.19587-1-daniel.baluta@oss.nxp.com>
References: <20230405092655.19587-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: pm: Tear down pipelines only if DSP was
 active
Message-Id: <168069754270.50709.3405991457967735088.b4-ty@kernel.org>
Date: Wed, 05 Apr 2023 13:25:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: JDZX6ATXG5WBOGHSNHFHS6EUIXOMYETX
X-Message-ID-Hash: JDZX6ATXG5WBOGHSNHFHS6EUIXOMYETX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, cujomalainey@chromium.org, tiwai@suse.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDZX6ATXG5WBOGHSNHFHS6EUIXOMYETX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Apr 2023 12:26:55 +0300, Daniel Baluta wrote:
> With PCI if the device was suspended it is brought back to full
> power and then suspended again.
> 
> This doesn't happen when device is described via DT.
> 
> We need to make sure that we tear down pipelines only if the device
> was previously active (thus the pipelines were setup).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: pm: Tear down pipelines only if DSP was active
      commit: 0b186bb06198653d74a141902a7739e0bde20cf4

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

