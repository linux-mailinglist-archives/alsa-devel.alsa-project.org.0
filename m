Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28256240A7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 12:04:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F35A1654;
	Thu, 10 Nov 2022 12:03:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F35A1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668078245;
	bh=QsXzk5C5epnb6EBB5ywup9HpoGDQrTmRBHEVnEeC6VY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOcd/p224wq3j7LqebjA99p9TL0QVwTxrQ+Uua2wdxpfIM8Nx+7gjDbumRlPox3Wd
	 nBP0CkyqTDBE1EzoJG0wnmeAJdTRcHU8iDuEEo0Gp8I/qzhYTYSQx9TRZWLcfTitV0
	 n/p2W/XSZZdayKc1Nd+FaedesdqgMfzxbQ0aLpzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAF5F802E8;
	Thu, 10 Nov 2022 12:03:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93427F80114; Thu, 10 Nov 2022 12:03:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 126F8F80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 12:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 126F8F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CJ60OPws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668078184; x=1699614184;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QsXzk5C5epnb6EBB5ywup9HpoGDQrTmRBHEVnEeC6VY=;
 b=CJ60OPwstbEVR2Fjs/PnCWearJHYTsfx+ZIzsu4DC9h5wfPAjtqupK/a
 WcZBb0XOR2IzIsIwWN+AJOnFqKKWcKFCYCdKo19el24O9FXhKq40bZOfA
 KzoJYqv5jQNyq28jcZznnkeRYxuerXjHW3vie7BPfkT0bPP/kZcIqbcHL
 ARFXAvpJPgBy8lcm3pTeppRLdETzSFsyPjcLgRtbe13P3Zw3zQFDJTZiU
 KlO9inOrtPU+A8mt+2hkGy3WvWaCvEKqpwLgW7GN8GyqaG6jJQrRiMdAs
 t98S/Poz0Ss1Qm6eo3rHBYy11voud4wvmoM3Tejv5eofRPA5lCWfbrNMb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312414778"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="312414778"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:02:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="726347003"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="726347003"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.190])
 ([10.99.249.190])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:02:56 -0800
Message-ID: <8039aad2-3d6f-153f-bf23-892c3804b0fa@linux.intel.com>
Date: Thu, 10 Nov 2022 12:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] Asoc: core: fix wrong size kzalloc for rtd's components
 member
Content-Language: en-US
To: lishqchn <lishqchn@qq.com>, perex@perex.cz, tiwai@suse.com
References: <tencent_59850BB028662B6F2D49D7F3624AB84CCF05@qq.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <tencent_59850BB028662B6F2D49D7F3624AB84CCF05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com,
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

On 11/8/2022 5:24 AM, lishqchn wrote:
> The actual space for struct snd_soc_component has been allocated by
> snd_soc_register_component, here rtd's components are pointers to
> components, I replace the base size from *component to component.
> 
> Signed-off-by: lishqchn <lishqchn@qq.com>
> ---
>   sound/soc/soc-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index a6d6d10cd471..d21e0284b2aa 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -459,7 +459,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   	 */
>   	rtd = devm_kzalloc(dev,
>   			   sizeof(*rtd) +
> -			   sizeof(*component) * (dai_link->num_cpus +
> +			   sizeof(component) * (dai_link->num_cpus +
>   						 dai_link->num_codecs +
>   						 dai_link->num_platforms),
>   			   GFP_KERNEL);

Can't struct_size macro be used instead, it is meant to be used when 
calculating size of structs containing flexible arrays at the end?

