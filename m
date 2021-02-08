Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8A313A5C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 18:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693131689;
	Mon,  8 Feb 2021 18:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693131689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612803776;
	bh=+w0qPtGxdvmVWmwR36CSRHJHHm3un57b5rX+06n8cIg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtawHq8yYIf5GiEXyjsf29Jlx7aNCEFcXWgz78X4Bv8V5WJsfY4blg9Y1Dao1bKk8
	 XVJTg7X9CrT3YAiiPii7KW4oFK/KQZ3G88UpOQtc2kNi6P13t9/b1Dm96dAiQEiK73
	 s5M+Lwwi5Ato3+cjIqav3W1H3SZON7mmp6hIBgKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E3EF8022D;
	Mon,  8 Feb 2021 18:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C9BF8022B; Mon,  8 Feb 2021 18:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66996F80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 18:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66996F80114
IronPort-SDR: 7zEFGQsMZDWaehiJsonoB3AMDFBL6ATCeNM8FGZdiWwRkT4VljdZdMCWWpaxr6Hlm7BDGSknx5
 Bvk5CiDOzy5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="181889369"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="181889369"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 09:00:54 -0800
IronPort-SDR: e172RgawyF8MNPBLQJNIVlHA9bsoueloVs7zoJD2JKCwfCcp3Gm31dm13vy8il3b/5e7yFIY9u
 3v5SelH390nQ==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377841336"
Received: from shuklaa2-mobl.amr.corp.intel.com ([10.209.44.136])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 09:00:53 -0800
Message-ID: <6c54f750caf141bc7984b245857a3e13bcd13238.camel@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: debug: Fix a potential issue on string
 buffer termination
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org, 
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com, 
 broonie@kernel.org
Date: Mon, 08 Feb 2021 09:00:53 -0800
In-Reply-To: <20210208103857.75705-1-hui.wang@canonical.com>
References: <20210208103857.75705-1-hui.wang@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2021-02-08 at 18:38 +0800, Hui Wang wrote:
> The function simple_write_to_buffer() doesn't add string termination
> at the end of buf, we need to handle it on our own. This change
> refers
> to the function tokenize_input() in debug.c and the function
> sof_dfsentry_trace_filter_write() in trace.c.
> 
> Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for
> IPC flood test")
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  sound/soc/sof/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index 30213a1beaaa..715a374b33cf 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -352,7 +352,7 @@ static ssize_t sof_dfsentry_write(struct file
> *file, const char __user *buffer,
>  	char *string;
>  	int ret;
>  
> -	string = kzalloc(count, GFP_KERNEL);
> +	string = kzalloc(count+1, GFP_KERNEL);
>  	if (!string)
>  		return -ENOMEM;
>  
LGTM except that may be checkpatch would complain about the spaces
missing around the + sign.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

