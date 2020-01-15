Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C65CA13C386
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 14:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535E617AF;
	Wed, 15 Jan 2020 14:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535E617AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579096157;
	bh=FhugRagA62P1vxL+yl4Gq1/ajKIM2W5eJqQl8aizemI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DZiVqlPw12sRU/3jQTSiHW75Zsh9Nz2enh4C70mQ4kE4Ad2NuaPO43WR3Ofsl/J4t
	 SIxZklO9FNpgboCIZiuD6Z71+9jjZfY7G9IEnnDFi7oBm+YGVfm6XvUb9c3NMZOJdS
	 vayICnyHRUbFnv14EEpRL4GQkjNPaMyuRsthyUxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6BEF801EB;
	Wed, 15 Jan 2020 14:47:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 179B5F801EB; Wed, 15 Jan 2020 14:47:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BE13F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 14:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE13F800CC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 05:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
 d="scan'208,217";a="397887113"
Received: from unknown (HELO [10.237.142.238]) ([10.237.142.238])
 by orsmga005.jf.intel.com with ESMTP; 15 Jan 2020 05:47:19 -0800
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
To: alsa-devel@alsa-project.org
Message-ID: <7ae52bb6-1af4-897f-7de1-34196d0ed1f0@linux.intel.com>
Date: Wed, 15 Jan 2020 14:47:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] arecord: buffer-size dependency on period-size and
	other params
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

SGVsbG8sCgpJIGhhdmUgc3BvdHRlZCBzdHJhbmdlIGJlaGF2aW9yIG9mIGFsc2EtbGliIHdoZW4g
SSB0cnkgdG8gc2V0IApidWZmZXItc2l6ZSBpbiBhcmVjb3JkLiBJdCBsb29rcyBsaWtlIHRoZSBz
aXplIG9mIHRoZSBidWZmZXIgaXMgdmVyeSAKZGVwZW5kZW50IG9uIG90aGVyIHBhcmFtZXRlcnMg
bGlrZSBwZXJpb2Qtc2l6ZSBhbmQgcmF0ZSBmb3IgZXhhbXBsZS4gQXQgCmZpcnN0IGl0IHNvdW5k
cyBsaWtlIG5vcm1hbCBiZWhhdmlvdXIsIGFmdGVyIGFsbCBidWZmZXIgc2l6ZSBzbWFsbGVyIAp0
aGFuIHBlcmlvZCBzaXplIGRvZXNu4oCZdCBtYWtlIG11Y2ggc2Vuc2UuIEhvd2V2ZXIgd2hhdCBp
ZiB3ZSBnbyBpbiB0aGUgCnJldmVyc2UgZGlyZWN0aW9uIGFuZCBzZXQgYnVmZmVyLXNpemUgbXVj
aCBsYXJnZXIgdGhhbiBwZXJpb2Qgc2l6ZT8gVGhlbiAKSSBzZWUgbm8gcmVhc29uIHRvIGZvcmJp
ZCBzdWNoIHJlcXVlc3QgKGF0IGxlYXN0IG9uIHRoZSB1c2VyIHNwYWNlIApsZXZlbCkuIFNvIHRv
IGJlIHNwZWNpZmljIEkgaXNzdWUgc3VjaCBjb21tYW5kOiBhcmVjb2QgLURwbHVnaHc6MCw4IC1y
IAoxNjAwMCAtYyAyIC1mIFMyNF9MRSAtLWJ1ZmZlcl9zaXplIDEyODAwMDAgdG1wLndhdiAtdnZ2
LiBUaGUgYXJlY29yZCAKcmVzcG9uc2UgZm9yIHRoaXMgaXMgYnVmZmVyIHNpemUgb2YgMzE5OTIg
ZnJhbWVzLCAyNTU5MzYgYnl0ZXMuIE5vdyBsZXQgCm1lIGFsc28gdGVsbCB0aGUgYnVmZmVyIHNp
emUgb2YgMTI4MDAwMCBieXRlcyBpcyB0aGUgbWF4aW11bSBidWZmZXIgc2l6ZSAKb3VyIGRyaXZl
ciBhbGxvd3MsIGxpa2V3aXNlIG1heCBwZXJpb2QgaXMgMjY4ODAwIGJ5dGVzLiBOb3cgaWYgaW5z
aWRlIApvdXIgZHJpdmVyIEkgZG91YmxlIG1heCBwZXJpb2Qgc2l6ZSBsaW1pdCBJIGdldCBidWZm
ZXIgc2l6ZSBhY2NvcmRpbmdseSAKYmlnZ2VyLiBTaW1pbGFybHksIGlmIEkgY2hhbmdlIHRoZSBm
b3JtYXQgaW4gdGhlIGNvbW1hbmQgbGluZSByZXF1ZXN0IApmcm9tIFMyNF9MRSB0byBpLmUgUzE2
X0xFIHRoZW4gYWdhaW4gSSB3aWxsIGdldCBidWZmZXIgc2l6ZSBjbG9zZXIgdG8gbXkgCnJlcXVl
c3QgKGJpZ2dlcikuIFNvIGJlbG93IGFyZSBteSBxdWVzdGlvbnM6CgogMS4gV2h5IGFsc2EtbGli
IGJlaGF2ZXMgaW4gYSB3YXkgSSBkZXNjcmliZWQgYWJvdmU/IFdoeSBJIGNhbiBub3QKICAgIGNv
bnRyb2wgYnVmZmVyIHNpemUgaW5kZXBlbmRlbnRseSBmcm9tIG90aGVyIHBhcmFtZXRlcnMgKHBy
b3ZpZGluZwogICAgaXQgaGFzIHBoeXNpY2FsIHNlbnNlKS4KIDIuIEl0IGxvb2tzIGxpa2UgYWxz
YS1saWIgZmlyc3QgY2FsY3VsYXRlcyBpbml0aWFsIGJ1ZmZlci1zaXplIGJhc2Ugb24KICAgIG90
aGVyIGlucHV0IHBhcmFtcyBsaWtlIG1lbnRpb25lZCBwZXJpb2Qgc2l6ZSBvciBzYW1wbGluZyBy
YXRlIGFuZAogICAgdGhlbiBhc2sgZHJpdmVyIHRvIHJlZmluZSBpdCBhY2NvcmRpbmcgdG8gaXRz
IGNhcGFiaWxpdGllcy4gSXMgdGhhdAogICAgdGhlIGNhc2U/CiAzLiBJIGFsc28gdHJpZWQgdG8g
ZHVtcCBodyBjYXBhYmlsaXRpZXMgYnkgYWRkaW5nIOKAk2R1bXAtaHctcGFyYW0gZmxhZwogICAg
dG8gbXkgY29tbWFuZCBsaW5lIHJlcXVlc3QgYW5kIGhlcmUgeWV0IGFub3RoZXIgc3VycHJpc2Ug
4oCTIGluIGEgcm93CiAgICBkZWRpY2F0ZWQgZm9yIGJ1ZmZlciBzaXplIGl0IHNheXMg4oCcQlVG
RkVSX1NJWkUgWzEyIDQyOTQ5NjcyOTRd4oCdLgogICAgV2hlcmUgaXMgdGhpcyDigJw0Mjk0OTY3
Mjk04oCdIGNvbWVzIGZyb20sIGFuZCBvbiB3aGF0IGJhc2ljcyBpcyBpdAogICAgY2FsY3VsYXRl
ZD8gSSB3b3VsZCBleHBlY3QgYXQgdGhlIGJhcmUgbWluaW11bSBpdCBzaG91bGQgYXNrIGRyaXZl
cgogICAgYnV0IGluIHRoZSBzbmRfcGNtX2h3X3BhcmFtX2R1bXAoKSBmdW5jdGlvbiBJIGRvbuKA
mXQgc2VlIGFueQogICAgY29tbXVuaWNhdGlvbiB3aXRoIHRoZSBkcml2ZXIuCgpLaW5kIFJlZ2Fy
ZHMsCgpNYXJjaW4gUmFqd2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fs
c2EtZGV2ZWwK
