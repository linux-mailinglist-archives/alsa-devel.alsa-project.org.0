Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0F93C6CD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 17:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F01CEB1;
	Thu, 25 Jul 2024 17:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F01CEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721922581;
	bh=ejEGIAVjF+qJVA4AR6q3llobF6/SxBpE8GwTPxRQFEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=If1sWRr02HisrxEsHTLu64pW+AcZwrO++vkfSB9z9PHBXtB6WHuPLuJyHOPg8OnPO
	 L1WRcwR+lpj35eBeHRA302hGiCsINUBeqJHLSKowuSmKxjD5niMy8rEm31l0lgOP/a
	 mDgWN4d+Axj0AdOsIJRqKH/aHzu0txGNbrNVSRNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE13CF805AB; Thu, 25 Jul 2024 17:49:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A08F805B0;
	Thu, 25 Jul 2024 17:49:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D8B5F8026D; Thu, 25 Jul 2024 17:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75237F800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 17:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75237F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=g2m+00bS
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTPS
	id WzpssjI59umtXX0iAsAHjp; Thu, 25 Jul 2024 15:48:58 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id X0i9s3YL0pG2AX0i9sivAp; Thu, 25 Jul 2024 15:48:57 +0000
X-Authority-Analysis: v=2.4 cv=E6rLp7dl c=1 sm=1 tr=0 ts=66a273e9
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=ki618tANScE7zih50KsA:9
 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nGP2Gm8OPOv2rvxIia8efzaHXlpHG6xvUKGj0VIuDjc=; b=g2m+00bSuKk9CBtAaDbOq/rXhG
	72S9HCWEHg8xgMR1YzXN1hHNXgljD97jvW3RN0WG6ePVKbjUAszudJiHDh9sA789tEzbJtMqXwEXk
	bWH5d5IXAgXG46GSeqrt2Q1lAqmXMbZP3ZHoCnbhzfAF8HAJRM4PmPIDQXpmnl8K/LjSNt9y0gPN+
	OeiBfR6xhvaI9rYqW9iJ5C3/VVeg5oRsXhLa3ivHvoHgzqioxJiqLMMF2MIXi+8VhLJSjohjVj/of
	eK+2lG/RyPoZaL9H0RFSnuL3Ot/xxOr5GUAD3iQ6GpeAaFl7iBnmPO1meMLutXmKgnnPmuDImJK7t
	PF8x3w5w==;
Received: from [201.172.173.139] (port=37644 helo=[192.168.15.5])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sX0i8-002dRG-1h;
	Thu, 25 Jul 2024 10:48:56 -0500
Message-ID: <dabb394e-6c85-45a0-bc06-7a45262a9a8c@embeddedor.com>
Date: Thu, 25 Jul 2024 09:48:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
To: Takashi Iwai <tiwai@suse.de>
Cc: "edmund.raile" <edmund.raile@proton.me>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 o-takashi@sakamocchi.jp, gustavoars@kernel.org, clemens@ladisch.de,
 linux-sound@vger.kernel.org
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
 <87r0bhipr7.wl-tiwai@suse.de>
 <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
 <9135b5d8-01fe-4250-8236-e76194cd6efc@embeddedor.com>
 <87h6cdiisg.wl-tiwai@suse.de>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <87h6cdiisg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sX0i8-002dRG-1h
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.139]:37644
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 16
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfBwB+3xOsIjr8PMhdodPATJCXDVef61wLO306LU+OCF7U6fSkI9pcJ+yOAAkfehEZ5YdPeZpVnvvjPj61GLocpoduseziWq9JpBleRTSXWUbSNddwSZ+
 agjM+rGUVgKY7kEnqW3tuWVCd8j439t7IDew2ohCIX87ksk1CP06oROIy99Z3engn6t13O/EMAdaQRrBK7ohScnhbGFUTtPRjG3YgRd1va1QkWmB10NhemJA
Message-ID-Hash: BONQ47OUKYO4LBBCZ4K56LN5FXNUJNKL
X-Message-ID-Hash: BONQ47OUKYO4LBBCZ4K56LN5FXNUJNKL
X-MailFrom: gustavo@embeddedor.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BONQ47OUKYO4LBBCZ4K56LN5FXNUJNKL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 25/07/24 09:38, Takashi Iwai wrote:
> On Thu, 25 Jul 2024 17:11:31 +0200,
> Gustavo A. R. Silva wrote:
>>
>>
>>
>> On 25/07/24 08:08, Gustavo A. R. Silva wrote:
>>> Hi!
>>>
>>> On 25/07/24 07:07, Takashi Iwai wrote:
>>>> On Thu, 25 Jul 2024 00:24:29 +0200,
>>>> edmund.raile wrote:
>>>>>
>>>>> Bisection revealed that the bitcrushing distortion with RME FireFace 800
>>>>> was caused by 1d717123bb1a7555
>>>>> ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
>>>>>
>>>>> Reverting this commit yields restoration of clear audio output.
>>>>> I will send in a patch reverting this commit for now, soonTM.
>>>>>
>>>>> #regzbot introduced: 1d717123bb1a7555
>>>>
>>>> While it's OK to have a quick revert, it'd be worth to investigate
>>>> further what broke there; the change is rather trivial, so it might be
>>>> something in the macro expansion or a use of flex array stuff.
>>>>
>>>
>>> I wonder is there is any log that I can take a look at. That'd be really
>>> helpful.
>>
>> OK, I found a discrepancy in how the `header_length` field in the flexible
>> structure (a struct that contains a flexible-array member) below is used:
>>
>> include/linux/firewire.h:
>> 458 struct fw_iso_packet {
>> ...
>> 465         u32 header_length:8;    /* Length of immediate header           */
>> 466                                 /* tx: Top of 1394 isoch. data_block    */
>> 467         u32 header[] __counted_by(header_length);
>> 468 };
>>
>> Take a look at the following piece of code:
>>
>> sound/firewire/amdtp-stream.c:
>> 1164         if (!(s->flags & CIP_NO_HEADER))
>> 1165                 pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
>>
>> In the code above `pkt_header_length` is set to `IT_PKT_HEADER_SIZE_CIP`, which based
>> on the following macros is 8 _bytes_:
>>
>> sound/firewire/amdtp-stream.c:37:#define CIP_HEADER_QUADLETS	2
>> sound/firewire/amdtp-stream.c:58:#define CIP_HEADER_SIZE		(sizeof(__be32) * CIP_HEADER_QUADLETS)
>> sound/firewire/amdtp-stream.c:72:#define IT_PKT_HEADER_SIZE_CIP		CIP_HEADER_SIZE
>>
>> Then we use the DEFINE_FLEX() macro, which internally sets `template->header_length`
>> to `CIP_HEADER_QUADLETS`, which based on the macros above, takes the value
>> of 2 _elements_. We set `header_length` because such variable is the _counter_
>> used during the `__counted_by()` annotation in `struct fw_iso_packet`. The
>> _counter_ is the variable that holds the number of _elements_ in the flex-array
>> member at some point at run-time[1].
>>
>> So, we set the counter to `CIP_HEADER_QUADLETS` because that's the total number
>> of _elements_ allocated for the flexible-array member `header[]` by the DEFINE_FLEX()
>> macro.
>>
>> 1183                 DEFINE_FLEX(struct fw_iso_packet, template, header,
>> 1184                             header_length, CIP_HEADER_QUADLETS);
>> 1185                 bool sched_irq = false;
>>
>> Then we call function `build_it_pkt_header()` and pass as arguments a pointer
>> to `template`, and `pkt_header_length`, which at this point might hold the
>> value of 8 _bytes_.
>>
>> 1187                 build_it_pkt_header(s, desc->cycle, template, pkt_header_length,
>> 1188                                     desc->data_blocks, desc->data_block_counter,
>> 1189                                     desc->syt, i, curr_cycle_time);
>>
>> Then inside function `build_it_pkt_header()`, the _counter_ is updated
>> `params->header_length = header_length;`:
>>
>>   680 static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
>>   681                                 struct fw_iso_packet *params, unsigned int header_length,
>> ...
>>   692         if (header_length > 0) {
>>   693                 cip_header = (__be32 *)params->header;
>>   694                 generate_cip_header(s, cip_header, data_block_counter, syt);
>>   695                 params->header_length = header_length;
>>   696         } else {
>>
>> This causes `params->header_length == 8`; however, only enough space for 2
>> _elements_ was allocated for the flex array (via DEFINE_FLEX()).
>>
>> So, regardless of how `pkt_header_length` is intended to be used in the rest of
>> the code inside `build_it_pkt_header()`, this last update to `params->header_length`
>> seems to be incorrect.
>>
>> So, my question here is whether this `header_length` struct member was originally
>> intended to be used as a counter for the elements in the flex array or as size
>> variable to hold the total number of bytes in the array?
>>
>> Based on the comment "Length of immediate header", I suppose `header_length` would
>> hold _elements_ not _bytes_.
> 
> Thanks, now I took a look over the whole picture, and I guess there
> are two problems:
> 
> - The header_length should be in bytes, as far as I read the code in
>    drivers/firwire/*.  So the assumption in the commit d3155742db89
>    ("firewire: Annotate struct fw_iso_packet with __counted_by()") was
>    already wrong, and it couldn't be annotated like that -- unless we
>    fix up all users of header_length field.

I see. In this case, the code comment should also be changed:

s/Length/Size

to prevent any further confusion, as Size is clearly for bytes.

> - By the use of DEFINE_FLEX() in amdtp-stream.c, process_rx_packets()
>    sets the header_length field to CIP_HEADER_QUADLETS (= 2) as
>    default.  Meanwhile, build_it_pkt_header() doesn't touch
>    header_length unless non-zero pkt_header_length is passed, supposing
>    it being zero.  So this may lead to a bogus header_length, which is
>    processed by the firewire core code wrongly.
> 
> The actual effect we see is likely the latter.  A simple fix would be
> to use DEFINE_RAW_FLEX() instead of DEFINE_FLEX() like below.

Yes, `DEFINE_RAW_FLEX()` is the way to go in this case, as long as the
following patch is also applied:

--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -462,9 +462,9 @@ struct fw_iso_packet {
                                 /* rx: Sync bit, wait for matching sy   */
         u32 tag:2;              /* tx: Tag in packet header             */
         u32 sy:4;               /* tx: Sy in packet header              */
-       u32 header_length:8;    /* Length of immediate header           */
+       u32 header_length:8;    /* Size of immediate header             */
                                 /* tx: Top of 1394 isoch. data_block    */
-       u32 header[] __counted_by(header_length);
+       u32 header[];
  };

Thanks
- Gustavo

> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/firewire/amdtp-stream.c
> +++ b/sound/firewire/amdtp-stream.c
> @@ -1180,8 +1180,8 @@ static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_
>   		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
>   
>   	for (i = 0; i < packets; ++i) {
> -		DEFINE_FLEX(struct fw_iso_packet, template, header,
> -			    header_length, CIP_HEADER_QUADLETS);
> +		DEFINE_RAW_FLEX(struct fw_iso_packet, template, header,
> +				CIP_HEADER_QUADLETS);
>   		bool sched_irq = false;
>   
>   		build_it_pkt_header(s, desc->cycle, template, pkt_header_length,
