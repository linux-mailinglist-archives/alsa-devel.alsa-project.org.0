Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F15689DA1
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 906313E7;
	Fri,  3 Feb 2023 16:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 906313E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675437194;
	bh=MT/1DWmiNdOv0jG/vTHIL9cjtaEEbp2aoOQTv2f9NTg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DxtxRuJVGlLc+aOZS9DnLDRsyVX5cVngOzIXo9TDjBPRUlrxUmIRKLiLPr656Y19C
	 C9EH0fhAHG/G7yKyNiKix09m0cvGZTTNoTvMGRhXpcJv9yqLpkT6X1ri9oJQOJ87M7
	 8UlaP6HgohGDusrTBYbDBr9e/PwzvbCE1miOWSac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97030F80544;
	Fri,  3 Feb 2023 16:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E06AFF80543; Fri,  3 Feb 2023 16:11:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 612B3F80494
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 612B3F80494
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QK0Eqyz6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675437106; x=1706973106;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MT/1DWmiNdOv0jG/vTHIL9cjtaEEbp2aoOQTv2f9NTg=;
 b=QK0Eqyz6aVl9Fl15wxQxPRDQK7JSchfx/iX01hWd9AULeJMP3aBIxve5
 R9YGL/zc1t6rM+axPEpZD/q5T1LDRY0FmjckuccT0fo28qstaDLBi+vuw
 HbgKJkcHJBoORScqGXmUnDzlLo7NItZ4KBt337O2Dyw8rtiDGALcTRDWY
 pT6CHWrAC5YbBP7GDpHnnSWnOnsaE63bBWO/fdDMvXUUSUJBSnGA78/6j
 ghLLnzMt0UGLu9F40uCUtpRFk9VouNefaHQG0vOPLF6OQsOhGFqxdLS4O
 mg9igO4KOnlID8JpyrdLZ62sjm8V5YCKIgEgZrKg0uG7no0yTbO4ZAbuL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330898278"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330898278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729290046"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729290046"
Received: from albuitra-desk.amr.corp.intel.com (HELO [10.209.172.145])
 ([10.209.172.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:42 -0800
Message-ID: <0b49c924-5994-c1cd-a174-4a2e2cfaf0d2@linux.intel.com>
Date: Fri, 3 Feb 2023 08:35:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] soundwire: bus: Prevent infinite loop in
 sdw_ch_mask_to_ch()
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20230202154212.1098736-1-rf@opensource.cirrus.com>
 <20230202154212.1098736-2-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230202154212.1098736-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/2/23 09:42, Richard Fitzgerald wrote:
> Define the ch_mask argument of sdw_ch_mask_to_ch() as an unsigned
> so that the shift right is guaranteed to eventually make the
> value of ch_mask==0.
> 
> Previously ch_mask was defined as a signed int, but a right
> shift of a signed value preserves the sign bit. So if the sign
> bit was 1, ch_mask would never become 0 and the for loop would
> be infinite.
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/soundwire/bus.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 7631ef5e71fb..28bedc919b78 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -160,7 +160,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
>  		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
>  
>  /* Retrieve and return channel count from channel mask */
> -static inline int sdw_ch_mask_to_ch(int ch_mask)
> +static inline int sdw_ch_mask_to_ch(unsigned int ch_mask)
>  {
>  	int c = 0;
>  

This patch1 is fine, but you remove this function in patch2, so is this
patch needed at all?

-/* Retrieve and return channel count from channel mask */
-static inline int sdw_ch_mask_to_ch(unsigned int ch_mask)
-{
-	int c = 0;
-
-	for (c = 0; ch_mask; ch_mask >>= 1)
-		c += ch_mask & 1;
-
-	return c;
-}
-
