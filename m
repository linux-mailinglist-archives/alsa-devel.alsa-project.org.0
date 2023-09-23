Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612057AC201
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 14:24:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4BD3DEB;
	Sat, 23 Sep 2023 14:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4BD3DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695471853;
	bh=JEGXneR1U3hRceAvAmnYSOwUua7QJ4WHKCB416Gy3rY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GWUxNdg8MBr8kZUJK3N54mVqA7jYiw1ZIm1360hIwWlHEUAv2U7wOhBzCcFNTR2p2
	 YqNd2DBnsyLch511TuT0xcYSrjwFlavqfstf8R5muvlFwy56Ts0qu7LrdoCUdbjFU7
	 1TJI5pjmz1UE8G1WPJ9JfqGSXtYXWUquqASveQ3c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D2CF80567; Sat, 23 Sep 2023 14:22:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F02F8055B;
	Sat, 23 Sep 2023 14:22:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB7FF801F5; Sat, 23 Sep 2023 14:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from omta34.uswest2.a.cloudfilter.net
 (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3F08F800AA
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 14:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F08F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=Z3jEnZQq
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id jq43qhcGMOzKlk1eIqI31z; Sat, 23 Sep 2023 12:22:14 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k1eHqY8z46Fyhk1eHq6L5t; Sat, 23 Sep 2023 12:22:13 +0000
X-Authority-Analysis: v=2.4 cv=Y8PrDzSN c=1 sm=1 tr=0 ts=650ed875
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=iox4zFpeAAAA:8 a=QyXUC8HyAAAA:8 a=foHCeV_ZAAAA:8 a=cm27Pg_UAAAA:8
 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=h8a9FgHX5U4dIE3jaWyr:22 a=xmb-EsYY8bH0VWELuYED:22
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WPSdLZnPg0Xa+53dl/XdXFwCV7Ecr3f4T970hU8aPKw=; b=Z3jEnZQq53K5tmRETOr6lUQXLV
	GxGRCgRrcAzMAe2v1b2jeEEzjTjYaAdI1G+zBh8Wp22m3D4wvZWFZuwF7KNF9rdszsiwGGeBtvzti
	hk0JOwUDnbu+Ph3vrDel7rstwGAiI5to7zIbuzFuidzdoRaNFkgu03zyLupWRJB2MTIQKW+N1fl2Q
	r5i/e3FEBOdFjVeOZv5MCPH30JaloYdfplRGbnzziJPmtiRkfU1p/cYaiS4F+bC+s2xRww1q4Dbwz
	UAuZe51+H3okQggzMJwTLMFQAbDXNwAa683TEGZ9H6Uf2/ec9KYKkTuANB2VI1CVQXNiHNPFJDT+w
	gHxQ6hxA==;
Received: from [94.239.20.48] (port=46926 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy0q-003YA9-1Y;
	Sat, 23 Sep 2023 03:29:17 -0500
Message-ID: <9838a857-9752-5c06-0b00-3cd279f665d0@embeddedor.com>
Date: Sat, 23 Sep 2023 10:30:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ALSA: hda: Annotate struct hda_conn_list with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jason Montleon <jmontleo@redhat.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230922175042.work.547-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175042.work.547-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy0q-003YA9-1Y
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:46926
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfGtrDyD56u4xIHFQSo20M5QIy4EYPmcgsmruLc3Biwg7DDs9lfnEADeDjJiKZ5nN5YOCfNRo4HcLMEM6W9SsKqxevPetl0llE7YH14YDJm0bzs15q2e0
 tvEB8fZz0+dPcfyeh9fn6Rw8NP1/O44uKJ/5A5JajnIoFa+TxmCeQogGZntgxd0cGQ8fiqA6/XnM3/pQAzCqBzdMGPAteROSBImH2gakl8poAHO+sCw8bPsL
Message-ID-Hash: GWHEXBUJWMENDDAM7X3CUHLDUCYSUQDO
X-Message-ID-Hash: GWHEXBUJWMENDDAM7X3CUHLDUCYSUQDO
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWHEXBUJWMENDDAM7X3CUHLDUCYSUQDO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/22/23 11:50, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hda_conn_list.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   sound/pci/hda/hda_codec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index 33af707a65ab..01718b1fc9a7 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -88,7 +88,7 @@ struct hda_conn_list {
>   	struct list_head list;
>   	int len;
>   	hda_nid_t nid;
> -	hda_nid_t conns[];
> +	hda_nid_t conns[] __counted_by(len);
>   };
>   
>   /* look up the cached results */
