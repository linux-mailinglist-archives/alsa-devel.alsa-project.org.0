Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF8D93C3C8
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 16:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54932E97;
	Thu, 25 Jul 2024 16:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54932E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721916684;
	bh=SADbPCxd17HIrLkpJURAjijzrsQZxo+Zf0YZKJ7WTR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TulGXZb8Cp59rwt/+35nCCYNgKygPyasgvkX6TDwJkX20CUi9Aat/tIjFQwwZMrj4
	 DtoORDFSMYSnJZtOMtaipbFEHW/b2+47ugbM/i4Yv1aNTwMPiBjJn4D2EYIUMPkXbN
	 POyaKj9HFq1vm6CsLqDVnI48QKmypv9QjSpMzADk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB35F805AD; Thu, 25 Jul 2024 16:10:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76528F805B0;
	Thu, 25 Jul 2024 16:10:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88AFF8026D; Thu, 25 Jul 2024 16:09:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F372F800C9
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 16:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F372F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=aXma48aL
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id WU8QsbUKfumtXWz8ks9ANy; Thu, 25 Jul 2024 14:08:18 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wz8isFm4FWW9nWz8ispXPx; Thu, 25 Jul 2024 14:08:16 +0000
X-Authority-Analysis: v=2.4 cv=U6yUD/ru c=1 sm=1 tr=0 ts=66a25c50
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=fdGasvwXBZ8LG8062yEA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UNSukhC8/XJWiqFsl1PRoBN34Cj/n6wZBImH+0eEHqg=; b=aXma48aLrxjiLwn6vTTMuFEmdc
	VZqW3FeBIBqN2H24BwRFhyL1zKgndA2E2oNQs8awmsSEYrKOIKdZ9bzgmyBgECW+FMtk4GKxyFfMl
	uwK9vz0tzxJEJCa+eRSNpo8ssslXoKnqUAdDApkmU7OwJN1FfecOyiQeqi1guAa3KYgMVxe7fp8IG
	vIPijEZ4L1HNBsFL/xWnlsKLYCVA0FeCIsA0gbnyKBNnrdS7lRt5AoZQgMuU/baYzeaXiLFAVgE/x
	zOQgMZ8NpZjx1xNnHEtKeeSCArnBfri2tnYthD2bDGsv/N2jEVgtCm520Lhth38dr3259CSkoyrPf
	m2fqJGDw==;
Received: from [201.172.173.139] (port=54024 helo=[192.168.15.5])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sWz8h-0019bE-2f;
	Thu, 25 Jul 2024 09:08:15 -0500
Message-ID: <906edca8-a357-4fc2-913d-be447a86963c@embeddedor.com>
Date: Thu, 25 Jul 2024 08:08:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
To: Takashi Iwai <tiwai@suse.de>, "edmund.raile" <edmund.raile@proton.me>
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, o-takashi@sakamocchi.jp, gustavoars@kernel.org,
 clemens@ladisch.de, linux-sound@vger.kernel.org
References: <rrufondjeynlkx2lniot26ablsltnynfaq2gnqvbiso7ds32il@qk4r6xps7jh2>
 <87r0bhipr7.wl-tiwai@suse.de>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <87r0bhipr7.wl-tiwai@suse.de>
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
X-Exim-ID: 1sWz8h-0019bE-2f
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.139]:54024
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfFBkUsQWMTfO1eMIkAU2siBSZDZPTliC8FMBoEuzVghmQaFBn/xPGPtuwjWZcJJkbdP31a9W9+C0DgThJS9JNw6XYeyeUQ6J0MY3uOHiNBwHC518QPNa
 1j0nlekVq/8HrwhC4sM9ofgPtRD5rUaT+L3MQEpZm0ekwwSv6b9mlR4qAIfwzGPkjVJHE6MU8ad97ewn+Arnkzh0W3S1O1WeRk2De47vLH5Mmcv18dGS6lvq
Message-ID-Hash: PN6IPOPBUTUIVCHPFAWCEUFAFFC5UUEM
X-Message-ID-Hash: PN6IPOPBUTUIVCHPFAWCEUFAFFC5UUEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN6IPOPBUTUIVCHPFAWCEUFAFFC5UUEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi!

On 25/07/24 07:07, Takashi Iwai wrote:
> On Thu, 25 Jul 2024 00:24:29 +0200,
> edmund.raile wrote:
>>
>> Bisection revealed that the bitcrushing distortion with RME FireFace 800
>> was caused by 1d717123bb1a7555
>> ("ALSA: firewire-lib: Avoid -Wflex-array-member-not-at-end warning").
>>
>> Reverting this commit yields restoration of clear audio output.
>> I will send in a patch reverting this commit for now, soonTM.
>>
>> #regzbot introduced: 1d717123bb1a7555
> 
> While it's OK to have a quick revert, it'd be worth to investigate
> further what broke there; the change is rather trivial, so it might be
> something in the macro expansion or a use of flex array stuff.
> 

I wonder is there is any log that I can take a look at. That'd be really
helpful.

Thanks!
--
Gustavo
