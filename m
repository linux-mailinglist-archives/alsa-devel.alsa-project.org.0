Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD09D619
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D8616D8;
	Mon, 26 Aug 2019 20:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D8616D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566845986;
	bh=PikiwSut0fJlKuLrU2KVNqx9YpI4rIv92rHXzwE8KN4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gm5r78WN1m9b/7VvHrdXgfbMfZkdZCmGETCeZ62cBaWSVkd7ObjOtiSJJ1vVnaorh
	 4NKg1r0UfTQv90I07mplYXbjMyR1z87JIXvL6WT6TAcryWfe8DDXj/tL7TRtooTOf/
	 gtYf1Uqlo6eEUU23vQg26xOQ5d9BU+RYO6NX378A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47154F80612;
	Mon, 26 Aug 2019 20:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2874FF805E2; Mon, 26 Aug 2019 20:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C790F805A0
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C790F805A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 11:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="185044436"
Received: from dmitra-mobl.amr.corp.intel.com (HELO [10.252.138.53])
 ([10.252.138.53])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 11:55:24 -0700
To: "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>
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
 <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
Date: Mon, 26 Aug 2019 11:51:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
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

CgpPbiA4LzI2LzE5IDI6MjQgQU0sIFdhc2tvLCBNaWNoYWwgd3JvdGU6Cj4gCj4gT24gOC8yNS8y
MDE5IDE6MDYgUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPj4gT24gMjAxOS0wOC0yNCAxNTo1
MSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gT24gMjAxOS0wOC0yMyAyMzozOSwgTWFyayBC
cm93biB3cm90ZToKPj4+PiBPbiBGcmksIEF1ZyAyMywgMjAxOSBhdCAwMzoxMjoxOFBNIC0wNTAw
LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4+Pj4gT24gOC8yMy8xOSAxOjQ0IFBNLCBD
ZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4KPj4+Pj4+IFdhc24ndCBseWluZyBhYm91dCBGVyB2
ZXJzaW9uIGJlaW5nIHVucmVsaWFibGUuIExldCdzIHNheSB2ZW5kb3IKPj4+Pj4+IHJlY2VpdmVz
IHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4gc3VjaCBlbmcgZHJvcCBtYXkgY2FycnkgaW52
YWxpZAo+Pj4+Pj4gbnVtYmVycyBzdWNoIGFzIDAuMC4wLjAuLgo+Pj4+Pj4gSW4gZ2VuZXJhbCwg
SSB0cnkgdG8gYXZvaWQgcmVseWluZyBvbiBGVyB2ZXJzaW9uIHdoZW5ldmVyIAo+Pj4+Pj4gcG9z
c2libGUuIEl0Cj4+Pj4+PiBjYW4gYmUgZHVtcGVkIGZvciBkZWJ1ZyByZWFzb25zLCB0cnVlLCBi
dXQgdG8gYmUgcmVsaWVkIG9uPyBOb3QgCj4+Pj4+PiByZWFsbHkuCj4+Pj4KPj4+Pj4gR29vZG5l
c3MsIHRoYXQncyByZWFsbHkgYmFkLiBJIGRpZG4ndCByZWFsaXplIHRoaXMuCj4+Pj4KPj4+PiBB
dCBhIHByZXZpb3VzIGVtcGxveWVyIEkgbW9kaWZpZWQgb3VyIGJ1aWxkIHN0YW1waW5nCj4+Pj4g
aW5mcmFzdHJ1Y3R1cmUgdG8gYWxzbyBpbmNsdWRlIGJvdGggYSB0aW1lc3RhbXAgYW5kIGEgc2Vy
aWFsaXplZAo+Pj4+IGJ1aWxkIG51bWJlciBpbiB0aGUgdmVyc2lvbiBudW1iZXIgc2luY2Ugb25l
IG9mIG15IGNvbGxlYWd1ZXMgd2FzCj4+Pj4gZm9uZCBvZiBzZW5kaW5nIHBlb3BsZSBwcmVyZWxl
YXNlcyBvZiB3aGF0IGhlIHdhcyB3b3JraW5nIG9uIHRvCj4+Pj4gb3RoZXIgcGVvcGxlIHdpdGgg
aWRlbnRpY2FsIHZlcnNpb24gbnVtYmVycyBvbiBkaWZmZXJlbnQKPj4+PiBiaW5hcmllcyBsZWFk
aW5nIHRvIG11Y2ggY29uZnVzaW9uIGFuZCBjaGVja3N1bW1pbmcuwqAgWW91IGRvIHNlZQo+Pj4+
IGEgbG90IG9mIHRoaW5ncyB3aXRoIHRob3NlIHNlcmlhbGl6ZWQgdmVyc2lvbiBudW1iZXJzLCBl
c3BlY2lhbGx5Cj4+Pj4gU1ZOIGJhc2VkIHByb2plY3RzLgo+Pj4+Cj4+Pj4+PiBQZXJzb25hbGx5
LCBJJ20gYWdhaW5zdCBhbGwgaGFyZGNvZGVzIGFuZCB3b3VsZCBzaW1wbHkgcmVjb21tZW5kIGFs
bAo+Pj4+Pj4gdXNlciB0byByZWRpcmVjdCB0aGVpciBzeW1saW5rcyB3aGVuIHRoZXkgZG8gc3dp
dGNoIGtlcm5lbCAtIGFsb25nIAo+Pj4+Pj4gd2l0aAo+Pj4+Pj4gZHVtcGluZyB3YXJuaW5nLyBl
cnJvciBtZXNzYWdlIGluIGRtZXNnLiBIYXJkY29kZXMgYnJpbmcgcHJvYmxlbXMgCj4+Pj4+PiB3
aXRoCj4+Pj4+PiBmb3J3YXJkIGNvbXBhdGliaWxpdHkgYW5kIHRoYXQncyB3aHkgaG9zdCBzaG91
bGQgb2ZmbG9hZCB0aGVtIGF3YXkgdG8KPj4+Pj4+IEZXLgo+Pj4+Cj4+Pj4+IENlemFyeSwgSSBr
bm93IHlvdSBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBhbGwgdGhpcywgYnV0IGF0IHRoaXMgCj4+
Pj4+IHBvaW50IGlmIHdlCj4+Pj4+IChJbnRlbCkgY2FuJ3QgZ3VhcmFudGVlIGFueSBzb3J0IG9m
IGludGVyb3BlcmFiaWxpdHkgd2l0aCBib3RoIAo+Pj4+PiBmaXJtd2FyZSBhbmQKPj4+Pj4gdG9w
b2xvZ3kgd2Ugc2hvdWxkIG1ha2UgaXQgY2xlYXIgdGhhdCB0aGlzIGRyaXZlciBpcyBub3QgCj4+
Pj4+IHJlY29tbWVuZGVkIHVubGVzcwo+Pj4+PiBzcGVjaWZpYyB2ZXJzaW9ucyBvZiB0aGUgZmly
bXdhcmUvdG9wb2xvZ3kgYXJlIHVzZWQsIGFuZCBhcyBhIAo+Pj4+PiBjb25zZXF1ZW5jZQo+Pj4+
PiB0aGUgdHlwaWNhbCBjbGllbnQgZGlzdHJvcyBhbmQgZGVza3RvcC9sYXB0b3AgdXNlcnMgc2hv
dWxkIHVzZSBIRGF1ZGlvCj4+Pj4+IGxlZ2FjeSBvciBTT0YgKGZvciBETUlDcykKPj4+Pgo+Pj4+
IE5vdCB0aGUgbW9zdCBlbGVnZW50IHNvbHV0aW9uIGJ1dCBJJ20gd29uZGVyaW5nIGlmIGtlZXBp
bmcgYSBjb3B5Cj4+Pj4gb2YgdGhlIGRyaXZlciBhcyBpcyBhcm91bmQgYW5kIHVzaW5nIG5ldyBs
b2NhdGlvbnMgZm9yIHRoZSBmaXhlZAo+Pj4+IGZpcm13YXJlIG1pZ2h0IGJlIHRoZSBzYWZlc3Qg
d2F5IHRvIGhhbmRsZSB0aGlzLsKgIFdlIGNvdWxkIGhhdmUgYQo+Pj4+IHdyYXBwZXIgd2hpY2gg
dHJpZXMgdG8gbG9hZCB0aGUgbmV3ZXIgZmlybXdhcmUgYW5kIHVzZXMgdGhlIGZpeGVkCj4+Pj4g
ZHJpdmVyIGNvZGUgaWYgdGhhdCdzIHRoZXJlLCBvdGhlcndpc2UgdHJpZXMgdGhlIG9sZCBkcml2
ZXIgd2l0aAo+Pj4+IHRoZSBleGlzdGluZyBmaXJtd2FyZSBwYXRocy7CoCBUaGlzIGlzIG9idmlv
dXNseSBhIGhvcnJvciBzaG93IGFuZAo+Pj4+IGxlYXZlcyB0aGUgb2xkIGNvZGUgc2l0dGluZyB0
aGVyZSBidXQgZ2l2ZW4gdGhlIG1pc3Rha2VzIHRoYXQKPj4+PiBoYXZlIGJlZW4gbWFkZSB0aGUg
d2hvbGUgc2l0dWF0aW9uIGxvb2tzIGxpa2UgYSBob3VzZSBvZiBjYXJkcy4KPj4+Pgo+Pj4KPj4+
IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIE1hcmsuIFdoaWxlIEknbSBub3QgeWV0IG9uIHRoZSAi
U09GIHdpbGwgZml4IAo+Pj4gdGhpcyIgdHJhaW4sIEknbSBrZWVuIHRvIGFncmVlIHRvIGxlYXZp
bmcgdGhpcyBlbnRpcmVseSB0byBTT0YgaWYgaXQgCj4+PiBjb21lcyBkb3duIHRvIHVzIGR1cGxp
Y2F0aW5nIC9za3lsYWtlLgo+Pj4KPj4+IEhvd2V2ZXIsIHdlIGFyZSBub3QgZ29pbmcgdG8gZ2l2
ZSB1cCB0aGF0IGVhc2lseS4gSSdsbCBzZWUgaWYgc29tZSAKPj4+ICJnb2xkZW4gY29uZmlnIiBo
YXJkY29kZXMgY2FuJ3QgYmUgcHJvdmlkZWQgaW4gc29tZSBsZWdhY3kuYyBmaWxlIAo+Pj4gd2hp
Y2ggd291bGQgYmUgZmV0Y2hlZCBpZiBpbml0aWFsIHNldHVwIGZhaWxzLiBFLmcuOiAyY29yZXMs
IDNzc3BzLCAKPj4+IDFQQUdFX1NJWkUgcGVyIHRyYWNlIGJ1ZmZlci4uIGFuZCBzdWNoLiBUaGVy
ZSBhcmUgcXVpdGUgYSBmZXcgZmFjdG9ycyAKPj4+IHRvIHRha2UgaW50byBjb25zaWRlcmF0aW9u
IHRob3VnaC4gSWYgImFza2luZyIgdXNlciB2aWEgZG1lc2cgdG8gCj4+PiB1cGdyYWRlIHRoZSBm
aXJtd2FyZSBpZiBoaXMvaGVyIHNldHVwIGNvbnRhaW5zIG9ic29sZXRlIGJpbmFyeSBpcyAKPj4+
IHJlYWxseSBub3QgYW4gb3B0aW9uLCB0aGVuIHNvbWUgbWFnaWMgd29yZHMgZ290IHRvIGJlIGlu
dm9sdmVkLgo+Pj4KPj4+IEN6YXJlawo+Pgo+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hhdCBp
ZiBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGtlcm5lbCBjb2RlLCAKPj4gYmluYXJpZXMgd291bGQg
YmUgZHVwbGljYXRlZD8KPj4gSS5lLiByYXRoZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9m
d19jbmwuYmluLCBfbmV3XyAvc2t5bGFrZSB3b3VsZCAKPj4gYmUgZXhwZWN0aW5nIC9pbnRlbC9k
c3BfZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGggdG9wb2xvZ3kgYmluYXJpZXMuCj4+IElu
IHN1Y2ggY2FzZSwgd2UgIm9ubHkiIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gcHJvcGFnYXRl
IG5ldyBmaWxlcyAKPj4gdG8gTGludXggZGlzdG9zIHNvIHdoZW5ldmVyIHNvbWVvbmUgdXBkYXRl
cyB0aGVpciBrZXJuZWwsIG5ldyBiaW5hcmllcyAKPj4gYXJlIGFscmVhZHkgcHJlc2VudCBpbiB0
aGVpciAvbGliL2Zpcm13YXJlLgo+Pgo+PiBJZiBzdWNoIG9wdGlvbiBpcyB2YWxpZCwgd2UgY2Fu
IHBvc3Rwb25lIC9za3lsYWtlIHVwZ3JhZGUgdGlsbCA1LjQgCj4+IG1lcmdpbmcgd2luZG93IGNs
b3NlcyBhbmQgdGhlIHBhdGNoZXMgKHJvdWdoIGVzdGltYXRpb24gaXMgMTUwKSB3b3VsZCAKPj4g
ZGVzY2VuZCB1cG9uIGFsc2EtZGV2ZWwgaW4gdGltZSBiZXR3ZWVuIDUuNCBhbmQgNS41Lgo+IAo+
IElmIHRoZSBkcml2ZXIgYW5kIEZXIHVwZGF0ZSB3aWxsIGJlIHdpdGhpbiB0aGUgc2FtZSBrZXJu
ZWwgcmVsZWFzZSB0aGVuIAo+IElNSE8KPiB0aGVyZSBzaG91bGQgYmUgbm8gY29tcGF0aWJpbGl0
eSBwcm9ibGVtIGJldHdlZW4gdGhvc2UgdHdvIGNvbXBvbmVudHMsIAo+IHJpZ2h0Pwo+IFRoaXMg
d2F5IGtlcm5lbCB1c2VycyB3aWxsaW5nIHRvIHN0aWNrIHRvIG9sZCBGVyBjYW4gc3RheSBvbiBv
bGRlciAKPiBrZXJuZWwgdmVyc2lvbiB3aGlsZQo+IG90aGVycyBjYW4gdXBkYXRlIGFuZCByZWNl
aXZlIGFsbCB0aGUgbGF0ZXN0IEZXIGZ1bmN0aW9uYWxpdHkgdGhhdCB3YXMgCj4gZGV2ZWxvcGVk
IGFuZCBlbmFibGVkLgoKSSBhbSBub3QgY29tZm9ydGFibGUgd2l0aCBwcmVjbHVkaW5nIGEga2Vy
bmVsIHVwZGF0ZSBiZWNhdXNlIG9mIGEgc2luZ2xlIApmaXJtd2FyZSBmaWxlLiBUaGVyZSBhcmUg
YWxsIHNvcnQgb2YgcmVhc29ucyBmb3IgdXBkYXRpbmcgYSBrZXJuZWwsIApzZWN1cml0eSwgc2lk
ZWJhbmQgYXR0YWNrcyBhbmQgQW5kcm9pZCBDREQgY29tcGF0aWJpbGl0eSBiZWluZyB0aGUgbW9z
dCAKb2J2aW91cyBvbmVzLgoKPiAKPiBJbiB0ZXJtcyBvZiBGVyB0b3BvbG9neSBjb21wYXRpYmls
aXR5IHRoZXJlIGlzIGFuIG9wdGlvbiB0byByZWFkIGZyb20gCj4gdG9wb2xvZ3kgbWFuaWZlc3QK
PiBhIEZXIHZlcnNpb24gdGhhdCBpdCB3YXMgYnVpbGQgZm9yIGFuZCBpbsKgIGNhc2UgaWYgaXQg
ZG9lcyBub3QgbWF0Y2ggRlcgCj4gdmVyc2lvbiBwcmVzZW50IG9uCj4gdGhlIHBsYXRmb3JtIHRo
ZW4gcHJpbnQgd2FybmluZyB0aGF0IHRoZSBGVyB0b3BvbG9neSBiaW5hcnkgc2hvdWxkIGJlIAo+
IHJlYnVpbGQgZm9yIGN1cnJlbnQKPiBGVyB2ZXJzaW9uICh4LngueC54KS4KCkNhbiB5b3UgcHJv
dmlkZSBhIHBvaW50ZXIgb24gaG93IHRoZSBGVyB2ZXJzaW9uIGlzIGVtYmVkZGVkIGluIGEgCi5j
b25mLy50cGxnIGZpbGU/IEkgc2VlIGEgY291cGxlIHdoZXJlIHRoYXQgaW5mb3JtYXRpb24gZG9l
cyBub3Qgc2VlbSAKcHJlc2VudC4KCj4gVGhlIGFib3ZlIGFwcHJvYWNoIGF0IHRoZSBlbmQgbWF5
IGJlIGxlc3MgY29uZnVzaW5nIHRoZW4gc291cmNlIGNvZGUgb3IgCj4gYmluYXJ5IGR1cGxpY2F0
aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
