Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B414A3F8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 13:33:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE9E850;
	Mon, 27 Jan 2020 13:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE9E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580128427;
	bh=yWg6Y3Th9pUuGhlYumuaozcu/tpTZ5eqJMbFu8T34iI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arizDq5bAY43WOBU72JcipcNTU+zDEHXnKftN1Qk+kcgDfr24guVH5rGovV+Qe8rM
	 B36FrPs9xLaHkQ2CGDqnHu4TBh/telFFDgBfYd0Kk5C7+f57+wRbvAozmDvQfUk56q
	 22H6fOiTkE42i1kwdmBinJAEN3hCHueVtrarvgqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E81CBF8021E;
	Mon, 27 Jan 2020 13:32:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F96AF8021E; Mon, 27 Jan 2020 13:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF1ADF80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 13:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF1ADF80085
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 04:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="223230437"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 04:31:50 -0800
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-11-cezary.rojewski@intel.com>
 <9edc0e32-b3af-3f98-613c-68ee7bcb80ed@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3836d573-c3cf-3f16-773f-8771ee49b042@intel.com>
Date: Mon, 27 Jan 2020 13:31:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9edc0e32-b3af-3f98-613c-68ee7bcb80ed@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 10/12] ASoC: SOF: Provide probe debugfs
	support
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

T24gMjAyMC0wMS0yNCAyMToyMiwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gWW91IHNo
b3VsZCBwcm9iYWJseSBhZGQgYSBoaWdoZXItbGV2ZWwgZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIAo+IHRoYXQgdG8gbWFrZSB1c2Ugb2YgcHJvYmVzLCB0aGUgdXNlciBuZWVkcyB0
byBzcGVjaWZpYyB3aGljaCBidWZmZXJzIG9mIAo+IHRoZSBmaXJtd2FyZSB0b3BvbG9neSB0aGV5
IHdhbnQgdG8gZXh0cmFjdCBkYXRhIGZyb20sIGFuZCB0aGF0IGRlYnVnZnMgCj4gaXMgdGhlIGNv
bmZpZ3VyYXRpb24gaW50ZXJmYWNlLiBUaGUgc3RyZWFtaW5nIHBhcnQgaXMgaGFuZGxlZCB2aWEg
dGhlIAo+IGNvbXByZXNzZWQgaW50ZXJmYWNlLgo+IAo+PiBEZWZpbmUgZGVidWdmcyBzdWJkaXJl
Y3RvcnkgZGVsZWdhdGVkIGZvciBJUEMgY29tbXVuaXRhdGlvbiB3aXRoIERTUC4KPiAKPiBjb21t
dW5pY2F0aW9uLgo+IAoKUmV3b3JkZWQgaW4gdjIsIHRoYW5rcy4KCj4+IElucHV0IGZvcm1hdDog
dWludCx1aW50LCguLi4pIHdoaWNoIGFyZSBsYXRlciB0cmFuc2xhdGVkIGludG8gRFdPUkRTCj4+
IHNlcXVlbmNlIGFuZCBmdXJ0aGVyIGludG8gaW5zdGFuY2VzIG9mIHN0cnVjdCBvZiBpbnRlcmVz
dCBnaXZlbiB0aGUgSVBDCj4+IHR5cGUuCj4gCj4gd2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBhIGRv
Y3VtZW50YXRpb24gcGFydCB0aGF0IHNwZWNpZmllcyB0aGUgdmFsdWVzIAo+IGV4cGVjdGVkLCBh
cyB5b3UgZGlkIHNvbWUgdGltZSBiYWNrLgo+IAoKRG9jdW1lbnRhdGlvbiB3aWxsIGJlIHJlbGVh
c2VkIG9uIGEgbGF0ZXIgZGF0ZSBhcyBTT0YncyBwcm9iZXMgYXJlIHN0aWxsIAphIHZlcnkgZnJl
c2ggc3ViamVjdC4KCj4+IEZvciBFeHRyYWN0b3IgcHJvYmVzLCBmb2xsb3dpbmcgaGF2ZSBiZWVu
IGVuYWJsZWQ6Cj4+IC0gUFJPQkVfUE9JTlRfQUREIChlY2hvIDwuLj4gcHJvYmVfcG9pbnRzKQo+
PiAtIFBST0JFX1BPSU5UX1JFTU9WRSAoZWNobyA8Li4+IHByb2JlX3BvaW50c19yZW1vdmUpCj4+
IC0gUFJPQkVfUE9JTlRfSU5GTyAoY2F0IHByb2JlX3BvaW50cykKPiAKPiBEb2Vzbid0IGFwcGVh
ciB2ZXJ5IGludHVpdGl2ZSB0byBtZSwgaXMgdGhpcyB0aGUgc2FtZSBhcyBpbiBwcmV2aW91cyAK
PiBzb2x1dGlvbnMgb3IgYSBuZXcgZGVzaWduIG9mIHlvdXIgb3duPwo+IAoKUHJlY2lzZWx5LCB0
aGUgdXNhZ2UgaXMgZXhhY3RseSB0aGUgc2FtZS4gRG9jdW1lbnRhdGlvbiBjb3ZlcnMgdGhlIAp1
c2FnZSwgYW5kIGl0IGlzIGFjdHVhbGx5IHZlcnkgaW50dWl0aXZlIChhcyBpdCdzIHZlcnkgc2lt
cGxlIHRvbykgb25jZSAKeW91IGdldCBjaGFuY2UgdG8gcHV0IHlvdXIgaGFuZHMgb24gaXQuCgo+
PiArc3RhdGljIHNzaXplX3QgcHBvaW50c19yZWFkKHN0cnVjdCBmaWxlICpmaWxlLAo+PiArwqDC
oMKgwqDCoMKgwqAgY2hhciBfX3VzZXIgKnRvLCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykK
PiAKPiBhdm9pZCBwcG9pbnRzIGFjcm9ueW0sIHVzZSBwcm9iZV9wb2ludHNfcmVhZD8gc2FtZSBp
biB0aGUgcmVzdCBvZiB0aGUgCj4gcGF0Y2guCj4gCgpSZXdvcmRlZCBpbiB2MiwgdGhhbmtzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
