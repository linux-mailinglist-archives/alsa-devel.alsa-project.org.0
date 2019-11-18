Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A25100EEE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 23:46:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F88E1690;
	Mon, 18 Nov 2019 23:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F88E1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574117162;
	bh=DwrBGyLutqm9hLR8U6J9or/+8wT9H2RSksIf1pXDCFQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3JPBX8rDxXhsBQ2jJwsk3ejEjNVt0fWTIEght0d3I0iQqOvo3mq8i6ppCkG35HMO
	 8EzCIaHzcJPgE5Sb8M0wn2Kvt+1ERnyDbhJmy3F3+u52VEEx2YfxxgJIDHslBLJqnI
	 6UT2O+tQXuyvkal1QjZ9m42xVGWp+Bhy+DsJ7W/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFAB5F80100;
	Mon, 18 Nov 2019 23:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91062F8013B; Mon, 18 Nov 2019 23:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A195F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 23:44:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6BB89A003F;
 Mon, 18 Nov 2019 23:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6BB89A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574117051; bh=9+t1CYqxrPEcDIUQMWqAvvJJaUzBRdpRf666XjXD5d4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CPy6vReg3fH0Cuv8D/Kcj7qKem2tvOAFszqNwGLWolurBf3akGe4Rwg4YAeO7h7TR
 dFl/mJe/ACDgxsBPkNqeWR5+Fs20USy2KTGFOr3dpGKgrwlXBLchKpccPV4K/1eKIw
 XSnjOOE1AfHy6U+NAhztIfF9bATO/fFXLawek3pE=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 18 Nov 2019 23:44:06 +0100 (CET)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191104224812.3393-1-ranjani.sridharan@linux.intel.com>
 <20191104224812.3393-3-ranjani.sridharan@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a87bce63-0413-d475-9b3c-19aa0f803232@perex.cz>
Date: Mon, 18 Nov 2019 23:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191104224812.3393-3-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: topology: set trigger
 order for FE DAI link
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

Dne 04. 11. 19 v 23:48 Ranjani Sridharan napsal(a):
> Set trigger order for FE DAI links to SND_SOC_DPCM_TRIGGER_POST
> to trigger the BE DAI's before the FE DAI's. This prevents the
> xruns seen on playback pipelines using the link DMA.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/sof/topology.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index e0e2ae734632..e7076692119b 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2951,6 +2951,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
>   	if (!link->no_pcm) {
>   		link->nonatomic = true;
>   
> +		/* set trigger order */
> +		link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> +		link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> +
>   		/* nothing more to do for FE dai links */
>   		return 0;
>   	}
> 

It seems that this patch breaks the signed 1.3 firmware. Tested on Lenovo 
Carbon X1 7th gen.

https://github.com/thesofproject/sof/issues/2102

					Jaroslav


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
