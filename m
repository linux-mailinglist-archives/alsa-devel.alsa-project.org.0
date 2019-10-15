Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9CD7AAA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 17:58:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0AFB84D;
	Tue, 15 Oct 2019 17:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0AFB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571155115;
	bh=9LmGCYQ4Lu7SqByfcEeEsI8fd1FY02uYkjNINp6/UNE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0n6zSvXpIVdFeiUGn5CigM9sBx6zsL8HOaTAvHydMNQHEmeoQE48SIAj2YiFHOl1
	 RJoWhszfmIi1s6dlNlC5jL2TO8UMRkhy5YKEMpx/bYlQ+07XcS8Yli5dKJIq35KMIN
	 LdRYZBHnQaWXB3B89fcXmm4eMYQCTosuAp0KmEBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32EEEF804AA;
	Tue, 15 Oct 2019 17:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72E0BF804AA; Tue, 15 Oct 2019 17:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 035F0F800F4
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 17:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035F0F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 08:56:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="201796072"
Received: from unknown (HELO [10.254.44.8]) ([10.254.44.8])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2019 08:56:42 -0700
To: Daniel Baluta <daniel.baluta@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87a7a24l7r.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZAsZ=Q=tcqCzVp8bvj4Jme+YTH9GxmMoBgvOT+w6z8iiw@mail.gmail.com>
 <877e564ht5.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <93911ba6-370e-4b93-d3c2-81081b1be0aa@linux.intel.com>
Date: Tue, 15 Oct 2019 08:27:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAEnQRZDtwFoXQ2H_j1v-95Pnh=QzZFX86jHk1RTq1oqSO+5jRw@mail.gmail.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: sof: include types.h at header.h
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

CgpPbiAxMC8xNS8xOSAyOjA3IEFNLCBEYW5pZWwgQmFsdXRhIHdyb3RlOgo+IE9uIFR1ZSwgT2N0
IDE1LCAyMDE5IGF0IDk6NTcgQU0gS3VuaW5vcmkgTW9yaW1vdG8KPiA8a3VuaW5vcmkubW9yaW1v
dG8uZ3hAcmVuZXNhcy5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBIaSBEYW5pZWwKPj4KPj4+PiBDb250
ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4+Pj4KPj4+PiBXaXRob3V0IDx0eXBlcy5oPiB3
ZSB3aWxsIGdldCB0aGVzZSBlcnJvcgo+Pj4+Cj4+Pj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2Yv
aGVhZGVyLmg6MTI1OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVp
bnQzMl90IHNpemU7Cj4+Pj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvaGVhZGVyLmg6MTM2OjI6
IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVpbnQzMl90IHNpemU7Cj4+
Pj4gbGludXgvaW5jbHVkZS9zb3VuZC9zb2YvaGVhZGVyLmg6MTM3OjI6IGVycm9yOiB1bmtub3du
IHR5cGUgbmFtZSDigJh1aW50MzJfdOKAmXVpbnQzMl90IGNtZDsKPj4+PiAuLi4KPj4+PiBsaW51
eC9pbmNsdWRlL3NvdW5kL3NvZi9kYWktaW14Lmg6MTg6MjogZXJyb3I6IHVua25vd24gdHlwZSBu
YW1lIOKAmHVpbnQxNl904oCZdWludDE2X3QgcmVzZXJ2ZWQxOwo+Pj4+IGxpbnV4L2luY2x1ZGUv
c291bmQvc29mL2RhaS1pbXguaDozMDoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdWlu
dDE2X3TigJl1aW50MTZfdCB0ZG1fc2xvdF93aWR0aDsKPj4+PiBsaW51eC9pbmNsdWRlL3NvdW5k
L3NvZi9kYWktaW14Lmg6MzE6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHVpbnQxNl90
4oCZdWludDE2X3QgcmVzZXJ2ZWQyOwo+Pj4+Cj4+Pgo+Pj4gSSB0aGluayB5b3VyIHBhdGNoIGlz
IE9LLCBidXQgeW91IHNob3VsZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGJlY2F1c2UKPj4+
IFN0ZXBoZW4gUm90aHdlbGwgYWxyZWFkeSBmaXhlZCBkYWktaW14LmggY29tcGlsYXRpb24gZXJy
b3IgIGluIGxpbnV4LW5leHQuCj4+Cj4+IEkgc2VlLiBUaGFua3MKPj4KPj4gQnV0IGhtbS4uLiBJ
IGNvdWxkbid0IGZpbmQgaXQgYXQgbGludXgtbmV4dC9tYXN0ZXIgdG9kYXkuLi4KPj4gTm90IHll
dCBtZXJnZWQgPwo+IAo+IFllcywgdGhpcyBpcyBzdHJhbmdlLiBJJ3ZlIHNlbnQgYW4gZW1haWwg
dG8gU3RlcGhlbiBhbmQKPiBhbHNvIGFkZGVkIHlvdSB0byBDYy4KPiAKPiBCdXQsIHlvdXIgcGF0
Y2ggaXMgc3RpbGwgdmFsaWQgYmVjYXVzZSBTdGVwaGVuIHVzZWQgKyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPgo+IGluIGRhaS1pbXguaCBhbmQgeW91IGFyZSBub3cgZml4aW5nIHRoZSBnZW5lcmlj
IHNpdHVhdGlvbiBieSBpbmNsdWRpbmcgaXQgaW4KPiBoZWFkZXIuaC4KPiAKPiBMZXRzIHNlZSBp
ZiBTdGVwaGVuIGNhbiBjbGFyaWZ5IHRoZSBzaXR1YXRpb24uIFBlcmhhcHMgd2UgY2FuIGRyb3Ag
aGlzIHBhdGNoCj4gYW5kIG9ubHkgaGF2ZSB5b3Vycy4KCnRoaXMgaXMgYSBmaWxlIHNoYXJlZCB3
aXRoIHRoZSBmaXJtd2FyZSwgd2Ugc2hvdWxkbid0IGhhdmUgdG8gYWRkIGxpbnV4IApzcGVjaWZp
YyBzdHVmZiBpbiB0aGVyZS4KCkFsc28gSSBkb24ndCBrbm93IGhvdyB5b3UgZ2V0IHRob3NlIGVy
cm9ycywgd2UndmUgYmVlbiB1c2luZyB0aGlzIGZpbGUgCmZvciBzb21lIHRpbWUsIGNhbiB5b3Ug
Y2xhcmlmeSBob3cgdGhpcyBlcnJvciBoYXBwZW5zPwoKVGhhbmtzLgoKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IEFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
