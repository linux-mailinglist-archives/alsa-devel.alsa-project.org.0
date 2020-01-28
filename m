Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167114B318
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210AD168A;
	Tue, 28 Jan 2020 11:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210AD168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580208953;
	bh=GwHyuMyvrQ0TKjvATrrb+cV4EktFc5kQYsXhGzc04ls=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yae8GMHvZBcAfmN5FHxBE2v+n93LTGsE4aUTM+dEK1ouat1896n5/NVwVFNLlLWyx
	 8cBD9gpR9P6gA9cQM1RWQBl9e5fCnBGgzVQZiXyUlZkmzHbiam72vxFyshS3dzrCAn
	 rfDBk1/7/XF62ytULt9+SFMk9yZtznyH/u7UBRl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F811F801EB;
	Tue, 28 Jan 2020 11:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90135F8014B; Tue, 28 Jan 2020 11:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB5CF80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB5CF80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="231880811"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 02:54:35 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
 <20200127121243.15813-8-cezary.rojewski@intel.com>
 <856e030c-e6ee-75dd-30e2-5ece864ec2fa@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <26c31898-c67d-e22c-cd96-7a70667cebe4@intel.com>
Date: Tue, 28 Jan 2020 11:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <856e030c-e6ee-75dd-30e2-5ece864ec2fa@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 07/11] ASoC: SOF: Implement Probe IPC API
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

T24gMjAyMC0wMS0yNyAyMjoyMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2Mvc29mL3NvZi1wcml2LmggYi9zb3VuZC9zb2Mvc29mL3NvZi1w
cml2LmgKPj4gaW5kZXggYmMyMzM3Y2YxMTQyLi45ZmE2ZmI2YzdiOTMgMTAwNjQ0Cj4+IC0tLSBh
L3NvdW5kL3NvYy9zb2Yvc29mLXByaXYuaAo+PiArKysgYi9zb3VuZC9zb2Mvc29mL3NvZi1wcml2
LmgKPj4gQEAgLTM4Nyw2ICszODcsOSBAQCBzdHJ1Y3Qgc25kX3NvZl9kZXYgewo+PiDCoMKgwqDC
oMKgIHdhaXRfcXVldWVfaGVhZF90IHdhaXRxOwo+PiDCoMKgwqDCoMKgIGludCBjb2RlX2xvYWRp
bmc7Cj4+ICvCoMKgwqAgLyogcHJvYmVzICovCj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGV4dHJh
Y3RvcjsKPj4gKwo+IAo+IGlmIHdlIGNhbiByZW5hbWUgdGhpcyBleHRyYWN0b3Jfc3RyZWFtX3Rh
ZyBpdCdkIGJlIG1vcmUgZXhwbGljaXQgZm9yIAo+IGZ1dHVyZSBjb2RlIGV2b2x1dGlvbnMuIHdl
IGhhdmUgdG9vIG1hbnkgdGhpbmdzIGluIHRoaXMgc29mLWRldiAKPiBzdHJ1Y3R1cmVzIGFuZCBp
dCdzIGhhcmQgdG8ga2VlcCB0cmFjayBvZiB3aGF0IGlzIHVzZWQgZm9yIHdoYXQgd2l0aG91dCAK
PiBzZWxmLWV4cGxhbmF0b3J5IG5hbWluZyBjb252ZW50aW9ucy4gVGhhbmtzIQoKUmVuYW1lZCBh
cyByZXF1ZXN0ZWQuCgpXaGV0aGVyIGRpcmVjdGx5IG9yIGluZGlyZWN0bHksIHlvdXIgY29tbWVu
dHMgbWFkZSBtZSByZWFsaXplIHRoZSAKJ2V4dHJhY3Rvcl9zdHJlYW1fdGFnJyBmaWVsZCB3YXMg
aW5jb3JyZWN0bHkgZGVjbGFyZWQgd2l0aGluIDA3ICh0aGlzIApwYXRjaCkgcmF0aGVyIHRoYW4g
dGhlIDA4IHBhdGNoOiAiQVNvQzogU09GOiBHZW5lcmljIHByb2JlIGNvbXByZXNzIApvcGVyYXRp
b25zIi4gU2FpZCBmaWVsZCBuZXZlciBlbnRlcnMgSVBDIGRvbWFpbiBhbmQgaXMgb3BhcXVlIHRv
d2FyZHMgCnByb2JlLUlQQ3MuIE9ubHkgdGhlIGNvbXByZXNzIHJlbGF0ZWQgbWVjaGFuaXNtIGNh
cmVzIGFib3V0IGl0LiBUaGFua3MgClBpZXJyZSEKCkN6YXJlawpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
