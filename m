Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D6148C88
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 17:52:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1D6168A;
	Fri, 24 Jan 2020 17:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1D6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579884765;
	bh=eGibE9H7cWmi15kqbkZZ6P8H/N2CgDdZD6rYIbGDEtk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePXqprnyN2oJnDxJAwVPtY+BALrnOnkYzrIwHT6yXCZkmPkv+eeZdn0sdz2aZr8kV
	 t43JYQIdAo2T7bFn2GbLJVRv+biU5icMHqeR5q87GJpf2Rlef1uBZHqHLRvjYi36yF
	 bKo9WocmydhMq3Fh1JoNwGVWFKrndkwReGfh+Hxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5E3F8020C;
	Fri, 24 Jan 2020 17:51:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D0CF8020C; Fri, 24 Jan 2020 17:51:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07182F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 17:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07182F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="mER7qWmf"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e2b205c0000>; Fri, 24 Jan 2020 08:50:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 24 Jan 2020 08:50:50 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 24 Jan 2020 08:50:50 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 16:50:48 +0000
To: Ben Dooks <ben.dooks@codethink.co.uk>, Dmitry Osipenko <digetx@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
Date: Fri, 24 Jan 2020 16:50:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579884636; bh=UBuebTzX36A7jML+Z3K4Q7iEWRJLoXDLDzs2+StBasE=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mER7qWmfPv+Ab8am01xjv80RvqZdabdlWGRe0/ftniBnRfScDmpbwnkQR9Jw6i18s
 fhgNzTsrq1xvZUXGhkRJGCQbgBFN1iHXzK9M3vSxjFqHM4MQs1y6srw4WRdzfoi5Db
 Ysh83BX7lyBRapI5XU+2SFNVMU3mSXhtzku0MO6E4aAnPHH4u+j9axfUXL768XVFVP
 2uEvOsGtM+eOApwW4+onxo2KY1XFoS7KvjFPTYWuF7hR6tK1K75ec7JyjIwpQ3/wwF
 1+d3hz/s2EYcSwWmKRc4iPGJVBU3ZbpFG28/sjYrPtjegoGIQasLBiDib8Zw+UlFIL
 pVmICdyNueODg==
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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

Ck9uIDIzLzAxLzIwMjAgMTk6MzgsIEJlbiBEb29rcyB3cm90ZToKPiBPbiAwNy8wMS8yMDIwIDAx
OjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDA2LjAxLjIwMjAgMjI6MDAsIEJlbiBEb29r
cyDQv9C40YjQtdGCOgo+Pj4gT24gMDUvMDEvMjAyMCAxMDo1MywgQmVuIERvb2tzIHdyb3RlOgo+
Pj4+Cj4+Pj4KPj4+PiBPbiAyMDIwLTAxLTA1IDAxOjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6
Cj4+Pj4+IDA1LjAxLjIwMjAgMDM6MDQsIEJlbiBEb29rcyDQv9C40YjQtdGCOgo+Pj4+Pj4gW3Nu
aXBdCj4+Pj4+Pgo+Pj4+Pj4gSSd2ZSBqdXN0IGdvbmUgdGhyb3VnaCB0ZXN0aW5nLgo+Pj4+Pj4K
Pj4+Pj4+IFNvbWUgc2ltcGxlIGRhdGEgdGVzdHMgc2hvdyAxNiBhbmQgMzItYml0cyB3b3JrLgo+
Pj4+Pj4KPj4+Pj4+IFRoZSAyNCBiaXQgY2FzZSBzZWVtcyB0byBiZSB3ZWlyZCwgaXQgbG9va3Mg
bGlrZSB0aGUgMjQtYml0IGV4cGVjdHMKPj4+Pj4+IDI0IGJpdCBzYW1wbGVzIGluIDMyIGJpdCB3
b3Jkcy4gSSBjYW4ndCBzZWUgYW55IHBhY2tpbmcgb3B0aW9ucyB0bwo+Pj4+Pj4gZG8gMjQgYml0
IGluIDI0IGJpdCwgc28gd2UgbWF5IGhhdmUgdG8gcmVtb3ZlIDI0IGJpdCBzYW1wbGUgc3VwcG9y
dAo+Pj4+Pj4gKHdoaWNoIGlzIGEgc2hhbWUpCj4+Pj4+Pgo+Pj4+Pj4gTXkgcHJlZmVyZW5jZSBp
cyB0byByZW1vdmUgdGhlIDI0LWJpdCBzdXBwb3J0IGFuZCBrZWVwIHRoZSAzMiBiaXQgaW4uCj4+
Pj4+Pgo+Pj4+Pgo+Pj4+PiBJbnRlcmVzdGluZy4uIEpvbiwgY291bGQgeW91IHBsZWFzZSBjb25m
aXJtIHRoYXQgMjRiaXQgZm9ybWF0IGlzbid0Cj4+Pj4+IHVzYWJsZSBvbiBUMzA/Cj4+Pj4KPj4+
PiBJZiB0aGVyZSBpcyBhbiBvcHRpb24gb2YgMjQgcGFja2VkIGludG8gMzIsIHRoZW4gSSB0aGlu
ayB0aGF0IHdvdWxkCj4+Pj4gd29yay4KPj4+Pgo+Pj4+IEkgY2FuIHRyeSB0ZXN0aW5nIHRoYXQg
d2l0aCByYXcgZGF0YSBvbiBNb25kYXkuCj4+Pgo+Pj4gSSBuZWVkIHRvIGNoZWNrIHNvbWUgdGhp
bmdzLCBJIGFzc3VtZWQgMjQgd2FzIDI0IHBhY2tlZCBiaXRzLCBpdCBsb29rcwo+Pj4gbGlrZSB0
aGUgZGVmYXVsdCBpcyAyNCBpbiAzMiBiaXRzIHNvIHdlIG1heSBiZSBvay4gSG93ZXZlciBJIG5l
ZWQgdG8KPj4+IHJlLXdyaXRlIG15IHRlc3QgY2FzZSB3aGljaCBhc3N1bWVkIGl0IHdhcyAyNGJp
dHMgaW4gMyBieXRlcyAoUzI0XzNMRSkuCj4+Pgo+Pj4gSSdsbCBmb2xsb3cgdXAgbGF0ZXIsCj4+
Cj4+IE9rYXksIHRoZSBTMjRfM0xFIGlzbid0IHN1cHBvcnRlZCBieSBSVDU2NDAgY29kZWMgaW4g
bXkgY2FzZS4gSSBicmllZmx5Cj4+IGxvb2tlZCB0aHJvdWdoIHRoZSBUUk0gZG9jIGFuZCBnb3Qg
aW1wcmVzc2lvbiB0aGF0IEFIVUIgY291bGQgcmUtcGFjawo+PiBkYXRhIHN0cmVhbSBpbnRvIHNv
bWV0aGluZyB0aGF0IGNvZGVjIHN1cHBvcnRzLCBidXQgbWF5YmUgaXQncyBhIHdyb25nCj4+IGlt
cHJlc3Npb24uCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IAo+IEkgZGlk
IGEgcXVpY2sgdGVzdCB3aXRoIHRoZSBmb2xsb3dpbmc6Cj4gCj4gwqBzb3ggLW4gLWIgMTYgLWMg
MiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wgMC41Cj4gwqBzb3gg
LW4gLWIgMjQgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBzaW5lIDUwMCB2b2wg
MC41Cj4gwqBzb3ggLW4gLWIgMzIgLWMgMiAtciA0NDEwMCAvdG1wL3RtcC53YXbCoCBzeW50aCBz
aW5lIDUwMCB2b2wgMC41Cj4gCj4gVGhlIDE2IGFuZCAzMiB3b3JrIGZpbmUsIHRoZSAyNCBpcyBz
aG93aW5nIGEgcGxheWJhY2sgb3V0cHV0IGZyZXEKPiBvZiA0NDBIeiBpbnN0ZWFkIG9mIDUwMEh6
Li4uIHRoaXMgc3VnZ2VzdHMgdGhlIGNsb2NrIGlzIG9mZiwgb3IgdGhlcmUKPiBpcyBzb21ldGhp
bmcgZWxzZSB3ZWlyZCBnb2luZyBvbi4uLgoKSSB3YXMgbG9va2luZyBhdCB1c2luZyBzb3ggdG8g
Y3JlYXRlIHN1Y2ggYXMgZmlsZSwgYnV0IHRoZSBhYm92ZSBjb21tYW5kCmdlbmVyYXRlcyBhIFMy
NF8zTEUgZmlsZSBhbmQgbm90IFMyNF9MRSBmaWxlLiBUaGUgY29kZWMgb24gSmV0c29uLVRLMQpz
dXBwb3J0cyBTMjRfTEUgYnV0IGRvZXMgbm90IHN1cHBvcnQgUzI0XzNMRSBhbmQgc28gSSBjYW5u
b3QgdGVzdCB0aGlzLgpBbnl3YXksIHdlIHJlYWxseSBuZWVkIHRvIHRlc3QgUzI0X0xFIGFuZCBu
b3QgUzI0XzNMRSBiZWNhdXNlIHRoaXMgaXMKdGhlIHByb2JsZW0gdGhhdCBEbWl0cnkgaXMgaGF2
aW5nLgoKQmVuIGlzIFMyNF8zTEUgd2hhdCB5b3UgcmVhbGx5IG5lZWQgdG8gc3VwcG9ydD8KCkRt
aXRyeSwgZG9lcyB0aGUgZm9sbG93aW5nIGZpeCB5b3VyIHByb2JsZW0/CgpkaWZmIC0tZ2l0IGEv
c291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMgYi9zb3VuZC9zb2MvdGVncmEvdGVncmEzMF9p
MnMuYwppbmRleCBkYmVkM2M1NDA4ZTcuLjkyODQ1YzRiNjNmNCAxMDA2NDQKLS0tIGEvc291bmQv
c29jL3RlZ3JhL3RlZ3JhMzBfaTJzLmMKKysrIGIvc291bmQvc29jL3RlZ3JhL3RlZ3JhMzBfaTJz
LmMKQEAgLTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMzBfaTJzX2h3X3BhcmFtcyhz
dHJ1Y3QKc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKICAgICAgICAgICAgICAgIGF1ZGlv
X2JpdHMgPSBURUdSQTMwX0FVRElPQ0lGX0JJVFNfMTY7CiAgICAgICAgICAgICAgICBzYW1wbGVf
c2l6ZSA9IDE2OwogICAgICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgY2FzZSBTTkRSVl9QQ01f
Rk9STUFUX1MyNF9MRToKKyAgICAgICBjYXNlIFNORFJWX1BDTV9GT1JNQVRfUzI0XzNMRToKICAg
ICAgICAgICAgICAgIHZhbCA9IFRFR1JBMzBfSTJTX0NUUkxfQklUX1NJWkVfMjQ7CiAgICAgICAg
ICAgICAgICBhdWRpb19iaXRzID0gVEVHUkEzMF9BVURJT0NJRl9CSVRTXzI0OwogICAgICAgICAg
ICAgICAgc2FtcGxlX3NpemUgPSAyNDsKQEAgLTMxOCw3ICszMTgsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlcgp0ZWdyYTMwX2kyc19kYWlfdGVtcGxhdGUgPSB7CiAg
ICAgICAgICAgICAgICAuY2hhbm5lbHNfbWF4ID0gMiwKICAgICAgICAgICAgICAgIC5yYXRlcyA9
IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCiAgICAgICAgICAgICAgICAuZm9ybWF0cyA9IFNO
RFJWX1BDTV9GTVRCSVRfUzMyX0xFIHwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgU05EUlZf
UENNX0ZNVEJJVF9TMjRfTEUgfAorICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01f
Rk1UQklUX1MyNF8zTEUgfAogICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1U
QklUX1MxNl9MRSwKICAgICAgICB9LAogICAgICAgIC5jYXB0dXJlID0gewpAQCAtMzI3LDcgKzMy
Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyCnRlZ3JhMzBfaTJz
X2RhaV90ZW1wbGF0ZSA9IHsKICAgICAgICAgICAgICAgIC5jaGFubmVsc19tYXggPSAyLAogICAg
ICAgICAgICAgICAgLnJhdGVzID0gU05EUlZfUENNX1JBVEVfODAwMF85NjAwMCwKICAgICAgICAg
ICAgICAgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAotICAgICAgICAgICAg
ICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8CisgICAgICAgICAgICAgICAg
ICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNMRSB8CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzE2X0xFLAogICAgICAgIH0sCiAgICAgICAgLm9wcyA9
ICZ0ZWdyYTMwX2kyc19kYWlfb3BzLAoKSm9uCgotLSAKbnZwdWJsaWMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
