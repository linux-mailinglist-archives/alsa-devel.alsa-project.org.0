Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914C6CCDA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 12:37:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFCDF16A4;
	Thu, 18 Jul 2019 12:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFCDF16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563446224;
	bh=9+h3DlszV90NPswpkAhru2NpIdz0i0LzhR2poON0Ml0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8HMvK7haTRUhzvJU40U1ZacvJqvjOEGNE0BdunKLq44Ww+NBQh3eAsYf8vqHbkCY
	 FT2qURwc/Lu893Or7OJFk44i8hnW9AkoGkXIFa9s1YbKkXT+6b3I0VOOxKIrNv7rtc
	 AM0erNnpglyPLn7MbkCztMxwLCbqmANkwkR3kMZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B05F80445;
	Thu, 18 Jul 2019 12:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3AEF80362; Thu, 18 Jul 2019 10:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93969F800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 10:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93969F800C0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 01:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; 
 d="scan'208,217";a="195540813"
Received: from mrajwa-mobl.ger.corp.intel.com (HELO [10.249.144.101])
 ([10.249.144.101])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2019 01:42:51 -0700
To: Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190718031113.25040-1-yang.jie@linux.intel.com>
 <94753e7c-931b-2b24-b92b-283e7abbb9ac@linux.intel.com>
 <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
Message-ID: <e023af8c-0538-6f84-3cfe-9482532b2cec@linux.intel.com>
Date: Thu, 18 Jul 2019 10:42:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a1a676aa-e1da-0f6a-4dbd-972b4973553d@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Jul 2019 12:33:32 +0200
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

Ck9uIDcvMTgvMjAxOSA3OjA2IEFNLCBLZXlvbiBKaWUgd3JvdGU6Cj4KPgo+IE9uIDIwMTkvNy8x
OCDkuIrljYgxMTozNSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDcv
MTcvMTkgMTA6MTEgUE0sIEtleW9uIEppZSB3cm90ZToKPj4+IEZyb206IE1hcmNpbiBSYWp3YSA8
bWFyY2luLnJhandhQGxpbnV4LmludGVsLmNvbT4KPj4+Cj4+PiBJbiBzb21lIGNhc2VzLCBGVyBt
aWdodCBuZWVkIHRvIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgdG8KPj4+IHN5bmNo
cm9uaXplIHRoZSBETUEgY29weWluZyAod2l0aCBob3N0IHNpZGUpIGJ1dCB0aGUgZHJpdmVyIGRv
ZXMgbm90Cj4+Cj4+IGl0J3MgeW91ciByaWdodCB0byBlZGl0IG15IHN1Z2dlc3RlZCB3b3JkaW5n
LCBidXQgdGhlIG5vdGlvbiBvZiAKPj4gJ3N5bmNocm9uaXphdGlvbicgaXMgZmFyIGZyb20gY2xl
YXIuIGl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSAKPj4gaG9zdF9wZXJpb2RfYnl0ZXMg
ZGVmaW5lcyB0aGUgRE1BIHRyYW5zZmVyIHNpemUgcmVxdWVzdGVkIGJ5IHRoZSAKPj4gZmlybXdh
cmUsIHdoaWNoIGlzbid0IGEgdmFsdWUgdGhhdCBtYXR0ZXJzIHRvIHRoZSBob3N0IGV4Y2VwdCBm
b3IgCj4+IHJld2luZCB1c2FnZXMuCj4KPiBIaSBQaWVycmUsIGhlcmUgdGhlIGhvc3RfcGVyaW9k
X2J5dGVzIGlzIHJlcXVlc3RlZCBieSBob3N0LCBGVyBoYXMgaXRzIAo+IG93biBwZXJpb2Qgc2l6
ZSwgYW5kIERNQSB3aWxsIHRyYW5zZmVyIGRhdGEgaW4gRlcgYnVmZmVyIHBlcmlvZCBzaXplLiAK
PiBJdCB3b3JrcyBsaWtlIHRoaXM6Cj4KPiBGVyBidWZmZXJbcGVyaW9kIDAsIHBlcmlvZCAxLCAu
Li5dIDw9PT4gRE1BIDw9PT4gaG9zdC9hbHNhIAo+IGJ1ZmZlcltob3N0X3BlcmlvZCAwLCBob3N0
X3ByaW9kIDEsIC4uLl0KPgo+IFdlIG5lZWQgdGhpcyBob3N0X3ByZWlvZF9ieXRlcyBpbmZvcm1h
dGlvbiBpbiBGVyB0byBkbyBmYXN0IAo+IGRyYWluaW5nKGUuZy4gcmVjb3JkIDIgc2Vjb25kcyBk
YXRhIHdpdGhpbiAxMG1zKSBpbiBtbWFwIGNhcHR1cmUsIHdlIAo+IGFyZSBzbG93aW5nIGRvd24g
dGhlIGRyYWluaW5nIGluIHNtYWxsZXIgaG9zdF9wZXJpb2RfYnl0ZXMgY2FzZXMsIAo+IG90aGVy
d2lzZSwgYXJlY29yZCBjYW4ndCByZWFkIHRoZSBidWZmZXIgaW4gdGltZSBhbmQgb3ZlcnJ1biB3
aWxsIGhhcHBlbi4KPgo+IE1heWJlIHRoZSB3b3JkaW5nICJzeW5jaHJvbml6ZSIgaGVyZSBpcyBp
bmFjY3VyYXRlLCBob3cgYWJvdXQgCj4gc29tZXRoaW5nIGxpa2UgdGhpczoKPgo+ICJGVyBtaWdo
dCBuZWVkIHRvIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgdG8gY29uZmlndXJlIGFu
ZCAKPiBjb250cm9sIHRoZSBETUEgY29weWluZyBzcGVlZCBidXQgdGhlIGRyaXZlciBkb2VzIG5v
dC4uLiIKPgoKSGksCgp3ZSBuZWVkICpob3N0X3BlcmlvZF9ieXRlcyAqaW4gRlcgdG8gcHJvcGVy
bHkgZHJhaW4gZGF0YSAtIGJ5IHByb3Blcmx5IEkgCm1lYW4gdG8gbm8gb3ZlcnJpZGUgaG9zdCBi
dWZmZXIgYnV0IGluIHRoZSBzYW1lIHRpbWUgdG8gYXZvaWQgc2l0dWF0aW9uIAp3aGVuIGhvc3Qg
aXMgd2FpdGluZyBmb3IgZGF0YSBhbmQgZG9lc24ndCBnZXQgaXQuIFRoZSBmb3JtZXIgaXMga25v
d24gYXMgCipvdmVycnVuICp3aGlsZSB0aGUgbGF0ZXIgKnVuZGVycnVuKiouCioKClNvIHRoYXQn
cyB3aHkgSSBvcmlnaW5hbGx5IHVzZWQgdGhlIHdvcmQgKiJ0byBzeW5jaHJvbml6ZSIgKmJlY2F1
c2UgaXQgCmJlc3QgcmVmbGVjdHMgdGhlIHVzZSBvZiB0aGlzIHZhcmlhYmxlIGluIEZXLgoKKlRo
ZSBwcm9ibGVtICotIGhvc3QgZXN0YWJsaXNoZXMgdGhlICpwZXJpb2Rfc2l6ZS8qKmhvc3RfcGVy
aW9kX2J5dGVzIAoqYW5kIHVzZXMgaXQgYXMgYSAiZGF0YSBjb3B5IHRlbXBvIGNvbnRyb2xsZXIi
IG1lYW5pbmcgaXQgd2lsbCBjb3B5IGRhdGEgCmJ1ZmZlcmVkIGluIGl0cyBvd24gYnVmZmVyIChj
b3BpZWQgdGhlcmUgYnkgRlcpIGluICpwZXJpb2Rfc2l6ZSAqdGltZSAKaW50ZXJ2YWxzLiBOb3cs
IGluIHJlZ3VsYXIgY29weSAocmVhbCB0aW1lIHN0cmVhbSkgZmlybXdhcmUgZG9lc24ndAoKbmVl
ZCB0byBjYXJlIGFib3V0IGhvdyBmYXN0IGhvc3QgY29weSBiZWNhdXNlIHRoZSBob3N0IGJ1ZmZl
ciBpcyBiaWcgCmVub3VnaCB0byBzdG9yZSBldmVuIHNldmVyYWwgRlcgcGVyaW9kcyAoZWFjaCBv
bmUgb3IgZmV3IG1pbGxpc2Vjb25kcynCoCAKd2l0aG91dCBvdmVycmlkaW5nIGl0LiBUaGF0IGlz
IHdoeSB3ZSBkaWQgbm90IG5lZWQgdGhpcyAqcGVyaW9kX3NpemUgCip2YXJpYWJsZSBiZWZvcmUu
IEhvd2V2ZXIgdGhlIGRyYWluaW5nIHRhc2sgaXMgdmVyeQoKZGlmZmVyZW50IGJhbGwgZ2FtZSAt
IGl0IGNvcGllcyAqMiwxIHNlY29uZHMqIG9mIGRhdGEgYXMgZmFzdCBhcyAKcG9zc2libGUgdG8g
dGhlIGhvc3QuIFRoZXJlZm9yZSB3ZSBhcmUgdmVyeSBwcm9uZSB0byAqWFJVTnMqCgoqVGhlIHNv
bHV0aW9uKiAtIGluIEZXIHdlIG5lZWQgdG8ga25vdyBob3cgb2Z0ZW4gaG9zdCBjb3BpZXMgZGF0
YSBvdXQgCmZyb20gaXRzIG93biBidWZmZXIgYW5kIHRoaXMgaW5mb3JtYXRpb24gaXMgc3RvcmVk
IGluIAoqaG9zdF9wZXJpb2RfYnl0ZXMsICpsZXRzIHNlbmQgdGhpcyBpbmZvcm1hdGlvbiBkb3du
IHRvIGZpcm13YXJlLiBOb3csIAp0aGUgRlcga25vd2luZyB0aGlzIGNhbiBmaWxsIHRoZSBob3N0
IGJ1ZmZlciBhbmQgd2FpdCB0aGUgdGltZSAKY2FsY3VsYXRlZCBieSAqaG9zdF9wZXJpb2RfYnl0
ZXMqCgpiZWZvcmUgbmV4dCBjb3B5LiBUaGlzIHdheSB3ZSBjb3B5IGFzIG11Y2gvZmFzdCBhcyB3
ZSBjYW4gYW5kIGluIHRoZSAKc2FtZSB0aW1lIHdlIGFyZSBzYWZlIHRoYXQgaG9zdCB3aWxsIGhh
bmRsZSB0aGlzIGFuZCBubyBYUlVOIHdpbGwgZXZlciAKaGFwcGVuLgoKCkhvcGUgaXQgaGVscGVk
IHRvIHVuZGVyc3RhbmQgdGhlIG5lZWQgb2YgKmhvc3RfcGVyaW9kX2J5dGVzICppbiB0aGUgCmZp
cm13YXJlLgoqKgoKTWFyY2luCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCg==
