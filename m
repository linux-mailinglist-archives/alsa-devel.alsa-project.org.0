Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1867E86B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 15:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547D586E;
	Fri, 27 Jan 2023 15:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547D586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674830304;
	bh=vqTACG1Ldua3JvUd5Z0C9mplt8TXJI0+A+b8ihdnsZE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JP0YNxvpDZIaQcunUoehFvRHlMhI3VvdldSNd2BOroGiKq+j0O6hoNL+31AsbU6qC
	 m7y8yqd/zC762iUakmPxsIu4aTLeAoteLUjhZBDTWogmGQf1sSZAhPqzjSfKP6y98t
	 zQdotblY9KooimD0xHs6OGXmEgDW4nzgjDQN1s3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6252AF804A9;
	Fri, 27 Jan 2023 15:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BEC4F80424; Fri, 27 Jan 2023 15:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CBA1F80224
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 15:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CBA1F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZBChKsoX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674830235; x=1706366235;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to:content-transfer-encoding;
 bh=vqTACG1Ldua3JvUd5Z0C9mplt8TXJI0+A+b8ihdnsZE=;
 b=ZBChKsoXyH21DsmrQw2zn4lJb3uBtXDHngjnl1lyhTc2/q1DlAPNbFcl
 HfvQzPP1Nj749rPuJ9STvfAL2SJ07OydFHjbO2Nj4GwiOuheu9MKxjC9l
 RdFfQ54Y92d92TKBPqw2MrlHMUCAUPhuAAwf1+PnuZ+pqoP6k3B3jhRUM
 j0z2IMzaJnudfexhI8bx5nntd1wl4S8y4iqm8/TwX8dRC0+YGV9APJOHZ
 oJU7n9yDwkRNbEv0G+TL3tD4KI6CXx65XiXbHd5557muWgKCMPt1fzc9p
 INnt4iZ9GiSnmEmhggHA114eIbHQSyyhTcObgfRKKH8f9OxWAuJ9gtSYO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="328383009"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="328383009"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 06:36:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="656624839"
X-IronPort-AV: E=Sophos;i="5.97,251,1669104000"; d="scan'208";a="656624839"
Received: from vmodi-mobl2.amr.corp.intel.com (HELO [10.212.9.128])
 ([10.212.9.128])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 06:36:56 -0800
Message-ID: <923c4ca3-bf79-bd34-279a-54c817dbf413@linux.intel.com>
Date: Fri, 27 Jan 2023 08:36:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: Query on get_time_info
Content-Language: en-US
To: Raghu Ballappa Bankapur <quic_rbankapu@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
References: <271019c5-cfba-fa77-12e0-df97034f25b3@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <271019c5-cfba-fa77-12e0-df97034f25b3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rander Wang <rander.wang@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/27/23 08:03, Raghu Ballappa Bankapur wrote:
> HI All,
> 
> 
> We see get_time_info is not enabled from ALSA core. ay reason behind?

I think you meant ASoC core?

> we enabled like below with some more code, we are able to get_time_info
> to lower driver.
> 
> static int dpcm_be_connect(struct snd_soc_pcm_runtime *fe,
>                 struct snd_soc_pcm_runtime *be, int stream)
> @@ -2907,6 +2927,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd,
> int num)
>                 rtd->ops.hw_free        = dpcm_fe_dai_hw_free;
>                 rtd->ops.close          = dpcm_fe_dai_close;
>                 rtd->ops.pointer        = soc_pcm_pointer;
> +               rtd->ops.get_time_info  = soc_pcm_get_time_info;
>         } else {
>                 rtd->ops.open           = soc_pcm_open;
>                 rtd->ops.hw_params      = soc_pcm_hw_params;
> @@ -2915,6 +2936,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd,
> int num)
>                 rtd->ops.hw_free        = soc_pcm_hw_free;
>                 rtd->ops.close          = soc_pcm_close;
>                 rtd->ops.pointer        = soc_pcm_pointer;
> +               rtd->ops.get_time_info  = soc_pcm_get_time_info;
>         }
> 
> Is this ALSA limitation or any other approach is followed to enable this
> implementation.

No, it's a miss.

I had a patch to fix this in
https://github.com/thesofproject/linux/pull/3792, but somehow it never
made its path upstream. I don't fully recall the details, only vaguely
that we first added support for the .delay(), but the get_time_info part
was tested back in August 2022.

Would that patch work for you?
