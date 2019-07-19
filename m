Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA66E467
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 12:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777B416AC;
	Fri, 19 Jul 2019 12:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777B416AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563532441;
	bh=TPwm682SO5DIFvcX1EQG5CxHUEthsuHC9SrMetr2b00=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C61TACgU0qBEtgRbvD1oCMaRmXEH089cF9wevGQryDMtZ8qZRKubqWoYOX72cMtRz
	 iELUJ6NYlE+SfngGy7Ar4Aw8pxckMRYbLIjYoZW476aTOdpqy6FLyllynKlWMAoUzo
	 AByh3cDqwH6+XUog3sagn3pB1H8bNSD2+CNrhmCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE8AF80367;
	Fri, 19 Jul 2019 12:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D45F80272; Fri, 19 Jul 2019 12:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14EBAF800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 12:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14EBAF800B2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 03:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,282,1559545200"; 
 d="scan'208,217";a="170869643"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.237.142.153])
 ([10.237.142.153])
 by orsmga003.jf.intel.com with ESMTP; 19 Jul 2019 03:32:06 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
 <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
 <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
 <e023af8c-0538-6f84-3cfe-9482532b2cec@linux.intel.com>
 <7097547d-9784-2d26-f1f0-fd2f803481ec@linux.intel.com>
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Message-ID: <54b08af5-77bd-2de4-c3ce-158a9374c15a@linux.intel.com>
Date: Fri, 19 Jul 2019 12:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7097547d-9784-2d26-f1f0-fd2f803481ec@linux.intel.com>
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: marcin.rajwa@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: add flag for position
	update ipc
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

Ck9uIDcvMTgvMjAxOSA1OjI0IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPgo+Cj4g
T24gNy8xOC8xOSAzOjQyIEFNLCBSYWp3YSwgTWFyY2luIHdyb3RlOgo+Pgo+PiBPbiA3LzE4LzIw
MTkgNzowNiBBTSwgS2V5b24gSmllIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyMDE5LzcvMTgg5LiK
5Y2IMTE6MzUsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiA3
LzE3LzE5IDEwOjExIFBNLCBLZXlvbiBKaWUgd3JvdGU6Cj4+Pj4+IEZyb206IE1hcmNpbiBSYWp3
YSA8bWFyY2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KPj4+Pj4KPj4+Pj4gSW4gc29tZSBjYXNl
cywgRlcgbWlnaHQgbmVlZCB0byB1c2UgdGhlIGhvc3RfcGVyaW9kX2J5dGVzIGZpZWxkIHRvCj4+
Pj4+IHN5bmNocm9uaXplIHRoZSBETUEgY29weWluZyAod2l0aCBob3N0IHNpZGUpIGJ1dCB0aGUg
ZHJpdmVyIGRvZXMgbm90Cj4+Pj4KPj4+PiBpdCdzIHlvdXIgcmlnaHQgdG8gZWRpdCBteSBzdWdn
ZXN0ZWQgd29yZGluZywgYnV0IHRoZSBub3Rpb24gb2YgCj4+Pj4gJ3N5bmNocm9uaXphdGlvbicg
aXMgZmFyIGZyb20gY2xlYXIuIGl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSAKPj4+PiBo
b3N0X3BlcmlvZF9ieXRlcyBkZWZpbmVzIHRoZSBETUEgdHJhbnNmZXIgc2l6ZSByZXF1ZXN0ZWQg
YnkgdGhlIAo+Pj4+IGZpcm13YXJlLCB3aGljaCBpc24ndCBhIHZhbHVlIHRoYXQgbWF0dGVycyB0
byB0aGUgaG9zdCBleGNlcHQgZm9yIAo+Pj4+IHJld2luZCB1c2FnZXMuCj4+Pgo+Pj4gSGkgUGll
cnJlLCBoZXJlIHRoZSBob3N0X3BlcmlvZF9ieXRlcyBpcyByZXF1ZXN0ZWQgYnkgaG9zdCwgRlcg
aGFzIAo+Pj4gaXRzIG93biBwZXJpb2Qgc2l6ZSwgYW5kIERNQSB3aWxsIHRyYW5zZmVyIGRhdGEg
aW4gRlcgYnVmZmVyIHBlcmlvZCAKPj4+IHNpemUuIEl0IHdvcmtzIGxpa2UgdGhpczoKPj4+Cj4+
PiBGVyBidWZmZXJbcGVyaW9kIDAsIHBlcmlvZCAxLCAuLi5dIDw9PT4gRE1BIDw9PT4gaG9zdC9h
bHNhIAo+Pj4gYnVmZmVyW2hvc3RfcGVyaW9kIDAsIGhvc3RfcHJpb2QgMSwgLi4uXQo+Pj4KPj4+
IFdlIG5lZWQgdGhpcyBob3N0X3ByZWlvZF9ieXRlcyBpbmZvcm1hdGlvbiBpbiBGVyB0byBkbyBm
YXN0IAo+Pj4gZHJhaW5pbmcoZS5nLiByZWNvcmQgMiBzZWNvbmRzIGRhdGEgd2l0aGluIDEwbXMp
IGluIG1tYXAgY2FwdHVyZSwgd2UgCj4+PiBhcmUgc2xvd2luZyBkb3duIHRoZSBkcmFpbmluZyBp
biBzbWFsbGVyIGhvc3RfcGVyaW9kX2J5dGVzIGNhc2VzLCAKPj4+IG90aGVyd2lzZSwgYXJlY29y
ZCBjYW4ndCByZWFkIHRoZSBidWZmZXIgaW4gdGltZSBhbmQgb3ZlcnJ1biB3aWxsIAo+Pj4gaGFw
cGVuLgo+Pj4KPj4+IE1heWJlIHRoZSB3b3JkaW5nICJzeW5jaHJvbml6ZSIgaGVyZSBpcyBpbmFj
Y3VyYXRlLCBob3cgYWJvdXQgCj4+PiBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4KPj4+ICJGVyBt
aWdodCBuZWVkIHRvIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgdG8gY29uZmlndXJl
IGFuZCAKPj4+IGNvbnRyb2wgdGhlIERNQSBjb3B5aW5nIHNwZWVkIGJ1dCB0aGUgZHJpdmVyIGRv
ZXMgbm90Li4uIgo+Pj4KPj4KPj4gSGksCj4+Cj4+IHdlIG5lZWQgKmhvc3RfcGVyaW9kX2J5dGVz
ICppbiBGVyB0byBwcm9wZXJseSBkcmFpbiBkYXRhIC0gYnkgCj4+IHByb3Blcmx5IEkgbWVhbiB0
byBubyBvdmVycmlkZSBob3N0IGJ1ZmZlciBidXQgaW4gdGhlIHNhbWUgdGltZSB0byAKPj4gYXZv
aWQgc2l0dWF0aW9uIHdoZW4gaG9zdCBpcyB3YWl0aW5nIGZvciBkYXRhIGFuZCBkb2Vzbid0IGdl
dCBpdC4gVGhlIAo+PiBmb3JtZXIgaXMga25vd24gYXMgKm92ZXJydW4gKndoaWxlIHRoZSBsYXRl
ciAqdW5kZXJydW4qKi4KPj4gKgo+Pgo+PiBTbyB0aGF0J3Mgd2h5IEkgb3JpZ2luYWxseSB1c2Vk
IHRoZSB3b3JkICoidG8gc3luY2hyb25pemUiICpiZWNhdXNlIAo+PiBpdCBiZXN0IHJlZmxlY3Rz
IHRoZSB1c2Ugb2YgdGhpcyB2YXJpYWJsZSBpbiBGVy4KPj4KPj4gKlRoZSBwcm9ibGVtICotIGhv
c3QgZXN0YWJsaXNoZXMgdGhlICpwZXJpb2Rfc2l6ZS8qKmhvc3RfcGVyaW9kX2J5dGVzIAo+PiAq
YW5kIHVzZXMgaXQgYXMgYSAiZGF0YSBjb3B5IHRlbXBvIGNvbnRyb2xsZXIiIG1lYW5pbmcgaXQg
d2lsbCBjb3B5IAo+PiBkYXRhIGJ1ZmZlcmVkIGluIGl0cyBvd24gYnVmZmVyIChjb3BpZWQgdGhl
cmUgYnkgRlcpIGluICpwZXJpb2Rfc2l6ZSAKPj4gKnRpbWUgaW50ZXJ2YWxzLiBOb3csIGluIHJl
Z3VsYXIgY29weSAocmVhbCB0aW1lIHN0cmVhbSkgZmlybXdhcmUgCj4+IGRvZXNuJ3QKPj4KPj4g
bmVlZCB0byBjYXJlIGFib3V0IGhvdyBmYXN0IGhvc3QgY29weSBiZWNhdXNlIHRoZSBob3N0IGJ1
ZmZlciBpcyBiaWcgCj4+IGVub3VnaCB0byBzdG9yZSBldmVuIHNldmVyYWwgRlcgcGVyaW9kcyAo
ZWFjaCBvbmUgb3IgZmV3IAo+PiBtaWxsaXNlY29uZHMpwqAgd2l0aG91dCBvdmVycmlkaW5nIGl0
LiBUaGF0IGlzIHdoeSB3ZSBkaWQgbm90IG5lZWQgCj4+IHRoaXMgKnBlcmlvZF9zaXplICp2YXJp
YWJsZSBiZWZvcmUuIEhvd2V2ZXIgdGhlIGRyYWluaW5nIHRhc2sgaXMgdmVyeQo+Pgo+PiBkaWZm
ZXJlbnQgYmFsbCBnYW1lIC0gaXQgY29waWVzICoyLDEgc2Vjb25kcyogb2YgZGF0YSBhcyBmYXN0
IGFzIAo+PiBwb3NzaWJsZSB0byB0aGUgaG9zdC4gVGhlcmVmb3JlIHdlIGFyZSB2ZXJ5IHByb25l
IHRvICpYUlVOcyoKPj4KPj4gKlRoZSBzb2x1dGlvbiogLSBpbiBGVyB3ZSBuZWVkIHRvIGtub3cg
aG93IG9mdGVuIGhvc3QgY29waWVzIGRhdGEgb3V0IAo+PiBmcm9tIGl0cyBvd24gYnVmZmVyIGFu
ZCB0aGlzIGluZm9ybWF0aW9uIGlzIHN0b3JlZCBpbiAKPj4gKmhvc3RfcGVyaW9kX2J5dGVzLCAq
bGV0cyBzZW5kIHRoaXMgaW5mb3JtYXRpb24gZG93biB0byBmaXJtd2FyZS4gCj4+IE5vdywgdGhl
IEZXIGtub3dpbmcgdGhpcyBjYW4gZmlsbCB0aGUgaG9zdCBidWZmZXIgYW5kIHdhaXQgdGhlIHRp
bWUgCj4+IGNhbGN1bGF0ZWQgYnkgKmhvc3RfcGVyaW9kX2J5dGVzKgo+Pgo+PiBiZWZvcmUgbmV4
dCBjb3B5LiBUaGlzIHdheSB3ZSBjb3B5IGFzIG11Y2gvZmFzdCBhcyB3ZSBjYW4gYW5kIGluIHRo
ZSAKPj4gc2FtZSB0aW1lIHdlIGFyZSBzYWZlIHRoYXQgaG9zdCB3aWxsIGhhbmRsZSB0aGlzIGFu
ZCBubyBYUlVOIHdpbGwgCj4+IGV2ZXIgaGFwcGVuLgo+Cj4KPiBXZSBrbmV3IGZyb20gRGF5MSB0
aGF0IGRyYWluaW5nIGZhc3RlciB0aGFuIHJlYWwtdGltZSBjb3VsZCAKPiBwb3RlbnRpYWxseSBs
ZWFkIHRvIHRoZSBkcml2ZXIgZGV0ZWN0aW5nIG92ZXJmbG93cyBvciB0aW1lb3V0cy4gSXQncyAK
PiBiZWVuIGRvY3VtZW50ZWQgbGVmdCBhbmQgcmlnaHQsIHdpdGggYW4gYXNzdW1wdGlvbiB0aGF0
IHRoZSByaW5nIAo+IGJ1ZmZlciBpcyBhY3R1YWxseSBiaWcgZW5vdWdoIHRvIGNvbnRhaW4gYWxs
IHRoZSBkYXRhIHN0b3JlZCBpbiB0aGUgRFNQLgoKQFBpZXJyZSwgaW5kZWVkIHRoZSBidWZmZXIg
dGhhdCBrZXJuZWwgYWxsb2NhdGVzIGlzIGJpZyBlbm91Z2ggdG8gc3RvcmUgCmFsbCB0aGUgZGF0
YS4gSG93ZXZlciAqYXJlY29yZCogaW50cm9kdWNlcyBpdHMgb3duIGJ1ZmZlciB3aGljaCBpcyBq
dXN0IAphIG11bHRpcGxlIG9mICpwZXJpb2Rfc2l6ZXMgKi0gYW5kIGl0IGlzIHRoZSBidWZmZXIg
d2hpY2ggb3ZlcmZsb3dzLgoKPgo+IEJlZm9yZSBJIHByb3ZpZGUgbW9yZSBmZWVkYmFjaywgY2Fu
IHlvdSBjbGFyaWZ5IGlmIHRoZSAKPiAnaG9zdF9wZXJpb2RfYnl0ZXMnIGlzIHRoZSBzYW1lIHZh
bHVlIGFzIHRoZSBBTFNBIHBlcmlvZCBzaXplIChpbiAKPiBieXRlcyk/IEFuZCB3aGF0IHdvdWxk
IGJlIHRoZSB2YWx1ZSB3aGVuIHRoZSBub19pcnEgbW9kZSBpcyB1c2VkPwoKWWVzLCB0aGlzIGlz
IHRoZSBzYW1lIHZhbHVlLiBJdCBpcyBvYnRhaW5lZCBieSAqcGFyYW1zX3BlcmlvZF9ieXRlcyoq
KCkqIAppbiBrZXJuZWwuCgoqbm9faXJxIG1vZGUgKi0gaXQgZG9lcyBub3QgYWZmZWN0IHRoZSB2
YWx1ZSBvZiAqaG9zdF9wZXJpb2RfYnl0ZXMgCiphZnRlciBteSBwYXRjaCBoYXMgYmVlbiBhcHBs
aWVkLiBCZWZvcmUgbXkgcGF0Y2ggaG93ZXZlciwgZHJpdmVyIGFuZCBGVyAKdXNlZCB0aGlzIHZh
bHVlIHRvIHNlbmQgc3RyZWFtIHBvc2l0aW9uIGluZm9ybWF0aW9uIGZyb20gRlcgdG8ga2VybmVs
LiAKSW4gc2hvcnQsIHdoZW4gKihoZGEgJiYgaGRhLT5ub19pcGNfcG9zaXRpb24pKgoKdGhlbiAq
aXBjX3BhcmFtcy0+aG9zdF9wZXJpb2RfYnl0ZXMgPSAwOyAqd2FzIHNldCBpbiBrZXJuZWwuKipG
aXJtd2FyZSAKdGhlbiwgcmVhZCB0aGlzICpob3N0X3BlcmlvZF9ieXRlcyA9IDAgKmFuZCB0cmVh
dGVkIGl0IGFzICJPSyBkb2VzIG5vdCAKc2VuZCBhbnkgSVBDIHJlZ2FyZGluZyBzdHJlYW0gcG9z
aXRpb24iLiBTbyBvbmNlICpub19pcGNfcG9zaXRpb24gKndhcyAKc2V0IHdlIGxvc3QgaW5mb3Jt
YXRpb24gYWJvdXQgKmhvc3RfcGVyaW9kX2J5dGVzICppbiB0aGUgRlcuCgpTbyBhbGwgbXkgcGF0
Y2hlcyBpbiBGVyBhbmQgS2VybmVsIGRvIGlzIHRvICpyZWxheCoqKipob3N0X3BlcmlvZF9ieXRl
cyAKKmFuZCBpbnRyb2R1Y2UgbmV3IHBhcmFtZXRlciBkZWRpY2F0ZWQgZm9yIHRoaXMgc3RyZWFt
IHBvc2l0aW9uIElQQy4gQXQgCnRoYXQgdGltZSB3ZSBjYWxsZWQgaXQgKm5vX3BlcmlvZF9pcnEg
KnRvIHJlc2VtYmxlIG9sZCBuYW1lIGJ1dCBub3cgSSAKdGhpbmsgaXQgd291bGQgYmUgYmV0dGVy
IGlmIHdlIHJlbmFtZSBpdCB0byBzb21ldGhpbmcgbGlrZQoKKm5vX3N0cmVhbV9wb3NpdGlvbiAq
YXMgaXQgaXMgbW9yZSBpbmZvcm1hdGl2ZS4gV2hhdCBkbyB5b3UgdGhpbms/CgoKPgo+Pgo+Pgo+
PiBIb3BlIGl0IGhlbHBlZCB0byB1bmRlcnN0YW5kIHRoZSBuZWVkIG9mICpob3N0X3BlcmlvZF9i
eXRlcyAqaW4gdGhlIAo+PiBmaXJtd2FyZS4KPj4gKioKPj4KPj4gTWFyY2luCj4+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
