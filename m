Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6616DE0E6
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 18:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF10EF9;
	Tue, 11 Apr 2023 18:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF10EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681230207;
	bh=CX9WRTDQW5xCDnvHaNJ5KVEyUjZqaBgtPdovCxwUKVc=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QsHVX3B1QtaLjRQ69Nlp2bafpc7ofLq0jE0jOVMqehU6b6+DiFj1//Z9x0j/+kgut
	 Am2FDTqXQ6AXA2WItu24g5E+iNAw1sN0ONlczwqK1hC4qjxDEQoIAH6ns+nttZ8rvs
	 64Atg/jScBY9iCLeCx95DcxjlI7zMcmiUr+MrEe0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F79F8025E;
	Tue, 11 Apr 2023 18:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242F5F8032B; Tue, 11 Apr 2023 18:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDDEAF80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 18:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDEAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=f8wsnAE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681230147; x=1712766147;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dcgSDClWc/aht0qkpKxDFVsSsZLtCGp9BYHaTTDZwp0=;
  b=f8wsnAE5jG37MoAcqw6X4Jy93dFFzteYlUM+ahKoP3vhgXSa7fdIN7AA
   OtT8Ey436TZDJshIvokvW9DLuhA59jXQwHZs3Fa6vPhcVzTL8sdv4C0wP
   Fxuq91H9LRHfGy2s+aAsVPRgbNFzyKcgy+9yaT8ROlyMNBLHL80qyqfFr
   MLLob8g4ZFEyOMNW1hpd1FgNSZ/UiTVR8AwhMeEaf2QC9zVd/jqKbtjGC
   g0wtL4sCXd3ZZ//7BB32khJi8BfANMNISGbtUHKnAGMiUg/Ib19IGoXtG
   kDAGNWSC4KmMsuvU8MledPtYRDqKW7A0DMYAtEUZKL1Y0+ReDa5WUYdJm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="324031920"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400";
   d="scan'208";a="324031920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 09:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018426235"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400";
   d="scan'208";a="1018426235"
Received: from gliakhov-mobl.ger.corp.intel.com (HELO ubuntu)
 ([10.251.212.53])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 09:22:22 -0700
Date: Tue, 11 Apr 2023 18:22:20 +0200 (CEST)
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: =?ISO-8859-15?Q?P=E9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: Re: [bug report] ASoC: SOF: avoid a NULL dereference with unsupported
 widgets
In-Reply-To: <471b8f95-1c13-48bd-0491-cae0fe2ce824@linux.intel.com>
Message-ID: <d9dbf94-154f-f571-e4ef-43adef43881@intel.com>
References: <4826f662-42f0-4a82-ba32-8bf5f8a03256@kili.mountain>
 <80f2a9e2-a2fb-4543-b381-251bb07876ef@linux.intel.com>
 <b3671cde-7f77-48aa-a4a2-db25e141ff45@kili.mountain>
 <8f78395b-5cc3-e5da-90f2-2fa7114ddcfb@linux.intel.com>
 <9ab57cb9-8320-4891-beb9-50c57346d9e5@kili.mountain>
 <471b8f95-1c13-48bd-0491-cae0fe2ce824@linux.intel.com>
MIME-Version: 1.0
Message-ID-Hash: 65MK7YHIIRDMSCSMSIPOPJJZ4AWUWW5E
X-Message-ID-Hash: 65MK7YHIIRDMSCSMSIPOPJJZ4AWUWW5E
X-MailFrom: guennadi.liakhovetski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Dan Carpenter <error27@gmail.com>, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65MK7YHIIRDMSCSMSIPOPJJZ4AWUWW5E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksDQoNCkFjdHVhbGx5IHRoZXJlJ3Mgbm8gYmxhY2sgbWFnaWMgdGhlcmUgYmVjYXVzZSB0aGVy
ZSdzIG5vIGRlcmVmZXJlbmNlIGJ1dCANCm9ubHkgcG9pbnRlciBhcml0aG1ldGljLiBUaGUgY29t
cGlsZXIganVzdCBhZGRzIHRoZSBjYWxjdWxhdGVkIG9mZnNldCB0byANCk5VTEwgYW5kIHBhc3Nl
cyB0aGF0IHNtYWxsIHBvaW50ZXIgdG8gcHJpbnRrKCkuDQoNClRoYW5rcw0KR3Vlbm5hZGkNCg0K
T24gTW9uLCAzIEFwciAyMDIzLCBQw6l0ZXIgVWpmYWx1c2kgd3JvdGU6DQoNCj4NCj4NCj4gT24g
MDMvMDQvMjAyMyAwODo1NCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4+IE9uIE1vbiwgQXByIDAz
LCAyMDIzIGF0IDA4OjIwOjM4QU0gKzAzMDAsIFDDqXRlciBVamZhbHVzaSB3cm90ZToNCj4+Pg0K
Pj4+DQo+Pj4gT24gMDEvMDQvMjAyMyAxMDo0NCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4+Pj4g
T24gRnJpLCBNYXIgMzEsIDIwMjMgYXQgMTA6MTQ6MTFBTSArMDMwMCwgUMOpdGVyIFVqZmFsdXNp
IHdyb3RlOg0KPj4+Pj4gaWYgc3JjX2Z3X21vZHVsZSBpcyBOVUxMIHRoZW4gdGhlIHByaW50IHdp
bGwgYmU6DQo+Pj4+PiBzb3VyY2UgKGVmYXVsdCkgb3Igc2luayBzaW5rLm1vZHVsZS5uYW1lIHdp
ZGdldCB3ZXJlbid0IHNldCB1cCBwcm9wZXJseQ0KPj4+Pj4NCj4+Pj4+IEd1ZW5uYWRpIGlzIHJl
bHlpbmcgb24gc29tZSBibGFjayBtYWdpYyBpbiB0aGUgcHJpbnRrIHN5c3RlbSB0byBoYW5kbGUN
Cj4+Pj4+IHRoZSBwcmludGluZyBpbnN0ZWFkIG9mIG9wZW4gY29kaW5nLg0KPj4+Pg0KPj4+PiBJ
J3ZlIGRvbmUgY29tcGlsZXIgcmVsYXRlZCB3b3JrIGFuZCBleHBsb3JlZCBzb21lIHdlaXJkIGFz
cGVjdCBvZiB0aGUNCj4+Pj4gQyBsYW5ndWFnZSBhbmQgSSBhbSBzbyBmYXNjaW5hdGVkIGJ5IHRo
aXMuICBJIHdvdWxkIGhhdmUgdGhvdWdodCBpdA0KPj4+PiBjcmFzaGVzIGJlZm9yZSB0aGUgZnVu
Y3Rpb24gaXMgY2FsbGVkLiAgSSBjYW5ub3QgZXZlbiBpbWFnaW5lIGhvdyBibGFjaw0KPj4+PiBt
YWdpYyBsaWtlIHRoaXMgd291bGQgd29yay4NCj4+Pg0KPj4+IEkgdGhpbmsgaXQgaXMgbm90IGEg
Y29tcGlsZXIgbWFnaWMsIGJ1dCBrZXJuZWwgbWFnaWM6DQo+Pj4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvbGli
L3ZzcHJpbnRmLmMjbjcwMA0KPj4+DQo+Pj4+IElzIHRoZXJlIGFueXdheSBJIGNhbiB0ZXN0IHRo
aXM/DQo+Pj4NCj4+PiBZb3UgY291bGQsIElmIHlvdSBoYXZlIGEgbGFwdG9wIHdoaWNoIHVzZXMg
U09GIGFuZCBpdCBpcyBJbnRlbCAxMXRoIGdlbg0KPj4+IG9yIG5ld2VyIHRoZW4geW91IGNhbiBz
d2l0Y2ggaXQgdG8gSVBDNCBhbmQgaW5zdGFsbCB0aGUgb3B0LWluIHYyLjUNCj4+PiAod2hpY2gg
d291bGQgbmVlZCB3aXRoIDYuNCBrZXJuZWwpLg0KPj4+IEFwcGx5IHRoaXMgcGF0Y2ggdG8gNi4z
LXJjIChvciA2LjIpIGFuZCBib290IHVwLCBidXQgdW5wYXRjaGVkIGtlcm5lbA0KPj4+IHdpbGwg
TlVMTCBkZXJlZmVyZW5jZSwgc28geW91IG5lZWQgdG8gaGF2ZSBhIGJhY2t1cCBvcHRpb24uDQo+
Pj4NCj4+PiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVjdC9zb2YtYmluDQo+Pj4NCj4+
PiBUaGUgdjIuNSBpcyBub3QgdGhlcmUgYXMgYSByZWxlYXNlLHlvdSBuZWVkIHRvIGZldGNoIHRo
ZSByZXBvIGFuZCBmb2xsb3cNCj4+PiB0aGUgaW5zdHJ1Y3Rpb25zLg0KPj4+DQo+Pj4gUmVhZCB0
aGUgaW5zdHJ1Y3Rpb24gaW4gdjIuNS54L1JFQURNRS5tZCBiZWZvcmUgYXR0ZW1wdGluZyB0byB1
c2UgdGhpcw0KPj4+IHJlbGVhc2UuDQo+Pj4NCj4+PiBOb3cgdGhhdCBJIGxvb2sgYmFjayBhdCB0
aGUgcGF0Y2gsIHllcyBpdCBpcyBub3Qgb2J2aW91cywgYnV0IGl0IGlzDQo+Pj4gZG9pbmcgYSB2
YWxpZCB0aGluZy4NCj4+DQo+PiBZZWFoLiAgRmluZS4gIEl0IGRvZXNuJ3QgY3Jhc2ggYnV0ICJ2
YWxpZCIgaXMga2luZCBvZiBkZWJhdGFibGUuICBJdCdzDQo+PiBhIHN1cGVyIHVnbHkgdGhpbmcu
DQo+DQo+IFdlbGwsIGl0IGlzIGdvaW5nIHRvIGJlaGF2ZSBpbiBhbiBleHBlY3RlZCB3YXkgKHBy
aW50IChlZmF1bHQpIGluc3RlYWQNCj4gb2YgdGhlIG1vZHVsZSBuYW1lIGluIGNhc2UgaXQgaXMg
bm90IHByZXNlbnQpLg0KPiBCeSBpdHNlbGYgaXQgaXMgY29ycmVjdCBhcyB0aGlzIGlzIGEgZmVh
dHVyZSBnaXZlbiBieSB0aGUga2VybmVsLCBvbiB0aGUNCj4gb3RoZXIgaGFuZCwgaXQgY291bGQg
YmUgaW1wcm92ZWQgdG8gcHJpbnQgdGhlIF9zd2lkZ2V0LT53aWRnZXQtPm5hbWUgYW5kDQo+IGEg
bm90ZSwgd2hpY2ggc2lkZSBpcyBtaXNzaW5nIHRoZSBmd19tb2R1bGUuDQo+DQo+IEkgY2FuIHNl
bmQgYSB2MiB3aXRoIGEgbmV3IHByaW50IHdpdGhvdXQgd2FpdGluZyBmb3IgR3Vlbm5hZGkgaW4g
ZmV3IGhvdXJzLg0KPg0KPiAtLSANCj4gUMOpdGVyDQo+
