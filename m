Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECA57B800
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 15:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5579A17A8;
	Wed, 20 Jul 2022 15:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5579A17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658325507;
	bh=esxkJuy0ztRji0enQV4Wfph2iwMAK2BWM7TRhVIuhpw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1VejSrX6Hx2uwG3OP4t6jW+OVLLGTLwn1p/WYZeZSwQNc2h8dg4kg//038GOVmYY
	 m6JtEkJ/YQ7jnUyUr0Hgge1ZOfiDU2pTpOsTBO2kXKbZy0BvYKpcvNz6ufK2+HCL6b
	 K+kLD9lxqTqniqygZz7QlETH/059gjNMOAiUknfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0764FF804BB;
	Wed, 20 Jul 2022 15:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED9AF8028B; Wed, 20 Jul 2022 15:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE89F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 15:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE89F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PxiXOzU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658325416; x=1689861416;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=esxkJuy0ztRji0enQV4Wfph2iwMAK2BWM7TRhVIuhpw=;
 b=PxiXOzU/xr7mwvOb4d000WigplswzaNi5xaZL9yddENBpgG/O2T68zAj
 DdRjltDUy5iuo/15aV9bWmR6um60kOGMc1ugznEuP04wkKOT7uBxFTyww
 6gKj+EbfkDph9FdMQ3OnBz9X16qe7rb71JSyVrFTGEUP2lFI3+aYkUTEM
 iY8JgHjbEG6K+2uM5VzgcC7hOgYqFAzsZe2Lu5+sCDGSEhfIsB+E+qlbQ
 lrCL4XEJEjxxDk7bcJEXG9nd+/Kc4NAcog9+x34gXfSMEfa2o13mXHMB4
 JJKC+FT1n6zfqcyoMBNT3Hw1y+EBzrXWSqQxfGZA7M2lWuz8Z9fs7D8BJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="284340038"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="284340038"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 06:56:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="573312437"
Received: from tgeorge1-mobl.amr.corp.intel.com (HELO [10.212.79.208])
 ([10.212.79.208])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 06:56:38 -0700
Message-ID: <14b84004-0c0b-64d4-dce3-96c7c8d96c28@linux.intel.com>
Date: Wed, 20 Jul 2022 08:56:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire:repeated word: 'state'.
Content-Language: en-US
To: Xin Gao <gaoxin@cdjrlc.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <20220719183902.9231-1-gaoxin@cdjrlc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220719183902.9231-1-gaoxin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com
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



On 7/19/22 13:39, Xin Gao wrote:
> repeated word: 'state'.
> 
> Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
> ---
>  drivers/soundwire/stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index d34150559142..f0312b99e3de 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1424,7 +1424,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
>  	if (stream->state != SDW_STREAM_CONFIGURED &&
>  	    stream->state != SDW_STREAM_DEPREPARED &&
>  	    stream->state != SDW_STREAM_DISABLED) {
> -		pr_err("%s: %s: inconsistent state state %d\n",
> +		pr_err("%s: %s: inconsistent state %d\n",
>  		       __func__, stream->name, stream->state);
>  		ret = -EINVAL;
>  		goto state_err;

There are other occurrences of this repetition, you may want to correct
them all in the same patch?

stream.c:1444:          pr_err("%s: %s: inconsistent state state %d\n",

stream.c:1533:          pr_err("%s: %s: inconsistent state state %d\n",

stream.c:1620:          pr_err("%s: %s: inconsistent state state %d\n",

stream.c:1701:          pr_err("%s: %s: inconsistent state state %d\n",

