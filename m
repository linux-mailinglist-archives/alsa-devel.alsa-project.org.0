Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2266313D2
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Nov 2022 12:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0B683A;
	Sun, 20 Nov 2022 12:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0B683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668945473;
	bh=6PrMjAgXFFONXRSGpI9VYmKCG+NV0tx1lK5NBBg2bzc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJoLsyeEAnSdIduW5qjbnQEb4PeFkYx/BWdE5QjbiZriol41qGcCjJjabH1skxYZq
	 C7Nb/1Juyq4f2nu6lMx750sw7fhDLnthy/Ic2taUJCV69YbnZ96wOIJ/oyQoLqLe/N
	 LbSF4oU8nX/OHDRmCHYN/tpORP9o34sYnrZOsDfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BFF4F803DD;
	Sun, 20 Nov 2022 12:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39FEBF8026A; Sun, 20 Nov 2022 12:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8799EF80155
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 12:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8799EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tNF2c+H9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1518DB80975;
 Sun, 20 Nov 2022 11:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E75AC433D6;
 Sun, 20 Nov 2022 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668945405;
 bh=6PrMjAgXFFONXRSGpI9VYmKCG+NV0tx1lK5NBBg2bzc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tNF2c+H9oQY9YcMVY7eRu8PuwiIyhT5/gWQaiV0vDeifjlob4BiKHh/C++6G/2pCr
 4s2frsuo0UKYHe3u0MiFOfFn8vD+fDKQFE5Y7CNYw+d101v0RhGL9FuBZ/S1nOi5l9
 9aSumQzeyHlA40r1AgoisthhMZ+z2g0fwHa4ZWnAatIluycjXHkMMC1xNGwc10JQkj
 DWPE/SW77NYLkLg7XCg7CTSMzNx2meCuvWgBscIArlDPtIIKUR9ecoohyrMpAwgwZO
 SXDrt0Qo1TQaXoMg8AEHvnye6adIhCblseogQZ0gGYZKNzyRndrbJVReA4Tm4U0/c7
 QmXCshBTqFBwg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221027085840.1562698-1-cezary.rojewski@intel.com>
References: <20221027085840.1562698-1-cezary.rojewski@intel.com>
Subject: Re: [RESEND PATCH] ASoC: core: Exit all links before removing their
 components
Message-Id: <166894540585.1075876.9923695190281693260.b4-ty@kernel.org>
Date: Sun, 20 Nov 2022 11:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 27 Oct 2022 10:58:40 +0200, Cezary Rojewski wrote:
> Flows leading to link->init() and link->exit() are not symmetric.
> Currently the relevant part of card probe sequence goes as:
> 
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_components(rtd, i, component)
> 			component->probe()
> 	for_each_card_rtds(card, rtd)
> 		for_each_rtd_dais(rtd, i, dai)
> 			dai->probe()
> 	for_each_card_rtds(card, rtd)
> 		rtd->init()
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Exit all links before removing their components
      commit: c7eb967d70446971413061effca3226578cb4dab

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
