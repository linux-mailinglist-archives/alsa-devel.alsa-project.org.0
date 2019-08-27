Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25E9E71D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 13:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED64166D;
	Tue, 27 Aug 2019 13:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED64166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566906925;
	bh=M1GNRihWKNk7capxYZwLvQedn72GuBj3o2EXxGKIwZA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAcxtYTAZT02lP7d0059UnF92sf7OrIKZq/cDzNSgGs1lwyU1casldPgEW/1EWZvt
	 3eNLWVsAvsWu+z7VHSbFPwiLFypNxMggN7F5I3zU/Lk6jSAfrfSf01Jr0F/P8NTuVv
	 bsrBKAEGJ+OAE0I3ZsGQWYr9EMq3f0eYKIhky1Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61528F80274;
	Tue, 27 Aug 2019 13:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD25F80274; Tue, 27 Aug 2019 13:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9FE7F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 13:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9FE7F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 04:53:29 -0700
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="331795455"
Received: from unknown (HELO [10.237.149.85]) ([10.237.149.85])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 27 Aug 2019 04:53:25 -0700
To: "Jie, Yang" <yang.jie@intel.com>
References: <CACJJ=pxPm7dRUE534hDWy2tN3dGYDyrgU8JKqett=wOQx+nWCQ@mail.gmail.com>
 <39533fe5-c060-7a07-c910-74b83eee53c4@linux.intel.com>
 <ac7bcb42e40ac12d9924fd65c3e2c68b9b11b093.camel@linux.intel.com>
 <37ede7ea-e760-eac9-a1d5-0eb8e3bff3cb@linux.intel.com>
 <CACJJ=pyb==xWqKMB-gAzW7-FCFgEU7Rm+b-CL-ANO-eorDKy=A@mail.gmail.com>
 <356b3f4eacb43f23c40c4cd8e3c54ae9514a34c6.camel@linux.intel.com>
 <7e08e45d-7cec-9fdd-36c5-5e82632968f8@linux.intel.com>
 <CACJJ=pzcMCaOvHMVhmYKKL2Z45-XdrBB9FT8VjSzX_obVtKzyw@mail.gmail.com>
 <d80c2f4d-b5f4-5bbe-9529-36b9859ab8be@linux.intel.com>
 <CACJJ=pxokT5z+U=nM9QcUVxCk84998ugM5J89U28k=CVGMjG=w@mail.gmail.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC567@SHSMSX106.ccr.corp.intel.com>
 <d0131c02-3477-8390-e0c6-b37b142169e8@intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A9606FC9AE@SHSMSX106.ccr.corp.intel.com>
 <fe0d4511-aecd-bee5-c491-4a093a14110e@intel.com>
From: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
Message-ID: <40cdda08-d5fe-7415-b0d6-f10bf79f0282@linux.intel.com>
Date: Tue, 27 Aug 2019 13:53:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe0d4511-aecd-bee5-c491-4a093a14110e@intel.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "benzh@chromium.org" <benzh@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>,
 Jon Flatley <jflat@chromium.org>
Subject: Re: [alsa-devel] [BUG] bdw-rt5650 DSP boot timeout
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

T24gOC8yMi8xOSA1OjI5IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0wOC0y
MCAwNDoxMSwgSmllLCBZYW5nIHdyb3RlOgo+Pgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPj4+IEZyb206IFJvamV3c2tpLCBDZXphcnkKPj4+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAy
MCwgMjAxOSAyOjA5IEFNCj4+PiBUbzogSmllLCBZYW5nIDx5YW5nLmppZUBpbnRlbC5jb20+OyBK
b24gRmxhdGxleSAKPj4+IDxqZmxhdEBjaHJvbWl1bS5vcmc+OyBQaWVycmUtCj4+PiBMb3VpcyBC
b3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Cj4+PiBDYzogYmVu
emhAY2hyb21pdW0ub3JnOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IEppZSBZYW5nCj4+
PiA8eWFuZy5qaWVAbGludXguaW50ZWwuY29tPjsgUmFuamFuaSBTcmlkaGFyYW4KPj4+IDxyYW5q
YW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+OyBjdWpvbWFsYWluZXlAY2hyb21pdW0ub3Jn
Cj4+PiBTdWJqZWN0OiBSZTogW2Fsc2EtZGV2ZWxdIFtCVUddIGJkdy1ydDU2NTAgRFNQIGJvb3Qg
dGltZW91dAo+Pj4KPj4+IE9uIDIwMTktMDgtMTkgMDQ6MzMsIEppZSwgWWFuZyB3cm90ZToKPj4+
Pgo+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+Pj4+PiBGcm9tOiBKb24gRmxhdGxl
eSBbbWFpbHRvOmpmbGF0QGNocm9taXVtLm9yZ10KPj4+Pj4gU2VudDogVGh1cnNkYXksIEF1Z3Vz
dCAxNSwgMjAxOSA1OjI1IEFNCj4+Pj4+IFRvOiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJl
LWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgo+Pj4+PiBDYzogSm9uIEZsYXRsZXkgPGpm
bGF0QGNocm9taXVtLm9yZz47IEppZSwgWWFuZyA8eWFuZy5qaWVAaW50ZWwuY29tPjsKPj4+Pj4g
YmVuemhAY2hyb21pdW0ub3JnOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IFJhbmphbmkg
U3JpZGhhcmFuCj4+Pj4+IDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+OyBjdWpv
bWFsYWluZXlAY2hyb21pdW0ub3JnOyBKaWUKPj4+Pj4gWWFuZyA8eWFuZy5qaWVAbGludXguaW50
ZWwuY29tPgo+Pj4+PiBTdWJqZWN0OiBSZTogW2Fsc2EtZGV2ZWxdIFtCVUddIGJkdy1ydDU2NTAg
RFNQIGJvb3QgdGltZW91dAo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAxOjUx
IFBNIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtCj4+Pj4+IGxvdWlzLmJvc3NhcnRAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+IFRoZXJlIHNlZW1zIHRv
IGJlIGFuIGlzc3VlIHdoZW4gc3VzcGVuZGluZyB0aGUgQUxDNTY1MC4gSSB0aGluayB0aGUKPj4+
Pj4+PiBub25kZXRlcm1pbmlzdGljIGJlaGF2aW9yIEkgd2FzIHNlZWluZyBqdXN0IGhhZCB0byBk
byB3aXRoIHdoZXRoZXIKPj4+Pj4+PiBvciBub3QgdGhlIERTUCBoYWQgeWV0IHN1c3BlbmRlZC4K
Pj4+Pj4+Pgo+Pj4+Pj4+IEkgcmV2ZXJ0ZWQgY29tbWl0IDBkMjEzNWVjYWRiMCAoIkFTb0M6IElu
dGVsOiBXb3JrIGFyb3VuZCB0byBmaXggSFcKPj4+Pj4+PiBEMyBwb3RlbnRpYWwgY3Jhc2ggaXNz
dWUiKSBhbmQgdGhpbmdzIHN0YXJ0ZWQgd29ya2luZywgaW5jbHVkaW5nCj4+Pj4+Pj4gc3VzcGVu
ZC9yZXN1bWUgb2YgdGhlIERTUC4gQW55IGlkZWFzIGZvciB3aHkgdGhpcyBtYXkgYmU/IEkgd291
bGQKPj4+Pj4+PiBsaWtlIHRvIHJlc29sdmUgdGhpcyBzbyBJIGNhbiBmaW5pc2ggdXBzdHJlYW1p
bmcgdGhlIGJkdy1ydDU2NTAKPj4+Pj4+PiBtYWNoaW5lIGRyaXZlci4KPj4+Pj4+Cj4+Pj4+PiBD
b3B5aW5nIEtleW9uIGluIGNhc2UgaGUgcmVtZW1iZXJzIHRoZSBjb250ZXh0Lgo+Pj4+Pj4KPj4+
Pj4+IFJldmVydGluZyBhIDV5ci1vbGQgY29tbWl0IHdpdGggYWxsIHNvcnRzIG9mIGNsb2NrL3Bv
d2VyLXJlbGF0ZWQKPj4+Pj4+IGZpeGVzIGxvb2tzIGJyYXZlLCBhbmQgaXQncyBub3QgY2xlYXIg
d2h5IHRoaXMgd291bGQgd29yayB3aXRoIHRoZQo+Pj4+Pj4gcnQ1Njc3IGFuZCBub3Qgd2l0aCA1
NjUwLgo+Pj4+Pgo+Pj4+PiBObyBpZGVhLCBJIHdhcyBqdXN0IGRpZmZpbmcgdGhlIHJlZ2lzdGVy
IHdyaXRlcyBsb29raW5nIGZvciAKPj4+Pj4gc291cmNlcyBvZgo+Pj4gZGlzY3JlcGFuY3kuCj4+
Pj4+IFRoZSBDaHJvbWl1bSBPUyAzLjE0IGtlcm5lbCB0cmVlIHRoYXQgQnVkZHkgdXNlcyBkb2Vz
bid0IGhhdmUgdGhpcwo+Pj4+PiBwYXRjaCwgc28gSSBmaWd1cmVkIHdoYXQncyB0aGUgd29yc3Qg
dGhhdCBjb3VsZCBoYXBwZW4/Cj4+Pj4KPj4+PiBIaSBKb24sIHNvcnJ5IGFib3V0IGp1c3Qgbm90
aWNpbmcgdGhpcyB0aHJlYWQuCj4+Pj4gwqAgRnJvbSB0aGUgZG1lc2cgbG9nLCB0aGUgaXNzdWUg
aGFwcGVucyBhdCBydW50aW1lIHN1c3BlbmQvcmVzdW1lIAo+Pj4+IGJ1dCBub3QKPj4+IGluIGJv
b3QsIGFtIEkgcmlnaHQoeW91IGNhbiBkaXNhYmxlIHJ1bnRpbWUgUE0gZm9yIHRoZSBkZXZpY2Ug
dG8gCj4+PiBjb25maXJtIHRoYXQpPwo+Pj4+Cj4+Pj4gTXkgcG9pbnRzIGhlcmUgYXJlOgo+Pj4+
IDEuIHRoZSBjb21taXQgMGQyMTM1ZWNhZGIwIHdhcyBzdWdnZXN0ZWQgYnkgRlcgdGVhbSB0byBX
L0EgRDMKPj4+IHBvdGVudGlhbCBjcmFzaCBpc3N1ZS4KPj4+PiAyLiBpdCB3YXMgdmVyaWZpZWQg
d2l0aCBydDI4NihCcm9hZHdlbGwuYywgZS5nLiBEZWxsIFhQUykgZnJvbSBvdXIgCj4+Pj4gc2lk
ZQo+Pj4gb25seShhbmQgbWF5IGhhdmUgYmVlbiBjaGVja2VkIHdpdGggcnQ1Njc3IGJ5IENocm9t
ZSB0ZWFtKS4KPj4+PiAzLiBwbGVhc2UgZm9sbG93IHNlcXVlbmNlIGluIGJyb2Fkd2VsbC5jIGlm
IGlzc3VlIGhhcHBlbiBhdCBib290IHRpbWUuCj4+Pj4gSWYgaGFwcGVuZWQgYXQgcnVudGltZSBQ
TSBmcm9tIERTUCBzaWRlLCB3ZSBzaG91bGQgc2VlIGl0IHdpdGggYWxsIAo+Pj4+IGtpbmRzIG9m
Cj4+PiBtYWNoaW5lIGRyaXZlci4KPj4+PiBDb3VsZCB5b3UgcGVyZm9ybWluZyBtb3JlIHRlc3Qg
YW5kIGRlYnVnZ2luZyB0byBzZWUgd2hhdCBpdCByZWFsIAo+Pj4+IGhhcHBlbgo+Pj4gdGhlcmU/
Cj4+Pj4gNC4gd2UgaGF2ZSBubyByZWFzb24gdG8gcmVtb3ZlIHRoZSBjb21taXQgZGlyZWN0bHks
IGV4Y2VwdCAKPj4+PiBjb3JyZWN0aW5nIGlmCj4+PiBzb21lIGxpbmVzIGFyZSBwcm92ZWQgd3Jv
bmcuIEFuZCwgYXMgUGllcnJlIG1lbnRpb25lZCwgU09GIGRyaXZlciBpcwo+Pj4gcHJlZmVycmVk
LCBhcyB0aGVyZSBpcyBubyBuZXcgZGV2ZWxvcG1lbnQgZWZmb3J0IHRvIHN1cHBvcnQgU1NUCj4+
PiBoYXN3ZWxsL0Jyb2Fkd2VsbCBkcml2ZXIgaGVyZShubyBwbGF0Zm9ybSwgbm8gZGV2ZWxvcGVy
LCA6LSggKS4KPj4+Pgo+Pj4+IFRoYW5rcywKPj4+PiB+S2V5b24+Cj4+Pgo+Pj4gR290IHRvIGRp
c2FncmVlIHdpdGggdGhlIGxhc3Qgb25lIC0gbm8gcGxhdGZvcm0sIG5vIGRldmVsb3Blci4KPj4+
IFdlIGFyZSBzZXR0aW5nIHVwIHNvbWUgQkRXLyBIU1cgaGVyZSB0byBqb2luIG91ciBoYXBweSBT
S0wrIGZhbWlseSAKPj4+IGluIENJLgo+Pj4gVGhpcyBpcyBiZWNhdXNlIG9mIC9jb21tb24gY2xl
YW51cHMgd2hpY2ggd2lsbCBlbmd1bGYgYURTUCBwcm9qZWN0Cj4+PiAoaHN3L2J5dCkgb2J2aW91
c2x5Lgo+Pgo+PiBZZXMsIHRoYXQncyB0cnVlLCBnb29kIHRvIGhlYXIgdGhhdCB5b3Ugd2lsbCBh
ZGQgaXQgdG8gQ0kuCj4+Cj4+Pgo+Pj4gVGhlc2Ugd2lsbCBiZSB0ZXN0ZWQgYWdhaW5zdCB0aGUg
ZXhhY3Qgc2FtZSBCQVQgc2NvcGUgYXMgb3RoZXIgQURTUCAKPj4+IGRldmljZXMuCj4+PiBDb2Rl
IGhlcmUgbG9va3MgbXVjaCBiZXR0ZXIsIGF0IGxlYXN0IGNvbXBhcmVkIHRvIC9za3lsYWtlIC0g
YWluJ3QgYSAKPj4+IGhpZ2gKPj4+IHRocmVzaG9sZCB0aG91Z2guLiBHaXZlbiBob3cgb3V0ZGF0
ZWQgYWxsIFNLTCsgZncgYmluYXJpZXMgYXJlIChvbiAKPj4+IHVwc3RyZWFtCj4+PiByZXBvKSBp
dCBtaWdodCBldmVuIGNvbWUgZG93biBzaW1wbHkgdG8gZncgdXBncmFkZS4KPj4+IE1vc3Qgb2Yg
RlcgcGVwcyB3aG8gdG9vayBwYXJ0IGluIHRoYXQgcHJvamVjdCBhcmUgYWxyZWFkeSBvdXQuIAo+
Pj4gQWx0aG91Z2gsCj4+PiBmb3VuZCBvbmUgb3IgdHdvIHdobyBhcmUgd2lsbGluZyB0byBoZWxw
IDogKQo+Pgo+PiBJIHJlbWVtYmVyIFBhd2VsIFBpc2tvcnNraSBhbmQgTWFyY2luIEJhcmxpayBo
ZWxwZWQgbWUgZnJvbSB0aGUgRlcgCj4+IHNpZGUoaW5jbHVkaW5nIGV4cGxhaW5pbmcgYWJvdXQg
dGhlIFMwPC0+UzMgc2VxdWVuY2UpLCBwbGVhc2UgY29udGFjdCAKPj4gbWUgb2ZmbGluZSBpZiBu
ZWVkZWQsIEkgd2lsbCB0cnkgdG8gZHJhZyBmb3Igc29tZSBtYWlscyB3aGljaCBJIGdvdCA1IAo+
PiB5ZWFycyBiYWNrLgo+Pgo+PiBUaGFua3MsCj4+IH5LZXlvbgo+Pgo+Cj4gUGxlYXNlIGRvIG5v
dCBuYW1lIHBlb3BsZSBvbiBvZmZpY2lhbCBsaXN0IHVubGVzcyB5b3UgYXJlIDEwMCUgc3VyZSAK
PiBhYm91dCB0aGVpciBlbmdhZ2VtZW50IGluIGxpbnV4IHNvbHV0aW9ucywgd2hpY2ggZm9yIGJv
dGggaW5kaXZpZHVhbHMgCj4geW91IGhhdmUgbGlzdGVkLCBpcyBubyBsb25nZXIgdGhlIGNhc2Uu
IEFueSByZWNvbW1lbmRhdGlvbnM/IC0geW91IGNhbiAKPiBwcm92aWRlIGludGVybmFsbHkuCj4K
PiBBbnl3YXksIEkndmUgY29udGFjdGVkIE1hcmNpbiBhbmQgb25jZSBoZSBpcyBhdmFpbGFibGUs
IHdlIHdpbGwgcmV2aWV3IAo+IHRoZSBwYXRjaCB0b2dldGhlci4gTm90ZSwgdGhhdCBJJ20gYSBJ
R0sgZHdlbGxlciB0b28sIHNvIGl0J3MgaGlnaGx5IAo+IHByb2JhYmxlIHdob21ldmVyIHlvdSBo
YWQgaW4gbWluZCBJJ3ZlIGVpdGhlciBhbHJlYWR5IG1ldCBvciBkcmFuayBhIAo+IGJlZXIgd2l0
aC4KPgo+IEN6YXJlawo+Cj4+Pgo+Pj4gQW5kIHllcywgSSdtIHNldHRpbmcgdGhlbSB1cCB3aXRo
IHJ0Mjg2IHRvby4gVGhlcmUgYXJlIHNvbWUgcnQ1NlhYIAo+Pj4gYnV0IEknbQo+Pj4gdW5zdXJl
IGlmIHJ0NTY1MCBpcyBhbW91bnQgdGhlbS4KPj4+IFN0aWxsIGdvdCBzb21lIHByb2JsZW1zIHdp
dGggQUNQSSwgYnV0IHNvb24gdHdvIG5ldyBmYWNlcyBzaG91bGQgYmUgCj4+PiBncmVldGluZwo+
Pj4gYXVkaW8gQ0kgYm9uZmlyZS4uCj4+Pgo+Pj4gQ3phcmVrCj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFy
ZSB5b3UgdXNpbmcgdGhlIGxhdGVzdCB1cHN0cmVhbSBmaXJtd2FyZSBidHc/IE9yIHRoZSBvbmUg
d2hpY2gKPj4+Pj4+IHNoaXBwZWQgd2l0aCB0aGUgaW5pdGlhbCBkZXZpY2UgKHdoaWNoIGNvdWxk
IGJlIGFuIGlzc3VlIGlmIHRoZQo+Pj4+Pj4gcHJvdG9jb2wKPj4+Pj4gY2hhbmdlZCkuCj4+Pj4+
Cj4+Pj4+IFRoZSBmaXJtd2FyZSBJJ20gbG9hZGluZyBpczogYEZXIGluZm86IHR5cGUgMDEsIC0g
dmVyc2lvbjogMDAuMDAsCj4+Pj4+IGJ1aWxkIDc3LCBzb3VyY2UgY29tbWl0IGlkOiA4NzZhYzY5
MDZmMzFhNDNiNjc3MmIyM2M3Yzk4M2NlOWRjYjE4YTFgLgo+Pj4+PiBIYXNoZXMgdGhlIHNhbWUg
YXMgdGhlIHVwc3RyZWFtIGJpbmFyeS4KCkkgZG9uJ3QgaGF2ZSBhIHNwZWNpZmllZCBjb2RlYyBm
b3IgdGVzdGluZyBzbyBJIHRyaWVkIHdpdGggcnQyODYuIEkgd2FzIApub3QgYWJsZSB0byByZXBy
b2R1Y2UgdGhpcyBpc3N1ZS4gQ291bGQgeW91IGNvbGxlY3QgbG9ncyhkbWVzZykgd2l0aCAKZW5h
YmxlZCBkZWJ1ZyBsaWtlIGJlbG93IGZvciBTMyBvciBlbmFibGVkIGRlYnVnIGR1cmluZyBidWls
ZCBmb3IgCnJlc3RpbmcgcmVib290IHNjZW5hcmlvPwplY2hvIC1uICdtb2R1bGXCoCBzbmQqICtw
JyB8wqAgZGQgb2Y9L3N5cy9rZXJuZWwvZGVidWcvZHluYW1pY19kZWJ1Zy9jb250cm9sClNpbmNl
IGVuYWJsaW5nIGRlYnVnIGRlY3JlYXNlcyBwcm9ibGVtIG9jY3VycmVuY2UgcmF0aW8gcGxlYXNl
IGFsc28gCmNoZWNrIGJlbG93IGNoYW5nZToKCi0tLSBhL3NvdW5kL3NvYy9pbnRlbC9oYXN3ZWxs
L3NzdC1oYXN3ZWxsLWlwYy5jCisrKyBiL3NvdW5kL3NvYy9pbnRlbC9oYXN3ZWxsL3NzdC1oYXN3
ZWxsLWlwYy5jCkBAIC04MSw3ICs4MSw3IEBACgogwqAvKiBJUEMgbWVzc2FnZSB0aW1lb3V0ICht
c2VjcykgKi8KIMKgI2RlZmluZSBJUENfVElNRU9VVF9NU0VDU8KgwqDCoMKgwqAgMzAwCi0jZGVm
aW5lIElQQ19CT09UX01TRUNTwqDCoMKgwqDCoMKgwqDCoCAyMDAKKyNkZWZpbmUgSVBDX0JPT1Rf
TVNFQ1PCoMKgwqDCoMKgwqDCoMKgIDMwMAoKR3VzdGF3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
