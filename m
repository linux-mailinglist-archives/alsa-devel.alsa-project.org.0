Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11639159B00
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 22:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787851616;
	Tue, 11 Feb 2020 22:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787851616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581455633;
	bh=LHyDNljAHyOIibs8J+g3GlHvcWcShdQQgAxmP6D9p9Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bY1oP4vdjyz0PybINXvbT2ANS0p+E5MTi/bULMQhdr+rcM+0pQLsR7MGo4o4VQ93O
	 PXDRE/NHEEF+Tg5uqUf4wEpmQskz1da5ZHzvGEn92mPinWCCgA049Mn8hREXwgzMlt
	 sv+di2SF3HO5g6wsuXvoudE/BlcH0iAiojNZsAPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8679CF800F0;
	Tue, 11 Feb 2020 22:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 150C5F80145; Tue, 11 Feb 2020 22:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AE66F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 22:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE66F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 13:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="256603823"
Received: from lmgarret-mobl2.amr.corp.intel.com (HELO [10.251.152.253])
 ([10.251.152.253])
 by fmsmga004.fm.intel.com with ESMTP; 11 Feb 2020 13:12:01 -0800
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <AM6PR10MB2263F302A86B17C95B16361280190@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <SN6PR11MB26702B2E7E5F705425517F4897180@SN6PR11MB2670.namprd11.prod.outlook.com>
 <855c88fb-4438-aefb-ac9b-a9a5a2dc8caa@linux.intel.com>
 <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2eeca7fe-aec9-c680-5d61-930de18b952b@linux.intel.com>
Date: Tue, 11 Feb 2020 15:12:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeWHDyyd_YBBaD6P2sCL5OCNEsiUU6B7eUwtiLv8GZU0yg@mail.gmail.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "Lu,
 Brent" <brent.lu@intel.com>, "cychiang@google.com" <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
 callback
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

CgpPbiAyLzExLzIwIDI6MzcgUE0sIFNyaWRoYXJhbiwgUmFuamFuaSB3cm90ZToKPiAKPiAgICAg
ID4gSSB0aGluayB0aGUgcGF0Y2ggaXMgZm9yIHRob3NlIHN5c3RlbXMgd2hpY2ggZW5hYmxlIEky
UyBjbG9ja3MgaW4KPiAgICAgcGNtX3N0YXJ0IGluc3RlYWQKPiAgICAgID4gb2YgcGNtX3ByZXBh
cmUuIEl0IGhhcyBubyBlZmZlY3Qgb24gc3lzdGVtcyBhbHJlYWR5IGJlIGFibGUgdG8KPiAgICAg
dHVybiBvbiBjbG9ja3MgaW4KPiAgICAgID4gc3VwcGx5IHdpZGdldHMgb3Igc2V0X2JpYXNfbGV2
ZWwoKSBmdW5jdGlvbi4KPiAgICAgID4KPiAgICAgID4gSWYgdGhlIHRyaWdnZXIgdHlwZSBpbiB0
aGUgREFJIGxpbmsgaXMgVFJJR0dFUl9QUkUsIHRoZW4gdGhlCj4gICAgIHRyaWdnZXIgZnVuY3Rp
b24gb2YgRkUgcG9ydAo+ICAgICAgPiAoY29tcG9uZW50IG9yIENQVSBEQUkpIHdpbGwgYmUgY2Fs
bGVkIGJlZm9yZSBjb2RlYyBkcml2ZXIncwo+ICAgICB0cmlnZ2VyIGZ1bmN0aW9uLiBJbiB0aGlz
Cj4gICAgICA+IGNhc2Ugd2Ugd2lsbCBiZSBhYmxlIHRvIHR1cm4gb24gdGhlIGNsb2NrIGluIHRp
bWUuIEhvd2V2ZXIsIGlmCj4gICAgIHRoZSB0cmlnZ2VyIHR5cGUgaXMKPiAgICAgID4gVFJJR0dF
Ul9QT1NULCB0aGVuIHRoZSBwYXRjaCBkb2VzIG5vdCBoZWxwIGJlY2F1c2UganVzdCBsaWtlIHdo
YXQKPiAgICAgeW91IHNhaWQsIGNvZGVjCj4gICAgICA+IGRyaXZlcidzIHRyaWdnZXIgZnVuY3Rp
b24gaXMgY2FsbGVkIGZpcnN0Lgo+IAo+ICAgICBJSVJDIHdlIHJlY2VudGx5IGRpZCBhIGNoYW5n
ZSB0byBkZWFsIHdpdGggdW5kZXJmbG93cy4gUmFuamFuaSwgY2FuIHlvdQo+ICAgICByZW1pbmQg
dXMgd2hhdCB0aGUgaXNzdWUgd2FzPwo+IAo+IEhpIFBpZXJyZSwKPiAKPiBBcmUgeW91IHRhbGtp
bmcgYWJvdXQgdGhlIGNoYW5nZSBpbiB0aGlzIGNvbW1pdMKgYWNiZjI3NzQ2ZWNmYTk2Ygo+ICJB
U29DOiBwY206IHVwZGF0ZSBGRS9CRSB0cmlnZ2VyIG9yZGVyIGJhc2VkIG9uIHRoZSBjb21tYW5k
Ij8KPiAKPiBXZSBtYWRlIHRoaXMgY2hhbmdlIHRvIGhhbmRsZSB4cnVucyBkdXJpbmcgcGF1c2Uv
cmVsZWFzZSBwYXJ0aWN1bGFybHkgb24gCj4gdGhlIEludGVsIEhEQSBwbGF0Zm9ybXMuCgp0aGlz
IGNoYW5nZSB3YXMganVzdCB0byBtaXJyb3IgdGhlIGJlaGF2aW9yIGJldHdlZW4gc3RhcnQvc3Rv
cCwgSSAKdGhvdWdodCB0aGVyZSB3YXMgYSBwYXRjaCB3aGVyZSB3ZSBtb3ZlZCB0byBUUklHR0VS
X1BPU1QgYnkgZGVmYXVsdD8KCldoYXQgSSBhbSB0cnlpbmcgdG8gZmlndXJlIG91dCBpZiB3aGV0
aGVyIHVzaW5nIFRSSUdHRVJfUFJFIGlzIG9rIG9yIG5vdCAKZm9yIHRoZSBTT0YgZmlybXdhcmUu
CgpUaGFua3MhCi1QaWVycmUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
