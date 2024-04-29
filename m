Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653F58B6144
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 20:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C78839;
	Mon, 29 Apr 2024 20:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C78839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714416195;
	bh=o7Rzh6vzHe9kqHnyh0XzcOChBzUGpfd9DHW4G5UZ8Eg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K04m42xTJK5gYIy1eDTH4KJf6C5P5S0rpQEwKXlVKLKjwd5UHyuCu1tuZlhw+C8T4
	 GxP8g4b2uuUMwXFqtbkdJcLkymtyyT+U9/pJo2OOtsvq1RhxBr0GY4SQtnc8yJDoDZ
	 1KEV9eZFBinMxPA2wFitsdzKl3ZcAd4mNZJLCLM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CFB4F805AE; Mon, 29 Apr 2024 20:42:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DE94F8057C;
	Mon, 29 Apr 2024 20:42:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B8EF8028D; Mon, 29 Apr 2024 20:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from omta036.useast.a.cloudfilter.net
 (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 698C4F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 20:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 698C4F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=mQMOePvc
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id 1TK5sZKLOAidI1VxPsIsq9; Mon, 29 Apr 2024 18:42:31 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1VxOsNFvgWqfj1VxOsa8GD; Mon, 29 Apr 2024 18:42:30 +0000
X-Authority-Analysis: v=2.4 cv=GsNE+F1C c=1 sm=1 tr=0 ts=662fea16
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=zXgy4KOrraTBHT4+ULisNA==:17
 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=v1GTFQr46au9FOpdLhIA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7R8iOZZv1UeQk5saLx+Pr9H4OJPkevAvXI2B0KeGlbY=; b=mQMOePvckb+lme1Q4LIcIVB07P
	vApm5UCTHavk75lmlhzQw6NYVve7lvc2S8gFrW+bstGZeHJBHz2quTQp2ZrmkJhapCcZ1jDOx5dWL
	eqDz94RZfiB0uBPKs9LciR4tw4ZpyN1j31WWOJJCSxH+pMlM9tzvQld8CxTql6R6PCPbajVa8yw8Y
	dGvZI5VNhSc9s2+sQeL3/gCgMBq1yABRHIa+UhBFqb5eaRsYfwPcZoedGpuhhbRNDHOHEf3YdV0/j
	ha/cRMnszSG69sF+d8fQvy1yfqJ0N3Aygz6iT+GOnveQIg/5RyyPAEaCDJGwORAbzRWiEyoh2vNT6
	wDjKAcCQ==;
Received: from [201.172.173.147] (port=36178 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1s1VxN-002n1Z-1F;
	Mon, 29 Apr 2024 13:42:29 -0500
Message-ID: <90ddce3b-1ad5-49be-89f9-2f3e48d73e19@embeddedor.com>
Date: Mon, 29 Apr 2024 12:42:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warnings
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux1394-devel@lists.sourceforge.net
References: <cover.1709658886.git.gustavoars@kernel.org>
 <20240306011030.GA71684@workstation.local>
 <6a7854af-a183-4db2-8400-4d9eb0cc4308@embeddedor.com>
 <202404291129.F261DEA21F@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202404291129.F261DEA21F@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.147
X-Source-L: No
X-Exim-ID: 1s1VxN-002n1Z-1F
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.10]) [201.172.173.147]:36178
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: 
 MS4xfBSuU/bTIKemENC5A1cvjnuI3XsGXl9zjFnDm/ZUSzdEncokcsbKeWkVRFNCXyAxzBNqffnx44TbkVCDaovdZZMMXUL0g+o092GNAF0wTcuH70iNBQ51
 FaUYNNR2+7ZS0sj+U6BTp50svEgpTc1gcFj7AuCdU1itjhnCcsz+xALyOwgdONRgXUtrNptYYlGryYwKQhi4ktGJ3DOU4FIFbkc3JHwWmXLM5y6cbpmMD0wM
Message-ID-Hash: ZC4YFBZARHDO7JUBX4VFYQPWCPWDKJNI
X-Message-ID-Hash: ZC4YFBZARHDO7JUBX4VFYQPWCPWDKJNI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZC4YFBZARHDO7JUBX4VFYQPWCPWDKJNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/29/24 12:30, Kees Cook wrote:
> On Wed, Mar 06, 2024 at 10:18:59AM -0600, Gustavo A. R. Silva wrote:
>>
>>> Thanks for the improvements, however we are mostly at the end of
>>> development period for v6.8 kernel. Let me postpone applying the patches
>>> until closing the next merge window (for v6.9), since we need the term to
>>> evaluate the change. I mean that it goes to v6.10 kernel.
>>
>> Sure, no problem.
>>
>> Actually, I'll send a v2 with DEFINE_FLEX(), instead.
> 
> I was just going through the patch tracker to make sure stuff got
> handled -- did a v2 of these ever get posted? I don't see anything in
> the tracker nor changes here in -next.

Yes, it's in linux-next already:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1d717123bb1a7555a432e51a41709badf8545dba

--
Gustavo
