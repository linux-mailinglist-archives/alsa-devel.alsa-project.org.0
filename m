Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20392C4196
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 15:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504BF1741;
	Wed, 25 Nov 2020 14:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504BF1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606312824;
	bh=Cyu0AkwxzQsIHLMFSvu3ENgdx8wUHEaoXwxzg6oGcxk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXWHi+baLDHK7Dm2CyrgQuEVh3vwho4FYCOjaL7WYXqnp/bM8vYZDYY3GgDM6BNXL
	 uFVWXDu9yATnD+STOYyejejPtpD/C0prSyLujjVBkcDQsHsWRHn8DjuoejzTRq3UyW
	 vEnaeZXh9uTwhLTnWdLOcwpgA0PjPp/W78Mvx+tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02E2AF80269;
	Wed, 25 Nov 2020 14:58:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B4B6F8019D; Wed, 25 Nov 2020 14:58:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A77C6F8015F
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 14:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A77C6F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="attU8U+1"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28D522067D;
 Wed, 25 Nov 2020 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606312711;
 bh=Cyu0AkwxzQsIHLMFSvu3ENgdx8wUHEaoXwxzg6oGcxk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=attU8U+1cTDuzsvE9HmP+erKurMSIQZOrE+O4MxZ2dgulzI8FN7I0xPcWQOSvundg
 aHTZK9hujZTNeyoPXsXy1uSePSW2PLYaWHy+QBEKCDKJbd04TUtQg/qC8b7SDVsZhf
 9us5cwFGC5oHlYnymcfnfTp55S/kbZq//1ESjyVE=
Date: Wed, 25 Nov 2020 13:58:06 +0000
From: Mark Brown <broonie@kernel.org>
To: linuxppc-dev@lists.ozlabs.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
In-Reply-To: <20201124141957.20481-1-viorel.suman@oss.nxp.com>
References: <20201124141957.20481-1-viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix potential resource leak
Message-Id: <160631268108.29388.9517071791344841145.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Viorel Suman <viorel.suman@nxp.com>
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

On Tue, 24 Nov 2020 16:19:57 +0200, Viorel Suman (OSS) wrote:
> "fw" variable must be relased before return.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: fix potential resource leak
      commit: 373c2cebf42772434c8dd0deffc3b3886ea8f1eb

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
