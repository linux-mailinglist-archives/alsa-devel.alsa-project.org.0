Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A69AD2FF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 08:11:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C111669;
	Mon,  9 Sep 2019 08:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C111669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568009473;
	bh=pWZmjDCYZbOFkezaYKzhhPcHRH/dwsx0MQ3muLSGztw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGpLSp8t40S2lpL3kBHISxCxtUJt2QA9pM5Q1rwgwCoVLRb89svXxL6ZaJCHB6W/5
	 pkOSMaz5vq0vHEf4ncncNimfL1UCQcTEpnqpcS/D+zs8VgtLTqoAhBQ/ZheoQxCsIO
	 SE72/O8TxkP3FTnF2JaHDYjvYMBU1IwS0MkR0XRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 803E9F804CF;
	Mon,  9 Sep 2019 08:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1060BF804CF; Mon,  9 Sep 2019 08:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE226F80094
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 08:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE226F80094
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Sep 2019 23:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,483,1559545200"; d="scan'208";a="188924696"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2019 23:09:18 -0700
To: Jaroslav Kysela <perex@perex.cz>, tridlh@hotmail.com
References: <15679391594432724-alsa-devel@perex.cz>
 <50d38c53-78c8-0593-2029-f5502c49b69f@perex.cz>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <977a5bd9-7dde-7207-bb93-fc008197faf0@linux.intel.com>
Date: Mon, 9 Sep 2019 14:15:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <50d38c53-78c8-0593-2029-f5502c49b69f@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit (Lu,
 Han: 1 total)
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

SGkgSmFyb3NsYXYsCgpIZXJlIGFkZCBIYW4ncyBuZXcgZW1haWwgYWRkcmVzcyB3aGljaCBtYXkg
YmUgYXBwcm9hY2hhYmxlLgoKfktleW9uCgpPbiAyMDE5LzkvOCDkuIvljYg4OjQ1LCBKYXJvc2xh
diBLeXNlbGEgd3JvdGU6Cj4gUmVzZW5kIChkZWxpdmVyeSBpc3N1ZXMgZm9yIHRoZSBkaXJlY3Qg
ZS1tYWlsKS4gUGxlYXNlLCBhbnN3ZXIuIFRoYW5rIHlvdS4KPiAKPiAJCQkJCUphcm9zbGF2Cj4g
Cj4gMDguMDkuMTkgaW4gMTI6MzkgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+PiBBcyBkaXNjdXNz
ZWQsIHdlIHdvdWxkIGxpa2UgdG8gbW92ZSB0aGUgVUNNIGNvbmZpZ3VyYXRpb24gZmlsZXMgZnJv
bSB0aGUKPj4gYWxzYS1saWIgcmVwb3NpdG9yeSB0byBuZXcgYWxzYS11Y20tY29uZiByZXBvc2l0
b3J5IHdpdGggdGhlIGxpY2VuY2UgY2hhbmdlCj4+IGZyb20gTEdQTC0yLjEgdG8gQlNELTMtQ2xh
dXNlLgo+Pgo+PiBJIHdvdWxkIGxpa2UgdG8gY2hlY2ssIGlmIHlvdSBhZ3JlZSB3aXRoIHRoaXMg
bGljZW5jZSBjaGFuZ2UuIFBsZWFzZSwgYW5zd2VyCj4+IHRvIHRoaXMgZS1tYWlsIGFuZCB3cml0
ZSB5b3VyIGFncmVlbWVudCAvIGRpc2FncmVlbWVudCAoa2VlcCBDQyB0bwo+PiB0aGUgYWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QgZm9yIHRoZSBhcmNoaXZpbmcgcHVycG9zZXMpLgo+Pgo+PiBUaGFu
ayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgY28tb3BlcmF0aW9uLgo+Pgo+PiBSZWZlcmVuY2U6ICBo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9waXBlcm1haWwvYWxzYS1kZXZlbC8yMDE5
LUp1bHkvMTUzMjU3Lmh0bWwKPj4KPj4gTGlzdCBvZiB5b3VyIGNvbW1pdChzKToKPj4KPj4gICAg
M2MyNjM3MTZmZDViZDJkOWQ1MzA4Y2IxM2RiYTY2N2QxMzhjMDA5Nwo+PiAgICAgIGNvbmYvdWNt
OiBicm9hZHdlbGwtcnQyODY6IGFkZCB1Y20gY29uZmlnCj4+Cj4+IC0tLQo+PiBKYXJvc2xhdiBL
eXNlbGEgPHBlcmV4QHBlcmV4LmN6Pgo+PiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFBy
b2plY3Q7IFJlZCBIYXQsIEluYy4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
