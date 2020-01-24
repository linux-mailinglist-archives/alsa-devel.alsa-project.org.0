Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40147147A09
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 10:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A38D166F;
	Fri, 24 Jan 2020 10:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A38D166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579856964;
	bh=NcGkf0PE5e1m32HCwcT/1TWBHdjbIr/MAL1oMHFvDWM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEvSrCtYSmDlzd5zFXix8CzxLg9QlDb/iEKjf+77r7OpwNW3ZJB+RjBmSaJO1H83u
	 +eW0Ts5JI1ETG7i93IH7pEDeRT1Pyk+qJip3+Qey5ArglVWEUc0rIT6uKvSd3QKgYK
	 753K3PuXi4/aq6s8t73LW77d3KCHDWOTNrXIPScQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF34DF8020C;
	Fri, 24 Jan 2020 10:07:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A582F8020C; Fri, 24 Jan 2020 10:07:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C71F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 10:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C71F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QwVgTRUk"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2ab3a20000>; Fri, 24 Jan 2020 01:06:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 24 Jan 2020 01:07:32 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 24 Jan 2020 01:07:32 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 09:07:24 +0000
To: Dmitry Osipenko <digetx@gmail.com>, Sameer Pujar <spujar@nvidia.com>
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
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9f73afdf-1e9a-cdbd-f972-a022d503ef51@nvidia.com>
Date: Fri, 24 Jan 2020 09:07:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b5c581b9-17af-d004-33fb-2cc782ab820a@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579856806; bh=7aoEWgOMrsENsyCSERE4iOvClQ10ZBvAeKGx7j04F0Y=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QwVgTRUkTeKYuVdIF7IWb8Lx6v4QxDRL3CI5bRnrYOJwXFYDVgMmPs5XFiEQ0Qfk4
 wqx0DGl28wvYoC4xC0tkZah++mlIsfR8UrL12MvIgBntdJ0oA57208JrBcXNZRb2xF
 bxrjLt4MAxLDlMn5/rcnn5er2CGH8stTdmDBAOImYAtrUnk2DOBgU7xWuuOyBrqesr
 rOkiqEckCbQJwpbwZgu+MuDnK2VVPRFAAitb253LPKwCb3SFyUV1vjYzXrw2hosS7R
 MZciu+P9Zy8jm+skB8HZ97Q2LK9OiU77dRSKfnIM4aQj72Mnb7bHsjN/hOgGr6jHGA
 KVmJjRE4Uf0dA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, atalambedu@nvidia.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Ck9uIDIzLzAxLzIwMjAgMTU6MTYsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAyMy4wMS4yMDIw
IDEyOjIyLCBTYW1lZXIgUHVqYXIg0L/QuNGI0LXRgjoKPj4KPj4KPj4gT24gMS8yMi8yMDIwIDk6
NTcgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IEV4dGVybmFsIGVtYWlsOiBVc2UgY2F1
dGlvbiBvcGVuaW5nIGxpbmtzIG9yIGF0dGFjaG1lbnRzCj4+Pgo+Pj4KPj4+IDIyLjAxLjIwMjAg
MTQ6NTIsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4+PiBPbiAyMi8wMS8yMDIwIDA3OjE2LCBT
YW1lZXIgUHVqYXIgd3JvdGU6Cj4+Pj4KPj4+PiAuLi4KPj4+Pgo+Pj4+Pj4+Pj4+PiArc3RhdGlj
IGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+
Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCBwbV9ydW50aW1lX2Rpc2FibGUoJnBk
ZXYtPmRldik7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1
c3BlbmRlZCgmcGRldi0+ZGV2KSkKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0ZWdyYTIxMF9pMnNfcnVudGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+Pj4+Pj4+Pj4+IFRo
aXMgYnJlYWtzIGRldmljZSdzIFJQTSByZWZjb3VudGluZyBpZiBpdCB3YXMgZGlzYWJsZWQgaW4g
dGhlCj4+Pj4+Pj4+Pj4gYWN0aXZlCj4+Pj4+Pj4+Pj4gc3RhdGUuIFRoaXMgY29kZSBzaG91bGQg
YmUgcmVtb3ZlZC4gQXQgbW9zdCB5b3UgY291bGQgd2Fybgo+Pj4+Pj4+Pj4+IGFib3V0IHRoZQo+
Pj4+Pj4+Pj4+IHVueHBlY3RlZCBSUE0gc3RhdGUgaGVyZSwgYnV0IGl0IHNob3VsZG4ndCBiZSBu
ZWNlc3NhcnkuCj4+Pj4+Pj4+PiBJIGd1ZXNzIHRoaXMgd2FzIGFkZGVkIGZvciBzYWZldHkgYW5k
IGV4cGxpY2l0IHN1c3BlbmQga2VlcHMgY2xvY2sKPj4+Pj4+Pj4+IGRpc2FibGVkLgo+Pj4+Pj4+
Pj4gTm90IHN1cmUgaWYgcmVmLWNvdW50aW5nIG9mIHRoZSBkZXZpY2UgbWF0dGVycyB3aGVuIHJ1
bnRpbWUgUE0gaXMKPj4+Pj4+Pj4+IGRpc2FibGVkIGFuZCBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+
Pj4+Pj4+IEkgc2VlIGZldyBkcml2ZXJzIHVzaW5nIHRoaXMgd2F5Lgo+Pj4+Pj4+PiBJdCBzaG91
bGQgbWF0dGVyIChpZiBJJ20gbm90IG1pc3Npbmcgc29tZXRoaW5nKSBiZWNhdXNlIFJQTSBzaG91
bGQKPj4+Pj4+Pj4gYmUgaW4KPj4+Pj4+Pj4gYSB3cmVja2VkIHN0YXRlIG9uY2UgeW91J2xsIHRy
eSB0byByZS1sb2FkIHRoZSBkcml2ZXIncyBtb2R1bGUuCj4+Pj4+Pj4+IExpa2VseQo+Pj4+Pj4+
PiB0aGF0IHRob3NlIGZldyBvdGhlciBkcml2ZXJzIGFyZSB3cm9uZy4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gW3NuaXBdCj4+Pj4+Pj4gT25jZSB0aGUgZHJpdmVyIGlzIHJlLWxvYWRlZCBhbmQgUlBNIGlz
IGVuYWJsZWQsIEkgZG9uJ3QgdGhpbmsgaXQKPj4+Pj4+PiB3b3VsZCB1c2UKPj4+Pj4+PiB0aGUg
c2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVmIGNvdW50LiBEb2Vzbid0IGl0IHVz
ZSB0aGUKPj4+Pj4+PiBuZXcKPj4+Pj4+PiBjb3VudGVycz8KPj4+Pj4+PiBJZiBSUE0gaXMgbm90
IHdvcmtpbmcgZm9yIHNvbWUgcmVhc29uLCBtb3N0IGxpa2VseSBpdCB3b3VsZCBiZSB0aGUKPj4+
Pj4+PiBjYXNlCj4+Pj4+Pj4gZm9yIG90aGVyCj4+Pj4+Pj4gZGV2aWNlcy4gV2hhdCBiZXN0IGRy
aXZlciBjYW4gZG8gaXMgcHJvYmFibHkgZG8gYSBmb3JjZSBzdXNwZW5kCj4+Pj4+Pj4gZHVyaW5n
Cj4+Pj4+Pj4gcmVtb3ZhbCBpZgo+Pj4+Pj4+IGFscmVhZHkgbm90IGRvbmUuIEkgd291bGQgcHJl
ZmVyIHRvIGtlZXAsIHNpbmNlIG11bHRpcGxlIGRyaXZlcnMKPj4+Pj4+PiBzdGlsbAo+Pj4+Pj4+
IGhhdmUgaXQsCj4+Pj4+Pj4gdW5sZXNzIHRoZXJlIGlzIGEgcmVhbCBoYXJtIGluIGRvaW5nIHNv
Lgo+Pj4+Pj4gSSB0b29rIGEgY2xvc2VyIGxvb2sgYW5kIGxvb2tzIGxpa2UgdGhlIGNvdW50ZXIg
YWN0dWFsbHkgc2hvdWxkIGJlCj4+Pj4+PiByZXNldC4gU3RpbGwgSSBkb24ndCB0aGluayB0aGF0
IGl0J3MgYSBnb29kIHByYWN0aWNlIHRvIG1ha2UgY2hhbmdlcwo+Pj4+Pj4gdW5kZXJuZWF0aCBv
ZiBSUE0sIGl0IG1heSBzdHJpa2UgYmFjay4KPj4+Pj4gSWYgUlBNIGlzIGJyb2tlbiwgaXQgcHJv
YmFibHkgd291bGQgaGF2ZSBiZWVuIGNhdWdodCBkdXJpbmcgZGV2aWNlCj4+Pj4+IHVzYWdlLgo+
Pj4+PiBJIHdpbGwgcmVtb3ZlIGV4cGxpY2l0IHN1c3BlbmQgaGVyZSBpZiBubyBhbnkgY29uY2Vy
bnMgZnJvbSBvdGhlcgo+Pj4+PiBmb2xrcy4KPj4+Pj4gVGhhbmtzLgo+Pj4+IEkgcmVjYWxsIHRo
YXQgdGhpcyB3YXMgdGhlIHByZWZlcnJlZCB3YXkgb2YgZG9pbmcgdGhpcyBmcm9tIHRoZSBSUE0K
Pj4+PiBmb2xrcy4gVGVncmEzMCBJMlMgZHJpdmVyIGRvZXMgdGhlIHNhbWUgYW5kIFN0ZXBoZW4g
aGFkIHBvaW50ZWQgbWUgdG8KPj4+PiB0aGlzIGFzIGEgcmVmZXJlbmNlLgo+Pj4+IEkgYmVsaWV2
ZSB0aGF0IHRoaXMgaXMgbWVhbnQgdG8gZW5zdXJlIHRoYXQgdGhlCj4+Pj4gZGV2aWNlIGlzIGFs
d2F5cyBwb3dlcmVkLW9mZiByZWdhcmRsZXNzIG9mIGl0IFJQTSBpcyBlbmFibGVkIG9yIG5vdCBh
bmQKPj4+PiB3aGF0IHRoZSBjdXJyZW50IHN0YXRlIGlzLgo+Pj4gWWVzLCBpdCB3YXMga2luZGEg
YWN0dWFsIGZvciB0aGUgY2FzZSBvZiB1bmF2YWlsYWJsZSBSUE0uCj4+Cj4+PiBBbnl3YXlzLCAv
SSB0aGluay8gdmFyaWFudCBsaWtlIHRoaXMgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIHByZWZlcnJl
ZDoKPj4+Cj4+PiBpZiAoIXBtX3J1bnRpbWVfZW5hYmxlZCgmcGRldi0+ZGV2KSkKPj4+IMKgwqDC
oMKgwqDCoMKgwqAgdGVncmEyMTBfaTJzX3J1bnRpbWVfc3VzcGVuZCgmcGRldi0+ZGV2KTsKPj4+
IGVsc2UKPj4+IMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYp
Owo+Pgo+PiBJIHRoaW5rIGl0IGxvb2tzIHRvIGJlIHNpbWlsYXIgdG8gd2hhdCBpcyB0aGVyZSBh
bHJlYWR5Lgo+Pgo+PiBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7IC8vIGl0IHdvdWxk
IHR1cm4gb3V0IHRvIGJlIGEgZHVtbXkgY2FsbAo+PiBpZiAhUlBNCj4+IGlmICghcG1fcnVudGlt
ZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKSAvLyBpdCBpcyB0cnVlIGFsd2F5cyBpZiAh
UlBNCj4+IMKgwqDCoMKgwqDCoMKgIHRlZ3JhMjEwX2kyc19ydW50aW1lX3N1c3BlbmQoJnBkZXYt
PmRldik7Cj4gCj4gTWF5YmUgdGhpcyBpcyBmaW5lIGZvciAhUlBNLCBidXQgbm90IHJlYWxseSBm
aW5lIGluIGEgY2FzZSBvZiBlbmFibGVkCj4gUlBNLiBEZXZpY2UgY291bGQgYmUgaW4gcmVzdW1l
ZCBzdGF0ZSBhZnRlciBwbV9ydW50aW1lX2Rpc2FibGUoKSBpZiBpdAo+IHdhc24ndCBzdXNwZW5k
ZWQgYmVmb3JlIHRoZSBkaXNhYmxpbmcuCgpJIGRvbid0IHNlZSBhbnkgcHJvYmxlbSB3aXRoIHRo
aXMgZm9yIHRoZSAhUlBNIGNhc2UuCgpKb24KCi0tIApudnB1YmxpYwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
