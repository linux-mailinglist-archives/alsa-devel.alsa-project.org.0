Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C97A7B4683
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 11:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4416BDE5;
	Sun,  1 Oct 2023 11:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4416BDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696151682;
	bh=Ha7j0py2BF78BRm74I+NRuGO1Q5uA/bFXJGbxW4+hqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZYbqvFoJ0uTgunmt/qh2JqiwDw++sW1NZecE4dWMHBRZiA7J67i97IvKMd+/z7Xd
	 WejGhjDnkB7ZU8xeraqEvwwP4naIR2Np3U3+gj2KzE1bDYkGhbwkc7mFmlWxfm8zGc
	 MZ/tRdGN35ZMeqS+y6mnC6bi9F4GNDG7DVXT/9xM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD0C2F80166; Sun,  1 Oct 2023 11:13:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5717FF802E8;
	Sun,  1 Oct 2023 11:13:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2139F80310; Sun,  1 Oct 2023 11:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from omta038.useast.a.cloudfilter.net
 (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDA67F80130
	for <alsa-devel@alsa-project.org>; Sun,  1 Oct 2023 11:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDA67F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=EoHYcehP
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTP
	id msJ8q8sjhqBU3msW9qfwCp; Sun, 01 Oct 2023 09:13:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id msW7qMDQHBsZEmsW8qFabJ; Sun, 01 Oct 2023 09:13:36 +0000
X-Authority-Analysis: v=2.4 cv=bax47cDB c=1 sm=1 tr=0 ts=65193840
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=2PcnruhlFBHVcXBBCtIA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MrAp7LCAcddLccSTimBB1XRn1y7D20vfA2wvqsAEa8A=; b=EoHYcehP85PCU9nMRzqsDqdbXN
	8d+lvBreBD+QwOo/0MbsJb0PIHlAL1FdA0keHt/b/yi5FqLhQ/vBAjLFpEDqAkFbQL3h4gKXGD6oA
	xyHL0phXFGgLFPab5dzhFd/F0wXsSWSjRrHAZazfXjHnSujTWKYOvdnKVFTKRChBCD/XkF1chsWWn
	uK68qN7dUyW9rbOmiWCVdgeh8CKddEeUaiGf4gBD4AyEZMrkTUqyWaC59zRlLCw7tCgX9hnTgBVl0
	/F5EaYbPiqaGTRjrbYQ1PpGM5fSnddYCfE+4wrA0oBqW/BOF2QC6Ry9jUqvIj/VN6vkU1vUo2PZFL
	CzDhd2PQ==;
Received: from [94.239.20.48] (port=44878 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qmqKb-001WQf-2I;
	Sun, 01 Oct 2023 01:53:33 -0500
Message-ID: <d044b556-d97f-218f-4282-5d87be6a8ef9@embeddedor.com>
Date: Sun, 1 Oct 2023 08:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH][next] ALSA: 6fire: Fix undefined behavior bug in struct
 midi_runtime
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Torsten Schenk <torsten.schenk@zoho.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <ZRb2CKHuaCu0u38i@work> <202309291026.06071AC@keescook>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202309291026.06071AC@keescook>
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
X-Exim-ID: 1qmqKb-001WQf-2I
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:44878
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfGfXbSmxMHkViOlkdSQ2ZItsIBSTwiXb+ix53w4MPy9CUnUUXyT+QMPnMf9Gu2kJ90tAG2H4aZtGatlLv0m1H1EqvOy7ubNCJJ88UCkFYeCm/yI8Pjd3
 /dfeLTIJp1tFyHXCdpGt4AVrklvjX2Gj8ibR6OWypjmxW3pAWy4mXIWqR4MpKrBuSwllBQ61Fe1TTZp2u8JDffCXjowQwMaGhCCpPqsTBHLL2w5TmNPYGfYo
Message-ID-Hash: YBRJMPB22QV6U6ZJYHBHVATMVPE3ISBM
X-Message-ID-Hash: YBRJMPB22QV6U6ZJYHBHVATMVPE3ISBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBRJMPB22QV6U6ZJYHBHVATMVPE3ISBM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/29/23 19:27, Kees Cook wrote:
> On Fri, Sep 29, 2023 at 06:06:32PM +0200, Gustavo A. R. Silva wrote:
>> `struct urb` is a flexible structure, which means that it contains a
>> flexible-array member at the bottom. This could potentially lead to an
>> overwrite of the objects following `out_urb` in `struct midi_runtime`,
>> among them a function pointer.
>>
>> Fix this by placing the declaration of object `out_urb` at the end of
>> `struct midi_runtime`.
>>
>> Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Another good find. :)

There are more coming. :)

> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 

Thanks!
--
Gustavo
