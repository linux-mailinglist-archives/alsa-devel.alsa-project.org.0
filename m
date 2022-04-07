Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A82AB4F87A0
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 21:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562C7185E;
	Thu,  7 Apr 2022 21:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562C7185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649358178;
	bh=+Do0YfsDHRH1l+qnksliBRchsPuZipjLmbC6F1eP0s4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UizgGkjuR9IK8wSy0lxBuyO/B3SpVbAVF1Z7np455IZslMc2588xNS6Al+AoL0qQy
	 3/h+5QYoAaFxwj2kl7IIAooaQ0N74slzrnCHBe0kO4fxfpge7MDWKIFWKB759HfX9O
	 c9A9FiL8PEbD+CLonu1Pyid3E4rAGkhPajz60zZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B70F8F80054;
	Thu,  7 Apr 2022 21:01:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C03DF8024C; Thu,  7 Apr 2022 21:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B36F80054
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 21:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B36F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HgtXLrsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649358115; x=1680894115;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Do0YfsDHRH1l+qnksliBRchsPuZipjLmbC6F1eP0s4=;
 b=HgtXLrsv7efFu8d8EceCJfjeEmGfWOE3QdgXViwG/HTCVzzIWe9QTlWx
 8uO1Si0dX1nzj7CAVoQx3fjaf/cI68g0xvOSYACJ/+J3MycMtbUIIB0d6
 e0vTPhdx2rDi3+Jnfqomi2Vh5PWuW2xcz5QVXgfii7fQiVU3XumnUUCkk
 +O7aiabbCCucdFY35YvLrrRi3GSCqyZlF7px7Za1AJg/Emgnj7kQ9tp8a
 r+9tC7cYFc9DKr9fg84hKDhTupTFPWAaaowdMhMgndYRtozfysKmCUAld
 nwkyYQXp7ZVBLgQHDG8YB4D/mpQgs+kIaljx0ht+yniB5tRQWV+tvyq7B Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322107538"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="322107538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:01:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="524499719"
Received: from achordiy-mobl.amr.corp.intel.com (HELO [10.209.88.227])
 ([10.209.88.227])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:01:27 -0700
Message-ID: <591f1596-a2be-309c-4f61-0d58ab0effc0@linux.intel.com>
Date: Thu, 7 Apr 2022 14:01:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v5 0/4] Make headphone work on Huawei Matebook D15
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>, alsa-devel@alsa-project.org
References: <cover.1649357263.git.mchehab@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cover.1649357263.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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



On 4/7/22 13:49, Mauro Carvalho Chehab wrote:
> Huawei Matebook D15 uses two different GPIOs are used to control the output:
> 
> 	- gpio0 controls the speaker output;
> 	- gpio1 controls the headphone output.
> 
> Changing both at the same time cause spurious events that are mis-interpreted
> as input events, causing troubles on apps. So, a delay is needed before turning
> on such gpios.
> 
> Also, the headset microphone is connected to MIC1, instead of MIC2 port.
> 
> With this patch, plugging a headphone causes a jack event to trigger the speaker
> supply, powering down the speaker and powering up the headphone output.
> Removing the headphone also triggers the power supply, powering up the speaker
> and powering down the headphone.
> 
> The headset microphone also works. 

For the series:

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Mauro for your work, much appreciated.

> 
> ---
> 
> v5:
>   - dropped an uneeded differential mux from the boards driver.
> 
> v4:
>   - add support for headset microphone on MIC1 port.
> 
> v3:
>   - add a patch changing GPIO quirk speaker naming. Patch 2 got rebased on the top of it.
> 
> Mauro Carvalho Chehab (3):
>   ASoC: Intel: sof_es8336: support a separate gpio to control headphone
>   ASoC: Intel: sof_es8336: add a quirk for headset at mic1 port
>   ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook D15
> 
> Pierre-Louis Bossart (1):
>   ASoC: Intel: sof_es8336: simplify speaker gpio naming
> 
>  sound/soc/intel/boards/sof_es8336.c | 117 +++++++++++++++++++++-------
>  1 file changed, 89 insertions(+), 28 deletions(-)
> 
