Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162B6D422
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 20:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF0A168C;
	Thu, 18 Jul 2019 20:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF0A168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563475446;
	bh=fHVmkUN7rP69aQNRNQtCh1Ckv/fVQsqlU3OHuueMGZI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V9pU8VRN0Q9nvY4lKtxqZPRqPOMiO+gefnt2ksZOC0aA3i7Y0lo8bnwMMmipmI4Sb
	 fYPl+/0FGrRTzt/dcITFJ7oHlTh7LdiuYTjPeGl49G81xQA5ARlTk3J4qS6c99KUWy
	 IqFJAiDDgLvH2Nxe8S32hSwtqhZYksIGKu/26hp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1C0F802BC;
	Thu, 18 Jul 2019 20:42:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03C8F80362; Thu, 18 Jul 2019 20:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FD9F800D2
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 20:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FD9F800D2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 11:42:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; d="scan'208";a="195708519"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2019 11:42:11 -0700
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
 <20190718090240.18432-3-oleksandr.suvorov@toradex.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <9c9ee47c-48bd-7109-9870-8f73be1f1cfa@intel.com>
Date: Thu, 18 Jul 2019 20:42:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718090240.18432-3-oleksandr.suvorov@toradex.com>
Content-Language: en-US
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v5 2/6] ASoC: sgtl5000: Improve VAG power
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

On 2019-07-18 11:02, Oleksandr Suvorov wrote:
>   
> +enum {
> +	HP_POWER_EVENT,
> +	DAC_POWER_EVENT,
> +	ADC_POWER_EVENT,
> +	LAST_POWER_EVENT
> +};
> +
> +static u16 mute_mask[] = {
> +	SGTL5000_HP_MUTE,
> +	SGTL5000_OUTPUTS_MUTE,
> +	SGTL5000_OUTPUTS_MUTE
> +};

If mute_mask[] is only used within common handler, you may consider 
declaring const array within said handler instead (did not check that 
myself).
Otherwise, simple comment for the second _OUTPUTS_MUTE should suffice - 
its not self explanatory why you doubled that mask.

> +
>   /* sgtl5000 private structure in codec */
>   struct sgtl5000_priv {
>   	int sysclk;	/* sysclk rate */
> @@ -137,8 +157,109 @@ struct sgtl5000_priv {
>   	u8 micbias_voltage;
>   	u8 lrclk_strength;
>   	u8 sclk_strength;
> +	u16 mute_state[LAST_POWER_EVENT];
>   };
>   

When I spoke of LAST enum constant, I did not really had this specific 
usage in mind.

 From design perspective, _LAST_ does not exist and should never be 
referred to as "the next option" i.e.: new enum constant.
That is way preferred usage is:
u16 mute_state[ADC_POWER_EVENT+1;
-or-
u16 mute_state[LAST_POWER_EVENT+1];

Maybe I'm just being radical here :)

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
