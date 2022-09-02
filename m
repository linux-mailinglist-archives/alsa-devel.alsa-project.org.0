Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF335AAE7F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 14:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A08C161E;
	Fri,  2 Sep 2022 14:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A08C161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662121469;
	bh=6uviH47qBS+1ubtoWU7lHAlPaOBxaxFqehrVN7z4xgk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzw185y4PswGVxq59oDke/wltd1luxDuYrdtYgdl1eSIh1hYZXv52NEhzQm+xRtDU
	 FHrmx5QwH66mvjkrPrtzmYKtNGbq/wbX1nOoxAbIzNFgp92Zcpf847ATKJ97lbq9AA
	 tGJoHBHZQAFi0/k/6K806rb3NiIhqPdKROGDUNAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D490DF80163;
	Fri,  2 Sep 2022 14:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7A0F8027B; Fri,  2 Sep 2022 14:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54F93F80125
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 14:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F93F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QSK5Moui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662121402; x=1693657402;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6uviH47qBS+1ubtoWU7lHAlPaOBxaxFqehrVN7z4xgk=;
 b=QSK5Moui5Z2157lJiooP/5pAnW0H1ODFpxyrAkxASK7YnH++oNN/Pl4x
 jlsU076PeR6513vKUE3baZ84S6Xe3TgVnI5KJlIAUCwMtjmFSWpbjFIoX
 xsoK/y+PkxcvkL7pptevV+lJ0OzHcNg1lPe15hWEz/xggNdQAIbatr6vt
 v8f6BB6QQF0dxbVZuQtyhjkd4oHItFduYI9Ftt+BBX8f1nVuGcu4x5ifw
 KHjJmXMNDhC7UGZ/IGSYSIAq9izlIXK1WuYjG5o83IFyYnulHErmoIlVG
 n4yZXufKjL4/BCKhZgzc5S0FcUcXUic8wSW1YHKbNVTQUvATJyfUeKL8L g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296749806"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296749806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:23:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="941272739"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.248])
 ([10.99.241.248])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:23:12 -0700
Message-ID: <e48ffb56-f220-adf5-87ca-1826397f2e7f@linux.intel.com>
Date: Fri, 2 Sep 2022 14:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/2] lib/string_helpers: Introduce
 parse_int_array_user()
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220902122928.632602-1-cezary.rojewski@intel.com>
 <20220902122928.632602-2-cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220902122928.632602-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: andy@kernel.org, intel-poland@eclists.intel.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, willy@infradead.org, lgirdwood@gmail.com,
 hdegoede@redhat.com, andy.shevchenko@gmail.com,
 ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
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

On 9/2/2022 2:29 PM, Cezary Rojewski wrote:
> Add new helper function to allow for splitting specified user string
> into a sequence of integers. Internally it makes use of get_options() so
> the returned sequence contains the integers extracted plus an additional
> element that begins the sequence and specifies the integers count.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   include/linux/string_helpers.h |  2 ++
>   lib/string_helpers.c           | 45 ++++++++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
> index 4d72258d42fd..dc2e726fd820 100644
> --- a/include/linux/string_helpers.h
> +++ b/include/linux/string_helpers.h
> @@ -21,6 +21,8 @@ enum string_size_units {
>   void string_get_size(u64 size, u64 blk_size, enum string_size_units units,
>   		     char *buf, int len);
>   
> +int parse_int_array_user(const char __user *from, size_t count, int **array);
> +
>   #define UNESCAPE_SPACE		BIT(0)
>   #define UNESCAPE_OCTAL		BIT(1)
>   #define UNESCAPE_HEX		BIT(2)
> diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> index 5ed3beb066e6..d0c8f6ecf84c 100644
> --- a/lib/string_helpers.c
> +++ b/lib/string_helpers.c
> @@ -131,6 +131,51 @@ void string_get_size(u64 size, u64 blk_size, const enum string_size_units units,
>   }
>   EXPORT_SYMBOL(string_get_size);
>   
> +/**
> + * parse_int_array_user - Split string into a sequence of integers
> + * @from:	The user space buffer to read from
> + * @ppos:	The current position in the buffer

There is no such parameter?

> + * @count:	The maximum number of bytes to read
> + * @tkns:	Returned pointer to sequence of integers

s/tkns/array/ ?

> + *
> + * On success @tkns is allocated and initialized with a sequence of

ditto

> + * integers extracted from the @from plus an additional element that
> + * begins the sequence and specifies the integers count.
> + *
> + * Caller takes responsibility for freeing @tkns when it is no longer

ditto

> + * needed.
> + */
> +int parse_int_array_user(const char __user *from, size_t count, int **array)
> +{
> +	int *ints, nints;
> +	char *buf;
> +	int ret = 0;
> +
> +	buf = memdup_user_nul(from, count);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	get_options(buf, 0, &nints);
> +	if (!nints) {
> +		ret = -ENOENT;
> +		goto free_buf;
> +	}
> +
> +	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
> +	if (!ints) {
> +		ret = -ENOMEM;
> +		goto free_buf;
> +	}
> +
> +	get_options(buf, nints + 1, ints);
> +	*array = ints;
> +
> +free_buf:
> +	kfree(buf);
> +	return ret;
> +}
> +EXPORT_SYMBOL(parse_int_array_user);
> +
>   static bool unescape_space(char **src, char **dst)
>   {
>   	char *p = *dst, *q = *src;

