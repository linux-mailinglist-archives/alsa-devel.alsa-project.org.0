Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C911C46D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 04:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6060816AD;
	Thu, 12 Dec 2019 04:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6060816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576122683;
	bh=7cJ8i7WZTdEXz1704iQ/nA2PbU2pa7S4merwgSR34I0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFLxL7b/lHT5Dqwkrz8p4URKXUytFt3u8jZX29ULSwQt0Rza21oeeAiv7YvVo3CVj
	 wTNdJlR3PFcsE+tVOZJeZbRNl8BmqFbFe2xBDiCxYVQn/GzS25B/289UmpyEGN+QUe
	 fNCbjQVpAcIYwHdRHWD2QJuB0htdsfSEGr/jPt4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E1CF8020C;
	Thu, 12 Dec 2019 04:49:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43300F8020C; Thu, 12 Dec 2019 04:49:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A7FF800EC
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 04:49:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A7FF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PO8Nlrga"
Received: from localhost (unknown [106.200.251.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDF90214D8;
 Thu, 12 Dec 2019 03:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576122570;
 bh=sO6XmEoJxykkgpmbd4+eUXUxrxDhjg81vEZPden8/MU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PO8NlrgakWBWf/vuxs49fIfKtb/DQFt/iw6sGB4y05mZhvI+Lsd5Q4SONdcdOq0Ts
 XGipELIWwdl4gI087D9aEA/6SJ8upNHwy7wagVw9pdpldzYydgpND76jw6ZV7ynsET
 0QdUKKjhT/aTSxSAHqs18kmWir7KPa5BCKcWNKUU=
Date: Thu, 12 Dec 2019 09:19:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191212034926.GK2536@vkoul-mobl>
References: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gMTEtMTItMTksIDE5OjQ0LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiBXZSBuZWVk
IG5ldyBmaWVsZHMgaW4gZXhpc3Rpbmcgc3RydWN0dXJlcyB0bwo+IGEpIGRlYWwgd2l0aCByYWNl
IGNvbmRpdGlvbnMgb24gY29kZWMgcHJvYmUvZW51bWVyYXRpb24KPiBiKSBhbGxvdyBmb3IgbXVs
dGktc3RlcCBBQ1BJIHNjYW4vcHJvYmUvc3RhcnR1cCBvbiBJbnRlbCBwbGFmb3Jtcwo+IGMpIGRl
YWwgd2l0aCBNU0kgaXNzdWVzIHVzaW5nIGEgc2luZ2xlIGhhbmRsZXIvdGhyZWFkcyBmb3IgYWxs
IGF1ZGlvCj4gaW50ZXJydXB0cwo+IGQpIGRlYWwgd2l0aCBhY2Nlc3MgdG8gcmVnaXN0ZXJzIHNo
YXJlZCBhY3Jvc3MgbXVsdGlwbGUgbGlua3Mgb24gSW50ZWwKPiBwbGF0Zm9ybXMKPiAKPiBUaGVz
ZSBzdHJ1Y3R1cmVzIGZvciBhKSB3aWxsIGJlIHVzZWQgYnkgdGhlIFNPRiBkcml2ZXIgYXMgd2Vs
bCBhcwo+IGNvZGVjIGRyaXZlcnMuIFRoZSBiKSBjKSBhbmQgZCkgY2FzZXMgYXJlIG9ubHkgZm9y
IHRoZSBJbnRlbC1zcGVjaWZpYwo+IGltcGxlbWVudGF0aW9uLgo+IAo+IFRvIGF2b2lkIGNvbmZs
aWN0cyBiZXR3ZWVuIEFTb0MgYW5kIFNvdW5kd2lyZSB0cmVlcywgdGhlc2UgMTEgcGF0Y2hlcwo+
IGFyZSBwcm92aWRlZCBvdXQtb2Ytb3JkZXIsIGJlZm9yZSB0aGUgZnVuY3Rpb25hbGl0eSBlbmFi
bGVkIGluIHRoZXNlCj4gaGVhZGVyIGZpbGVzIGlzIGFkZGVkIGluIGZvbGxvdy11cCBwYXRjaCBz
ZXJpZXMgd2hpY2ggY2FuIGJlIGFwcGxpZWQKPiBzZXBhcmF0ZWx5IGluIHRoZSBBU29DIGFuZCBT
b3VuZHdpcmUgdHJlZXMuIEFzIGRpc2N1c3NlZCBlYXJsaWVyLAo+IFZpbm9kIHdvdWxkIG5lZWQg
dG8gcHJvdmlkZSBhbiBpbW11dGFibGUgdGFnIGZvciBNYXJrIEJyb3duLCBhbmQgdGhlCj4gaW50
ZWdyYXRpb24gb24gdGhlIEFTb0Mgc2lkZSBvZiBTT0YgY2hhbmdlcyBhbmQgbmV3IGNvZGVjcyBk
cml2ZXJzIGNhbgo+IHByb2NlZWQgaW4gcGFyYWxsZWwgd2l0aCBTb3VuZFdpcmUgY29yZSBjaGFu
Z2VzLgo+IAo+IEkgaGFkIG11bHRpcGxlIG9mZmxpbmUgZGlzY3Vzc2lvbnMgd2l0aCBWaW5vZC9N
YXJrL1Rha2FzaGkgb24gaG93IHRvCj4gcHJvY2VlZCB3aXRoZSB2b2x1bWUgb2YgU291bmRXaXJl
IGNoYW5nZXMuIE5vdyB0aGF0IHY1LjUtcmMxIGlzIG91dCB3ZQo+IHNob3VsZCBnbyBhaGVhZCB3
aXRoIHRoZXNlIGludGVyZmFjZSBjaGFuZ2VzLgo+IAo+IFRoZSBuZXh0IHBhdGNoc2V0ICJbUEFU
Q0ggdjMgMDAvMTVdIHNvdW5kd2lyZTogaW50ZWw6IGltcGxlbWVudCBuZXcKPiBBU29DIGludGVy
ZmFjZXPigIsiIGNhbiBzdGlsbCBiZSByZXZpZXdlZCBidXQgd2lsbCBub3QgYXBwbHkgYXMgaXMg
ZHVlIHRvCj4gYSBvbmUtbGluZSBjb25mbGljdC4gQW4gdXBkYXRlIHdpbGwgYmUgcHJvdmlkZWQg
d2hlbiBWaW5vZCBhcHBsaWVzCj4gdGhpcyBzZXJpZXMgdG8gYXZvaWQgbm9pc2Ugb24gbWFpbGlu
ZyBsaXN0cy4KPiAKPiBBbiB1cGRhdGUgZm9yIHRoZSBzZXJpZXMgIltQQVRDSCB2MyAwMC8yMl0g
c291bmR3aXJlOiBjb2RlIGhhcmRlbmluZwo+IGFuZCBzdXNwZW5kLXJlc3VtZSBzdXBwb3J0IiBp
cyByZWFkeSBidXQgd2lsbCBiZSBwcm92aWRlZCB3aGVuIGJvdGgKPiB0aGUgaW50ZXJmYWNlcyBj
aGFuZ2VzIGFuZCB0aGUgaW1wbGVtZW50YXRpb24gY2hhbmdlcyBhcmUgbWVyZ2VkLgoKQXBwbGll
ZCwgdGhhbmtzCgpJIHdpbGwgc2VuZCB0aGUgdGFnIHRvbW9ycm93IGFmdGVyIGl0IGlzIGluIG5l
eHQKClRoYW5rcwoKLS0gCn5WaW5vZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
