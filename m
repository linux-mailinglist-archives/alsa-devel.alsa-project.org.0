Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662BE13D1C0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 02:55:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0FC17C1;
	Thu, 16 Jan 2020 02:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0FC17C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579139750;
	bh=qZuUfo3wAOsnhS8WULV5WMuBajHtk6KXXVS/2tGmtQ4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3/hPRyl/n+/Dn42O8PTrE8wKfU7glw5JqM477yjW40RWE+nD6PpfBjdXM+P1K7Qg
	 zRbGJR7bMbWKWK/XgjJze0x97PFgMAqhJX54dPDAIUc+2tmdHDvstBe9hr45+aqEvQ
	 kyO/FTkYM3JU/6iWv5BaANkSSsZWF3dZVqWGfjz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E63F8026F;
	Thu, 16 Jan 2020 02:53:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8A20F801EB; Thu, 16 Jan 2020 02:53:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C385DF800CC
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 02:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C385DF800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 17:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,324,1574150400"; d="scan'208";a="423839873"
Received: from cecox1-mobl.amr.corp.intel.com (HELO [10.251.131.55])
 ([10.251.131.55])
 by fmsmga005.fm.intel.com with ESMTP; 15 Jan 2020 17:52:54 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
 <20200114175152.3291-3-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc9075b8-7418-e910-47cd-eb181a4d9028@linux.intel.com>
Date: Wed, 15 Jan 2020 19:48:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114175152.3291-3-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH RFC v2 2/4] ASoC: Add multiple CPU DAI
 support for PCM ops
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


> @@ -1810,18 +1972,22 @@ static int dpcm_apply_symmetry(struct snd_pcm_substream *fe_substream,
>   {
>   	struct snd_soc_dpcm *dpcm;
>   	struct snd_soc_pcm_runtime *fe = fe_substream->private_data;
> -	struct snd_soc_dai *fe_cpu_dai = fe->cpu_dai;
> +	struct snd_soc_dai *fe_cpu_dai;
>   	int err;
> +	int i;
>   
>   	/* apply symmetry for FE */
>   	if (soc_pcm_has_symmetry(fe_substream))
>   		fe_substream->runtime->hw.info |= SNDRV_PCM_INFO_JOINT_DUPLEX;
>   
>   	/* Symmetry only applies if we've got an active stream. */
> -	if (fe_cpu_dai->active) {
> -		err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
> -		if (err < 0)
> -			return err;
> +	/* Do we need to support Multi cpu for FE? */
> +	for_each_rtd_cpu_dai(fe, i, fe_cpu_dai) {
> +		if (fe_cpu_dai->active) {
> +			err = soc_pcm_apply_symmetry(fe_substream, fe_cpu_dai);
> +			if (err < 0)
> +				return err;
> +		}

that part seems inconsistent with Patch 4 where you add warnings/error 
everywhere there's a FE with num_cpus>1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
