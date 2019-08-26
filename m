Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8E9CA48
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 09:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396EE166F;
	Mon, 26 Aug 2019 09:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396EE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566804409;
	bh=qbYiy3PrwvrGG3cP1VTj4TA3OVwYuwm2woRvXbszg30=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TrsygtgByOONhs0azKIRhafYplFGtjI1b6xi3hW1j1nprppzqDzHj5T8UrKjNAIBn
	 aHt/Wdeg0gLNkLPT+qNJvAK3lnD92zGgLrT300x4Oe7SFykcpryBvTOaGQtyHhOpNw
	 qzxOfFxmaw9rrk4GKOdVgJ/+v5ovCb03hyvKCE2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 030C6F802BC;
	Mon, 26 Aug 2019 09:25:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BB5DF80362; Mon, 26 Aug 2019 09:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28624F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 09:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28624F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 00:24:52 -0700
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; d="scan'208";a="174121891"
Received: from mwasko-mobl.ger.corp.intel.com (HELO [10.237.137.181])
 ([10.237.137.181])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 26 Aug 2019 00:24:50 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <a08b2547-3fe5-5c48-9513-c5ade151c01e@linux.intel.com>
 <50932a9f-2f3e-c150-77c7-f021f84ed4d1@intel.com>
 <20190823102652.GM23391@sirena.co.uk>
 <c845fda4-c18d-2ca8-7337-6e6af74d239c@intel.com>
 <70222fac-8c4e-5ceb-3c49-7020196b59df@linux.intel.com>
 <2e2a34b8-2451-01f6-79a1-14f06d1ed059@intel.com>
 <9dfd3a96-f286-34d6-fe57-9b6b8740e424@linux.intel.com>
 <20190823213920.GW23391@sirena.co.uk>
 <57196fe6-9291-5518-9fb6-731b9b5c27ed@intel.com>
 <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
From: "Wasko, Michal" <michal.wasko@linux.intel.com>
Message-ID: <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
Date: Mon, 26 Aug 2019 09:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab5f0c6a-8d16-0848-1ca7-96286334a9bc@intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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

Ck9uIDgvMjUvMjAxOSAxOjA2IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4gT24gMjAxOS0w
OC0yNCAxNTo1MSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+PiBPbiAyMDE5LTA4LTIzIDIzOjM5
LCBNYXJrIEJyb3duIHdyb3RlOgo+Pj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTI6MThQ
TSAtMDUwMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4gT24gOC8yMy8xOSAxOjQ0
IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pgo+Pj4+PiBXYXNuJ3QgbHlpbmcgYWJvdXQg
RlcgdmVyc2lvbiBiZWluZyB1bnJlbGlhYmxlLiBMZXQncyBzYXkgdmVuZG9yCj4+Pj4+IHJlY2Vp
dmVzIHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4gc3VjaCBlbmcgZHJvcCBtYXkgY2Fycnkg
aW52YWxpZAo+Pj4+PiBudW1iZXJzIHN1Y2ggYXMgMC4wLjAuMC4uCj4+Pj4+IEluIGdlbmVyYWws
IEkgdHJ5IHRvIGF2b2lkIHJlbHlpbmcgb24gRlcgdmVyc2lvbiB3aGVuZXZlciAKPj4+Pj4gcG9z
c2libGUuIEl0Cj4+Pj4+IGNhbiBiZSBkdW1wZWQgZm9yIGRlYnVnIHJlYXNvbnMsIHRydWUsIGJ1
dCB0byBiZSByZWxpZWQgb24/IE5vdCAKPj4+Pj4gcmVhbGx5Lgo+Pj4KPj4+PiBHb29kbmVzcywg
dGhhdCdzIHJlYWxseSBiYWQuIEkgZGlkbid0IHJlYWxpemUgdGhpcy4KPj4+Cj4+PiBBdCBhIHBy
ZXZpb3VzIGVtcGxveWVyIEkgbW9kaWZpZWQgb3VyIGJ1aWxkIHN0YW1waW5nCj4+PiBpbmZyYXN0
cnVjdHVyZSB0byBhbHNvIGluY2x1ZGUgYm90aCBhIHRpbWVzdGFtcCBhbmQgYSBzZXJpYWxpemVk
Cj4+PiBidWlsZCBudW1iZXIgaW4gdGhlIHZlcnNpb24gbnVtYmVyIHNpbmNlIG9uZSBvZiBteSBj
b2xsZWFndWVzIHdhcwo+Pj4gZm9uZCBvZiBzZW5kaW5nIHBlb3BsZSBwcmVyZWxlYXNlcyBvZiB3
aGF0IGhlIHdhcyB3b3JraW5nIG9uIHRvCj4+PiBvdGhlciBwZW9wbGUgd2l0aCBpZGVudGljYWwg
dmVyc2lvbiBudW1iZXJzIG9uIGRpZmZlcmVudAo+Pj4gYmluYXJpZXMgbGVhZGluZyB0byBtdWNo
IGNvbmZ1c2lvbiBhbmQgY2hlY2tzdW1taW5nLsKgIFlvdSBkbyBzZWUKPj4+IGEgbG90IG9mIHRo
aW5ncyB3aXRoIHRob3NlIHNlcmlhbGl6ZWQgdmVyc2lvbiBudW1iZXJzLCBlc3BlY2lhbGx5Cj4+
PiBTVk4gYmFzZWQgcHJvamVjdHMuCj4+Pgo+Pj4+PiBQZXJzb25hbGx5LCBJJ20gYWdhaW5zdCBh
bGwgaGFyZGNvZGVzIGFuZCB3b3VsZCBzaW1wbHkgcmVjb21tZW5kIGFsbAo+Pj4+PiB1c2VyIHRv
IHJlZGlyZWN0IHRoZWlyIHN5bWxpbmtzIHdoZW4gdGhleSBkbyBzd2l0Y2gga2VybmVsIC0gYWxv
bmcgCj4+Pj4+IHdpdGgKPj4+Pj4gZHVtcGluZyB3YXJuaW5nLyBlcnJvciBtZXNzYWdlIGluIGRt
ZXNnLiBIYXJkY29kZXMgYnJpbmcgcHJvYmxlbXMgCj4+Pj4+IHdpdGgKPj4+Pj4gZm9yd2FyZCBj
b21wYXRpYmlsaXR5IGFuZCB0aGF0J3Mgd2h5IGhvc3Qgc2hvdWxkIG9mZmxvYWQgdGhlbSBhd2F5
IHRvCj4+Pj4+IEZXLgo+Pj4KPj4+PiBDZXphcnksIEkga25vdyB5b3UgYXJlIG5vdCByZXNwb25z
aWJsZSBmb3IgYWxsIHRoaXMsIGJ1dCBhdCB0aGlzIAo+Pj4+IHBvaW50IGlmIHdlCj4+Pj4gKElu
dGVsKSBjYW4ndCBndWFyYW50ZWUgYW55IHNvcnQgb2YgaW50ZXJvcGVyYWJpbGl0eSB3aXRoIGJv
dGggCj4+Pj4gZmlybXdhcmUgYW5kCj4+Pj4gdG9wb2xvZ3kgd2Ugc2hvdWxkIG1ha2UgaXQgY2xl
YXIgdGhhdCB0aGlzIGRyaXZlciBpcyBub3QgCj4+Pj4gcmVjb21tZW5kZWQgdW5sZXNzCj4+Pj4g
c3BlY2lmaWMgdmVyc2lvbnMgb2YgdGhlIGZpcm13YXJlL3RvcG9sb2d5IGFyZSB1c2VkLCBhbmQg
YXMgYSAKPj4+PiBjb25zZXF1ZW5jZQo+Pj4+IHRoZSB0eXBpY2FsIGNsaWVudCBkaXN0cm9zIGFu
ZCBkZXNrdG9wL2xhcHRvcCB1c2VycyBzaG91bGQgdXNlIEhEYXVkaW8KPj4+PiBsZWdhY3kgb3Ig
U09GIChmb3IgRE1JQ3MpCj4+Pgo+Pj4gTm90IHRoZSBtb3N0IGVsZWdlbnQgc29sdXRpb24gYnV0
IEknbSB3b25kZXJpbmcgaWYga2VlcGluZyBhIGNvcHkKPj4+IG9mIHRoZSBkcml2ZXIgYXMgaXMg
YXJvdW5kIGFuZCB1c2luZyBuZXcgbG9jYXRpb25zIGZvciB0aGUgZml4ZWQKPj4+IGZpcm13YXJl
IG1pZ2h0IGJlIHRoZSBzYWZlc3Qgd2F5IHRvIGhhbmRsZSB0aGlzLsKgIFdlIGNvdWxkIGhhdmUg
YQo+Pj4gd3JhcHBlciB3aGljaCB0cmllcyB0byBsb2FkIHRoZSBuZXdlciBmaXJtd2FyZSBhbmQg
dXNlcyB0aGUgZml4ZWQKPj4+IGRyaXZlciBjb2RlIGlmIHRoYXQncyB0aGVyZSwgb3RoZXJ3aXNl
IHRyaWVzIHRoZSBvbGQgZHJpdmVyIHdpdGgKPj4+IHRoZSBleGlzdGluZyBmaXJtd2FyZSBwYXRo
cy7CoCBUaGlzIGlzIG9idmlvdXNseSBhIGhvcnJvciBzaG93IGFuZAo+Pj4gbGVhdmVzIHRoZSBv
bGQgY29kZSBzaXR0aW5nIHRoZXJlIGJ1dCBnaXZlbiB0aGUgbWlzdGFrZXMgdGhhdAo+Pj4gaGF2
ZSBiZWVuIG1hZGUgdGhlIHdob2xlIHNpdHVhdGlvbiBsb29rcyBsaWtlIGEgaG91c2Ugb2YgY2Fy
ZHMuCj4+Pgo+Pgo+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBNYXJrLiBXaGlsZSBJJ20gbm90
IHlldCBvbiB0aGUgIlNPRiB3aWxsIGZpeCAKPj4gdGhpcyIgdHJhaW4sIEknbSBrZWVuIHRvIGFn
cmVlIHRvIGxlYXZpbmcgdGhpcyBlbnRpcmVseSB0byBTT0YgaWYgaXQgCj4+IGNvbWVzIGRvd24g
dG8gdXMgZHVwbGljYXRpbmcgL3NreWxha2UuCj4+Cj4+IEhvd2V2ZXIsIHdlIGFyZSBub3QgZ29p
bmcgdG8gZ2l2ZSB1cCB0aGF0IGVhc2lseS4gSSdsbCBzZWUgaWYgc29tZSAKPj4gImdvbGRlbiBj
b25maWciIGhhcmRjb2RlcyBjYW4ndCBiZSBwcm92aWRlZCBpbiBzb21lIGxlZ2FjeS5jIGZpbGUg
Cj4+IHdoaWNoIHdvdWxkIGJlIGZldGNoZWQgaWYgaW5pdGlhbCBzZXR1cCBmYWlscy4gRS5nLjog
MmNvcmVzLCAzc3NwcywgCj4+IDFQQUdFX1NJWkUgcGVyIHRyYWNlIGJ1ZmZlci4uIGFuZCBzdWNo
LiBUaGVyZSBhcmUgcXVpdGUgYSBmZXcgZmFjdG9ycyAKPj4gdG8gdGFrZSBpbnRvIGNvbnNpZGVy
YXRpb24gdGhvdWdoLiBJZiAiYXNraW5nIiB1c2VyIHZpYSBkbWVzZyB0byAKPj4gdXBncmFkZSB0
aGUgZmlybXdhcmUgaWYgaGlzL2hlciBzZXR1cCBjb250YWlucyBvYnNvbGV0ZSBiaW5hcnkgaXMg
Cj4+IHJlYWxseSBub3QgYW4gb3B0aW9uLCB0aGVuIHNvbWUgbWFnaWMgd29yZHMgZ290IHRvIGJl
IGludm9sdmVkLgo+Pgo+PiBDemFyZWsKPgo+IE9uIHRoZSBzZWNvbmQgdGhvdWdodCB3aGF0IGlm
IGluc3RlYWQgb2YgZHVwbGljYXRpbmcga2VybmVsIGNvZGUsIAo+IGJpbmFyaWVzIHdvdWxkIGJl
IGR1cGxpY2F0ZWQ/Cj4gSS5lLiByYXRoZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19j
bmwuYmluLCBfbmV3XyAvc2t5bGFrZSB3b3VsZCAKPiBiZSBleHBlY3RpbmcgL2ludGVsL2RzcF9m
d19jbmxfcmVsZWFzZS5iaW4/IFNhbWUgd2l0aCB0b3BvbG9neSBiaW5hcmllcy4KPiBJbiBzdWNo
IGNhc2UsIHdlICJvbmx5IiBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93IHRvIHByb3BhZ2F0ZSBuZXcg
ZmlsZXMgCj4gdG8gTGludXggZGlzdG9zIHNvIHdoZW5ldmVyIHNvbWVvbmUgdXBkYXRlcyB0aGVp
ciBrZXJuZWwsIG5ldyBiaW5hcmllcyAKPiBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZWlyIC9s
aWIvZmlybXdhcmUuCj4KPiBJZiBzdWNoIG9wdGlvbiBpcyB2YWxpZCwgd2UgY2FuIHBvc3Rwb25l
IC9za3lsYWtlIHVwZ3JhZGUgdGlsbCA1LjQgCj4gbWVyZ2luZyB3aW5kb3cgY2xvc2VzIGFuZCB0
aGUgcGF0Y2hlcyAocm91Z2ggZXN0aW1hdGlvbiBpcyAxNTApIHdvdWxkIAo+IGRlc2NlbmQgdXBv
biBhbHNhLWRldmVsIGluIHRpbWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4KCklmIHRoZSBkcml2ZXIg
YW5kIEZXIHVwZGF0ZSB3aWxsIGJlIHdpdGhpbiB0aGUgc2FtZSBrZXJuZWwgcmVsZWFzZSB0aGVu
IElNSE8KdGhlcmUgc2hvdWxkIGJlIG5vIGNvbXBhdGliaWxpdHkgcHJvYmxlbSBiZXR3ZWVuIHRo
b3NlIHR3byBjb21wb25lbnRzLCAKcmlnaHQ/ClRoaXMgd2F5IGtlcm5lbCB1c2VycyB3aWxsaW5n
IHRvIHN0aWNrIHRvIG9sZCBGVyBjYW4gc3RheSBvbiBvbGRlciAKa2VybmVsIHZlcnNpb24gd2hp
bGUKb3RoZXJzIGNhbiB1cGRhdGUgYW5kIHJlY2VpdmUgYWxsIHRoZSBsYXRlc3QgRlcgZnVuY3Rp
b25hbGl0eSB0aGF0IHdhcyAKZGV2ZWxvcGVkIGFuZCBlbmFibGVkLgoKSW4gdGVybXMgb2YgRlcg
dG9wb2xvZ3kgY29tcGF0aWJpbGl0eSB0aGVyZSBpcyBhbiBvcHRpb24gdG8gcmVhZCBmcm9tIAp0
b3BvbG9neSBtYW5pZmVzdAphIEZXIHZlcnNpb24gdGhhdCBpdCB3YXMgYnVpbGQgZm9yIGFuZCBp
bsKgIGNhc2UgaWYgaXQgZG9lcyBub3QgbWF0Y2ggRlcgCnZlcnNpb24gcHJlc2VudCBvbgp0aGUg
cGxhdGZvcm0gdGhlbiBwcmludCB3YXJuaW5nIHRoYXQgdGhlIEZXIHRvcG9sb2d5IGJpbmFyeSBz
aG91bGQgYmUgCnJlYnVpbGQgZm9yIGN1cnJlbnQKRlcgdmVyc2lvbiAoeC54LngueCkuCgpUaGUg
YWJvdmUgYXBwcm9hY2ggYXQgdGhlIGVuZCBtYXkgYmUgbGVzcyBjb25mdXNpbmcgdGhlbiBzb3Vy
Y2UgY29kZSBvciAKYmluYXJ5IGR1cGxpY2F0aW9uLgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKPiBodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
