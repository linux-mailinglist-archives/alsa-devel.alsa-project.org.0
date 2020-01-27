Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 063DF14A7A7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 17:00:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA7F14E;
	Mon, 27 Jan 2020 16:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA7F14E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580140832;
	bh=MN1SVSM4+XFuPBa20pWPgkgQ0FEWRobXSbzjOHWe59I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PkiYVi2An81c19izr+DEvhQ2V+W0yn88w1v9OZe3lQmuSYGsd53Jyz8SXKpoMvZkb
	 /s5VpYpjw3yG62DMHK59gKI1hh6cfnb0ggrrdgGsOLUKle2ovgbKC8eESFH/a2AG0b
	 EIp0Acfuw9Vjw7AuhkEZB1rE0rsduuSJ3Ywbj9cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3099F80273;
	Mon, 27 Jan 2020 16:57:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4530FF80218; Mon, 27 Jan 2020 16:57:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF1DF80234
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 16:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF1DF80234
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 07:57:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="223277237"
Received: from vvaddepa-mobl.amr.corp.intel.com (HELO [10.252.204.5])
 ([10.252.204.5])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 07:57:36 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-9-cezary.rojewski@intel.com>
 <d74dc038-78fa-b81c-5014-6ed3668641b1@linux.intel.com>
 <18e42c09-c09b-3916-c6e7-6431609bac7c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <55724e29-fd40-f871-5131-29d6dc19cad7@linux.intel.com>
Date: Mon, 27 Jan 2020 09:56:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18e42c09-c09b-3916-c6e7-6431609bac7c@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 08/12] ASoC: SOF: Generic probe compress
 operations
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

CgpPbiAxLzI3LzIwIDY6MjggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDIwLTAx
LTI0IDIxOjAwLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4+ICtpbnQgc29mX3By
b2JlX2NvbXByX29wZW4oc3RydWN0IHNuZF9jb21wcl9zdHJlYW0gKmNzdHJlYW0sCj4+PiArwqDC
oMKgwqDCoMKgwqAgc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCj4+PiArewo+Pj4gK8KgwqDCoCBz
dHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYgPQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShkYWktPmNvbXBvbmVudCk7Cj4+PiAr
wqDCoMKgIGludCByZXQ7Cj4+PiArCj4+PiArwqDCoMKgIHJldCA9IHNuZF9zb2ZfcHJvYmVfY29t
cHJfYXNzaWduKHNkZXYsIGNzdHJlYW0sIGRhaSk7Cj4+PiArwqDCoMKgIGlmIChyZXQgPCAwKSB7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkYWktPmRldiwgIkZhaWxlZCB0byBhc3NpZ24g
cHJvYmUgc3RyZWFtOiAlZFxuIiwgcmV0KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIHNkZXYtPmV4dHJhY3RvciA9IHJldDsK
Pj4KPj4gY291bGQgeW91IGVpdGhlciByZW5hbWUgdGhlICdleHRyYWN0b3InIGZpZWxkIHRvIHNv
bWV0aGluZyBtZWFuaW5nZnVsIAo+PiBvciBhZGQgYSBjb21tZW50IG9uIHdoYXQgaXMgc3RvcmVk
IGluIHRoaXMgZmllbGQ/IEEgc3RyZWFtIHRhZz8gYSAKPj4gZGV2aWNlIG51bWJlcj8gSXQncyBv
bmx5IHVzZWQgb25jZSBmb3IgdGhlIGluaXQuCj4gCj4gJ2V4dHJhY3RvcicgaXMgX3ZlcnlfIG1l
YW5pbmdmdWwgYW5kIGV4cGxpY2l0IHNvIHRoZSBuYW1pbmcgc2hvdWxkIHN0YXkuIAo+IFJld29y
ZGluZyB0byBzdHJlYW1fdGFnIC8gZGV2IG51bSBvciBhbnl0aGluZyBvZiB0aGF0IHNvcnQgd291
bGQgYWNoaWV2ZSAKPiB0aGUgZXhhY3Qgb3Bwb3NpdGU6IGFtYmlndWl0eS4gQ29kZSBhcm91bmQg
J2V4dHJhY3RvcicgdXNhZ2UgY2xlYXJseSAKPiBzdGF0ZXMgd2hhdCBpdCBpcyBmb3IuIEknZCBy
YXRoZXIgcHJlZmVyIHN1Y2ggZGVzY3JpcHRpb25zIHRvIHN0YXkgCj4gd2l0aGluIERvY3VtZW50
YXRpb24gLSB3aGljaCB3aWxsIGJlIHJlbGVhc2VkIG9uIGEgbGF0ZXIgZGF0ZSBhcyBTT0YncyAK
PiBwcm9iZXMgYXJlIHZlcnksIHZlcnkgZnJlc2ggc3ViamVjdC4KCidleHRyYWN0b3InIGlzIGFu
IGludGVnZXIsIGFuZCB0aGVyZSdzIG5vdGhpbmcgdGhhdCB0ZWxscyBtZSB3aGF0IHZhbHVlcyAK
aXQgY2FuIHRha2UsIGFuZCB3aGF0IGl0IGNvcnJlc3BvbmRzIHRvLgoKWW91IGFsc28gc3RvcmUg
dGhlIHJlc3VsdCBvZiAncHJvYmVfY29tcHJfYXNzaWduJyBidXQgZG9uJ3QgdXNlIGl0IGluIGEg
CmZyZWUuIFRoZSBvbmx5IHBsYWNlIHdoZXJlIEkgc2VlIGl0IHVzZWQgaXMKCisgICAgcmV0ID0g
c29mX2lwY19wcm9iZV9pbml0KHNkZXYsIHNkZXYtPmV4dHJhY3RvciwgcnRkLT5kbWFfYnl0ZXMp
OwoKQW5kIHRoZW4gaWYgbG9vayBiYWNrIGF0IFBhdGNoIDcsIEkgc2VlIHRoaXM6CgoraW50IHNv
Zl9pcGNfcHJvYmVfaW5pdChzdHJ1Y3Qgc25kX3NvZl9kZXYgKnNkZXYsCisJCXUzMiBzdHJlYW1f
dGFnLCBzaXplX3QgYnVmZmVyX3NpemUpCgpzbyB5b3VyICdleHRyYWN0b3InIGlzIHJlYWxseSBh
biAnZXh0cmFjdG9yX3N0cmVhbV90YWcnLgoKQlRXIHBsZWFzZSB0cnkgYW5kIGNvbXBpbGUgd2l0
aCBXPTEsIHlvdSdsbCBzZWUga2VybmVsLWRvYyBlcnJvcnMgd2l0aCAKbWlzc2luZyBwYXJhbWV0
ZXJzLCB0aGFua3MhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
