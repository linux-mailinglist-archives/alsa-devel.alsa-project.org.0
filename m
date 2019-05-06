Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A67150BB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C223518FE;
	Mon,  6 May 2019 17:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C223518FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557158011;
	bh=fvucRRAoXItznUzijQIHfVrr47HjxdjiY1ExeRevLnQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvKAYu/U7c6wSUqp4OHDAIJjIGOOAGblQLuhG+Pgp74+9/kU/cCKs7TUk86yV0d4d
	 rqD5qDpzu+5zGhVDN1gL8JSH4KQ94sPVomKV8MoLVIICZPxO4pRcqEpO+mfHrpG5ji
	 bDLMB2zMTOLpYv8nhRn2IqiWYeo7ui/UToAvb/SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4117F89727;
	Mon,  6 May 2019 17:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B040F89725; Mon,  6 May 2019 17:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F10AF89724
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F10AF89724
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="155608363"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 06 May 2019 08:50:54 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 2CC5158010A;
 Mon,  6 May 2019 08:50:53 -0700 (PDT)
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>,
 Nariman <narimantos@gmail.com>
References: <20190504151652.5213-1-user@elitebook-localhost>
 <20190504151652.5213-4-user@elitebook-localhost>
 <s5ha7g1l4oq.wl-tiwai@suse.de>
 <b9ea51f6-29fb-5ae8-607b-a047eba4bac0@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b8ced03c-4137-0be6-1c2b-705caba3bbc1@linux.intel.com>
Date: Mon, 6 May 2019 10:50:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b9ea51f6-29fb-5ae8-607b-a047eba4bac0@redhat.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Jordy Ubink <jordyubink@hotmail.nl>,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5651.c: remove string
 buffers 'byt_rt5651_cpu_dai_name' and 'byt_rt5651_cpu_dai_name'
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

T24gNS82LzE5IDEwOjQwIEFNLCBIYW5zIGRlIEdvZWRlIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA1
LTA1LTE5IDA5OjUxLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+IE9uIFNhdCwgMDQgTWF5IDIwMTkg
MTc6MTY6NTIgKzAyMDAsCj4+IE5hcmltYW4gd3JvdGU6Cj4+Pgo+Pj4gRnJvbTogSm9yZHkgVWJp
bmsgPGpvcmR5dWJpbmtAaG90bWFpbC5ubD4KPj4+Cj4+PiBUaGUgc25wcmludGYgY2FsbHMgZmls
bGluZyBieXRfcnQ1NjUxX2NwdV9kYWlfbmFtZSAvIAo+Pj4gYnl0X3J0NTY1MV9jcHVfZGFpX25h
bWUgYWx3YXlzIGZpbGwgdGhlbSB3aXRoIHRoZSBzYW1lIHN0cmluZyAKPj4+IChzc3AwLXBvcnQi
IHJlc3AgInJ0NTY1MS1haWYyIikuIFNvIGluc3RlYWQgb2Yga2VlcGluZyB0aGVzZSBidWZmZXJz
IAo+Pj4gYXJvdW5kIGFuZCBtYWtpbmcgdGhlIGNwdV9kYWlfbmFtZSAvIGNvZGVjX2RhaV9uYW1l
IHBvaW50IHRvIHRoaXMsIAo+Pj4gc2ltcGx5IHVwZGF0ZSB0aGUgZm9vX2RhaV9uYW1lIHBvaW50
ZXJzIHRvIGRpcmVjdGx5IHBvaW50IHRvIGEgc3RyaW5nIAo+Pj4gY29uc3RhbnQgY29udGFpbmlu
ZyB0aGUgZGVzaXJlZCBzdHJpbmcuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSm9yZHkgVWJpbmsg
PGpvcmR5dWJpbmtAaG90bWFpbC5ubD4KPj4KPj4gSWYgeW91IHN1Ym1pdCBhIHBhdGNoLCBwbGVh
c2UgZ2l2ZSB5b3VyIG93biBzaWduLW9mZiBhcyB3ZWxsIGFzIHRoZQo+PiBhdXRob3IncyBvbmUs
IGV2ZW4gaWYgdGhlIHBhdGNoIGlzIG5vdCB3cml0dGVuIGJ5IHlvdS7CoCBUaGlzIGlzIGEKPj4g
bGVnYWwgcmVxdWlyZW1lbnQuCj4gCj4gU29ycnksIHRoYXQgaXMgbXkgYmFkLCBOYXJpbWFuIGFu
ZCB0aGUgYXV0aG9yIGF1dGhvcnMgb2YgdGhlIHBhdGNoZXMKPiBhcmUgYSBncm91cCBvZiBzdHVk
ZW50cyBkb2luZyBzb21lIGtlcm5lbCB3b3JrIGZvciBtZSBhbmQgdGhpcyBpcwo+IGEgd2FybS11
cCBhc3NpZ25tZW50IGZvciB0aGVtIHRvIGdldCB1c2VkIHRvIHRoZSBrZXJuZWwgZGV2ZWxvcG1l
bnQKPiBwcm9jZXNzLgo+IAo+IEkgZm9yZ290IHRvIHBvaW50IG91dCB0byBOYXJpbWFuIHRoYXQg
c2luY2UgaGUgaXMgc2VuZGluZwo+IG91dCB0aGUgZW50aXJlIHNlcmllcyBmb3IgYWxsIDQgb2Yg
dGhlbSwgaGUgbmVlZHMgdG8gYWRkIGhpcwo+IFMtby1iLgoKT25lIHN1Z2dlc3Rpb24gZm9yIGFk
ZGl0aW9uYWwgY2xlYW51cHM6IGNhbiB3ZSB0cnkgYW5kIHJlbW92ZSBhbGwgdGhlc2UgCnN0YXRp
YyB2YXJpYWJsZXMgYW5kIG1vdmUgdGhlbSB0byB0aGUgY29udGV4dCBzdHJ1Y3R1cmU/IEl0J3Mg
YmVlbiBvbiBteSAKVE9ETyBsaXN0IGZvciBhIHdoaWxlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
