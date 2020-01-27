Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7589D149EA3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 06:24:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEC1168E;
	Mon, 27 Jan 2020 06:23:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEC1168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580102660;
	bh=do3UdWhXGiG1UqbOCYUiTjdoZ7QxadT3X1N2CfYaS1k=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IwW5rMH0qTZZYoLngfAyhYj2aVcJiDjx9LY1JxaEV2WrX+mZJr77wLauuGHH5PJiY
	 SDZCsjGzuz5T5JKJgc1b7fnl4i4/bakloXD84f0Yx/YhE9uE+Qfg+9NUvgeU4XoAf+
	 FkR4BP4nRY0NAt3bZVYeaMTv6oj+worZ+YmATVwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 139E5F80218;
	Mon, 27 Jan 2020 06:22:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B7BAF8021E; Mon, 27 Jan 2020 06:22:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03130F800C8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 06:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03130F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WOyBbCjo"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2e73840000>; Sun, 26 Jan 2020 21:22:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 26 Jan 2020 21:22:26 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 26 Jan 2020 21:22:26 -0800
Received: from [10.25.73.144] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jan
 2020 05:22:21 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
 <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
 <3f51939d-cf4b-f69b-728a-7eb99bbae458@nvidia.com>
 <34ac1fd3-ae0f-07f2-555f-a55087a2c9dc@nvidia.com>
 <1a84b393-938f-8bed-d08e-cc3bb6ed4844@gmail.com>
 <0fc814c2-0dc6-7741-b954-463381ff7fb9@nvidia.com>
 <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
 <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
 <264d3354-8a2e-ee12-44ae-aff69213d551@nvidia.com>
 <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <c6022a93-b79a-c691-1d75-d007d0b64ead@nvidia.com>
Date: Mon, 27 Jan 2020 10:52:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <075e476a-36bb-5fee-15bc-76af4474a797@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580102532; bh=uyQ7nxDtadx0HKIFwTV9Y/Ni4jJ8RtmHuiaNgpeGCVQ=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=WOyBbCjo0xTj12FVF25Yp1r1fV1gjHMY39c/AKkvSqdoN4YQ+TmEJgCDKGkWZ8CUS
 uXfojDb95fmA49UWlns0lMxbRtb/hJoXQN1d5bvf7fxIiKhdMy0GTPJm7AxdHGbHXV
 VFToAlODWyoYIHhldt2qp4LICkvwScpCr6Qkvq2OSpSI7tURbR8etrzEjmAzAauQ/O
 G/LHqtNBTtMV5HfLqhLxc5AIyA0nojqExfW+mU5kiTOBRmO8mYafsijhf1zdvf3+a+
 9i11lAj01mx8nuiVj3R91baTa8gkSItMXFk58WRPVK4h4hW9vDXZXUeBZMcd0vIddr
 Dh1hIr4h4ZZHw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, spujar@nvidia.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, atalambedu@nvidia.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

CgpPbiAxLzI0LzIwMjAgNzozNCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IEV4dGVybmFs
IGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4KPgo+IDI0
LjAxLjIwMjAgMTI6NTEsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4gT24gMjQvMDEvMjAyMCAw
OTowNywgSm9uIEh1bnRlciB3cm90ZToKPj4+IE9uIDIzLzAxLzIwMjAgMTU6MTYsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPj4+PiAyMy4wMS4yMDIwIDEyOjIyLCBTYW1lZXIgUHVqYXIg0L/QuNGI
0LXRgjoKPj4+Pj4KPj4+Pj4gT24gMS8yMi8yMDIwIDk6NTcgUE0sIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+Pj4+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1dGlvbiBvcGVuaW5nIGxpbmtzIG9y
IGF0dGFjaG1lbnRzCj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IDIyLjAxLjIwMjAgMTQ6NTIsIEpvbiBI
dW50ZXIg0L/QuNGI0LXRgjoKPj4+Pj4+PiBPbiAyMi8wMS8yMDIwIDA3OjE2LCBTYW1lZXIgUHVq
YXIgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiAuLi4KPj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiArc3Rh
dGljIGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+Pj4+ICsgICAgIHBtX3J1bnRpbWVfZGlzYWJs
ZSgmcGRldi0+ZGV2KTsKPj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgaWYgKCFwbV9ydW50aW1lX3N0YXR1
c19zdXNwZW5kZWQoJnBkZXYtPmRldikpCj4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgdGVn
cmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+Pj4+Pj4+Pj4+PiBUaGlz
IGJyZWFrcyBkZXZpY2UncyBSUE0gcmVmY291bnRpbmcgaWYgaXQgd2FzIGRpc2FibGVkIGluIHRo
ZQo+Pj4+Pj4+Pj4+Pj4+IGFjdGl2ZQo+Pj4+Pj4+Pj4+Pj4+IHN0YXRlLiBUaGlzIGNvZGUgc2hv
dWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4KPj4+Pj4+Pj4+Pj4+PiBhYm91
dCB0aGUKPj4+Pj4+Pj4+Pj4+PiB1bnhwZWN0ZWQgUlBNIHN0YXRlIGhlcmUsIGJ1dCBpdCBzaG91
bGRuJ3QgYmUgbmVjZXNzYXJ5Lgo+Pj4+Pj4+Pj4+Pj4gSSBndWVzcyB0aGlzIHdhcyBhZGRlZCBm
b3Igc2FmZXR5IGFuZCBleHBsaWNpdCBzdXNwZW5kIGtlZXBzIGNsb2NrCj4+Pj4+Pj4+Pj4+PiBk
aXNhYmxlZC4KPj4+Pj4+Pj4+Pj4+IE5vdCBzdXJlIGlmIHJlZi1jb3VudGluZyBvZiB0aGUgZGV2
aWNlIG1hdHRlcnMgd2hlbiBydW50aW1lIFBNIGlzCj4+Pj4+Pj4+Pj4+PiBkaXNhYmxlZCBhbmQg
ZGV2aWNlIGlzIHJlbW92ZWQuCj4+Pj4+Pj4+Pj4+PiBJIHNlZSBmZXcgZHJpdmVycyB1c2luZyB0
aGlzIHdheS4KPj4+Pj4+Pj4+Pj4gSXQgc2hvdWxkIG1hdHRlciAoaWYgSSdtIG5vdCBtaXNzaW5n
IHNvbWV0aGluZykgYmVjYXVzZSBSUE0gc2hvdWxkCj4+Pj4+Pj4+Pj4+IGJlIGluCj4+Pj4+Pj4+
Pj4+IGEgd3JlY2tlZCBzdGF0ZSBvbmNlIHlvdSdsbCB0cnkgdG8gcmUtbG9hZCB0aGUgZHJpdmVy
J3MgbW9kdWxlLgo+Pj4+Pj4+Pj4+PiBMaWtlbHkKPj4+Pj4+Pj4+Pj4gdGhhdCB0aG9zZSBmZXcg
b3RoZXIgZHJpdmVycyBhcmUgd3JvbmcuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFtzbmlwXQo+
Pj4+Pj4+Pj4+IE9uY2UgdGhlIGRyaXZlciBpcyByZS1sb2FkZWQgYW5kIFJQTSBpcyBlbmFibGVk
LCBJIGRvbid0IHRoaW5rIGl0Cj4+Pj4+Pj4+Pj4gd291bGQgdXNlCj4+Pj4+Pj4+Pj4gdGhlIHNh
bWUgJ2RldicgYW5kIHRoZSBjb3JyZXNwb25kaW5nIHJlZiBjb3VudC4gRG9lc24ndCBpdCB1c2Ug
dGhlCj4+Pj4+Pj4+Pj4gbmV3Cj4+Pj4+Pj4+Pj4gY291bnRlcnM/Cj4+Pj4+Pj4+Pj4gSWYgUlBN
IGlzIG5vdCB3b3JraW5nIGZvciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUg
dGhlCj4+Pj4+Pj4+Pj4gY2FzZQo+Pj4+Pj4+Pj4+IGZvciBvdGhlcgo+Pj4+Pj4+Pj4+IGRldmlj
ZXMuIFdoYXQgYmVzdCBkcml2ZXIgY2FuIGRvIGlzIHByb2JhYmx5IGRvIGEgZm9yY2Ugc3VzcGVu
ZAo+Pj4+Pj4+Pj4+IGR1cmluZwo+Pj4+Pj4+Pj4+IHJlbW92YWwgaWYKPj4+Pj4+Pj4+PiBhbHJl
YWR5IG5vdCBkb25lLiBJIHdvdWxkIHByZWZlciB0byBrZWVwLCBzaW5jZSBtdWx0aXBsZSBkcml2
ZXJzCj4+Pj4+Pj4+Pj4gc3RpbGwKPj4+Pj4+Pj4+PiBoYXZlIGl0LAo+Pj4+Pj4+Pj4+IHVubGVz
cyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBzby4KPj4+Pj4+Pj4+IEkgdG9vayBhIGNs
b3NlciBsb29rIGFuZCBsb29rcyBsaWtlIHRoZSBjb3VudGVyIGFjdHVhbGx5IHNob3VsZCBiZQo+
Pj4+Pj4+Pj4gcmVzZXQuIFN0aWxsIEkgZG9uJ3QgdGhpbmsgdGhhdCBpdCdzIGEgZ29vZCBwcmFj
dGljZSB0byBtYWtlIGNoYW5nZXMKPj4+Pj4+Pj4+IHVuZGVybmVhdGggb2YgUlBNLCBpdCBtYXkg
c3RyaWtlIGJhY2suCj4+Pj4+Pj4+IElmIFJQTSBpcyBicm9rZW4sIGl0IHByb2JhYmx5IHdvdWxk
IGhhdmUgYmVlbiBjYXVnaHQgZHVyaW5nIGRldmljZQo+Pj4+Pj4+PiB1c2FnZS4KPj4+Pj4+Pj4g
SSB3aWxsIHJlbW92ZSBleHBsaWNpdCBzdXNwZW5kIGhlcmUgaWYgbm8gYW55IGNvbmNlcm5zIGZy
b20gb3RoZXIKPj4+Pj4+Pj4gZm9sa3MuCj4+Pj4+Pj4+IFRoYW5rcy4KPj4+Pj4+PiBJIHJlY2Fs
bCB0aGF0IHRoaXMgd2FzIHRoZSBwcmVmZXJyZWQgd2F5IG9mIGRvaW5nIHRoaXMgZnJvbSB0aGUg
UlBNCj4+Pj4+Pj4gZm9sa3MuIFRlZ3JhMzAgSTJTIGRyaXZlciBkb2VzIHRoZSBzYW1lIGFuZCBT
dGVwaGVuIGhhZCBwb2ludGVkIG1lIHRvCj4+Pj4+Pj4gdGhpcyBhcyBhIHJlZmVyZW5jZS4KPj4+
Pj4+PiBJIGJlbGlldmUgdGhhdCB0aGlzIGlzIG1lYW50IHRvIGVuc3VyZSB0aGF0IHRoZQo+Pj4+
Pj4+IGRldmljZSBpcyBhbHdheXMgcG93ZXJlZC1vZmYgcmVnYXJkbGVzcyBvZiBpdCBSUE0gaXMg
ZW5hYmxlZCBvciBub3QgYW5kCj4+Pj4+Pj4gd2hhdCB0aGUgY3VycmVudCBzdGF0ZSBpcy4KPj4+
Pj4+IFllcywgaXQgd2FzIGtpbmRhIGFjdHVhbCBmb3IgdGhlIGNhc2Ugb2YgdW5hdmFpbGFibGUg
UlBNLgo+Pj4+Pj4gQW55d2F5cywgL0kgdGhpbmsvIHZhcmlhbnQgbGlrZSB0aGlzIHNob3VsZCBo
YXZlIGJlZW4gbW9yZSBwcmVmZXJyZWQ6Cj4+Pj4+Pgo+Pj4+Pj4gaWYgKCFwbV9ydW50aW1lX2Vu
YWJsZWQoJnBkZXYtPmRldikpCj4+Pj4+PiAgICAgICAgICAgdGVncmEyMTBfaTJzX3J1bnRpbWVf
c3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+Pj4+IGVsc2UKPj4+Pj4+ICAgICAgICAgICBwbV9ydW50
aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cj4+Pj4+IEkgdGhpbmsgaXQgbG9va3MgdG8gYmUgc2lt
aWxhciB0byB3aGF0IGlzIHRoZXJlIGFscmVhZHkuCj4+Pj4+Cj4+Pj4+IHBtX3J1bnRpbWVfZGlz
YWJsZSgmcGRldi0+ZGV2KTsgLy8gaXQgd291bGQgdHVybiBvdXQgdG8gYmUgYSBkdW1teSBjYWxs
Cj4+Pj4+IGlmICFSUE0KPj4+Pj4gaWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJnBk
ZXYtPmRldikpIC8vIGl0IGlzIHRydWUgYWx3YXlzIGlmICFSUE0KPj4+Pj4gICAgICAgICAgdGVn
cmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+PiBNYXliZSB0aGlzIGlz
IGZpbmUgZm9yICFSUE0sIGJ1dCBub3QgcmVhbGx5IGZpbmUgaW4gYSBjYXNlIG9mIGVuYWJsZWQK
Pj4+PiBSUE0uIERldmljZSBjb3VsZCBiZSBpbiByZXN1bWVkIHN0YXRlIGFmdGVyIHBtX3J1bnRp
bWVfZGlzYWJsZSgpIGlmIGl0Cj4+Pj4gd2Fzbid0IHN1c3BlbmRlZCBiZWZvcmUgdGhlIGRpc2Fi
bGluZy4KPj4+IEkgZG9uJ3Qgc2VlIGFueSBwcm9ibGVtIHdpdGggdGhpcyBmb3IgdGhlICFSUE0g
Y2FzZS4KPj4gU29ycnkgSSBtZWFudCB0aGUgUlBNIGNhc2UuIEluIG90aGVyIHdvcmRzLCBJIGRv
bid0IHNlZSBhIHByb2JsZW0gZm9yCj4+IG5laXRoZXIgdGhlIFJQTSBjYXNlIG9mIHRoZSAhUlBN
IGNhc2UuCj4gMS4gRGV2aWNlIHNoYWxsIGJlIGluIFJQTS1zdXNwZW5kZWQgc3RhdGUgYXQgdGhl
IHRpbWUgb2YgZHJpdmVyJ3MKPiByZW1vdmFsLCB1bmxlc3MgdGhlcmUgaXMgYSBidWcgaW4gdGhl
IHNvdW5kIGRyaXZlci4gSGVuY2Ugd2h5IGRvIHlvdQo+IG5lZWQgdGhlIGRlYWQgY29kZSB3aGlj
aCBkb2Vzbid0IGJyaW5nIGFueSBwcmFjdGljYWwgdmFsdWU/Cj4KPiAyLiBNYWtpbmcgY2hhbmdl
cyB1bmRlcm5lYXRoIG9mIFJQTSBpcyBzaW1wbHkgZXJyb3ItcHJvbmUuIEl0IG1heSBoaXQKPiBi
YWRseSBpbiB0aGUgZnV0dXJlIG9uY2Ugc29tZXRoaW5nIHdpbGwgY2hhbmdlIGluIHRoZSBSUE0g
Y29yZS4KCkkgdGhpbmsgd2UgYXJlIHN0cmV0Y2hpbmcgYSBiaXQgbW9yZSBoZXJlIHdoZW4gdGhl
cmUgaXMgbm8gYW55IHJlYWwgaGFybS4KUmlnaHQgbm93IGl0IHdvcmtzIHdlbGwgZm9yIGJvdGgg
UlBNIGFuZCAhUlBNIGNhc2UgYW5kIGlmIHdlIHJlYWxseSBuZWVkIHRvCmZpeCBzb21ldGhpbmcg
aW4gZnV0dXJlIHdlIGNhbiBmaXguIFNpbmNlIG15IGluaXRpYWwgaW5jbGluYXRpb24gd2FzIGtl
ZXBpbmcKdGhlIGNvZGUgYXMgaXQgaXMgYW5kIEpvbiBhbHNvIGhhcyBzaW1pbGFyIHRob3VnaHRz
LCBJIHdvdWxkIHJldGFpbiB0aGlzIApjb2RlLgpTb3JyeSBEbWl0cnksIHdlIGNhbiBmaXggaWYg
c29tZXRoaW5nIGNvbWVzIHVwIGFuZCBtYW55IG90aGVyIGRyaXZlcnMgd291bGQKbmVlZCB0aGlz
IGF0IHRoYXQgdGltZS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
