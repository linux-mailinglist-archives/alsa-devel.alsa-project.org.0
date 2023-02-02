Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651768884C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 21:35:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15141823;
	Thu,  2 Feb 2023 21:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15141823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675370114;
	bh=KMrD5nXJ7fVsykQhHOu6HrL9tn/w/W2mKLdN8iCc02A=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vToGiZ7Wmn/U24j6L90Vq+75X0huUBaqWOPb4o6BgHnq7JPvts9cybBv5JOjSJi5Y
	 ngbDwcZCtYuYkvxqnz6IeUOkUW7Fjd2D1O4man2IEgNidpv4Vltql1RyxGmyS1atMy
	 gm8yYUJeWbRdyxIPe8Gv0NjlRlCi5B7D+hh1GHyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 367B2F800ED;
	Thu,  2 Feb 2023 21:34:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A15DF804C2; Thu,  2 Feb 2023 21:34:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from omta37.uswest2.a.cloudfilter.net
 (omta37.uswest2.a.cloudfilter.net [35.89.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45A18F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 21:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45A18F800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=sE6KXZog
Received: from eig-obgw-6011a.ext.cloudfilter.net ([10.0.30.170])
 by cmsmtp with ESMTP
 id Na68pxxuXYHR1NgHQpGWEM; Thu, 02 Feb 2023 20:34:00 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id NgHPpcIdj0rd4NgHPprB9v; Thu, 02 Feb 2023 20:33:59 +0000
X-Authority-Analysis: v=2.4 cv=SKtR6cjH c=1 sm=1 tr=0 ts=63dc1e37
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=m04uMKEZRckA:10
 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=VwQbUJbxAAAA:8
 a=gwZbGxDKoGpvoHXj0fsA:9 a=QEXdDO2ut3YA:10 a=t_mPKkL_zAAA:10
 a=_FVE-zBwftR9WsbkzFJk:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=havDD7BADH0COSYVLMyQg91Hn9SZSCTeeTvqOnemfFo=; b=sE6KXZogcskAgJDd4SwF9bxrs5
 qbZ/IL1PnJ7ZSPn9AgsXl/qsvuTDTtqY/o0oUDV2Laju4nvIOkPs8EfzCIOAMtFFuvTTwvQs0NGbP
 1b3I//jSpeZxL2mU3/v9XWzkywsGZ1WE0SehkfTcmMJtttJdZr40vTTUV5NWlWaJZ3N483NZJ3Gnf
 RSSEqwNgXazUoTRP09bgS4Ah49YZB7i/3FsTEqjRcfkC74t9qzPKMJI6uHXRb0liNV5UMAK2OzdQ3
 uoF+YMPPNhEJ2BT1yAl9B2cR+4ojKQcotZ2T1MyflqEZGxzILkuva43nt+RMuyGwLx/fkDGWZK5Vk
 QVBR5NDQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48834
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1pNgHO-002ALM-V6;
 Thu, 02 Feb 2023 14:33:59 -0600
Message-ID: <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
Date: Thu, 2 Feb 2023 14:34:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <YzIzUjUuJKf0mkKg@work>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <YzIzUjUuJKf0mkKg@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1pNgHO-002ALM-V6
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7])
 [187.162.31.110]:48834
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLCwj26nW5PQhNz6cNGzY6Dbr0cJl/YvzCdQdPQN4NmY18Ii13WREx2FhyEtjRis4uon5CoO39xfW63aNaaCGOCi3XXDGmKvfdjJ0ziFSVwyAlhBKRqw
 GodUTidsR6QQaQukJyEveLX45c+f68h2j28M8K6ih46Jrl1Ccl1ntITbHXjOS4hAmgdHOHdXrc86DLgNZLnz6UUPXFMKvH2khJnObaGI44o/eIAAf1XQNk4F
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Takashi,

I wonder if this can go through your tree.

It's already been reviewed by a couple of people. :)

Thanks
--
Gustavo

On 9/26/22 18:18, Gustavo A. R. Silva wrote:
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
