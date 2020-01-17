Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198514080D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 11:36:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F5C17D1;
	Fri, 17 Jan 2020 11:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F5C17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579257366;
	bh=HXIYR3ntCZnXg6x8CB0dw/XQvVp7FpS+kOqtJsS0Hz4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFKlBCXoQagSa1rNFSu3S+iKk+w8RSpbRG/hIrqs59V0PIQesRbfRel+uoRB/oeUq
	 gNKAoSxy4NfD7Dahfy5VcrxOxzer0xj7oOVDGBcI3HwvYJ0bNISoZ9sLjBv3chIZGa
	 SZ4UCjZWBJTpIPds1C3ecDf36T8/6NM3yBiGpwx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 726ECF801F8;
	Fri, 17 Jan 2020 11:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E5EAF801EB; Fri, 17 Jan 2020 11:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07B7CF800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 11:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B7CF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 02:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; d="scan'208";a="214433532"
Received: from unknown (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 17 Jan 2020 02:34:13 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
 <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
 <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
 <b6b55180-b846-96e7-4521-7d3b03881d06@linux.intel.com>
 <3374dc7d-e969-5380-581a-f6801a2fe50f@linux.intel.com>
 <s5hzhemo6ku.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <68e008e2-6796-f893-35ed-d76a2bf92587@linux.intel.com>
Date: Fri, 17 Jan 2020 18:43:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hzhemo6ku.wl-tiwai@suse.de>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Rajwa,
 Marcin" <marcin.rajwa@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
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

CgpPbiAyMDIwLzEvMTcg5LiL5Y2INDowMCwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIEZyaSwg
MTcgSmFuIDIwMjAgMDY6Mzc6MTYgKzAxMDAsCj4gS2V5b24gSmllIHdyb3RlOgo+Pgo+PiBPbiAy
MDIwLzEvMTcg5LiK5Y2IMTo0MCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pgo+Pj4+
Pj4+IFNvLCBkbyB5b3Ugc3VnZ2VzdCBub3QgZG9pbmcgcHJlYWxsb2NhdGlvbihvciBjYWxsaW5n
IGl0IHdpdGggMAo+Pj4+Pj4+IHNpemUpIGZvciBhbGwKPj4+Pj4+PiBkcml2ZXIgd2l0aCBUWVBF
X1NHPyBJIGFtIGZpbmUgaWYgdGhpcyBpcyB0aGUgcmVjb21tZW5kZWQKPj4+Pj4+PiBtZXRob2Qs
IEkgY2FuIHRyeQo+Pj4+Pj4+IHRoaXMgb24gU09GIEkyUyBwbGF0Zm9ybSB0byBzZWUgaWYgaXQg
Y2FuIHdvcmsgYXMgd2UgcmVxdWlyZWQKPj4+Pj4+PiBmb3IgdmVyeSBsYXJnZQo+Pj4+Pj4+IGJ1
ZmZlciBzaXplLgo+Pj4+Pgo+Pj4+PiBLZXlvbiwgZm9yIHRoZSByZXN0IG9mIHVzIHRvIGZvbGxv
dyB0aGlzIHBhdGNoLCB3b3VsZCB5b3UgbWluZAo+Pj4+PiBjbGFyaWZ5aW5nIHdoYXQgZHJpdmVz
IHRoZSBuZWVkIGZvciBhICd2ZXJ5IGxhcmdlIGJ1ZmZlciBzaXplJywKPj4+Pj4gYW5kIHdoYXQg
b3JkZXIgb2YgbWFnbml0dWRlIHRoaXMgdmVyeSBsYXJnZSBzaXplIHdvdWxkIGJlLgo+Pj4+Pgo+
Pj4+PiBGV0lXLCB3ZSd2ZSBtZWFzdXJlZCBjb25zaXN0ZW50bHkgb24gZGlmZmVyZW50IFdpbmRv
d3MvTGludXgKPj4+Pj4gcGxhdGZvcm1zLCBtYXliZSAxMCB5ZWFycyBhZ28sIHRoYXQgb25jZSB5
b3UgcmVhY2ggYSBidWZmZXIgb2YgMXMKPj4+Pj4gKDM4NCBrQikgdGhlIGJlbmVmaXRzIGZyb20g
aW5jcmVhc2luZyB0aGF0IGJ1ZmZlciBzaXplIGZ1cnRoZXIgYXJlCj4+Pj4+IG1hcmdpbmFsIGlu
IHRlcm1zIG9mIHBvd2VyIGNvbnN1bXB0aW9uLCBhbmQgZ2VuZXJhdGUgYWxsIGtpbmRzIG9mCj4+
Pj4+IGlzc3VlcyB3aXRoIHZvbHVtZSB1cGRhdGVzIGFuZCBkZWZlcnJlZCByb3V0aW5nIGNoYW5n
ZXMuCj4+Pj4+Cj4+Pj4gV2UgbmVlZCBiaWdnZXIgYnVmZmVyIG9uIGhvc3Qgc2lkZSB0byBjb21w
ZW5zYXRlIHRoZSB3YWtlIHVwIHRpbWUKPj4+PiBmcm9tIGQwaXggdG8gZDAgd2hpY2ggdGFrZXMg
fjIgc2Vjb25kcyBvbiBteSBzZXR1cC4gU28sIHdpaXRoCj4+Pj4gc21hbGxlciBidWZmZXIgc2l6
ZXMgbGlrZSA8IDIgc2Vjb25kcyB3ZSBvdmVyd3JpdGUgZGF0YSBzaW5jZSBGVwo+Pj4+IGtlZXBz
IGNvcHBpbmcgd2hpbGUgaG9zdCBkb2Vzbid0IHJlYWQgdW50aWwgaXRzIHVwIGFuZCBydW5uaW5n
Cj4+Pj4gYWdhaW4uCj4+Pgo+Pj4gUmlnaHQsIHRoYXQncyBhIHZhbGlkIGNhc2UsIGJ1dCB0aGF0
J3MgMjU2IGtCLCBub3QgJ3ZlcnkgbGFyZ2UnIG9yCj4+PiBsaWtlbHkgdG8gZXZlciB0cmlnZ2Vy
IGFuIE9PTSBjYXNlLgo+Pgo+PiBGb3IgUzI0X0xFLCBpdCBpcyA1MTJLQiwgdGhlIHBvaW50IGlz
IHRoYXQgaWYgd2UgY2FuJ3QgcmUtYWxsb2NhdGUKPj4gYnVmZmVyIGF0IGh3X3BhcmFtcygpIHN0
YWdlLCB0aGVuIHdlIG5lZWQgZm9sbG93IGEgQktNIHRoYXQgd2UgaGF2ZSB0bwo+PiBwcmVhbGxv
Y2F0ZSB0aGUgbGFyZ2VzdCBETUEgYnVmZmVyIHRoYXQgd2UgY2xhaW0gdG8gc3VwcG9ydCBhdAo+
PiBwY21fbmV3KCksIEkgdGhpbmsgdGhpcyBpcyBhY3R1YWxseSBhbm90aGVyIGtpbmQgb2Ygd2Fz
dCB3aXRoIHRoZXNlCj4+IGxhcmdlc3QgcGlubmVkIGJ1ZmZlciB0aGF0IGNhbid0IGJlIHN3YXBw
ZWQgb3V0Li4uCj4gCj4gV2VsbCwgdGhhdCdzIHRoZSBjYXNlIHlvdSdkIG5lZWQgYSBsYXJnZXIg
cHJlYWxsb2NhdGlvbi4KPiBJIGd1ZXNzIG1hbnkgZGlzdHJvcyBhbHJlYWR5IHNldCBpdCB0byBh
IGhpZ2hlciB2YWx1ZSBmb3IgUHVsc2VBdWRpby4KPiBUaGUgZGVmYXVsdCA2NGtCIGlzIGp1c3Qg
ZnJvbSBoaXN0b3JpY2FsIGFuZCBjb21wYXRpYmlsaXR5IHJlYXNvbiwgYW5kCj4gd2UgbWF5IGV4
dGVuZCBpdCB0byAxTUIgb3Igc28gbm93LgoKSW4gU09GIGRyaXZlciwgd2UgZG9uJ3QgdXNlIGtl
cm5lbCBjb25maWcgaXRlbSBsaWtlIApDT05GSUdfU05EX0hEQV9QUkVBTExPQ19TSVpFIGZvciBI
REEsIHRoZSBjb2RlIGZvciBpdCBpczoKCglzbmRfcGNtX2xpYl9wcmVhbGxvY2F0ZV9wYWdlcyhw
Y20tPnN0cmVhbXNbc3RyZWFtXS5zdWJzdHJlYW0sCgkJCQkgICAgICBTTkRSVl9ETUFfVFlQRV9E
RVZfU0csIHNkZXYtPmRldiwKCQkJCWxlMzJfdG9fY3B1KGNhcHMtPmJ1ZmZlcl9zaXplX21pbiks
CgkJCQlsZTMyX3RvX2NwdShjYXBzLT5idWZmZXJfc2l6ZV9tYXgpKTsKClNvIHRoZSBwcmVhbGxv
Y2F0ZWQgc2l6ZSBpcyBjb25maWd1cmVkIHZpYSB0b3BvbG9neSBmaWxlLCB0aGF0IGlzIApjYXBz
LT5idWZmZXJfc2l6ZV9taW4sIG5vIGNoYW5jZSBmb3IgUHVsc2VBdWRpbyB0byByZWNvbmZpZ3Vy
ZSBpdC4KClNvLCBpdCBsb29rcyBsaWtlIHdlIGhhdmUgdG8gY2hhbmdlIGl0IHRvIHRoaXMgaWYg
d2UgZG9uJ3QgY2hhbmdlIHRoZSAKQUxTQSBjb3JlOgoKCXNuZF9wY21fbGliX3ByZWFsbG9jYXRl
X3BhZ2VzKHBjbS0+c3RyZWFtc1tzdHJlYW1dLnN1YnN0cmVhbSwKCQkJCSAgICAgIFNORFJWX0RN
QV9UWVBFX0RFVl9TRywgc2Rldi0+ZGV2LAotCQkJCWxlMzJfdG9fY3B1KGNhcHMtPmJ1ZmZlcl9z
aXplX21pbiksCisJCQkJbGUzMl90b19jcHUoY2Fwcy0+YnVmZmVyX3NpemVfbWF4KSwKCQkJCWxl
MzJfdG9fY3B1KGNhcHMtPmJ1ZmZlcl9zaXplX21heCkpOwoKClRoYW5rcywKfktleW9uCgo+IAo+
IAo+IFRha2FzaGkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bHNhLWRldmVsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
