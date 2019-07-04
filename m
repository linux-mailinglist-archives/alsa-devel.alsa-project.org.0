Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6525F694
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 12:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F15169F;
	Thu,  4 Jul 2019 12:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F15169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562235950;
	bh=8ySgt8cT1joNNgTtknENPK/B3QlRC5erpdm+y+VjJCc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovQXMcLvuMhN6tKrxnsjw1IZB8951Gj1qd9TSh0m1LBBVS7qz1S3vi0J0akHapgN8
	 m4U0wURfrYSGdc9lUF7LhMfKfp6t9mYQGOacSqAjnSvLY8q1tRrnFmrfxsHlN4EHrt
	 a+d5nEJDas8IU+vL2TX8gNC+BP2ZDI4GvpBbS+rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E38B0F80113;
	Thu,  4 Jul 2019 12:24:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F8F7F80111; Thu,  4 Jul 2019 12:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D3EFF800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 12:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D3EFF800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 03:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,450,1557212400"; d="scan'208";a="166238141"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jul 2019 03:23:58 -0700
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20190703151023.30313-1-yang.jie@linux.intel.com>
 <alpine.DEB.2.21.1907041254100.4409@eliteleevi>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <3788800e-7050-d68a-bec6-5b443fd0d563@linux.intel.com>
Date: Thu, 4 Jul 2019 18:29:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907041254100.4409@eliteleevi>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: SOF: add flag for position
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

CgpPbiAyMDE5LzcvNCDkuIvljYg2OjAzLCBLYWkgVmVobWFuZW4gd3JvdGU6Cj4gSGksCj4gCj4g
cGF0Y2ggbG9va3MgZ29vZCwgYnV0IGNvbW1pdCBtZXNzYWdlIGNvdWxkIGJlIGltcHJvdmVkLgo+
IAo+IE9uIFdlZCwgMyBKdWwgMjAxOSwgS2V5b24gSmllIHdyb3RlOgo+IAo+PiBJbiBzb21lIGNh
c2VzLCBGVyBtaWdodCBuZWVkIHVzZSB0aGUgaG9zdF9wZXJpb2RfYnl0ZXMgZXZlbiBubyBwb3Np
dGlvbgo+PiB1cGRhdGUgaXBjIHJlcWl1cmVkIGZyb20gZHJpdmVyLCBoZXJlIGFkZCBhbm90aGVy
IGZsYWcgZm9yIHBvc2l0aW9uIHVwZGF0ZSwKPj4gYW5kIHByZXNlcnZlIGhvc3RfcGVyaW9kX2J5
dGVzIGZvciBGVyB0byB1c2UuCj4gCj4gU3BlY3VsYXRpb24gb24gd2hhdCBGVyBtaWdodCBkbyBp
cyBub3QgcmVhbGx5IG5lZWRlZC4gVGhlCj4gaG9zdF9wZXJpb2RfYnl0ZXMgZmllbGQgaGFzIGJl
ZW4gb3ZlcmxvYWRlZCB3aXRoIG11bHRpcGxlCj4gc2VtYW50aWNzIGFuZCB0aGlzIHBhdGNoIGNs
ZWFycyB0aGF0LCByaWdodC4gSG93IGFib3V0OgoKV2VsbCwgdG8gbWUgaXQgaXMgZmxhdm9yIGNo
b2ljZSwgUmFuamFuaSBzdWdnZXN0ZWQgdG8gaWxsdXN0cmF0ZSB0aGUgdXNlIApjYXNlIHdoZXJl
IHRoZSBGVyB3aWxsIHVzZSB0aGlzIGhvc3RfcGVyaW9kX2J5dGVzLCBhbmQgSSBhZ3JlZWQgdGhp
cyAKd2lsbCBoZWxwIHBlb3BsZSB0byB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVkIHRoaXMgY2hhbmdl
LgoKPiAKPiAiIgo+IFJlbW92ZSB0aGUgc3BlY2lhbCBjYXNlIHNlbWFudGljcyBvZiAnaG9zdF9w
ZXJpb2RfYnl0ZXM9PTAnLgo+IEFkZCBhIG5ldyBmaWVsZCAnbm9fcGVyaW9kX2lycScgdG8gc2ln
bmFsIHdoZXRoZXIgcGVyaW9kIGVsYXBzZWQKPiBJUEMgc2hvdWxkIGJlIHNlbnQgYW5kIHVzZSAn
aG9zdF9wZXJpb2RfYnl0ZXMnIG9ubHkgZm9yCj4gcGVyaW9kIHNpemUuCj4gIiIKPiAKPj4gVGhp
cyBtaWdodCByZXF1aXJlIGNvcnJlc3BvbmRpbmcgRlcgY2hhbmdlIGFuZCBBQkkgYWxpZ25tZW50
Lgo+IAo+IFRoaXMgaXMgbm90IGhlbHBmdWwgLS0gd2Uga25vdyB0aGlzIF9pc18gYSBtaW5vciBB
QkkgY2hhbmdlCj4gYW5kIG5lZWRzIHRvIGJlIGFsaWduZWQgd2l0aCBGVy4KCkl0IGlzIG1pbm9y
IGNoYW5nZSwgYnV0IHRoZSBGVyBjaGFuZ2UgaXMgc3RpbGwgcmVxdWlyZWQsIG90aGVyd2lzZSwg
d2UgCndpbGwgZ2V0IGV4dHJhIHBvc2l0aW9uIHVwZGF0ZSBJUENzIHdoaWNoIG1heSBjb25mdXNl
IHRoZSBkcml2ZXIsIHBsZWFzZSAKcmVmZXIgdG8gaGVyZToKaHR0cHM6Ly9naXRodWIuY29tL3Ro
ZXNvZnByb2plY3Qvc29mL3B1bGwvMTU5MgoKVGhhbmtzLAp+S2V5b24KCj4gCj4gQnIsIEthaQo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
