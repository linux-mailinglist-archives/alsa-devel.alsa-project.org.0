Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6549C40
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 10:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441871708;
	Tue, 18 Jun 2019 10:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441871708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560847411;
	bh=YdjzzD3GJpDxBNlieoFTQBXKXRPbt7ir74uUfhrVN5E=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzp/L0xFDhhBjZYuRbNQ7K1xOgQumAGGYJWNWM++0z+DmeN54JuUY8Yv69vHoUWbh
	 aCUvZroaS246Ne15kFWHazSGQ9gvVbzFjW1HJ4t/rXK8THCx79so3PiPeFI2+NZLuI
	 uA2DqZgF7pgukaqzpBXwzTe+tPmkpW6aCsx9fDuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B04CEF896DB;
	Tue, 18 Jun 2019 10:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D959F896F4; Tue, 18 Jun 2019 10:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8344BF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 10:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8344BF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 01:41:39 -0700
X-ExtLoop1: 1
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2019 01:41:37 -0700
Received: from pgsmsx112.gar.corp.intel.com ([169.254.3.172]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.124]) with mapi id 14.03.0439.000;
 Tue, 18 Jun 2019 16:41:37 +0800
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format
 constraint
Thread-Index: AQHVJZmHzRbOGMeSRUKLdTyLCueepqagdIIAgACGWyA=
Date: Tue, 18 Jun 2019 08:41:36 +0000
Message-ID: <5B37778DAAD9B04DA049B4A421B9B3EE71EB73A9@PGSMSX112.gar.corp.intel.com>
References: <1560836926-27055-1-git-send-email-mac.chiang@intel.com>
 <c084b10a-ecb5-19ad-379f-b79e723fe3d5@linux.intel.com>
In-Reply-To: <c084b10a-ecb5-19ad-379f-b79e723fe3d5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDUxYmEwYTQtYjQwZS00MDY1LTg3NWMtZGUzZjAzMGQ1ZjllIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTjhuTHZTOG5yTUxWUTZwWlZkWmhcL1krOWI0aHpEZm52alRqTjZJVXRBOTlZYUVsOE1XTVNGQ1BQRWtrRE5TRisifQ==
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "N, Harshapriya" <harshapriya.n@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Zhi, Yong" <yong.zhi@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format
 constraint
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> Which platforms is this needed for? IIRC this machine driver is shared with SOF-based solutions - which typically sets DMIC configs with topology - and I'd like to make sure there's no impact.
Hi Pierre, this is for APL platform.

-----Original Message-----
From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com] 
Sent: Tuesday, June 18, 2019 2:56 PM
To: Chiang, Mac <mac.chiang@intel.com>; alsa-devel@alsa-project.org
Cc: N, Harshapriya <harshapriya.n@intel.com>; broonie@kernel.org; Zhi, Yong <yong.zhi@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: add dmic format constraint

On 6/18/19 7:48 AM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> platform dmic recording fixup 16bits

Which platforms is this needed for? IIRC this machine driver is shared with SOF-based solutions - which typically sets DMIC configs with topology - and I'd like to make sure there's no impact.
Thanks!

> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c 
> b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 5cadb7f..ac06408 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -330,6 +330,9 @@ static int broxton_dmic_startup(struct snd_pcm_substream *substream)
>   	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
>   			&constraints_channels_quad);
>   
> +	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +	snd_pcm_hw_constraint_msbits(runtime, 0, 16, 16);
> +
>   	return snd_pcm_hw_constraint_list(substream->runtime, 0,
>   			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
>   }
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
