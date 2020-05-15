Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447A1D55AC
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 18:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0AAF1666;
	Fri, 15 May 2020 18:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0AAF1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589559378;
	bh=kx/G22MxQd+UosUcW5TcCrvSDWUeC7vEBvVFPghiZ7c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aml9ih1q6L1Dwk5aSzr48HqlQRcg63Kr9cL+Xn9MeSjBSE3havf5IL1WqFXQNKOaX
	 7G6y3gEVg/kZTbI45OgffM1QN5ifh3aN+tinedxFSfJcTTtDaFOhTC81gsfMC6Hz3c
	 x1GCSVwXul/On1+b6bv1r0PQFWCJudN0CEguQtIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E34B5F80247;
	Fri, 15 May 2020 18:14:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FEEF80247; Fri, 15 May 2020 18:14:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6359F800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 18:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6359F800B8
IronPort-SDR: T5gOJ/sTf9w6PF8OEVQWH0bDGXSl85GVu9pgreR3DsiwybjIoas8IHkEauw3bWMyYdqa1CUTkk
 Y5jEK82Kt6rw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 09:14:25 -0700
IronPort-SDR: EJGAKri3D2qrLvNB99fGsqOG0/AWrPzHLJzm4W3WnLh7DNslRY1WFDB6KK0+ISpnWoGrGNLdxM
 2IO1R0qT1j2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="281263283"
Received: from variasco-mobl.amr.corp.intel.com ([10.254.179.41])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 09:14:25 -0700
Message-ID: <00d4ea9242cad11b7aab10326b7430f6106d63e3.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] Kconfig updates for DMIC and SOF HDMI support
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: broonie@kernel.org, alsa-devel@alsa-project.org
Date: Fri, 15 May 2020 09:14:24 -0700
In-Reply-To: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
References: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Mon, 2020-04-27 at 09:52 -0700, Ranjani Sridharan wrote:
> This series provides the following updtes to the Intel machine driver
> Kconfig:
> 
> 1. The first patch adds the explicit dependency on GPIOLIB when
> SND_SOC_DMIC is selected.
> 
> 2. SND_SOC_SOF_HDA_AUDIO_CODEC is required for using the legacy
> HDA codec driver for HDMI support in SOF. The last 3 three patches
> make the required changes to account for this.
> 
> Libin Yang (3):
>   ASoC: intel: add depends on SND_SOC_SOF_HDA_AUDIO_CODEC for common
>     hdmi
>   ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC condition
>   ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI condition
> 
> Pierre-Louis Bossart (1):
>   ASoC: Intel: boards: add explicit dependency on GPIOLIB when DMIC
> is
>     used
Hi Mark,

I see that you applied the series in your merge commit below but your
for-next branch only has the first patch in the series and the
remaining 3 are missing. Just wanted to check with you if I should
resend them.

commit eda12425b266b85a8c4b8f4f25ca8afc7e36070f
Merge: 433f9cba54fa 4262ddc2ad63
Author: Mark Brown <broonie@kernel.org>
Date:   Tue Apr 28 16:40:38 2020 +0100

    Merge series "Kconfig updates for DMIC and SOF HDMI support" from
Ranjani Sridharan <ranjani.sridharan@linux.intel.com>:

Thanks,
Ranjani

