Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35EC54FE0D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 22:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196F71B35;
	Fri, 17 Jun 2022 22:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196F71B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655496198;
	bh=bIOPDztJcbgiHuxrPZa6CZEtsLYHu/u1qnz0FsmldL4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HU5TNsm/RX9Z9RFuM6rdbkLkN9/DANtqXKi/HolYSoqIOjhldlRmbafZf1giZ3Y7q
	 aAVRTh8c1bYMm3HVAuwEsKw9Iy55Xo7E+djH6MQh1v10yPsi3mFdpLrDbKXs4eJdSr
	 OCmz9eNvzeFGioeCTP1aCdAUPF5+PZhJ3Ao98o6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68C21F8028B;
	Fri, 17 Jun 2022 22:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C33DF80527; Fri, 17 Jun 2022 22:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 359C1F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 22:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 359C1F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U4CnNCJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655496132; x=1687032132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bIOPDztJcbgiHuxrPZa6CZEtsLYHu/u1qnz0FsmldL4=;
 b=U4CnNCJWoAGBE8Ui8E8uMexmjEFFLFnEcurWeL5hXsJwCm5xFCpFBZ5C
 IToRoHA0l2CmUmtb/GBqTxd/+XhqQq2Pp50D3ZTSVQy31mLhnHqbSAeny
 o4u4OW8VzAI8lV7Ad+vY+qc5EjHn+5Qvv1xVqu2OfNPvFepl66OW1ljo9
 X/cQP1mNG4SDxWEUyhptgTN8KsFlfMx1UVdWVkeztfV10fcqcK9m+tEHs
 RBFSqGkPu4bKqHAhgtpAolsVo3H792/bfUJgwapQVGX3xqJg6Th2/inD/
 vc10+f6+VtYLotagTfmzrGkl7zZGkQcu6aCta5cKAb7Bo5DjyuXeYZlFd A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="365901198"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="365901198"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 13:02:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642167729"
Received: from patelman-mobl1.amr.corp.intel.com (HELO [10.212.115.29])
 ([10.212.115.29])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 13:02:05 -0700
Message-ID: <ad76d0d9-22f9-5e35-8575-bf7a78bd1568@linux.intel.com>
Date: Fri, 17 Jun 2022 15:02:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: ops: Fix multiple value control type
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
References: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1655492828-5471-1-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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



On 6/17/22 14:07, Sameer Pujar wrote:
> The commit aa2a4b897132("ASoC: ops: Fix boolean/integer detection for
> simple controls") fixes false positives with controls not ending in
> " Volume" string. But it now forces boolean type for the multi value
> controls. Fix this by adding a max check before assigning types.
> 
> Fixes: aa2a4b897132("ASoC: ops: Fix boolean/integer detection for simple controls")
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This fixes the second regression we noticed today, with mixer values
such as:

numid=5,iface=MIXER,name='PGA4.0 4 Master Capture Volume'
  ; type=BOOLEAN,access=rw---R--,values=2
  : values=on,on
  | dBscale-min=-50.00dB,step=1.00dB,mute=1

This caused an across-the-board fail with alsa-bat tests

https://github.com/thesofproject/linux/pull/3702

Thanks Sameer!

> ---
>  sound/soc/soc-ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index 0267e39..21be8e8 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -190,7 +190,7 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
>  			vol_string = NULL;
>  	}
>  
> -	if (!vol_string)
> +	if (!vol_string && max == 1)
>  		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
>  	else
>  		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
