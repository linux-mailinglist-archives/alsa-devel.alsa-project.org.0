Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B87124846
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 14:25:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF541658;
	Wed, 18 Dec 2019 14:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF541658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576675554;
	bh=teai6EJ2Vx9qvgCgQxYg/BM5eLB76h0jL+C6OE+NajE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uaW//IINYP1skM/Bq4GSxgWC3hcG2C7lD+KDiHWN3NYlICXUsM+0CVzfK2yI8XJIJ
	 fRKjiXNCda5J9MApOs2B7oqFeb0ookvSJDE/ZbF293VCVyoJ44A/Vlbn2pMxJV8XDk
	 l3aIvB5Fu0xKbOvWuxSxb3AUYVdK0eupKMM0zj7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E9CF8022C;
	Wed, 18 Dec 2019 14:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 680F6F8022C; Wed, 18 Dec 2019 14:24:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C6BF80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 14:24:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C6BF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="Ay25ac56"
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIDMRtc020911; Wed, 18 Dec 2019 14:24:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ngcc1/bjwwXgqJYi6eIEjBZEPUTc8ZlQ1tttC11Dls0=;
 b=Ay25ac56hEhnGQYXRHZjVXs+U+zDeke0bC/YGW216LwsE2uFGPbfNYScpnUpr6nEOYEn
 K51pUxyw1hgVeSkgQVkESRkKBiJlGdS8bHUvEJutK8/p2s0OTQPRaGSN/uiiKaCkHng5
 S6ikYzL/e7EXHMrxt9UoQjL1q5hdgvD2JfjkAb7v1VwRyDu9E/77YOfLQhjBtrvCG0EE
 s5FtlTnlg8xZbLGSx7N5dBji7AVy7aO6FZ6AWzWw/dQaTn6kH7y4FJ/sl1WNytNKYp1N
 VX6VwJVmZ6LPBZYyi/2cqhuceT5uMgYzynmlJ8VQzy/2aRc2ZaB62scTZYSefQqar78y 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1mgy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 14:24:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A1595100034;
 Wed, 18 Dec 2019 14:24:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D2A52BB389;
 Wed, 18 Dec 2019 14:24:04 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 14:24:03 +0100
To: Jia-Ju Bai <baijiaju1990@gmail.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
References: <739176c9-d889-0093-129c-25ff9c57b63b@gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <86228f2a-f75c-2b17-1e47-ea2a6abec704@st.com>
Date: Wed, 18 Dec 2019 14:24:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <739176c9-d889-0093-129c-25ff9c57b63b@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_03:2019-12-17,2019-12-18 signatures=0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [BUG] ALSA: soc: sti: a possible
 sleep-in-atomic-context bug in uni_player_ctl_iec958_put()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgSmlhLUp1CgpPbiAxMi8xOC8xOSAxOjUxIFBNLCBKaWEtSnUgQmFpIHdyb3RlOgo+IFRoZSBk
cml2ZXIgbWF5IHNsZWVwIHdoaWxlIGhvbGRpbmcgYSBzcGlubG9jay4KPiBUaGUgZnVuY3Rpb24g
Y2FsbCBwYXRoIChmcm9tIGJvdHRvbSB0byB0b3ApIGluIExpbnV4IDQuMTkgaXM6Cj4gCj4gc291
bmQvc29jL3N0aS91bmlwZXJpZl9wbGF5ZXIuYywgMjI5Ogo+ICDCoMKgwqAgbXV0ZXhfbG9jayBp
biB1bmlfcGxheWVyX3NldF9jaGFubmVsX3N0YXR1cwo+IHNvdW5kL3NvYy9zdGkvdW5pcGVyaWZf
cGxheWVyLmMsIDYwODoKPiAgwqDCoMKgIHVuaV9wbGF5ZXJfc2V0X2NoYW5uZWxfc3RhdHVzIGlu
IHVuaV9wbGF5ZXJfY3RsX2llYzk1OF9wdXQKPiBzb3VuZC9zb2Mvc3RpL3VuaXBlcmlmX3BsYXll
ci5jLCA2MDM6Cj4gIMKgwqDCoCBfcmF3X3NwaW5fbG9ja19pcnFzYXZlIGluIHVuaV9wbGF5ZXJf
Y3RsX2llYzk1OF9wdXQKPiAKPiBtdXRleF9sb2NrKCkgY2FuIHNsZWVwIGF0IHJ1bnRpbWUuCj4g
Cj4gSSBhbSBub3Qgc3VyZSBob3cgdG8gcHJvcGVybHkgZml4IHRoaXMgcG9zc2libGUgYnVnLCBz
byBJIG9ubHkgcmVwb3J0IGl0Lgo+IAo+IFRoaXMgYnVnIGlzIGZvdW5kIGJ5IGEgc3RhdGljIGFu
YWx5c2lzIHRvb2wgU1RDaGVjayB3cml0dGVuIGJ5IG15c2VsZi4KVGhhbmsgeW91IGZvciBwb2lu
dGluZyBvdXQgdGhlIGJ1ZywgSSB3aWxsIHRlc3QgYW5kIHNlbmQgYSBmaXguCgpSZWdhcmRzCkFy
bmF1ZAo+IAo+IAo+IEJlc3Qgd2lzaGVzLAo+IEppYS1KdSBCYWkKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
