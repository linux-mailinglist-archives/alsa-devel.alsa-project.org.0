Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A3144C63
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 08:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A996165E;
	Wed, 22 Jan 2020 08:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A996165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579677489;
	bh=l0ut8vNfg/zzHLPmoMjEAfPW1SRMrcGWOdd6VYaNPcU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAyrOwFZ6dF4+FSMdL884CT8s18r7ZVke40inGgbOokm9BR32sVii3P5rOpQeemqZ
	 KjjfPM6+PCoZo9wUXtga0YWxHzC2o+qSB4M7aMryoHhSwyGZHHty2hINjp4CNuf61c
	 t12gLfmJzWJEP7w5jkhmety4hnPtFEiGoZzPQrk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21319F8020C;
	Wed, 22 Jan 2020 08:16:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97D1CF8020C; Wed, 22 Jan 2020 08:16:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A337F8007E
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 08:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A337F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="iHWX8TxA"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e27f6b00000>; Tue, 21 Jan 2020 23:16:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 21 Jan 2020 23:16:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 21 Jan 2020 23:16:15 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Jan
 2020 07:16:10 +0000
To: Dmitry Osipenko <digetx@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
Date: Wed, 22 Jan 2020 12:46:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579677360; bh=q6Hqy9YMgHF2zriePc5t7xoV1iQAW7z7hSGzyHNQi+A=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=iHWX8TxAEPWQAHMxnsnEpccgp3pldQW1vu2rjCXTentxBDH+5vQXzXatb6ZHUMKVB
 ScQTwjXFf0s2Av7ssM4F8cN5YrRpAgqRBnbqLzSF0VJqySersVlTpg7yIwnQJ4I/kp
 irh8ngIcJ7B55wDSXgclt9SKVz4Dwl16spDaerpg/P78xOJ+8Fz8A0Q5z4G8HJ7YRu
 QT4MD8axncFxWvVt3iIciiYnAzcvdHpkehLG9lKVEUSkUZCczLBXmGKegLZcX02F7e
 Hs1sMjaq6xqI1BIPOYrPSibIDTlAg2ZKi0jpN81te8kQQlJz+8BqC1Pn20xpr1dViE
 SwvO+fZZ3/wBg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, viswanathl@nvidia.com,
 linux-tegra@vger.kernel.org, broonie@kernel.org, atalambedu@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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

CgpPbiAxLzIyLzIwMjAgMTE6NTMgQU0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiBFeHRlcm5h
bCBlbWFpbDogVXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cwo+Cj4KPiAy
Mi4wMS4yMDIwIDA3OjMyLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPiBbc25pcF0KPj4+Pj4+
ICtzdGF0aWMgaW50IHRlZ3JhMjEwX2kyc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4+Pj4+ICt7Cj4+Pj4+PiArICAgICBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRl
dik7Cj4+Pj4+PiArICAgICBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+
ZGV2KSkKPj4+Pj4+ICsgICAgICAgICAgICAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgm
cGRldi0+ZGV2KTsKPj4+Pj4gVGhpcyBicmVha3MgZGV2aWNlJ3MgUlBNIHJlZmNvdW50aW5nIGlm
IGl0IHdhcyBkaXNhYmxlZCBpbiB0aGUgYWN0aXZlCj4+Pj4+IHN0YXRlLiBUaGlzIGNvZGUgc2hv
dWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4gYWJvdXQgdGhlCj4+Pj4+IHVu
eHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuCj4+
Pj4gSSBndWVzcyB0aGlzIHdhcyBhZGRlZCBmb3Igc2FmZXR5IGFuZCBleHBsaWNpdCBzdXNwZW5k
IGtlZXBzIGNsb2NrCj4+Pj4gZGlzYWJsZWQuCj4+Pj4gTm90IHN1cmUgaWYgcmVmLWNvdW50aW5n
IG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3aGVuIHJ1bnRpbWUgUE0gaXMKPj4+PiBkaXNhYmxlZCBh
bmQgZGV2aWNlIGlzIHJlbW92ZWQuCj4+Pj4gSSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcgdGhpcyB3
YXkuCj4+PiBJdCBzaG91bGQgbWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBi
ZWNhdXNlIFJQTSBzaG91bGQgYmUgaW4KPj4+IGEgd3JlY2tlZCBzdGF0ZSBvbmNlIHlvdSdsbCB0
cnkgdG8gcmUtbG9hZCB0aGUgZHJpdmVyJ3MgbW9kdWxlLiBMaWtlbHkKPj4+IHRoYXQgdGhvc2Ug
ZmV3IG90aGVyIGRyaXZlcnMgYXJlIHdyb25nLgo+Pj4KPj4+IFtzbmlwXQo+PiBPbmNlIHRoZSBk
cml2ZXIgaXMgcmUtbG9hZGVkIGFuZCBSUE0gaXMgZW5hYmxlZCwgSSBkb24ndCB0aGluayBpdCB3
b3VsZCB1c2UKPj4gdGhlIHNhbWUgJ2RldicgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHJlZiBjb3Vu
dC4gRG9lc24ndCBpdCB1c2UgdGhlIG5ldwo+PiBjb3VudGVycz8KPj4gSWYgUlBNIGlzIG5vdCB3
b3JraW5nIGZvciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUgdGhlIGNhc2UK
Pj4gZm9yIG90aGVyCj4+IGRldmljZXMuIFdoYXQgYmVzdCBkcml2ZXIgY2FuIGRvIGlzIHByb2Jh
Ymx5IGRvIGEgZm9yY2Ugc3VzcGVuZCBkdXJpbmcKPj4gcmVtb3ZhbCBpZgo+PiBhbHJlYWR5IG5v
dCBkb25lLiBJIHdvdWxkIHByZWZlciB0byBrZWVwLCBzaW5jZSBtdWx0aXBsZSBkcml2ZXJzIHN0
aWxsCj4+IGhhdmUgaXQsCj4+IHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBz
by4KPiBJIHRvb2sgYSBjbG9zZXIgbG9vayBhbmQgbG9va3MgbGlrZSB0aGUgY291bnRlciBhY3R1
YWxseSBzaG91bGQgYmUKPiByZXNldC4gU3RpbGwgSSBkb24ndCB0aGluayB0aGF0IGl0J3MgYSBn
b29kIHByYWN0aWNlIHRvIG1ha2UgY2hhbmdlcwo+IHVuZGVybmVhdGggb2YgUlBNLCBpdCBtYXkg
c3RyaWtlIGJhY2suCgpJZiBSUE0gaXMgYnJva2VuLCBpdCBwcm9iYWJseSB3b3VsZCBoYXZlIGJl
ZW4gY2F1Z2h0IGR1cmluZyBkZXZpY2UgdXNhZ2UuCkkgd2lsbCByZW1vdmUgZXhwbGljaXQgc3Vz
cGVuZCBoZXJlIGlmIG5vIGFueSBjb25jZXJucyBmcm9tIG90aGVyIGZvbGtzLiAKVGhhbmtzLgo+
Cj4+Pj4+PiArICAgICBpbnQgcnhfZmlmb190aDsKPj4+Pj4gQ291bGQgcnhfZmlmb190aCBiZSBu
ZWdhdGl2ZT8KPj4+PiByeF9maWZvX3RoIGl0c2VsZiBkb2VzIG5vdCB0YWtlIG5lZ2F0aXZlIHZh
bHVlcywgZXhwbGljaXQKPj4+PiB0eXBlY2FzdGluZz4gaXMgYXZvaWRlZCBpbiAiaWYiIGNvbmRp
dGlvbiBieSBkZWNsYXJpbmcgdGhpcyBhcyAiaW50Igo+Pj4gRXhwbGljaXQgdHlwZWNhc3Rpbmcg
aXNuJ3QgbmVlZGVkIGZvciBpbnRlZ2Vycy4KPj4gV2hhdCBJIG1lYW50IHdhcywgcnhfZmlmb190
aCBpcyBjaGVja2VkIGFnYWluc3QgYSAnaW50JyB2YXJpYWJsZSBpbiBhbgo+PiAiaWYiIGNvbmRp
dGlvbi4KPiBXaGF0J3MgdGhlIHByb2JsZW0gd2l0aCBjb21wYXJpbmcgb2YgdW5zaWduZWQgd2l0
aCBzaWduZWQ/Cgpjb25zaWRlciB0aGlzIGV4YW1wbGUsCi0tLS0KdW5zaWduZWQgaW50IHggPSA1
OwppbnQgeSA9IC0xOwoKKHggPiB5KSBpcyBmYWxzZS4KLS0tLQpIZW5jZSBzaG91bGQgYmUgY2Fy
ZWZ1bCB3aGlsZSB1c2luZyBzaWduZWQgYW5kIHVuc2lnbmVkIGNvbXBhcmlzb25zLgo+Cj4gQmVz
aWRlcywgY2lmX2NvbmYuYXVkaW9fY2ggPiBJMlNfUlhfRklGT19ERVBUSCBjYW4ndCBiZSBldmVy
IHRydWUsIGlzbid0Cj4gaXQ/IEkyU19SWF9GSUZPX0RFUFRIPTY0LCBjaGFubmVsc19tYXg9MTYK
ClllcyB0cnVlLgo+IExhc3RseSwgbm90aGluZyBzdG9wcyB5b3UgdG8gbWFrZSBtYXhfdGggdW5z
aWduZWQuCgp3aWxsIHVwZGF0ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
