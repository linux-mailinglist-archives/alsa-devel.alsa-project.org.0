Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8128B5EBBB3
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 09:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2739086E;
	Tue, 27 Sep 2022 09:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2739086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664264316;
	bh=pX+zNRfLn5le6aSKqq4PcNUTp9fg1Q7IQ0BbM+hchz8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCA64kjOyEiL6lO42fRG8ZzIlUCmMue4GOdbe8nG5SdjHX+QgYcu8SXAHfHMnQggM
	 POhoawE633hsDXMPplnt54ImX8W0mYeK+rqG9gu+Ek0IZrgeD4xDiO8v5NtBpblhdJ
	 QnzUFZuScqTw5EaT8Oz+UfH9n4WuHIsM2QSA+t8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D4F6F80496;
	Tue, 27 Sep 2022 09:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3BC8F8025E; Tue, 27 Sep 2022 09:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F02EF8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 09:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F02EF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eNBjaDl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664264252; x=1695800252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pX+zNRfLn5le6aSKqq4PcNUTp9fg1Q7IQ0BbM+hchz8=;
 b=eNBjaDl5z1Ku38ClXZWB/o5CVdJ39mBqN64AJa590hT9wDdaidf2/EJK
 HH+pHcaEex+PwG0Cc649n35QVk8xP9hkpBoZZUyVyYE3Cpl4nyQJRQxZE
 pgNri2mm6gWZjgHc8LmO0gq0lb+HNLgBQxNChVqjZ1lTiJLBR16DQ16b6
 HqoZeX5TCj8s0loHe6QEe6xSbfYfJbPa50SIp40wM2J7xGHlmosEyg5EL
 42yBBlqeDoKCOTmb12MlrQ2KBIzQrefmKRFBsj7mNsP4KMHXyH2Sc27fb
 4RfuLblrK8RD8IxSRsZwcVs/Y+phJaGOkkvgFwKQZTX0Jw+sA3aDh8PXw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284374728"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="284374728"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:37:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="599083965"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="599083965"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.206])
 ([10.99.249.206])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:37:15 -0700
Message-ID: <677f4f9d-9224-b2d9-1574-f64985fcedbc@linux.intel.com>
Date: Tue, 27 Sep 2022 09:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <YzIzUjUuJKf0mkKg@work>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <YzIzUjUuJKf0mkKg@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
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

On 9/27/2022 1:18 AM, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new __DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/227
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   include/uapi/sound/asoc.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
> index 053949287ce8..dd8ad790fc15 100644
> --- a/include/uapi/sound/asoc.h
> +++ b/include/uapi/sound/asoc.h
> @@ -226,9 +226,9 @@ struct snd_soc_tplg_vendor_array {
>   	__le32 type;	/* SND_SOC_TPLG_TUPLE_TYPE_ */
>   	__le32 num_elems;	/* number of elements in array */
>   	union {
> -		struct snd_soc_tplg_vendor_uuid_elem uuid[0];
> -		struct snd_soc_tplg_vendor_value_elem value[0];
> -		struct snd_soc_tplg_vendor_string_elem string[0];
> +		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_uuid_elem, uuid);
> +		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_value_elem, value);
> +		__DECLARE_FLEX_ARRAY(struct snd_soc_tplg_vendor_string_elem, string);
>   	};
>   } __attribute__((packed));
>   

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
