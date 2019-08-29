Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82109A1EB3
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BEF16D1;
	Thu, 29 Aug 2019 17:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BEF16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091880;
	bh=Z1Tpzfe8z9TBg/eMKKip8BqhoGgIND1J0c1OVZTCVac=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZiVRUEQeb+QG2MwD0NIvZaM5/TWd+FH/ZZX0iV36/gXup5MHAOhWqhy5/a3sh1yb
	 A91LI5kMWw5HPAYoVtLH6OYHAo20jCTc/i9OmtiyrGCi6xe8PRWQFCba1Xtsp61S0G
	 Od7szEocjYgI3bkyCO5tgtB+a2qbHNypCSZs019U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B73ABF897EC;
	Thu, 29 Aug 2019 04:26:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA39F897EC; Thu, 29 Aug 2019 04:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9857EF8970E
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 04:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9857EF8970E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="dvr793nm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cvhAYDXepFr1W9XWCommsvR9amxyOLa9CIfTaM40gzI=; b=dvr793nmEyuIwAJsP5Fl+MGYY
 uvnb9faUYyG1neWulPIY9ZqRNcx7SjwX+FKIEfKqNBaq9RcsVdx+oknvaG6iuC9vm37zGhMyvQvSp
 nJheZPzgfL7MJSOERDyF7B+MXxsLHKpsR2LFo2OMFICcizUrJHk3BSzURLc/JXfRSqhYSVDAbp0Dz
 cz3cR7/pdDt9G7D/xrl5aDhIH/TOr7g14632wYtcz03Z7SVo120mKlQT+ZPrHNq6nrfB5BSpna5tq
 iBgolawBjj8HZ+Oof7dNaGFrhrtQ92LUnI5Fms8FoSvTkrIZX17aaBVDTCZayHDWuIoXvsEx2ijEb
 64O83mpTA==;
Received: from [2601:1c0:6200:6e8::4f71]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i3A8u-0005Xu-47; Thu, 29 Aug 2019 02:26:32 +0000
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 akpm@linux-foundation.org, broonie@kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz,
 mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <20190828034012.sBvm81sYK%akpm@linux-foundation.org>
 <274054ef-8611-2661-9e67-4aabae5a7728@infradead.org>
 <5ac8a7a7-a9b4-89a5-e0a6-7c97ec1fabc6@linux.intel.com>
 <98ada795-4700-7fcc-6d14-fcc1ab25d509@infradead.org>
 <f0a62b08-cba9-d944-5792-8eac0ea39df1@linux.intel.com>
 <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
 <4725bbed-81e1-9724-b51c-47eba8e414d0@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d26c671b-fa17-e065-85f3-d6d187c4fc15@infradead.org>
Date: Wed, 28 Aug 2019 19:26:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4725bbed-81e1-9724-b51c-47eba8e414d0@infradead.org>
Content-Language: en-US
Subject: Re: [alsa-devel] mmotm 2019-08-27-20-39 uploaded
	(sound/hda/intel-nhlt.c)
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

T24gOC8yOC8xOSAzOjU5IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gT24gOC8yOC8xOSAzOjQ1
IFBNLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4+Pj4gSSBqdXN0IGNoZWNrZWQg
d2l0aCBNYXJrIEJyb3duJ3MgZm9yLW5leHQgdHJlZSA4YWNlZmZhMDliNGI5ODY3MTUzYmZlMGZm
NmY0MDUxNzI0MGNlZTEyCj4+Pj4+IGFuZCB0aGluZ3MgYXJlIGZpbmUgaW4gaTM4NiBtb2RlLCBz
ZWUgYmVsb3cuCj4+Pj4+Cj4+Pj4+IG5leHQtMjAxOTA4MjggYWxzbyB3b3JrcyBmaW5lIGZvciBt
ZSBpbiBpMzg2IG1vZGUuCj4+Pj4+Cj4+Pj4+IGlmIHlvdSBjYW4gcG9pbnQgbWUgdG8gYSB0cmVl
IGFuZCBjb25maWd1cmF0aW9uIHRoYXQgZG9uJ3Qgd29yayBJJ2xsIGxvb2sgaW50byB0aGlzLCBJ
J2QgbmVlZCBtb3JlIGluZm8gdG8gcHJvZ3Jlc3MuCj4+Pj4KPj4+PiBQbGVhc2UgdHJ5IHRoZSBh
dHRhY2hlZCByYW5kY29uZmlnIGZpbGUuCj4+Pj4KPj4+PiBUaGFua3MgZm9yIGxvb2tpbmcuCj4+
Pgo+Pj4gQWNrLCBJIHNlZSBzb21lIGVycm9ycyBhcyB3ZWxsIHdpdGggdGhpcyBjb25maWcuIExp
a2VseSBhIG1pc3NpbmcgZGVwZW5kZW5jeSBzb21ld2hlcmUsIHdvcmtpbmcgb24gdGhpcyBub3cu
Cj4+Cj4+IE15IGJhZCwgSSBhZGRlZCBhIGZhbGxiYWNrIHdpdGggc3RhdGljIGlubGluZSBmdW5j
dGlvbnMgaW4gdGhlIC5oIGZpbGUgd2hlbiBBQ1BJIGlzIG5vdCBkZWZpbmVkLCBidXQgdGhlIC5j
IGZpbGUgd2FzIHN0aWxsIGNvbXBpbGVkLgo+Pgo+PiBUaGUgZGlmZiBiZWxvdyBtYWtlcyBuZXh0
LTIwMTkwODI4IGNvbXBpbGUgd2l0aCBSYW5keSdzIGNvbmZpZy4KPj4KPj4gSXQgbG9va3MgbGlr
ZSB0aGUgYWxzYS1kZXZlbCBzZXJ2ZXIgaXMgZG93biBidHc/Cj4+Cj4+IGRpZmYgLS1naXQgYS9z
b3VuZC9oZGEvTWFrZWZpbGUgYi9zb3VuZC9oZGEvTWFrZWZpbGUKPj4gaW5kZXggODU2MGY2ZWYx
YjE5Li5iM2FmMDcxY2UwNmIgMTAwNjQ0Cj4+IC0tLSBhL3NvdW5kL2hkYS9NYWtlZmlsZQo+PiAr
KysgYi9zb3VuZC9oZGEvTWFrZWZpbGUKPj4gQEAgLTE0LDUgKzE0LDcgQEAgb2JqLSQoQ09ORklH
X1NORF9IREFfQ09SRSkgKz0gc25kLWhkYS1jb3JlLm8KPj4gwqAjZXh0ZW5kZWQgaGRhCj4+IMKg
b2JqLSQoQ09ORklHX1NORF9IREFfRVhUX0NPUkUpICs9IGV4dC8KPj4KPj4gK2lmZGVmIENPTkZJ
R19BQ1BJCj4+IMKgc25kLWludGVsLW5obHQtb2JqcyA6PSBpbnRlbC1uaGx0Lm8KPj4gwqBvYmot
JChDT05GSUdfU05EX0lOVEVMX05ITFQpICs9IHNuZC1pbnRlbC1uaGx0Lm8KPj4gK2VuZGlmCj4+
Cj4gCj4gd29ya3MgZm9yIG1lLiAgVGhhbmtzLgo+IEFja2VkLWJ5OiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4gIyBidWlsZC10ZXN0ZWQKPiAKCmFsdGhvdWdoIHRoaXMgTWFr
ZWZpbGUgY2hhbmdlIHNob3VsZCBub3QgYmUgbmVlZGVkCmFuZCB0aGUgZGVwZW5kZW5jaWVzIHNo
b3VsZCBiZSBoYW5kbGVkIGNvcnJlY3RseSBpbiBLY29uZmlnIGZpbGVzLgoKLS0gCn5SYW5keQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
