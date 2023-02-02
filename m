Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161A688B21
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 00:50:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A1083A;
	Fri,  3 Feb 2023 00:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A1083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675381843;
	bh=dAyMotPPJQVLz3tcNSghshbRhMbMMfGz5/0iUD8EmdY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QNCFc8RM2R86s/r4CPK9mUAb2XvBpHl61auDIE2nsh8V4z6263BuMvRWHE0Jz8D/a
	 UoQv6lT7likV4/BrVwwjuGCdG1cY0JrAvkbiIwUod17l3DOMTWlbU1f+Nx89f3Y4fL
	 O0FSd2SX0AZmE+lDfi9jTcEb1QZ3jdXVNT1RPcEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1255F800E3;
	Fri,  3 Feb 2023 00:49:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32567F804C2; Fri,  3 Feb 2023 00:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from omta039.useast.a.cloudfilter.net
 (omta039.useast.a.cloudfilter.net [44.202.169.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5588AF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 00:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5588AF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=i2Oiqd0B
Received: from eig-obgw-5019a.ext.cloudfilter.net ([10.0.29.142])
 by cmsmtp with ESMTP
 id NivNp54pjJlHBNjKYpiw6o; Thu, 02 Feb 2023 23:49:26 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id NjKWpCoGy4T4FNjKXpJJEf; Thu, 02 Feb 2023 23:49:25 +0000
X-Authority-Analysis: v=2.4 cv=DJucXgBb c=1 sm=1 tr=0 ts=63dc4c05
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=m04uMKEZRckA:10
 a=wYkD_t78qR0A:10 a=iox4zFpeAAAA:8 a=foHCeV_ZAAAA:8 a=VwQbUJbxAAAA:8
 a=mdQ3zACRoVh8_Dy_WlkA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=h8a9FgHX5U4dIE3jaWyr:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z06T/nkFeiE9v5s4+CdVnUZn2OYhwUVRq1KHTfhar1c=; b=i2Oiqd0B5Rd7RGZA4MnBTpzvb2
 J8gLRFxnbRWnKLkiFNihEIPu8/7lV9M4GNYIV3o663e1pt5g1S6hdJ7a/eBbpKcDNgyNneA1RwoVs
 2eOjBlFTuJqs7XeYuOobRnqFWcT7GoYuAtCUaEY1taD189YznECNsXby38NIsjQIKBNcFzQ+2Ivot
 wt6OfRU2Wn9KA9CsLhOgQr1547oqS9ccpi3TsxT1EYgBit6E/kWxwsb5uzmHsf0AelD3lUoBQz790
 WX+iKoPuGEJabQ5a9qjxkqnObu5ArJ2hRhwfej8CHCd6HMfhwkanseJn1PxaW46lXfCxLUiW0LgLV
 QvHVSKuw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:42006
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1pNgyS-0034yj-LE;
 Thu, 02 Feb 2023 15:18:28 -0600
Message-ID: <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
Date: Thu, 2 Feb 2023 15:18:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Y9wmnfTi/p4FuRmd@sirena.org.uk>
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
X-Exim-ID: 1pNgyS-0034yj-LE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7])
 [187.162.31.110]:42006
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCve7chF+nkiiwKOWi8DSqE3C63o1EQIHtr00VohrhSe0o4cTCtMVHGOL/zLymt87EYl2wFlDxpebi0GTCUimCAJ0KvC+llc7Gj0sEmpxl7eevfL64Dz
 eKYrp3awP5D9XPIZCu6q+zyZGkqbao/Rw58tpRjsSwXcdRzVkTBi0E1Rif0YChVd9KbmScTWqfNYToVs7UVQlCekQteGVlMu7U8OdIRccDeXHP09C2ERK5hN
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/2/23 15:09, Mark Brown wrote:
> On Thu, Feb 02, 2023 at 02:34:17PM -0600, Gustavo A. R. Silva wrote:
>> Hi Takashi,
>>
>> I wonder if this can go through your tree.
>>
>> It's already been reviewed by a couple of people. :)
> 
> As documented in submitting-patches.rst please send patches to the
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

Yep; that's exactly what I did. :)

scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/uapi/sound/asoc.h
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
alsa-devel@alsa-project.org (moderated list:SOUND)
linux-kernel@vger.kernel.org (open list)

If you're one the maintainers of that file, you're clearly not listed as such.

--
Gustavo
