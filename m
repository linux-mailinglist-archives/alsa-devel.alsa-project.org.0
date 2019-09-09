Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35DAD1B1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 03:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EBCA165D;
	Mon,  9 Sep 2019 03:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EBCA165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567994166;
	bh=Es62IvMOcsfG7LLigoadFXkQkFsKcDyw7h1DNADQe6s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNNyXiQdlVNFsqdxYeJNyaCuULq5PFSPG+iDhjoKk5Z86oxtV0L/PzrLAKXcvlWw0
	 xC/N2B3sISISfJW7HYPGFr6SJxhOAtFa4GvEbfhnK8V7CuH/36m7YzRyNfSvjxGiy1
	 tnca3ZzT+BPi6SBQNoqwS57I9fWdStwaHOawOH60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89597F804CF;
	Mon,  9 Sep 2019 03:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57370F804CF; Mon,  9 Sep 2019 03:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E141F800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 03:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E141F800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Sep 2019 18:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,483,1559545200"; d="scan'208";a="188881431"
Received: from keyon-x299.sh.intel.com (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga006.jf.intel.com with ESMTP; 08 Sep 2019 18:54:10 -0700
To: Jaroslav Kysela <jkysela@redhat.com>, Jie Yang <yang.jie@intel.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <46f8e754-c1f3-5586-cacf-ad6ddd722e74@linux.intel.com>
Date: Mon, 9 Sep 2019 10:00:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commits (Jie
 Yang: 2 total)
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

T24gMjAxOS85Lzgg5LiL5Y2INjozOSwgSmFyb3NsYXYgS3lzZWxhIHdyb3RlOgo+IEFzIGRpc2N1
c3NlZCwgd2Ugd291bGQgbGlrZSB0byBtb3ZlIHRoZSBVQ00gY29uZmlndXJhdGlvbiBmaWxlcyBm
cm9tIHRoZQo+IGFsc2EtbGliIHJlcG9zaXRvcnkgdG8gbmV3IGFsc2EtdWNtLWNvbmYgcmVwb3Np
dG9yeSB3aXRoIHRoZSBsaWNlbmNlIGNoYW5nZQo+IGZyb20gTEdQTC0yLjEgdG8gQlNELTMtQ2xh
dXNlLgo+IAo+IEkgd291bGQgbGlrZSB0byBjaGVjaywgaWYgeW91IGFncmVlIHdpdGggdGhpcyBs
aWNlbmNlIGNoYW5nZS4gUGxlYXNlLCBhbnN3ZXIKPiB0byB0aGlzIGUtbWFpbCBhbmQgd3JpdGUg
eW91ciBhZ3JlZW1lbnQgLyBkaXNhZ3JlZW1lbnQgKGtlZXAgQ0MgdG8KPiB0aGUgYWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QgZm9yIHRoZSBhcmNoaXZpbmcgcHVycG9zZXMpLgo+IAo+IFRoYW5rIHlv
dSBmb3IgeW91ciB0aW1lIGFuZCBjby1vcGVyYXRpb24uCj4gCj4gUmVmZXJlbmNlOiAgaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2EtZGV2ZWwvMjAxOS1KdWx5
LzE1MzI1Ny5odG1sCj4gCj4gTGlzdCBvZiB5b3VyIGNvbW1pdChzKToKPiAKPiAgICBiYTZmYTdi
NWE2YTM0ZGE5OGUwNWRmMzk1ZjcwYmJhM2UyOTkzNDk3Cj4gICAgICBjb25mL3VjbTogYnJvYWR3
ZWxsLXJ0Mjg2OiBjaGFuZ2UgdG8gdXNlIHRoZSBjb3JyZWN0IGphY2sga2NvbnRyb2wgbmFtZQo+
ICAgIDQwNDk1MWRhNWVkNjZjODBjYWY1ZTNmYTNkNzAzZjI5MTAwMmNiMjQKPiAgICAgIGNvbmYv
dWNtOiBicm9hZHdlbGwtcnQyODY6IGNoYW5nZSB0byBzZXQgY2FwdHVyZSB2b2x1bWUgYW5kIGNh
cHR1cmUgZGV2aWNlCgpZZXMsIEkgYWdyZWUgdG8gY2hhbmdlIHRoZSBsaWNlbnNlIGZyb20gTEdQ
TC0yLjEgdG8gQlNELTMtQ2xhdXNlIGZvciAKdGhvc2UgMiBjb21taXRzLCB0aGFua3MuCgp+S2V5
b24KCj4gCj4gLS0tCj4gSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KPiBMaW51eCBT
b3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
