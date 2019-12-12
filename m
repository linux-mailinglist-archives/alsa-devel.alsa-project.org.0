Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5405811D004
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D305716EA;
	Thu, 12 Dec 2019 15:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D305716EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576161587;
	bh=zPQLJfqj4qvlYs31ucwdgD4g34COcwsVL5lk9Q9TTmw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mb9xEcs36M/Tcy3A90wzj47CST66G69033GGhKuSoV6Szu0ancv7UcAtOKJVsUtwE
	 EUaoGrSnZtlI86YTAZtwwJBSMyWht6sNl6OX7PXnu5KbWXRAdOoTmCbGeWxjp7d0Az
	 fLP7wAVMw6jNL3dsRD9w2eIdRfQnUkA35IdmOq8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 154C7F8020C;
	Thu, 12 Dec 2019 15:38:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA26CF8020C; Thu, 12 Dec 2019 15:38:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D50F80089
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 15:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D50F80089
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 06:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="220707571"
Received: from unknown (HELO pbossart-mac02.local) ([10.254.97.107])
 by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2019 06:37:55 -0800
To: Vinod Koul <vkoul@kernel.org>
References: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
 <20191212034926.GK2536@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b60388fe-10a6-3a19-a575-243ed12bc611@linux.intel.com>
Date: Thu, 12 Dec 2019 08:37:56 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191212034926.GK2536@vkoul-mobl>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 00/11] soundwire: update ASoC interfaces
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

T24gMTIvMTEvMTkgOTo0OSBQTSwgVmlub2QgS291bCB3cm90ZToKPiBPbiAxMS0xMi0xOSwgMTk6
NDQsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+PiBXZSBuZWVkIG5ldyBmaWVsZHMgaW4g
ZXhpc3Rpbmcgc3RydWN0dXJlcyB0bwo+PiBhKSBkZWFsIHdpdGggcmFjZSBjb25kaXRpb25zIG9u
IGNvZGVjIHByb2JlL2VudW1lcmF0aW9uCj4+IGIpIGFsbG93IGZvciBtdWx0aS1zdGVwIEFDUEkg
c2Nhbi9wcm9iZS9zdGFydHVwIG9uIEludGVsIHBsYWZvcm1zCj4+IGMpIGRlYWwgd2l0aCBNU0kg
aXNzdWVzIHVzaW5nIGEgc2luZ2xlIGhhbmRsZXIvdGhyZWFkcyBmb3IgYWxsIGF1ZGlvCj4+IGlu
dGVycnVwdHMKPj4gZCkgZGVhbCB3aXRoIGFjY2VzcyB0byByZWdpc3RlcnMgc2hhcmVkIGFjcm9z
cyBtdWx0aXBsZSBsaW5rcyBvbiBJbnRlbAo+PiBwbGF0Zm9ybXMKPj4KPj4gVGhlc2Ugc3RydWN0
dXJlcyBmb3IgYSkgd2lsbCBiZSB1c2VkIGJ5IHRoZSBTT0YgZHJpdmVyIGFzIHdlbGwgYXMKPj4g
Y29kZWMgZHJpdmVycy4gVGhlIGIpIGMpIGFuZCBkKSBjYXNlcyBhcmUgb25seSBmb3IgdGhlIElu
dGVsLXNwZWNpZmljCj4+IGltcGxlbWVudGF0aW9uLgo+Pgo+PiBUbyBhdm9pZCBjb25mbGljdHMg
YmV0d2VlbiBBU29DIGFuZCBTb3VuZHdpcmUgdHJlZXMsIHRoZXNlIDExIHBhdGNoZXMKPj4gYXJl
IHByb3ZpZGVkIG91dC1vZi1vcmRlciwgYmVmb3JlIHRoZSBmdW5jdGlvbmFsaXR5IGVuYWJsZWQg
aW4gdGhlc2UKPj4gaGVhZGVyIGZpbGVzIGlzIGFkZGVkIGluIGZvbGxvdy11cCBwYXRjaCBzZXJp
ZXMgd2hpY2ggY2FuIGJlIGFwcGxpZWQKPj4gc2VwYXJhdGVseSBpbiB0aGUgQVNvQyBhbmQgU291
bmR3aXJlIHRyZWVzLiBBcyBkaXNjdXNzZWQgZWFybGllciwKPj4gVmlub2Qgd291bGQgbmVlZCB0
byBwcm92aWRlIGFuIGltbXV0YWJsZSB0YWcgZm9yIE1hcmsgQnJvd24sIGFuZCB0aGUKPj4gaW50
ZWdyYXRpb24gb24gdGhlIEFTb0Mgc2lkZSBvZiBTT0YgY2hhbmdlcyBhbmQgbmV3IGNvZGVjcyBk
cml2ZXJzIGNhbgo+PiBwcm9jZWVkIGluIHBhcmFsbGVsIHdpdGggU291bmRXaXJlIGNvcmUgY2hh
bmdlcy4KPj4KPj4gSSBoYWQgbXVsdGlwbGUgb2ZmbGluZSBkaXNjdXNzaW9ucyB3aXRoIFZpbm9k
L01hcmsvVGFrYXNoaSBvbiBob3cgdG8KPj4gcHJvY2VlZCB3aXRoZSB2b2x1bWUgb2YgU291bmRX
aXJlIGNoYW5nZXMuIE5vdyB0aGF0IHY1LjUtcmMxIGlzIG91dCB3ZQo+PiBzaG91bGQgZ28gYWhl
YWQgd2l0aCB0aGVzZSBpbnRlcmZhY2UgY2hhbmdlcy4KPj4KPj4gVGhlIG5leHQgcGF0Y2hzZXQg
IltQQVRDSCB2MyAwMC8xNV0gc291bmR3aXJlOiBpbnRlbDogaW1wbGVtZW50IG5ldwo+PiBBU29D
IGludGVyZmFjZXPigIsiIGNhbiBzdGlsbCBiZSByZXZpZXdlZCBidXQgd2lsbCBub3QgYXBwbHkg
YXMgaXMgZHVlIHRvCj4+IGEgb25lLWxpbmUgY29uZmxpY3QuIEFuIHVwZGF0ZSB3aWxsIGJlIHBy
b3ZpZGVkIHdoZW4gVmlub2QgYXBwbGllcwo+PiB0aGlzIHNlcmllcyB0byBhdm9pZCBub2lzZSBv
biBtYWlsaW5nIGxpc3RzLgo+Pgo+PiBBbiB1cGRhdGUgZm9yIHRoZSBzZXJpZXMgIltQQVRDSCB2
MyAwMC8yMl0gc291bmR3aXJlOiBjb2RlIGhhcmRlbmluZwo+PiBhbmQgc3VzcGVuZC1yZXN1bWUg
c3VwcG9ydCIgaXMgcmVhZHkgYnV0IHdpbGwgYmUgcHJvdmlkZWQgd2hlbiBib3RoCj4+IHRoZSBp
bnRlcmZhY2VzIGNoYW5nZXMgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBjaGFuZ2VzIGFyZSBtZXJn
ZWQuCj4gCj4gQXBwbGllZCwgdGhhbmtzCj4gCj4gSSB3aWxsIHNlbmQgdGhlIHRhZyB0b21vcnJv
dyBhZnRlciBpdCBpcyBpbiBuZXh0CgpUaGFua3MgVmlub2QsIEkgd2lsbCByZXBvc3QgdGhlIGZv
bGxvd2luZyBzZXJpZXMgdG9uaWdodC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
