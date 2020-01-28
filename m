Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC614BDD4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 17:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0751677;
	Tue, 28 Jan 2020 17:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0751677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580229274;
	bh=Tf5oxETswZXPnGzibl/Tkra2tr+JkT1LxVv3lCnBNv8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYXAjqSfsIUQZy+oyWjqy8MPyfhi9lei5nxrNnmkLnIxuHKAndkr+dM9LnZ3yIkxm
	 hlVit8rerjB+DbrMVarwCjJi16/Sm9bbvTclqMWIrxSTDuNf1YlNYdAwA6tLSyQ0VK
	 V3h5PGT1XoXW3te/MLfz4MWatygEkgEUgtsHKNSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B46DF80228;
	Tue, 28 Jan 2020 17:32:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA7BF801F8; Tue, 28 Jan 2020 17:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07575F800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 17:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07575F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 08:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="232004557"
Received: from cauduong-mobl1.amr.corp.intel.com (HELO [10.254.184.245])
 ([10.254.184.245])
 by orsmga006.jf.intel.com with ESMTP; 28 Jan 2020 08:31:50 -0800
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7246ae53-a542-2726-78e5-db43318dd44b@linux.intel.com>
Date: Tue, 28 Jan 2020 10:08:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128080518.29970-1-daniel.baluta@oss.nxp.com>
Content-Language: en-US
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/4] Add a better separation between i.MX8
	families
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

CgpPbiAxLzI4LzIwIDI6MDYgQU0sIERhbmllbCBCYWx1dGEgKE9TUykgd3JvdGU6Cj4gRnJvbTog
RGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgo+IAo+IFNvIGZhciB0aGUgaW1w
bGVtZW50YXRpb24gd2FzIGRlc2lnbmVkIHRvIHN1cHBvcnQgIGEgZ2VuZXJpYyBwbGF0Zm9ybQo+
IG5hbWVkIGkuTVg4LiBBbnlob3csIG5vdyB3b3JraW5nIHdpdGggc3BlY2lmaWMgaS5NWDggaW5z
dGFuY2VzIHdlIG5lZWQKPiB0byBhY2NvdW50IGZvciB0aGUgZGlmZmVyZW5jZXMuCj4gCj4gaS5N
WDggbmFtaW5nIGNhbiBiZSBjb25mdXNpbmcgYXQgdGhlIGZpcnN0IGdsYW5jZSwgc28gd2UgbmVl
ZCB0byBoYXZlCj4gYSBjbGVhbiBzZXBhcmF0aW9uIGJldHdlZW4gZGlmZmVyZW50IHBsYXRmb3Jt
cy4KPiAKPiBIZXJlIGlzIHRoZSBzcGxpdCBvZiBpLk1YOCBwZXIgcGxhdGZvcm1zLiBOb3RpY2Ug
dGhhdCBpLk1YOCBuYW1lcwo+IHRoZSBlbnRpcmUgZmFtaWx5LCBidXQgYWxzbyBhIHN1Yi1mYW1p
bHkuCj4gCj4gaW14OAo+IOKUnOKUgOKUgCBpbXg4Cj4g4pSCwqDCoCDilJTilIDilIAgaW14OHFt
ICgqKQo+IOKUnOKUgOKUgCBpbXg4bQo+IOKUgsKgwqAg4pSc4pSA4pSAIGlteDhtbQo+IOKUgsKg
wqAg4pSc4pSA4pSAIGlteDhtbgo+IOKUgsKgwqAg4pSc4pSA4pSAIGlteDhtcCAoKikKPiDilILC
oMKgIOKUlOKUgOKUgCBpbXg4bXEKPiDilJTilIDilIAgaW14OHgKPiAgICAgIOKUlOKUgOKUgCBp
bXg4cXhwICgqKQo+IAo+IFBsYXRmb3JtcyBtYXJrZWQgd2l0aCAoKikgY29udGFpbiBhIERTUC4g
SW4gdGhlIGZ1dHVyZSB0aGVyZSBtaWdodCBiZQo+IG1vcmUgcGxhdGZvcm1zLgo+IAo+IFRoaXMg
cGF0Y2hzZXJpZXMgZG9lcyB0aGUgZm9sbG93aW5nOgo+IAkqIHJlbmFtZXMgaW14OCB0byBpbXg4
eCAoYmVjYXVzZSB0aGUgb25seSBzdXBwb3J0ZWQgcGxhdGZvcm0gbm93Cj4gICAgICAgICAgaXMg
aW14OHF4cCkuCj4gICAgICAgICAgKiBhZGRzIHN1cHBvcnQgZm9yIGlteDggKHdoaWNoIGlzIGlt
eDhxbSkKPiAKPiBBIGZ1dHVyZSBwYXRjaHNldCB3aWxsIGFkZCBzdXBwcm90IGZvciBpLk1YOE1Q
Lgo+IAo+IFBhdWwgT2xhcnUgKDQpOgo+ICAgIEFTb0M6IFNPRjogUmVuYW1lIGkuTVg4IHBsYXRm
b3JtIHRvIGkuTVg4WAo+ICAgIEFTb0M6IFNPRjogaW14ODogQWRkIG9wcyBmb3IgaS5NWDhRTQo+
ICAgIEFTb0M6IFNPRjogQWRkIGkuTVg4UU0gZGV2aWNlIGRlc2NyaXB0b3IKPiAgICBkdC1iaW5k
aW5nczogZHNwOiBmc2w6IEFkZCBmc2wsaW14OHFtLWRzcCBlbnRyeQoKVGhpcyBwYXRjaHNldCB3
YXMgcmV2aWV3ZWQgb24gdGhlIFNPRiBHaXRIdWIuIEkgYXNrZWQgRGFuaWVsIHRvIHNlbmQgaXQg
CmRpcmVjdGx5IHRvIHRoZSByZWxldmFudCBtYWlsaW5nIGxpc3QgZm9yIEFSTS9EZXZpY2UgVHJl
ZS4KClJldmlld2VkLWJ5OiBQaWVycmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3Nh
cnRAbGludXguaW50ZWwuY29tPgoKPiAKPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RzcC9m
c2wsZHNwLnlhbWwgICAgICB8ICAxICsKPiAgIHNvdW5kL3NvYy9zb2YvaW14L2lteDguYyAgICAg
ICAgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKy0KPiAgIHNvdW5kL3NvYy9z
b2Yvc29mLW9mLWRldi5jICAgICAgICAgICAgICAgICAgICB8IDEwICsrKysKPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
