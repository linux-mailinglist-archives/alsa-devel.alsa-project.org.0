Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A794D157DA9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:45:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D3E1670;
	Mon, 10 Feb 2020 15:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D3E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581345900;
	bh=gJHHb23T9BMLTcn1NTRQ5hy/L7rTYUfUceeiddINhLg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxvv1s3i9kAx+nGeDsqcO1K/oQKyFVFS81CtjKFwyiutwErMP1AUTORcyWqTb1GNs
	 Ce7ymyJJDr7sm68+n6rp3u7dUm/Vb7BPj0oZQtmMlhy9rxOZoZS1DIHXk6LEbSeR9r
	 EzPO+6JnYbxQFuPvI1MSNtfJnXdOuk1ybnk7Q+68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0850FF80279;
	Mon, 10 Feb 2020 15:42:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB08BF8027D; Mon, 10 Feb 2020 15:42:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A78F8014F
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A78F8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 06:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="226213722"
Received: from ykatsuma-mobl1.gar.corp.intel.com (HELO [10.251.140.95])
 ([10.251.140.95])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2020 06:42:08 -0800
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 robh+dt@kernel.org
References: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73c72736-ca09-1501-4978-e0041b605aed@linux.intel.com>
Date: Mon, 10 Feb 2020 08:23:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210095817.13226-1-daniel.baluta@oss.nxp.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [RESEND 0/4] Add a better separation between i.MX8
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

CgpPbiAyLzEwLzIwIDM6NTggQU0sIERhbmllbCBCYWx1dGEgd3JvdGU6Cj4gRnJvbTogRGFuaWVs
IEJhbHV0YSA8ZGFuaWVsLmJhbHV0YUBueHAuY29tPgo+IAo+IFNvIGZhciB0aGUgaW1wbGVtZW50
YXRpb24gd2FzIGRlc2lnbmVkIHRvIHN1cHBvcnQgIGEgZ2VuZXJpYyBwbGF0Zm9ybQo+IG5hbWVk
IGkuTVg4LiBBbnlob3csIG5vdyB3b3JraW5nIHdpdGggc3BlY2lmaWMgaS5NWDggaW5zdGFuY2Vz
IHdlIG5lZWQKPiB0byBhY2NvdW50IGZvciB0aGUgZGlmZmVyZW5jZXMuCj4gCj4gaS5NWDggbmFt
aW5nIGNhbiBiZSBjb25mdXNpbmcgYXQgdGhlIGZpcnN0IGdsYW5jZSwgc28gd2UgbmVlZCB0byBo
YXZlCj4gYSBjbGVhbiBzZXBhcmF0aW9uIGJldHdlZW4gZGlmZmVyZW50IHBsYXRmb3Jtcy4KPiAK
PiBIZXJlIGlzIHRoZSBzcGxpdCBvZiBpLk1YOCBwZXIgcGxhdGZvcm1zLiBOb3RpY2UgdGhhdCBp
Lk1YOCBuYW1lcwo+IHRoZSBlbnRpcmUgZmFtaWx5LCBidXQgYWxzbyBhIHN1Yi1mYW1pbHkuCj4g
Cj4gaW14OAo+IOKUnOKUgOKUgCBpbXg4Cj4g4pSCwqDCoCDilJTilIDilIAgaW14OHFtICgqKQo+
IOKUnOKUgOKUgCBpbXg4bQo+IOKUgsKgwqAg4pSc4pSA4pSAIGlteDhtbQo+IOKUgsKgwqAg4pSc
4pSA4pSAIGlteDhtbgo+IOKUgsKgwqAg4pSc4pSA4pSAIGlteDhtcCAoKikKPiDilILCoMKgIOKU
lOKUgOKUgCBpbXg4bXEKPiDilJTilIDilIAgaW14OHgKPiAgICAgIOKUlOKUgOKUgCBpbXg4cXhw
ICgqKQo+IAo+IFBsYXRmb3JtcyBtYXJrZWQgd2l0aCAoKikgY29udGFpbiBhIERTUC4gSW4gdGhl
IGZ1dHVyZSB0aGVyZSBtaWdodCBiZQo+IG1vcmUgcGxhdGZvcm1zLgo+IAo+IFRoaXMgcGF0Y2hz
ZXJpZXMgZG9lcyB0aGUgZm9sbG93aW5nOgo+IAkqIHJlbmFtZXMgaW14OCB0byBpbXg4eCAoYmVj
YXVzZSB0aGUgb25seSBzdXBwb3J0ZWQgcGxhdGZvcm0gbm93Cj4gICAgICAgICAgaXMgaW14OHF4
cCkuCj4gICAgICAgICAgKiBhZGRzIHN1cHBvcnQgZm9yIGlteDggKHdoaWNoIGlzIGlteDhxbSkK
PiAKPiBQYXVsIE9sYXJ1ICg0KToKPiAgICBBU29DOiBTT0Y6IFJlbmFtZSBpLk1YOCBwbGF0Zm9y
bSB0byBpLk1YOFgKPiAgICBBU29DOiBTT0Y6IGlteDg6IEFkZCBvcHMgZm9yIGkuTVg4UU0KPiAg
ICBBU29DOiBTT0Y6IEFkZCBpLk1YOFFNIGRldmljZSBkZXNjcmlwdG9yCj4gICAgZHQtYmluZGlu
Z3M6IGRzcDogZnNsOiBBZGQgZnNsLGlteDhxbS1kc3AgZW50cnkKClJldmlld2VkLWJ5OiBQaWVy
cmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPgoK
PiAKPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RzcC9mc2wsZHNwLnlhbWwgICAgICB8ICAx
ICsKPiAgIHNvdW5kL3NvYy9zb2YvaW14L2lteDguYyAgICAgICAgICAgICAgICAgICAgICB8IDU3
ICsrKysrKysrKysrKysrKysrKy0KPiAgIHNvdW5kL3NvYy9zb2Yvc29mLW9mLWRldi5jICAgICAg
ICAgICAgICAgICAgICB8IDEwICsrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYWxzYS1kZXZlbAo=
