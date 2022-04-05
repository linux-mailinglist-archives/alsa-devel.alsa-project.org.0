Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFA4F2991
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A633187B;
	Tue,  5 Apr 2022 11:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A633187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151520;
	bh=OpxkvsWDpiQYTePXfsp0MaQAGyq3eu748KArM++RvRE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eox3JR56ekk3cMTLfqcADHbAbELXKCUDYetWYlGeAENNaRcLKWgcr62kiFYotwf/W
	 Eml5ep2yQDNX87J7YhkxywcbnLZYR/ahk1JczbVOBhkUFrq4K+wKe77R8jj04BuV12
	 kIibJApvyvFkzq970tGHT6hIL9ikDYgmpdRiBvQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF81F80518;
	Tue,  5 Apr 2022 11:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 741F6F805BF; Tue,  5 Apr 2022 11:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3428DF805C4
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3428DF805C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UEwXMYlv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A64DEB81C6E;
 Tue,  5 Apr 2022 09:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265B3C385A6;
 Tue,  5 Apr 2022 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151116;
 bh=OpxkvsWDpiQYTePXfsp0MaQAGyq3eu748KArM++RvRE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UEwXMYlv3ocbTerZaJ/KE7KQ0iEzOoVWYxZx/TQUAf/hGvY3Z+xSnRykcSmN2x4mV
 QljNF43EE7mgLY1LdBDalZ59MOOxuk3FgrXmmR4gWrppNzCPhwKj2JAosJ7XPD2HkF
 lN/HTYShoXCypVzRnQZMDAGRGLRu9Uw8s9pZL1M8KnjGiifJUJs9WPZXXfajtJD4G0
 sJxlBX+yq7kjvl27x9evTaRyDLPcY0phKo0oAXg2Ve99t7Sh1l5cjL/+16lWJ0rezM
 EIODOyMoGfQSRp2DcCKGhFjkdh5BVQdvvRp05REq3/kAY1TI8ciQ4gO8hl0xBegw+i
 MnmcJnQ+30hRA==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220403141647.1037173-1-cezary.rojewski@intel.com>
References: <20220403141647.1037173-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: catpt: Drop redundant enum constant
Message-Id: <164915111486.276574.4849436518929535974.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Sun, 3 Apr 2022 16:16:47 +0200, Cezary Rojewski wrote:
> CATPT_SSP_IFACE_LAST is being used only to calculate CATPT_SSP_COUNT.
> Make CATPT_SSP_COUNT part of the enum directly and remove the redundant
> constant.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: Drop redundant enum constant
      commit: b695f5c0a86ea685500a72b6a9959da041f26da6

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
