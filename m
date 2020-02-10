Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCE157DC9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1631670;
	Mon, 10 Feb 2020 15:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1631670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581346272;
	bh=DqsO3hKrhBIUytPChLGv9w3E1546phFkWediNVVA8b8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yhy3s5nWzDquE2IxhrM87hsFAhultIaom8t9YrQWpEf66T0PvGWbIjhu88rTzfJIn
	 ff4yTBagT5HgZJvb+KP2ACfBlHkNN0o5Ul7VNTwfIfI6Z/Ym5Yds0ExyslydWFszhI
	 nkrJN4F0BgZ8u2FK/Sq7F7jJWeB3UVlzVByb3tnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97958F800FD;
	Mon, 10 Feb 2020 15:49:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1276F80157; Mon, 10 Feb 2020 15:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC22BF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC22BF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Lw6tOnb+"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e416d300001>; Mon, 10 Feb 2020 06:48:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 10 Feb 2020 06:49:19 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 10 Feb 2020 06:49:19 -0800
Received: from [10.25.75.202] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 14:49:13 +0000
To: Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
 <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
 <75a63cb3-7d79-7216-6791-3cec57464cd9@nvidia.com>
 <847f4512-7118-e087-1004-685e476e11d8@gmail.com>
 <3c19ef99-8051-76f7-a4d6-0d61182fe6e4@nvidia.com>
 <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <ffff29e1-7ffb-01a0-a36a-fbc1e0604e5c@nvidia.com>
Date: Mon, 10 Feb 2020 20:19:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4c75fc51-fbfd-158f-a096-d4f178921ee3@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581346097; bh=pGRqxh5K8EuRcbN7wmMZRcTfJvaodHRotMWQZiA3Ab0=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=Lw6tOnb+ikPrnt3kc9xzVkN/YrTCIVw0uDOdwsjasTHyrKtfOX6ofYuT2/D5ijo0H
 24A7Vi9tGozF/cwHOAFqb4JFMZbhjXlzWVcF89l4acEl7Es2sH4jZWulLDOz1GscQT
 fVoFkqHPMOweMnnqq4VPaiUmAeuCT/cstefwq9Cgd7wK7gK5SBeDdzAj5WZtlQ2aqr
 YyNOKb+CQS6/omYObvyJsLqcD90X/z3VS+G/3u4K9v1LwcBer45pNdYPBXCgCpoAjp
 PGS5JCijnKZjoCoXOrSSSSMLW1Iwm3TsTlTXsea/aEn6NECDO67mFI8zTe6BFXHymT
 j923KetnGthqg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, spujar@nvidia.com,
 lgirdwood@gmail.com, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 robh+dt@kernel.org, thierry.reding@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 6/9] ASoC: tegra: add Tegra186 based
	DSPK driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAyLzEwLzIwMjAgNTo1MiBQTSwgSm9uIEh1bnRlciB3cm90ZToKPiBPbiAxMC8wMi8yMDIw
IDExOjE1LCBTYW1lZXIgUHVqYXIgd3JvdGU6Cj4+Cj4+IE9uIDIvNy8yMDIwIDExOjUyIFBNLCBE
bWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Bl
bmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Pj4KPj4+Cj4+PiAwNy4wMi4yMDIwIDE0OjI2LCBT
YW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4+PiBPbiAyLzYvMjAyMCAxMDo0NSBQTSwgRG1pdHJ5
IE9zaXBlbmtvIHdyb3RlOgo+Pj4+PiBFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24gb3Blbmlu
ZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Pj4+Pgo+Pj4+Pgo+Pj4+PiAzMC4wMS4yMDIwIDEzOjMz
LCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4+Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgdGVncmExODZfZHNwa19wbV9vcHMgPSB7Cj4+Pj4+PiArwqDCoMKgwqAgU0VUX1JV
TlRJTUVfUE1fT1BTKHRlZ3JhMTg2X2RzcGtfcnVudGltZV9zdXNwZW5kLAo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVncmExODZfZHNwa19y
dW50aW1lX3Jlc3VtZSwgTlVMTCkKPj4+Pj4+ICvCoMKgwqDCoCBTRVRfTEFURV9TWVNURU1fU0xF
RVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1f
cnVudGltZV9mb3JjZV9yZXN1bWUpCj4+Pj4+PiArfTsKPj4+Pj4gQ291bGQgeW91IHBsZWFzZSBl
eHBsYWluIHdoeSBkcml2ZXJzIG5lZWQgdGhlICJsYXRlIiBzeXN0ZW0gc2xlZXA/Cj4+Pj4gSXQg
d2FzIGRvbmUgdG8gZW5zdXJlIGNvcmUgZHJpdmVycyBhcmUgc3VzcGVuZGVkIGZpcnN0IGFuZCBk
ZWZlciB0aGUKPj4+PiBjb2RlYyBkcml2ZXIgc3VzcGVuZAo+Pj4gU3VzcGVuZCBvcmRlciBpcyBv
cHBvc2l0ZSB0byB0aGUgZHJpdmVycyByZWdpc3RyYXRpb24gb3JkZXIuIElmIHRoZXJlIGlzCj4+
PiBubyByZWFsIHByb2JsZW0gd2l0aCB0aGF0LCB0aGVuIHlvdSBzaG91bGQgdXNlIHRoZSBkZWZh
dWx0IHN1c3BlbmQKPj4+IGxldmVsLiBQbGVhc2UgZG9uJ3QgdHJ5IHRvIGZpeCBhIG5vbi1leGlz
dGVudCBwcm9ibGVtcy4KPj4gTm8uIFRoaXMgd2FzIGRvbmUgc3BlY2lmaWNhbGx5IHRvIGFsbG93
IHNvdW5kIGNvcmUgdG8gZmlyc3Qgc3RvcCBhbnkKPj4gb25nb2luZyBhdWRpbyBhY3Rpdml0eSBk
dXJpbmcgbm9ybWFsIHN1c3BlbmQgYW5kIGVuc3VyZSBhIHNhZmUgc3VzcGVuZAo+PiBvZiBBSFVC
IGRldmljZXMgYnkgZG9pbmcgYSBMQVRFIHN1c3BlbmQuCj4gV2hhdCBEbWl0cnkgaXMgc2F5aW5n
IGlzIHRoYXQgaWYgdGhlIERTUEsgZHJpdmVyIGlzIHJlZ2lzdGVyZWQgYWZ0ZXIgdGhlCj4gc291
bmQgY29yZSB0aGVuIHdlIHdpbGwgbm90IG5lZWQgdG8gc3VzcGVuZCBpbiB0aGUgbGF0ZSBwaGFz
ZS4gVGhlIERTUEsKPiBkZXZpY2Ugc2hvdWxkIG9ubHkgYmUgcmVnaXN0ZXJlZCBvbmNlIHRoZSBz
b3VuZCBjb3JlIGlzIGxvYWRlZCwgYmVjYXVzZQo+IG90aGVyd2lzZSB3ZSBzaG91bGQgZmFpbCB0
byByZWdpc3RlciBpdCB3aXRoIHRoZSBzb3VuZCBjb3JlLiBTbyBJIGRvbid0Cj4gdGhpbmsgd2Ug
bmVlZCB0aGlzIHRvIGJlIGxhdGUgYWZ0ZXJhbGwuCgpJIHdhcyBvcmlnaW5hbGx5IHRoaW5raW5n
IGlmIERNQSBpcyB0aGUgbWFpbiByZWFzb24gZm9yIHVzaW5nIExBVEUgCnN1c3BlbmQgZm9yIGF1
ZGlvIGRyaXZlcnMgYXMgd2VsbC4gSSBkaWQgYSBzbWFsbCBzYW5pdHkgY2hlY2sgYW5kIAphcHBl
YXJzIG5vcm1hbCBzdXNwZW5kIGlzIGZpbmUuIEkgd2lsbCB1cGRhdGUgdGhlIGRyaXZlcnMgd2l0
aCBub3JtYWwgCnN1c3BlbmQuIElmIHdlIGNvbWUgYWNyb3NzIGFueSBpc3N1ZSBsYXRlciwgaXQg
Y2FuIGJlIGFkZHJlc3NlZCAKc2VwYXJhdGVseS4gVGhhbmtzIERtaXRyeSBhbmQgSm9uLgo+Cj4g
Sm9uCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
