Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02076899A9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:28:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B899DFA;
	Fri,  3 Feb 2023 14:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B899DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675430881;
	bh=9zvCM+eD3HFAM/JHI9K9Jo747SBmayBE6kxnuy/yG1Q=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PnT+LLqN016aGRCbSVroTH5QtCopGUxMBh9QuYdRwobMUQmzPTr8QbUO/3FhDPe/P
	 HClqvylJffR15V74NXYok6gO6tZTKxjNIc6NwgOiNpRJ2HNoJpqCu7bPBYOFSPcVBZ
	 ee2CaG8mX8sFzlrQ6CtxxUHBGmluG/eJo1wME+JA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 200C6F80169;
	Fri,  3 Feb 2023 14:27:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5D19F8032B; Fri,  3 Feb 2023 14:26:59 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id B96CFF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B96CFF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=GS02NFii
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
 by cmsmtp with ESMTP
 id NlX7p5LifJlHBNw5WpkhDl; Fri, 03 Feb 2023 13:26:46 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTP
 id Nw5VpYU0RVU6VNw5VpzQfY; Fri, 03 Feb 2023 13:26:45 +0000
X-Authority-Analysis: v=2.4 cv=Z/j/oVdA c=1 sm=1 tr=0 ts=63dd0b95
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=m04uMKEZRckA:10
 a=wYkD_t78qR0A:10 a=iox4zFpeAAAA:8 a=foHCeV_ZAAAA:8 a=VwQbUJbxAAAA:8
 a=IyAp9IQCZIwS9LQYF3AA:9 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22
 a=h8a9FgHX5U4dIE3jaWyr:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ySRLWLu89+QMAMhoYmt4n2D42TaV++/FIinnTamcjbs=; b=GS02NFii4yxQLyVGj/NN0afEyL
 bqHdDW4OS28UVvoUtrWf6om+Oj5dQPby7lzks+R1AX1wzPzsLBI/w+K8Zlb7ptOJ8f3HMb/kAqyy7
 PV/fEcq0lJ/YxFA2uZV89NwL/VyE+h9IM82MSZD5Gl9re/nmdMA2izsiLhMBHUQCol1GYCRiXbboM
 hNyfa6TKNgk0003wmNMHrk1eM35xBw9tpTt2x2/af6S5BcQy9EWj/2gPMHZZj7HZ/aPqiFIRQd2+e
 3MkSMrWWj2pIGvY2vE5lP8or6pTuKstNcZ9CtWzxbv4WUeRSS04Tl30xqpLewJxS05BTW0hlXKk9q
 sADZxnAw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:35378
 helo=[192.168.15.7])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <gustavo@embeddedor.com>) id 1pNw5U-0030IK-IW;
 Fri, 03 Feb 2023 07:26:44 -0600
Message-ID: <652684af-bd10-99da-1ed8-104407493428@embeddedor.com>
Date: Fri, 3 Feb 2023 07:27:03 -0600
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
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
 <Y90ExljX2qCsowhu@sirena.org.uk>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Y90ExljX2qCsowhu@sirena.org.uk>
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
X-Exim-ID: 1pNw5U-0030IK-IW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7])
 [187.162.31.110]:35378
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH7FM6L5rRFwrZoA4/Aa6rxQJ5/219ew8fHju0w7eLdTABDIpFCpameynkHvAN7W2hShcrDIwjr4/WYx4hBRzEKXa5W8nFYFUHj3ddTAVCee6cBlT2vR
 wlEPFAbAihbJ7dQHi/6Qz3yHEDK16wSasI43UQyGNMwEDoHLsZyXuSYcVVc5LPGfAypcvloc00DScxFackWyDdgCBLgw/+8is+lyck/bMSMlDDJS0JxFv985
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



On 2/3/23 06:57, Mark Brown wrote:
> On Thu, Feb 02, 2023 at 03:18:47PM -0600, Gustavo A. R. Silva wrote:
>> On 2/2/23 15:09, Mark Brown wrote:
>>> On Thu, Feb 02, 2023 at 02:34:17PM -0600, Gustavo A. R. Silva wrote:
> 
>>> As documented in submitting-patches.rst please send patches to the
>>> maintainers for the code you would like to change.  The normal kernel
>>> workflow is that people apply patches from their inboxes, if they aren't
>>> copied they are likely to not see the patch at all and it is much more
>>> difficult to apply patches.
> 
>> Yep; that's exactly what I did. :)
> 
>> scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/uapi/sound/asoc.h
>> Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
>> Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
>> alsa-devel@alsa-project.org (moderated list:SOUND)
>> linux-kernel@vger.kernel.org (open list)
> 
>> If you're one the maintainers of that file, you're clearly not listed as such.
> 
> You did manage to figure out that it's an ASoC patch given the subject
> line...

As with the list of maintainers, I use a tool to get that info:

git log --oneline include/uapi/sound/asoc.h

I think we have run into this same issue (you not being listed in the
MAINTAINERS file) at least once in the past, right? (thinkingface)

IMHO, the sensible solution for this is to keep the MAINTAINERS file
up-to-date. So, get_maintainer.pl can continue to be useful for people.

--
Gustavo

