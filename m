Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E5125C5D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 09:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFE185D;
	Thu, 19 Dec 2019 09:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFE185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576742736;
	bh=CwYHImzwgjyBSInw2UclrihDkfgMYrcO+mu9tAznlvs=;
	h=To:From:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Temw55qtYxIx4l5gqQG273KTvVNsNzP5//kA7t7J2MXfdSA+r+LO1qr2wcdwjfKo8
	 6wfYUEVde6rvvGrkWXDIcMWXCEkDtWv92SBN+nN8PkKvPZcdiCLXc9tc22eXmU6xdN
	 Hg07nz5Qdiqy5MzEtAvSz+zSWuelpjrw/JSmFwiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF11EF8023F;
	Thu, 19 Dec 2019 09:03:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5540CF80234; Thu, 19 Dec 2019 09:03:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ACC4F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 09:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ACC4F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="j74B/QNk"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191219080345euoutp0194fe369434dc74de50ff78aa308e7e3c~htxBx6f2P1285212852euoutp01Z
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 08:03:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191219080345euoutp0194fe369434dc74de50ff78aa308e7e3c~htxBx6f2P1285212852euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576742625;
 bh=e8ew1VpbTWgxX8TMfSLIxJhUaIpngDyfiCvIitNcoiU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=j74B/QNkLKbjgul7YUOYKSW5FHNyH+rw94CBiEV+AgO+GqzjR5EIiZtr32PnLtFAq
 S6gQX49wqNciVqVB7Xgm96qeY1q/CkYk2xycGrJuKaAUTHStOoVVsQOAoE1e4clZXN
 8orm2fRvMFkjK0YTFMTEyRyQkEzG2u/vQ8B11umU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191219080345eucas1p198beb2205e3e4c76554a83fa08302c9e~htxBixZve0674206742eucas1p1Z;
 Thu, 19 Dec 2019 08:03:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 68.17.60679.1EE2BFD5; Thu, 19
 Dec 2019 08:03:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191219080344eucas1p21640f7eded7679fab092c68f3085f7ea~htxA-Poah1481314813eucas1p22;
 Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191219080344eusmtrp2dbe096dd78dca4f43a1e9d5d5f92d5ca~htxA_kuTQ0356503565eusmtrp2e;
 Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-66-5dfb2ee1b969
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 98.35.07950.0EE2BFD5; Thu, 19
 Dec 2019 08:03:44 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219080344eusmtip2f988f3311c4fc2c3b577ff7adb2ac8e9~htxAe54cJ2751827518eusmtip27;
 Thu, 19 Dec 2019 08:03:44 +0000 (GMT)
To: Mark Brown <broonie@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
Date: Thu, 19 Dec 2019 09:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218162422.GG3219@sirena.org.uk>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO2dnOzNnx6n5olKwSNJS81IcMqTAaGE//BUhrVp6cJKbsjlL
 7YeXSrNMEU2diVqWMjHN29SscJJzac5LmVoGixFo6p8t07yU82T573mf53kvD7wkLtQRHmSc
 IolRKqTxIq4Dp71vecjP7L8iOfx0wJN+P6LH6GKzhUv392bgdHZZDqJNpiYeXWp6hdG9c9kE
 PdMyh9HdI7O8E3xxkzWTK65qVoubtXe44vutWiRuGUgTW5v3RHKjHI7HMPFxyYwyIOyyg2yw
 oAZLLPC4njHYhqejIrdcxCeBCoHytUUsFzmQQqoOwYPXfZhdEFI2BK1vd7KCFYHWeBPf6lg1
 zyNWqEWwsF5GsMU8gs6SBsLucqEU0FNTz7VjV2offPj5kmPHODWOQXd1lB1zqUDInc/d9Aio
 MFj8/H2zl0PtB2OeaYMnSTdKAjm1MtbiDMYyy+YYPhUEH8fWEDtyL2S1leMsdocpS+VmHKD0
 PCifySfYq8NhemUcY7ELzBpaeSz2gt+dWw1ZCMxDDTy2uIdgLLMUsa5Q6DWMEPaLcMoHGrsC
 WPoklH+x4nYaKCeYmHdmj3CCwvaSv7QAcm4LWbc3aAzP/q3tGR7FC5BIsy2aZlsczbY4mv97
 qxBHi9wZtUoey6iCFMw1f5VUrlIrYv2jE+TNaOOdBtYNtg7UtXpFjygSiRwFS6d+SYSENFmV
 ItcjIHGRq+BTzrJEKIiRpqQyyoRLSnU8o9IjT5IjchcEP5qRCKlYaRJzlWESGeWWipF8j3R0
 xPuMb7FPlXvlxFL844766VGdLuIY8fzAmM1SsZK6O+rWw4Vx/o9DjLnDLVx+94Jt8UWDqS7f
 WPHu7FfZRWb89BjqmcxTT1punPcg8qob/JTRWpkuTecrDzkYbKzvCH1yNLQwsuRcu7X/TXF2
 Zto310Yvx+Fd+cqixISIHVMifxFHJZMG+uJKlfQPhErHdkoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7oP9H7HGmx7b25x5eIhJoupD5+w
 WZw43Mhs0T6zg9Hi/PkN7BYzzu9jsjj8pp3V4uXmN0wWey6+Ynfg9NjwuYnNY8GmUo9NqzrZ
 PPq2rGL02Hy62uPzJrkAtig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07
 m5TUnMyy1CJ9uwS9jDMTljAVTJCqaDyzlbmBcYpoFyMnh4SAicSfh28Zuxi5OIQEljJKfFrS
 ywaRkJE4Oa2BFcIWlvhzrYsNoug1o8SMzi1MIAlhgTyJg0tWgzWICChLXP2+lwWkiFngGpPE
 okv7WSE6epkl/nV2glWxCRhKdL3tArN5Bewkvt15DbaCRUBV4mTvebC4qECsxPeVnxghagQl
 Ts58wgJicwoYSVy//BcszixgJjFv80NmCFteonnrbChbXOLWk/lMExiFZiFpn4WkZRaSlllI
 WhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjMltx35u2cHY9S74EKMAB6MSD2+Ax69Y
 IdbEsuLK3EOMEhzMSiK8tzt+xgrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBd5JXEG5oa
 mltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYBR78uPL6uj3G/uyP7ZaGnJf
 Va8VlH+7kFnJeHtGf9eaaSZ/0pxmpuVyeMr/4CpfKzhZgW9B+s6q7FNFNUY6NcHFrGE+D/tf
 7lhut1YpSOuDRYqA8V6Pf13/vxkcOtx0vvJAwxF1RiXBb/t+3K3uvZb0ZMe95Nhl7hXzmd/G
 ZEr8bRDVym35q8RSnJFoqMVcVJwIAJ08QSvfAgAA
X-CMS-MailID: 20191219080344eucas1p21640f7eded7679fab092c68f3085f7ea
X-Msg-Generator: CA
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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

SGkgTWFyaywKCk9uIDE4LjEyLjIwMTkgMTc6MjQsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gV2Vk
LCBEZWMgMTgsIDIwMTkgYXQgMDM6NDg6MTRQTSArMDEwMCwgTWFyZWsgU3p5cHJvd3NraSB3cm90
ZToKPj4gT24gMTguMTIuMjAxOSAxNDoyNiwgTWFyayBCcm93biB3cm90ZToKPj4+PiAtIHNuZF9j
YXJkX25ldyggKSBzdWNjZWVkIGluIHNuZF9zb2NfYmluZF9jYXJkKCApLCBzbyB0aGF0IHVzZXJz
cGFjZQo+Pj4+IGNhbiBzZWUgdGhlIGNvbnRyb2wKPj4+Pgo+Pj4gVGhpcyBmZWVscyBsaWtlIHNu
ZF9jYXJkX25ldygpIGlzIGJlaW5nIG92ZXJseSBlbnRodXNpYXN0aWMgaGVyZSwgSSdkCj4+PiBl
eHBlY3QgdGhhdCB3ZSBtaWdodCBoYXZlIG90aGVyIHByb2JsZW1zIGVsc2V3aGVyZSB3aXRoIHRo
YXQuICBJJ2Qgbm90Cj4+PiBleHBlY3QgdXNlcnNwYWNlIHRvIHNlZSB0aGluZ3MgdW50aWwgc25k
X2NhcmRfcmVnaXN0ZXIoKSBzaW5jZSBiZXR3ZWVuCj4+PiBfbmV3KCkgYW5kIHRoYXQgd2UncmUg
aW4gdGhlIHByb2Nlc3Mgb2YgYnVpbGRpbmcgdGhlIGNhcmQgdXAuICBHaXZlbgo+Pj4gdGhpcyB3
ZSAqd2lsbCogbmVlZCB0byBoYW5kbGUgcGFydGlhbGx5IGNvbnN0cnVjdGVkIGNhcmRzIGFmdGVy
IGFsbCwKPj4+IHVubGVzcyB3ZSBjaGFuZ2UgdGhlIEFMU0EgY29yZS4gIFRha2FzaGk/Cj4+IEkn
bSBub3Qgc3VyZSBpZiB0aGlzIGlzIGFuIGlzc3VlIGFib3V0IHBhcnRpYWxseSByZWdpc3RlcmVk
IGNhcmQuIEhlcmUKPj4gaXMgdGhlIGJvb3QgbG9nOgo+Pgo+PiBodHRwczovL3Bhc3RlLmRlYmlh
bi5uZXQvMTEyMTU0My8KPj4KPj4gVGhpcyBvb3BzIGhhcHBlbnMgd2hlbiB1ZGV2IHRyaWVzIHRv
IGRvIGl0cyBqb2IuIFRoZSBjYXJkIGlzIGVhcmxpZXIKPj4gZnVsbHkgcmVnaXN0ZXJlZCBhbmQg
YWR2ZXJ0aXNlZCBieSBhbHNhOgo+Pgo+PiBbwqDCoMKgIDMuNTAxMTk4XSBBTFNBIGRldmljZSBs
aXN0Ogo+PiBbwqDCoMKgIDMuNTAxMzAwXcKgwqAgIzA6IE9kcm9pZC1VMwo+IFRoYXQncyBub3Qg
d2hhdCB0aGUgYW5hbHlzaXMgSSB3YXMgcmVwbHlpbmcgdG8gc2FpZCA6KAo+Cj4gVGhpcyBsb2cg
bWFrZXMgbm8gc2Vuc2UgdG8gbWUsIGlmIHRoaXMgaXMgdGhlIHNhbWUgY2FyZCB0aGF0IHdhcwo+
IHJlZ2lzdGVyZWQgYW5kIGFubm91bmNlZCBlYXJsaWVyIHdoYXQgY2F1c2VkIGl0IHRvIGJlY29t
ZSB1bnJlZ2lzdGVyZWQKPiBzbyB0aGF0IHdlIGFyZSByZWdpc3RlcmluZyBpdCBub3c/CgpJJ3Zl
IGNoZWNrZWQgYWdhaW4gdGhlIGV4YWN0IHByb2JlIG9yZGVyIGFuZCBoZXJlIGlzIHdoYXQgaGFw
cGVucyBpbiB0aGUgCnN5c3RlbToKCjEuIGZpcnN0IGNhbGwgdG8gb2Ryb2lkX2F1ZGlvX3Byb2Jl
KCkgaXMganVzdCBhZnRlcjoKClsgICAgMi45NDI0MjhdIHNhbXN1bmctaTJzIDM4MzAwMDAuaTJz
LXNlYzogRE1BIGNoYW5uZWxzIHNvdXJjZWQgZnJvbSBkZXZpY2UgMzgzMDAwMC5pMnMKCjIuIFRo
YXQgdGltZSwgaTJzIGRhaSBhbmQgbWF4OTgwOTAgZGV2aWNlcyBhcmUgYWxyZWFkeSByZWdpc3Rl
cmVkLiAKSG93ZXZlciB0aGUgc25kX3NvY19vZl9nZXRfZGFpX2xpbmtfY29kZWNzKCkgcmV0dXJu
IC1FUFJPQkVfREVGRVIsIApiZWNhdXNlIGl0IGNhbm5vdCBnZXQgdGhlIEhETUkgY29kZWMgY29t
cG9uZW50LgoKMy4gSERNSSBjb2RlYyBpcyBiZWluZyByZWdpc3RlcmVkIHdoZW4gRXh5bm9zIERS
TSBpbml0aWFsaXplcy4gVGhpcyAKaGFwcGVucyBsYXRlcjoKClvCoMKgwqAgMy4xMjc4MzNdIFtk
cm1dIEluaXRpYWxpemVkIGV4eW5vcyAxLjEuMCAyMDE4MDMzMCBmb3IgZXh5bm9zLWRybSBvbiAK
bWlub3IgMAoKNC4gVGhlbiBvZHJvaWRfYXVkaW9fcHJvYmUoKSBpcyBjYWxsZWQgYWdhaW4gZnJv
bSB0aGUgZGVmZXJyZWQgcHJvYmUgCndvcmtlciBhbmQgc3VjY2VlZHM6CgpbwqDCoMKgIDMuNTAx
MTk4XSBBTFNBIGRldmljZSBsaXN0OgpbwqDCoMKgIDMuNTAxMzAwXcKgwqAgIzA6IE9kcm9pZC1V
MwoKNS4gVGhlbiB1c2Vyc3BhY2Ugc3RhcnRzOgoKW8KgwqDCoCAzLjYwMzgyNV0gUnVuIC9zYmlu
L2luaXQgYXMgaW5pdCBwcm9jZXNzCgo2LiB3aGVuIHVzZXJzcGFjZSBpbml0IHNjcmlwdHMgKGFs
c2FjdGwpIGVudW1lcmF0ZXMgZGV2aWNlcyBpbiB0aGUgCnN5c3RlbSB0aGUgbG9ja2RlcCB3YXJu
aW5nIGlzIHRyaWdnZXJlZDoKClsgICAxMC4wNjg5OTBdID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpbICAgMTAuMDcwOTcwXSBXQVJOSU5HOiBw
b3NzaWJsZSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWQKWyAgIDEwLjA3NzEz
Nl0gNS41LjAtcmMyLW5leHQtMjAxOTEyMTggIzcxODggTm90IHRhaW50ZWQKWyAgIDEwLjA4MjE2
OF0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ClsgICAxMC4wODgzMzJdIGFsc2FjdGwvMTEwNiBpcyB0cnlpbmcgdG8gYWNxdWlyZSBsb2NrOgoK
Ny4gdGhlbiBhbHNhIHV0aWxzIHByb2JhYmx5IHRyaWVzIHRvIGxvYWQgdGhlIHNhdmVkIHZhbHVl
cyBmb3IgdGhlIGNvbnRyb2xzLCB3aGF0IHRyaWdnZXJzIHRoZSBOVUxMIHB0ciBkZXJlZmVyZW5j
ZToKClsuLi4uXSBTZXR0aW5nIHVwIEFMU0EuLi5bICAgMTAuNTAyNjcyXSA4PC0tLSBjdXQgaGVy
ZSAtLS0KWyAgIDEwLjUwMjc3Ml0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDBiMAoKPgo+PiBJZiB0aGVyZSBh
cmUgYW55IHVzZWZ1bCBsb2dzIGZvciB0cmFja2luZyB0aGlzIGlzc3VlLCBsZXQgbWUga25vdyBo
b3cgdG8KPj4gZW5hYmxlIHRoZW0sIHNvIEkgd2lsbCBwcm92aWRlIG1vcmUgbG9ncy4KPiBJdCdk
IGJlIGdvb2QgdG8gdW5kZXJzdGFuZCB0aGlzIHVucmVnaXN0cmF0aW9uL3Byb2JlIGRlZmVycmFs
IGZvciBhCj4gc3RhcnQuLi4gIHdoZW4gZGlkIHRoZSBjYXJkIGdldCB1bnJlZ2lzdGVyZWQgYW5k
IHdoeT8KCkkgaG9wZSB0aGF0IHRoZSBhYm92ZSBkZXNjcmlwdGlvbiBoZWxwcy4KClRoZSBzYW1l
IGlzc3VlIGhhcHBlbnMgb24gT2Ryb2lkWFUsIHdoaWNoIHVzZXMgc2ltcGxlLWF1ZGlvLWNhcmQs
IHNvIAp0aGlzIGlzIG5vdCByZWxhdGVkIHRvIG9kcm9pZF9hdWRpb19jYXJkIG9ubHkuCgpCZXN0
IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1dGUg
UG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
