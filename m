Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C79D742
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 22:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D257316D8;
	Mon, 26 Aug 2019 22:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D257316D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566850372;
	bh=81bV2crHMyqRxqtoUYtLAckKkhvSHYaSXWiM5QxugdA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wii5clm9VMjW4ZfIYGIGSqc61H0AmOpzn0DpIPRFZ4xI0sEGVdq+pKFUvHDqL40d1
	 AXzobXPk67i8zdgZIgBjQG3zmC+/w+Vq5QegbQZb+1c6urZIfyMHjY8tn1YvTnMRbF
	 yBXC4DVb9aDHdKuSMdVVn5weaHpCp719qLrSi9SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25757F80376;
	Mon, 26 Aug 2019 22:11:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE35EF80362; Mon, 26 Aug 2019 22:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 351A7F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 22:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351A7F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 13:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="331589205"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.150])
 ([10.252.26.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 13:08:38 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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
 <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
Date: Mon, 26 Aug 2019 22:08:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
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

T24gMjAxOS0wOC0yNiAxODo1MSwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4gCj4gCj4g
T24gOC8yNi8xOSAyOjI0IEFNLCBXYXNrbywgTWljaGFsIHdyb3RlOgo+Pgo+PiBPbiA4LzI1LzIw
MTkgMTowNiBQTSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4gT24gMjAxOS0wOC0yNCAxNTo1
MSwgQ2V6YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4+IE9uIDIwMTktMDgtMjMgMjM6MzksIE1hcmsg
QnJvd24gd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDAzOjEyOjE4UE0gLTA1
MDAsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IHdyb3RlOgo+Pj4+Pj4gT24gOC8yMy8xOSAxOjQ0IFBN
LCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Pj4gV2Fzbid0IGx5aW5nIGFib3V0
IEZXIHZlcnNpb24gYmVpbmcgdW5yZWxpYWJsZS4gTGV0J3Mgc2F5IHZlbmRvcgo+Pj4+Pj4+IHJl
Y2VpdmVzIHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4gc3VjaCBlbmcgZHJvcCBtYXkgY2Fy
cnkgCj4+Pj4+Pj4gaW52YWxpZAo+Pj4+Pj4+IG51bWJlcnMgc3VjaCBhcyAwLjAuMC4wLi4KPj4+
Pj4+PiBJbiBnZW5lcmFsLCBJIHRyeSB0byBhdm9pZCByZWx5aW5nIG9uIEZXIHZlcnNpb24gd2hl
bmV2ZXIgCj4+Pj4+Pj4gcG9zc2libGUuIEl0Cj4+Pj4+Pj4gY2FuIGJlIGR1bXBlZCBmb3IgZGVi
dWcgcmVhc29ucywgdHJ1ZSwgYnV0IHRvIGJlIHJlbGllZCBvbj8gTm90IAo+Pj4+Pj4+IHJlYWxs
eS4KPj4+Pj4KPj4+Pj4+IEdvb2RuZXNzLCB0aGF0J3MgcmVhbGx5IGJhZC4gSSBkaWRuJ3QgcmVh
bGl6ZSB0aGlzLgo+Pj4+Pgo+Pj4+PiBBdCBhIHByZXZpb3VzIGVtcGxveWVyIEkgbW9kaWZpZWQg
b3VyIGJ1aWxkIHN0YW1waW5nCj4+Pj4+IGluZnJhc3RydWN0dXJlIHRvIGFsc28gaW5jbHVkZSBi
b3RoIGEgdGltZXN0YW1wIGFuZCBhIHNlcmlhbGl6ZWQKPj4+Pj4gYnVpbGQgbnVtYmVyIGluIHRo
ZSB2ZXJzaW9uIG51bWJlciBzaW5jZSBvbmUgb2YgbXkgY29sbGVhZ3VlcyB3YXMKPj4+Pj4gZm9u
ZCBvZiBzZW5kaW5nIHBlb3BsZSBwcmVyZWxlYXNlcyBvZiB3aGF0IGhlIHdhcyB3b3JraW5nIG9u
IHRvCj4+Pj4+IG90aGVyIHBlb3BsZSB3aXRoIGlkZW50aWNhbCB2ZXJzaW9uIG51bWJlcnMgb24g
ZGlmZmVyZW50Cj4+Pj4+IGJpbmFyaWVzIGxlYWRpbmcgdG8gbXVjaCBjb25mdXNpb24gYW5kIGNo
ZWNrc3VtbWluZy7CoCBZb3UgZG8gc2VlCj4+Pj4+IGEgbG90IG9mIHRoaW5ncyB3aXRoIHRob3Nl
IHNlcmlhbGl6ZWQgdmVyc2lvbiBudW1iZXJzLCBlc3BlY2lhbGx5Cj4+Pj4+IFNWTiBiYXNlZCBw
cm9qZWN0cy4KPj4+Pj4KPj4+Pj4+PiBQZXJzb25hbGx5LCBJJ20gYWdhaW5zdCBhbGwgaGFyZGNv
ZGVzIGFuZCB3b3VsZCBzaW1wbHkgcmVjb21tZW5kIGFsbAo+Pj4+Pj4+IHVzZXIgdG8gcmVkaXJl
Y3QgdGhlaXIgc3ltbGlua3Mgd2hlbiB0aGV5IGRvIHN3aXRjaCBrZXJuZWwgLSAKPj4+Pj4+PiBh
bG9uZyB3aXRoCj4+Pj4+Pj4gZHVtcGluZyB3YXJuaW5nLyBlcnJvciBtZXNzYWdlIGluIGRtZXNn
LiBIYXJkY29kZXMgYnJpbmcgcHJvYmxlbXMgCj4+Pj4+Pj4gd2l0aAo+Pj4+Pj4+IGZvcndhcmQg
Y29tcGF0aWJpbGl0eSBhbmQgdGhhdCdzIHdoeSBob3N0IHNob3VsZCBvZmZsb2FkIHRoZW0gCj4+
Pj4+Pj4gYXdheSB0bwo+Pj4+Pj4+IEZXLgo+Pj4+Pgo+Pj4+Pj4gQ2V6YXJ5LCBJIGtub3cgeW91
IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGFsbCB0aGlzLCBidXQgYXQgdGhpcyAKPj4+Pj4+IHBv
aW50IGlmIHdlCj4+Pj4+PiAoSW50ZWwpIGNhbid0IGd1YXJhbnRlZSBhbnkgc29ydCBvZiBpbnRl
cm9wZXJhYmlsaXR5IHdpdGggYm90aCAKPj4+Pj4+IGZpcm13YXJlIGFuZAo+Pj4+Pj4gdG9wb2xv
Z3kgd2Ugc2hvdWxkIG1ha2UgaXQgY2xlYXIgdGhhdCB0aGlzIGRyaXZlciBpcyBub3QgCj4+Pj4+
PiByZWNvbW1lbmRlZCB1bmxlc3MKPj4+Pj4+IHNwZWNpZmljIHZlcnNpb25zIG9mIHRoZSBmaXJt
d2FyZS90b3BvbG9neSBhcmUgdXNlZCwgYW5kIGFzIGEgCj4+Pj4+PiBjb25zZXF1ZW5jZQo+Pj4+
Pj4gdGhlIHR5cGljYWwgY2xpZW50IGRpc3Ryb3MgYW5kIGRlc2t0b3AvbGFwdG9wIHVzZXJzIHNo
b3VsZCB1c2UgCj4+Pj4+PiBIRGF1ZGlvCj4+Pj4+PiBsZWdhY3kgb3IgU09GIChmb3IgRE1JQ3Mp
Cj4+Pj4+Cj4+Pj4+IE5vdCB0aGUgbW9zdCBlbGVnZW50IHNvbHV0aW9uIGJ1dCBJJ20gd29uZGVy
aW5nIGlmIGtlZXBpbmcgYSBjb3B5Cj4+Pj4+IG9mIHRoZSBkcml2ZXIgYXMgaXMgYXJvdW5kIGFu
ZCB1c2luZyBuZXcgbG9jYXRpb25zIGZvciB0aGUgZml4ZWQKPj4+Pj4gZmlybXdhcmUgbWlnaHQg
YmUgdGhlIHNhZmVzdCB3YXkgdG8gaGFuZGxlIHRoaXMuwqAgV2UgY291bGQgaGF2ZSBhCj4+Pj4+
IHdyYXBwZXIgd2hpY2ggdHJpZXMgdG8gbG9hZCB0aGUgbmV3ZXIgZmlybXdhcmUgYW5kIHVzZXMg
dGhlIGZpeGVkCj4+Pj4+IGRyaXZlciBjb2RlIGlmIHRoYXQncyB0aGVyZSwgb3RoZXJ3aXNlIHRy
aWVzIHRoZSBvbGQgZHJpdmVyIHdpdGgKPj4+Pj4gdGhlIGV4aXN0aW5nIGZpcm13YXJlIHBhdGhz
LsKgIFRoaXMgaXMgb2J2aW91c2x5IGEgaG9ycm9yIHNob3cgYW5kCj4+Pj4+IGxlYXZlcyB0aGUg
b2xkIGNvZGUgc2l0dGluZyB0aGVyZSBidXQgZ2l2ZW4gdGhlIG1pc3Rha2VzIHRoYXQKPj4+Pj4g
aGF2ZSBiZWVuIG1hZGUgdGhlIHdob2xlIHNpdHVhdGlvbiBsb29rcyBsaWtlIGEgaG91c2Ugb2Yg
Y2FyZHMuCj4+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBNYXJrLiBXaGls
ZSBJJ20gbm90IHlldCBvbiB0aGUgIlNPRiB3aWxsIGZpeCAKPj4+PiB0aGlzIiB0cmFpbiwgSSdt
IGtlZW4gdG8gYWdyZWUgdG8gbGVhdmluZyB0aGlzIGVudGlyZWx5IHRvIFNPRiBpZiBpdCAKPj4+
PiBjb21lcyBkb3duIHRvIHVzIGR1cGxpY2F0aW5nIC9za3lsYWtlLgo+Pj4+Cj4+Pj4gSG93ZXZl
ciwgd2UgYXJlIG5vdCBnb2luZyB0byBnaXZlIHVwIHRoYXQgZWFzaWx5LiBJJ2xsIHNlZSBpZiBz
b21lIAo+Pj4+ICJnb2xkZW4gY29uZmlnIiBoYXJkY29kZXMgY2FuJ3QgYmUgcHJvdmlkZWQgaW4g
c29tZSBsZWdhY3kuYyBmaWxlIAo+Pj4+IHdoaWNoIHdvdWxkIGJlIGZldGNoZWQgaWYgaW5pdGlh
bCBzZXR1cCBmYWlscy4gRS5nLjogMmNvcmVzLCAzc3NwcywgCj4+Pj4gMVBBR0VfU0laRSBwZXIg
dHJhY2UgYnVmZmVyLi4gYW5kIHN1Y2guIFRoZXJlIGFyZSBxdWl0ZSBhIGZldyAKPj4+PiBmYWN0
b3JzIHRvIHRha2UgaW50byBjb25zaWRlcmF0aW9uIHRob3VnaC4gSWYgImFza2luZyIgdXNlciB2
aWEgCj4+Pj4gZG1lc2cgdG8gdXBncmFkZSB0aGUgZmlybXdhcmUgaWYgaGlzL2hlciBzZXR1cCBj
b250YWlucyBvYnNvbGV0ZSAKPj4+PiBiaW5hcnkgaXMgcmVhbGx5IG5vdCBhbiBvcHRpb24sIHRo
ZW4gc29tZSBtYWdpYyB3b3JkcyBnb3QgdG8gYmUgCj4+Pj4gaW52b2x2ZWQuCj4+Pj4KPj4+PiBD
emFyZWsKPj4+Cj4+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hhdCBpZiBpbnN0ZWFkIG9mIGR1
cGxpY2F0aW5nIGtlcm5lbCBjb2RlLCAKPj4+IGJpbmFyaWVzIHdvdWxkIGJlIGR1cGxpY2F0ZWQ/
Cj4+PiBJLmUuIHJhdGhlciB0aGFuIHRhcmdldGluZyAvaW50ZWwvZHNwX2Z3X2NubC5iaW4sIF9u
ZXdfIC9za3lsYWtlIAo+Pj4gd291bGQgYmUgZXhwZWN0aW5nIC9pbnRlbC9kc3BfZndfY25sX3Jl
bGVhc2UuYmluPyBTYW1lIHdpdGggdG9wb2xvZ3kgCj4+PiBiaW5hcmllcy4KPj4+IEluIHN1Y2gg
Y2FzZSwgd2UgIm9ubHkiIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gcHJvcGFnYXRlIG5ldyBm
aWxlcyAKPj4+IHRvIExpbnV4IGRpc3RvcyBzbyB3aGVuZXZlciBzb21lb25lIHVwZGF0ZXMgdGhl
aXIga2VybmVsLCBuZXcgCj4+PiBiaW5hcmllcyBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZWly
IC9saWIvZmlybXdhcmUuCj4+Pgo+Pj4gSWYgc3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBw
b3N0cG9uZSAvc2t5bGFrZSB1cGdyYWRlIHRpbGwgNS40IAo+Pj4gbWVyZ2luZyB3aW5kb3cgY2xv
c2VzIGFuZCB0aGUgcGF0Y2hlcyAocm91Z2ggZXN0aW1hdGlvbiBpcyAxNTApIHdvdWxkIAo+Pj4g
ZGVzY2VuZCB1cG9uIGFsc2EtZGV2ZWwgaW4gdGltZSBiZXR3ZWVuIDUuNCBhbmQgNS41Lgo+Pgo+
PiBJZiB0aGUgZHJpdmVyIGFuZCBGVyB1cGRhdGUgd2lsbCBiZSB3aXRoaW4gdGhlIHNhbWUga2Vy
bmVsIHJlbGVhc2UgCj4+IHRoZW4gSU1ITwo+PiB0aGVyZSBzaG91bGQgYmUgbm8gY29tcGF0aWJp
bGl0eSBwcm9ibGVtIGJldHdlZW4gdGhvc2UgdHdvIGNvbXBvbmVudHMsIAo+PiByaWdodD8KPj4g
VGhpcyB3YXkga2VybmVsIHVzZXJzIHdpbGxpbmcgdG8gc3RpY2sgdG8gb2xkIEZXIGNhbiBzdGF5
IG9uIG9sZGVyIAo+PiBrZXJuZWwgdmVyc2lvbiB3aGlsZQo+PiBvdGhlcnMgY2FuIHVwZGF0ZSBh
bmQgcmVjZWl2ZSBhbGwgdGhlIGxhdGVzdCBGVyBmdW5jdGlvbmFsaXR5IHRoYXQgd2FzIAo+PiBk
ZXZlbG9wZWQgYW5kIGVuYWJsZWQuCj4gCj4gSSBhbSBub3QgY29tZm9ydGFibGUgd2l0aCBwcmVj
bHVkaW5nIGEga2VybmVsIHVwZGF0ZSBiZWNhdXNlIG9mIGEgc2luZ2xlIAo+IGZpcm13YXJlIGZp
bGUuIFRoZXJlIGFyZSBhbGwgc29ydCBvZiByZWFzb25zIGZvciB1cGRhdGluZyBhIGtlcm5lbCwg
Cj4gc2VjdXJpdHksIHNpZGViYW5kIGF0dGFja3MgYW5kIEFuZHJvaWQgQ0REIGNvbXBhdGliaWxp
dHkgYmVpbmcgdGhlIG1vc3QgCj4gb2J2aW91cyBvbmVzLgo+IAo+Pgo+PiBJbiB0ZXJtcyBvZiBG
VyB0b3BvbG9neSBjb21wYXRpYmlsaXR5IHRoZXJlIGlzIGFuIG9wdGlvbiB0byByZWFkIGZyb20g
Cj4+IHRvcG9sb2d5IG1hbmlmZXN0Cj4+IGEgRlcgdmVyc2lvbiB0aGF0IGl0IHdhcyBidWlsZCBm
b3IgYW5kIGluwqAgY2FzZSBpZiBpdCBkb2VzIG5vdCBtYXRjaCAKPj4gRlcgdmVyc2lvbiBwcmVz
ZW50IG9uCj4+IHRoZSBwbGF0Zm9ybSB0aGVuIHByaW50IHdhcm5pbmcgdGhhdCB0aGUgRlcgdG9w
b2xvZ3kgYmluYXJ5IHNob3VsZCBiZSAKPj4gcmVidWlsZCBmb3IgY3VycmVudAo+PiBGVyB2ZXJz
aW9uICh4LngueC54KS4KPiAKPiBDYW4geW91IHByb3ZpZGUgYSBwb2ludGVyIG9uIGhvdyB0aGUg
RlcgdmVyc2lvbiBpcyBlbWJlZGRlZCBpbiBhIAo+IC5jb25mLy50cGxnIGZpbGU/IEkgc2VlIGEg
Y291cGxlIHdoZXJlIHRoYXQgaW5mb3JtYXRpb24gZG9lcyBub3Qgc2VlbSAKPiBwcmVzZW50Lgo+
IAo+PiBUaGUgYWJvdmUgYXBwcm9hY2ggYXQgdGhlIGVuZCBtYXkgYmUgbGVzcyBjb25mdXNpbmcg
dGhlbiBzb3VyY2UgY29kZSAKPj4gb3IgYmluYXJ5IGR1cGxpY2F0aW9uLgo+IAoKSW5kZWVkLiBP
dXIgZXhpc3RpbmcgdG9wb2xvZ3kgc2tpcHMgdGhhdCBwYXJ0IG9mIGludGVybmFsIC54bWwgYW5k
IHRodXMgCnN1Y2ggaW5mb3JtYXRpb24gaXMgbm90IHByb3BhZ2F0ZWQgdG8ga2VybmVsLgoKUGll
cnJlLCBob3cgYWJvdXQgdGhlIGJpbmFyeS1kdXBsaWNhdGlvbiAtIGFzIGRlc2NyaWJlZCBhYm92
ZT8gQnR3LCAKdGhhdCdzIG5vdCBhIHNpbmdsZSBmaXJtd2FyZSBmaWxlIF4pXiBXZSB3b3VsZCBp
bW1lZGlhdGVseSB1cGRhdGUgYWxsIG9mIAp0aGVtLCB0b2dldGhlciB3aXRoIHRvcG9sb2dpZXMu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2
ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxt
YW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
