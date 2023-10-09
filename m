Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035FA7BEE24
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 00:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D60F00;
	Tue, 10 Oct 2023 00:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D60F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696889539;
	bh=td4VZV4kNP9yECuyAyDUpIzDrO5+BDxspsp/+oWm44E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WfCfHvi9mKTQjMxFDjUP6fmgKazJBEAaxONS1PfyjWP8I58g5GI6Fd8LvN2+UEt+Z
	 Nla2TuFRdiBQjWAG2lF1OllXS3HVV4yzz+CRhGVk+DH8ikjthRWL79eLI2lRzCX6ne
	 lVffQzhhroiGCV0lfSdNgLZYzs+2fbaNUiPrCzSc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC157F80130; Tue, 10 Oct 2023 00:10:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7BBF8027B;
	Tue, 10 Oct 2023 00:10:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43958F802BE; Tue, 10 Oct 2023 00:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F303DF8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 00:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F303DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=tiuwuZN9
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTP
	id puagqzpUvNWIepyScq2ceX; Mon, 09 Oct 2023 22:10:46 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id pySbqLxwvEn2cpySbqjdjt; Mon, 09 Oct 2023 22:10:45 +0000
X-Authority-Analysis: v=2.4 cv=P6MpOwMu c=1 sm=1 tr=0 ts=65247a65
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=TiVRK5GloQ2tXinOWEgA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z00a85cxpePpAkmDwxgedq3waCKHZ8B80JhlZHQ33mo=; b=tiuwuZN9V3RBFMGVrh2Cxj1kQq
	mdUI/UvLH2QvS96EQV2M0bdCHlELBmBS0OpPwE2WTL5nOfNv/NNd5IHux+NedAccZ6iHLfig8yjyd
	OZ6NTrJiNyHhJ7XOLHijROQEOz4zkzvyzbC6r7KH6ZQIfJs9SCBrg712wzhlcE+dTcbbuUhrdSejS
	mak7oYF0O6vhkXds87qLhAmNvfQWRKAIMzR0TGbYwV6Wa/idhnPejqqDhqkmy2CScBRZwfrS9LI28
	3puZuNXrqlm+uCj+UAVdBqIEPDLYR7ADiB83I/TZqK719k3Vfk89dafuk5Eo6APe7RmOS5QdKQf5W
	SvSS1+dA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56696
 helo=[192.168.15.7])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qpySa-0029nO-1P;
	Mon, 09 Oct 2023 17:10:44 -0500
Message-ID: <f30b0784-de06-4e53-9405-69aa2f86df28@embeddedor.com>
Date: Mon, 9 Oct 2023 16:10:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: sigmadsp: Add __counted_by for struct
 sigmadsp_data and use struct_size()
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZSRvh1j2MVVhuOUv@work> <202310091503.E59363D14@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202310091503.E59363D14@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qpySa-0029nO-1P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.7])
 [187.162.21.192]:56696
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfI7Z7zLV3kmZLXITXPoXrpIlcUU9h/1XwIpfKxtIuU5VxJ+D4JTR/LqiH9MkBegPfdjGMa9NyjmIlL3Z+/701K6B8bS0kdpzvXB6BHZUifMt3NnP742W
 3u5MF0OiQd+uK6PtE2US2ngmg0w/fgIpgs1EHWJkOO/90Ed+gbTY53jg7DeItq9o8X15ksmVDMQe23nzC3KlIh3xEeC2/j3/VqGxWF/d2x4vgFIewXlStIcs
Message-ID-Hash: QGCDLM23KFJCJXWIKFPJBNNRHA4XGHZ5
X-Message-ID-Hash: QGCDLM23KFJCJXWIKFPJBNNRHA4XGHZ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGCDLM23KFJCJXWIKFPJBNNRHA4XGHZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/10/23 00:03, Kees Cook wrote:
> On Mon, Oct 09, 2023 at 03:24:23PM -0600, Gustavo A. R. Silva wrote:
>> Prepare for the coming implementation by GCC and Clang of the __counted_by
>> attribute. Flexible array members annotated with __counted_by can have
>> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
>> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
>> functions).
>>
>> While there, use struct_size() and size_sub() helpers, instead of the
>> open-coded version, to calculate the size for the allocation of the
>> whole flexible structure, including of course, the flexible-array
>> member.
>>
>> This code was found with the help of Coccinelle, and audited and
>> fixed manually.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   sound/soc/codecs/sigmadsp.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
>> index b93c078a8040..56546e2394ab 100644
>> --- a/sound/soc/codecs/sigmadsp.c
>> +++ b/sound/soc/codecs/sigmadsp.c
>> @@ -43,7 +43,7 @@ struct sigmadsp_data {
>>   	uint32_t samplerates;
>>   	unsigned int addr;
>>   	unsigned int length;
>> -	uint8_t data[];
>> +	uint8_t data[] __counted_by(length);
>>   };
>>   
>>   struct sigma_fw_chunk {
>> @@ -270,7 +270,7 @@ static int sigma_fw_load_data(struct sigmadsp *sigmadsp,
>>   
>>   	length -= sizeof(*data_chunk);
>>   
>> -	data = kzalloc(sizeof(*data) + length, GFP_KERNEL);
>> +	data = kzalloc(struct_size(data, data, length), GFP_KERNEL);
>>   	if (!data)
>>   		return -ENOMEM;
>>   
>> @@ -413,7 +413,8 @@ static int process_sigma_action(struct sigmadsp *sigmadsp,
>>   		if (len < 3)
>>   			return -EINVAL;
>>   
>> -		data = kzalloc(sizeof(*data) + len - 2, GFP_KERNEL);
>> +		data = kzalloc(struct_size(data, data, size_sub(len, 2)),
>> +			       GFP_KERNEL);
> 
> Since len was just size-checked before the alloc, size_sub() is a bit of
> overkill, but it's not technically wrong. :P

Oops.. yep, you're right, I totally overlooked that check.

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Thanks!
--
Gustavo
