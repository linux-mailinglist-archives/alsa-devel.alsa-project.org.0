Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA96C892
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 07:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D45B51666;
	Thu, 18 Jul 2019 07:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D45B51666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563426206;
	bh=ViUmTaCyKa/agIOmiVXEEhF1NlTSf70zg6TnQN0NqoY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDkQZzlk7XtgdjBOx5boHHMWCrrMgDEY8IXuTet2iXKpasgcTO4xjCwEaUuBP14ne
	 woZLzz1SAMDxW/wSUrBnuRiwrY2tJ7MRCzu1BxJj52At6tb7ShsTTJ7MB4cHQX1KKn
	 RcvHKPmLhG9TXndsx/rBH7LSngZdEuONA7v2IbJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E39EF802BC;
	Thu, 18 Jul 2019 07:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2387EF80362; Thu, 18 Jul 2019 07:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6512CF8015B
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 07:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6512CF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 22:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169748413"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 22:01:27 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
 <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
Date: Thu, 18 Jul 2019 13:06:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
Content-Language: en-US
Cc: marcin.rajwa@intel.com, Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

CgpPbiAyMDE5LzcvMTgg5LiK5Y2IMTE6MzUsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+
IAo+IAo+IE9uIDcvMTcvMTkgMTA6MTEgUE0sIEtleW9uIEppZSB3cm90ZToKPj4gRnJvbTogTWFy
Y2luIFJhandhIDxtYXJjaW4ucmFqd2FAbGludXguaW50ZWwuY29tPgo+Pgo+PiBJbiBzb21lIGNh
c2VzLCBGVyBtaWdodCBuZWVkIHRvIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgdG8K
Pj4gc3luY2hyb25pemUgdGhlIERNQSBjb3B5aW5nICh3aXRoIGhvc3Qgc2lkZSkgYnV0IHRoZSBk
cml2ZXIgZG9lcyBub3QKPiAKPiBpdCdzIHlvdXIgcmlnaHQgdG8gZWRpdCBteSBzdWdnZXN0ZWQg
d29yZGluZywgYnV0IHRoZSBub3Rpb24gb2YgCj4gJ3N5bmNocm9uaXphdGlvbicgaXMgZmFyIGZy
b20gY2xlYXIuIGl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSAKPiBob3N0X3BlcmlvZF9i
eXRlcyBkZWZpbmVzIHRoZSBETUEgdHJhbnNmZXIgc2l6ZSByZXF1ZXN0ZWQgYnkgdGhlIAo+IGZp
cm13YXJlLCB3aGljaCBpc24ndCBhIHZhbHVlIHRoYXQgbWF0dGVycyB0byB0aGUgaG9zdCBleGNl
cHQgZm9yIHJld2luZCAKPiB1c2FnZXMuCgpIaSBQaWVycmUsIGhlcmUgdGhlIGhvc3RfcGVyaW9k
X2J5dGVzIGlzIHJlcXVlc3RlZCBieSBob3N0LCBGVyBoYXMgaXRzIApvd24gcGVyaW9kIHNpemUs
IGFuZCBETUEgd2lsbCB0cmFuc2ZlciBkYXRhIGluIEZXIGJ1ZmZlciBwZXJpb2Qgc2l6ZS4gSXQg
CndvcmtzIGxpa2UgdGhpczoKCkZXIGJ1ZmZlcltwZXJpb2QgMCwgcGVyaW9kIDEsIC4uLl0gPD09
PiBETUEgPD09PiBob3N0L2Fsc2EgCmJ1ZmZlcltob3N0X3BlcmlvZCAwLCBob3N0X3ByaW9kIDEs
IC4uLl0KCldlIG5lZWQgdGhpcyBob3N0X3ByZWlvZF9ieXRlcyBpbmZvcm1hdGlvbiBpbiBGVyB0
byBkbyBmYXN0IApkcmFpbmluZyhlLmcuIHJlY29yZCAyIHNlY29uZHMgZGF0YSB3aXRoaW4gMTBt
cykgaW4gbW1hcCBjYXB0dXJlLCB3ZSBhcmUgCnNsb3dpbmcgZG93biB0aGUgZHJhaW5pbmcgaW4g
c21hbGxlciBob3N0X3BlcmlvZF9ieXRlcyBjYXNlcywgb3RoZXJ3aXNlLCAKYXJlY29yZCBjYW4n
dCByZWFkIHRoZSBidWZmZXIgaW4gdGltZSBhbmQgb3ZlcnJ1biB3aWxsIGhhcHBlbi4KCk1heWJl
IHRoZSB3b3JkaW5nICJzeW5jaHJvbml6ZSIgaGVyZSBpcyBpbmFjY3VyYXRlLCBob3cgYWJvdXQg
c29tZXRoaW5nIApsaWtlIHRoaXM6CgoiRlcgbWlnaHQgbmVlZCB0byB1c2UgdGhlIGhvc3RfcGVy
aW9kX2J5dGVzIGZpZWxkIHRvIGNvbmZpZ3VyZSBhbmQgCmNvbnRyb2wgdGhlIERNQSBjb3B5aW5n
IHNwZWVkIGJ1dCB0aGUgZHJpdmVyIGRvZXMgbm90Li4uIgoKPiAKPj4gbmVlZCBhbnkgcG9zaXRp
b24gaW5mb3JtYXRpb24gcmV0dXJuZWQgb3ZlciB0aGUgSVBDIGNoYW5uZWwgYnkgdGhlCj4+IGZp
cm13YXJlLiBUaGUgY3VycmVudCBJUEMgZGVmaW5pdGlvbiBwcmV2ZW50cyB0aGlzIGNhcGFiaWxp
dHksIHNvIGFkZAo+PiBuZXcgZmllbGQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmNpbiBSYWp3
YSA8bWFyY2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogS2V5b24g
SmllIDx5YW5nLmppZUBsaW51eC5pbnRlbC5jb20+Cj4+IFJldmlld2VkLWJ5OiBSYW5qYW5pIFNy
aWRoYXJhbiA8cmFuamFuaS5zcmlkaGFyYW5AbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAg
aW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFtLmggfCA0ICsrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc291bmQvc29mL3N0cmVhbS5oIGIvaW5jbHVkZS9zb3VuZC9zb2Yvc3RyZWFtLmgKPj4gaW5k
ZXggNjQzZjE3NWNiNDc5Li4wNmFmNGVjYjI1ODQgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvc291
bmQvc29mL3N0cmVhbS5oCj4+ICsrKyBiL2luY2x1ZGUvc291bmQvc29mL3N0cmVhbS5oCj4+IEBA
IC04MywxMCArODMsMTAgQEAgc3RydWN0IHNvZl9pcGNfc3RyZWFtX3BhcmFtcyB7Cj4+IMKgwqDC
oMKgwqAgdWludDE2X3Qgc2FtcGxlX3ZhbGlkX2J5dGVzOwo+PiDCoMKgwqDCoMKgIHVpbnQxNl90
IHNhbXBsZV9jb250YWluZXJfYnl0ZXM7Cj4+IC3CoMKgwqAgLyogZm9yIG5vdGlmeWluZyBob3N0
IHBlcmlvZCBoYXMgY29tcGxldGVkIC0gMCBtZWFucyBubyBwZXJpb2QgCj4+IElSUSAqLwo+PiDC
oMKgwqDCoMKgIHVpbnQzMl90IGhvc3RfcGVyaW9kX2J5dGVzOwo+PiArwqDCoMKgIHVpbnQzMl90
IG5vX3Bvc2l0aW9uX2lwYzsgLyogMSBtZWFucyBubyBJUEMgZm9yIHBvc2l0aW9uIHVwYWR0ZSAq
Lwo+IAo+IHR5cG86IHVwZGF0ZQoKT0ssIHRoYW5rcywgYW5vdGhlciB1cGRhdGUgdmVyc2lvbiBu
ZWVkZWQgZm9yIGl0LgoKVGhhbmtzLAp+S2V5b24KCj4gCj4+IC3CoMKgwqAgdWludDMyX3QgcmVz
ZXJ2ZWRbMl07Cj4+ICvCoMKgwqAgdWludDE2X3QgcmVzZXJ2ZWRbM107Cj4+IMKgwqDCoMKgwqAg
dWludDE2X3QgY2htYXBbU09GX0lQQ19NQVhfQ0hBTk5FTFNdO8KgwqDCoCAvKio8IGNoYW5uZWwg
bWFwIC0gCj4+IFNPRl9DSE1BUF8gKi8KPj4gwqAgfSBfX3BhY2tlZDsKPj4KPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5n
IGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
