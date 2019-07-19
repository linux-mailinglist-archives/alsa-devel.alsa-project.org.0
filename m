Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67C6E4FE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 13:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D33F716A4;
	Fri, 19 Jul 2019 13:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D33F716A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563535290;
	bh=iGZNm4ZcbdO1YNaVUnzbFeLyiCsNCIEyPRFXCyKZAcY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVRq4uD+PJETssjINKE/KosZICIJ3M4EVn1Pdt9caYzp64GjwV9tGAJkubb77sUpS
	 XV5E6Buvzm5/qqRGe+/3xTi9T67wVG60O/laRuMLZk458HeyQjUIoA/LkDDrKE2+aD
	 WFEwVQ0GdDBfVRnWwroCWHdjf/YZ/SoEloUcmzk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E964EF80367;
	Fri, 19 Jul 2019 13:19:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236BFF80272; Fri, 19 Jul 2019 13:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E3D7F800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 13:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3D7F800B2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 04:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; d="scan'208";a="195918306"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2019 04:19:33 -0700
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
References: <20190719100524.23300-1-oleksandr.suvorov@toradex.com>
 <20190719100524.23300-3-oleksandr.suvorov@toradex.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a4bcf146-4e5a-09be-599e-0ba12113d128@intel.com>
Date: Fri, 19 Jul 2019 13:19:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719100524.23300-3-oleksandr.suvorov@toradex.com>
Content-Language: en-US
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v6 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2019-07-19 12:05, Oleksandr Suvorov wrote:
> VAG power control is improved to fit the manual [1]. This patch fixes as
> minimum one bug: if customer muxes Headphone to Line-In right after boot,
> the VAG power remains off that leads to poor sound quality from line-in.
> 
> I.e. after boot:
>    - Connect sound source to Line-In jack;
>    - Connect headphone to HP jack;
>    - Run following commands:
>    $ amixer set 'Headphone' 80%
>    $ amixer set 'Headphone Mux' LINE_IN
> 
> Change VAG power on/off control according to the following algorithm:
>    - turn VAG power ON on the 1st incoming event.
>    - keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-In).
>    - turn VAG power OFF when there is the latest consumer's pre-down event
>      come.
>    - always delay after VAG power OFF to avoid pop.
>    - delay after VAG power ON if the initiative consumer is Line-In, this
>      prevents pop during line-in muxing.
> 
> According to the data sheet [1], to avoid any pops/clicks,
> the outputs should be muted during input/output
> routing changes.
> 
> [1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf
> 
> Cc: stable@vger.kernel.org
> Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> ---
> 
> Changes in v6:
> - Code optimization

You went crazy with that description (u16 mute_mask[]) :)

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
