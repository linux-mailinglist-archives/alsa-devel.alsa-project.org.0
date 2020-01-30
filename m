Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8414D856
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 10:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05BEE1679;
	Thu, 30 Jan 2020 10:40:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05BEE1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580377289;
	bh=2LKmuVptarwHn9OBtQA4ZcK9eSueKoruyKEfmG2SDug=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NK5amL7dNLpVgmivGIa5wVSfW3cha+wriNycX+qnK8qmMIm2oRhKkuOVYptcuMk9T
	 6CVoT2LcCg9GXDNcpLSXTEqomcuHxdwKrCUwsodJ1Y1wT4Tf1Jd5MsgJRG2vsS6ODi
	 1cbPA2udf/lNP6q8wk7UQLqKuHA0ElD23fym0SWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2218BF8014B;
	Thu, 30 Jan 2020 10:39:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D57A7F80150; Thu, 30 Jan 2020 10:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D353FF80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 10:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D353FF80123
Received: from [167.98.27.226] (helo=[172.16.102.1])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ix6IQ-00044D-6k; Thu, 30 Jan 2020 09:39:34 +0000
To: Clemens Ladisch <clemens@ladisch.de>, Dmitry Osipenko <digetx@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <047c8caa-e715-5295-9794-67ff3e10cea2@gmail.com>
 <70f344bf-f991-606c-55ab-bdadea27d233@nvidia.com>
 <2ff97414-f0a5-7224-0e53-6cad2ed0ccd2@gmail.com>
 <35667c85-67b5-6f6f-ffe8-4fe3455ea4bb@codethink.co.uk>
 <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <8161fc88-fa8c-ec92-cc14-1caa5c6f2fe7@codethink.co.uk>
Date: Thu, 30 Jan 2020 09:39:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <96ed04cb-24ab-7e4d-bd44-6a4bb7c046ac@ladisch.de>
Content-Language: en-GB
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org
Subject: Re: [alsa-devel] (no subject)
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

T24gMzAvMDEvMjAyMCAwOTozMSwgQ2xlbWVucyBMYWRpc2NoIHdyb3RlOgo+IEJlbiBEb29rcyB3
cm90ZToKPj4gT24gMjkvMDEvMjAyMCAwMDoxNywgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4g
MjguMDEuMjAyMCAyMToxOSwgSm9uIEh1bnRlciDQv9C40YjQtdGCOgo+Pj4+IE9uIDI4LzAxLzIw
MjAgMTc6NDIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+Pj4gMjguMDEuMjAyMCAxNToxMywg
TWFyayBCcm93biDQv9C40YjQtdGCOgo+Pj4+Pj4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMTA6
MjA6MjVQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+Pj4+Pj4+IDI0LjAxLjIwMjAg
MTk6NTAsIEpvbiBIdW50ZXIg0L/QuNGI0LXRgjoKPj4+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgICAg
ICAgICAgIC5yYXRlcyA9IFNORFJWX1BDTV9SQVRFXzgwMDBfOTYwMDAsCj4+Pj4+Pj4+ICAgICAg
ICAgICAgICAgICAgIC5mb3JtYXRzID0gU05EUlZfUENNX0ZNVEJJVF9TMzJfTEUgfAo+Pj4+Pj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICBTTkRSVl9QQ01fRk1UQklUX1MyNF9MRSB8Cj4+
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIFNORFJWX1BDTV9GTVRCSVRfUzI0XzNM
RSB8Cj4+Pj4+Pgo+Pj4+Pj4+IEl0IHNob3VsZCBzb2x2ZSB0aGUgcHJvYmxlbSBpbiBteSBwYXJ0
aWN1bGFyIGNhc2UsIGJ1dCBJJ20gbm90IHN1cmUgdGhhdAo+Pj4+Pj4+IHRoZSBzb2x1dGlvbiBp
cyBjb3JyZWN0Lgo+Pj4+Pj4KPj4+Pj4+IElmIHRoZSBmb3JtYXQgaW1wbGVtZW50ZWQgYnkgdGhl
IGRyaXZlciBpcyBTMjRfM0xFIHRoZSBkcml2ZXIgc2hvdWxkCj4+Pj4+PiBhZHZlcnRpc2UgUzI0
XzNMRS4KPj4+Pj4KPj4+Pj4gSXQgc2hvdWxkIGJlIFMyNF9MRSwgYnV0IHNlZW1zIHdlIHN0aWxs
IGRvbid0IGtub3cgZm9yIHN1cmUuCj4+Pj4KPj4+PiBXaHk/Cj4+PiAvSSB0aGluay8gc291bmQg
c2hvdWxkIGJlIG11Y2ggbW9yZSBkaXN0b3J0ZWQgaWYgaXQgd2FzIFMyNF8zTEUsIGJ1dAo+Pj4g
bWF5YmUgSSdtIHdyb25nLgo+Pgo+PiBTMjRfM0xFIGlzIElJQ0MgdGhlIHdyb25nIHRoaW5nIGFu
ZCB3ZSBjYW4ndCBzdXBwb3J0IGl0IG9uIHRoZSB0ZWdyYTMKPiAKPiBUaGVyZSBhcmUgdGhyZWUg
d2F5cyBvZiBhcnJhbmdpbmcgMjQtYml0IHNhbXBsZXMgaW4gbWVtb3J5Ogo+IAo+IFMyNF8zTEU6
IDI0LWJpdCBzYW1wbGVzIGluIDI0LWJpdCB3b3JkcyB3aXRob3V0IHBhZGRpbmcKPiBTMjRfTEU6
ICAyNC1iaXQgc2FtcGxlcyBpbiAzMi1iaXQgd29yZHMsIGFsaWduZWQgdG8gdGhlIExTQgo+IFMz
Ml9MRTogIDI0LWJpdCBzYW1wbGVzIGluIDMyLWJpdCB3b3JkcywgYWxpZ25lZCB0byB0aGUgTVNC
Cj4gCj4gSXQgaXMgdmVyeSB1bmxpa2VseSB0aGF0IHlvdXIgaGFyZHdhcmUgaW1wbGVtZW50cyBT
MjRfTEUuCgpXaGljaCBpcyB3cm9uZywgc2luY2UgdGhpcyBpcyBleGFjdGx5IHdoYXQgdGhlIGhh
cmR3YXJlIGltcGxlbWVudHMuCgpUaGUgRE1BIGZldGNoZXMgMzIgYml0IHdvcmRzLCBhbmQgdGhl
biB0aGUgZnJvbnQgZW5kIGRpc3BhdGNoZXMgb25seQoyNCBiaXRzIG9mIHRoZXNlIHRvIHRoZSBJ
MlMvVERNCgo+IAoKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsv
ClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczov
L3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
