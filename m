Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7469D8FB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 00:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B7F15E4;
	Tue, 27 Aug 2019 00:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B7F15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566857991;
	bh=0LNyOyTD+Xd/OJSm/hKF/D4fh5p7Eg9r6QC1YkTh2lY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PDT9zH2r8CSWA14rEcnnBCDzEEadNelwDcC98q4VPj3/2OsCiMwagnU54lxv3kT1k
	 bjBbgODIMlIbMJyqHd6E55Pt6epd7Unp7onhJLJ+5UDPesBeBRRr73FQ1XxpqlbRNz
	 xChlNPEfXw/BG9mYpLgv85TNTXmOFm8buRFw9uRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BF1F8038F;
	Tue, 27 Aug 2019 00:18:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A25BBF80362; Tue, 27 Aug 2019 00:07:44 +0200 (CEST)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C74FBF8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 23:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C74FBF8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 14:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="187724758"
Received: from tyajima-mobl.gar.corp.intel.com (HELO [10.251.21.153])
 ([10.251.21.153])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 14:57:24 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>,
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
 <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
Date: Mon, 26 Aug 2019 16:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
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

CgpPbiA4LzI2LzE5IDM6MDggUE0sIENlemFyeSBSb2pld3NraSB3cm90ZToKPiBPbiAyMDE5LTA4
LTI2IDE4OjUxLCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPj4KPj4KPj4gT24gOC8yNi8x
OSAyOjI0IEFNLCBXYXNrbywgTWljaGFsIHdyb3RlOgo+Pj4KPj4+IE9uIDgvMjUvMjAxOSAxOjA2
IFBNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4gT24gMjAxOS0wOC0yNCAxNTo1MSwgQ2V6
YXJ5IFJvamV3c2tpIHdyb3RlOgo+Pj4+PiBPbiAyMDE5LTA4LTIzIDIzOjM5LCBNYXJrIEJyb3du
IHdyb3RlOgo+Pj4+Pj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTI6MThQTSAtMDUwMCwg
UGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cj4+Pj4+Pj4gT24gOC8yMy8xOSAxOjQ0IFBNLCBD
ZXphcnkgUm9qZXdza2kgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4+PiBXYXNuJ3QgbHlpbmcgYWJvdXQg
RlcgdmVyc2lvbiBiZWluZyB1bnJlbGlhYmxlLiBMZXQncyBzYXkgdmVuZG9yCj4+Pj4+Pj4+IHJl
Y2VpdmVzIHF1aWNrIEZXIGRyb3Agd2l0aCBuZXcgUkNSLi4gc3VjaCBlbmcgZHJvcCBtYXkgY2Fy
cnkgCj4+Pj4+Pj4+IGludmFsaWQKPj4+Pj4+Pj4gbnVtYmVycyBzdWNoIGFzIDAuMC4wLjAuLgo+
Pj4+Pj4+PiBJbiBnZW5lcmFsLCBJIHRyeSB0byBhdm9pZCByZWx5aW5nIG9uIEZXIHZlcnNpb24g
d2hlbmV2ZXIgCj4+Pj4+Pj4+IHBvc3NpYmxlLiBJdAo+Pj4+Pj4+PiBjYW4gYmUgZHVtcGVkIGZv
ciBkZWJ1ZyByZWFzb25zLCB0cnVlLCBidXQgdG8gYmUgcmVsaWVkIG9uPyBOb3QgCj4+Pj4+Pj4+
IHJlYWxseS4KPj4+Pj4+Cj4+Pj4+Pj4gR29vZG5lc3MsIHRoYXQncyByZWFsbHkgYmFkLiBJIGRp
ZG4ndCByZWFsaXplIHRoaXMuCj4+Pj4+Pgo+Pj4+Pj4gQXQgYSBwcmV2aW91cyBlbXBsb3llciBJ
IG1vZGlmaWVkIG91ciBidWlsZCBzdGFtcGluZwo+Pj4+Pj4gaW5mcmFzdHJ1Y3R1cmUgdG8gYWxz
byBpbmNsdWRlIGJvdGggYSB0aW1lc3RhbXAgYW5kIGEgc2VyaWFsaXplZAo+Pj4+Pj4gYnVpbGQg
bnVtYmVyIGluIHRoZSB2ZXJzaW9uIG51bWJlciBzaW5jZSBvbmUgb2YgbXkgY29sbGVhZ3VlcyB3
YXMKPj4+Pj4+IGZvbmQgb2Ygc2VuZGluZyBwZW9wbGUgcHJlcmVsZWFzZXMgb2Ygd2hhdCBoZSB3
YXMgd29ya2luZyBvbiB0bwo+Pj4+Pj4gb3RoZXIgcGVvcGxlIHdpdGggaWRlbnRpY2FsIHZlcnNp
b24gbnVtYmVycyBvbiBkaWZmZXJlbnQKPj4+Pj4+IGJpbmFyaWVzIGxlYWRpbmcgdG8gbXVjaCBj
b25mdXNpb24gYW5kIGNoZWNrc3VtbWluZy7CoCBZb3UgZG8gc2VlCj4+Pj4+PiBhIGxvdCBvZiB0
aGluZ3Mgd2l0aCB0aG9zZSBzZXJpYWxpemVkIHZlcnNpb24gbnVtYmVycywgZXNwZWNpYWxseQo+
Pj4+Pj4gU1ZOIGJhc2VkIHByb2plY3RzLgo+Pj4+Pj4KPj4+Pj4+Pj4gUGVyc29uYWxseSwgSSdt
IGFnYWluc3QgYWxsIGhhcmRjb2RlcyBhbmQgd291bGQgc2ltcGx5IHJlY29tbWVuZCAKPj4+Pj4+
Pj4gYWxsCj4+Pj4+Pj4+IHVzZXIgdG8gcmVkaXJlY3QgdGhlaXIgc3ltbGlua3Mgd2hlbiB0aGV5
IGRvIHN3aXRjaCBrZXJuZWwgLSAKPj4+Pj4+Pj4gYWxvbmcgd2l0aAo+Pj4+Pj4+PiBkdW1waW5n
IHdhcm5pbmcvIGVycm9yIG1lc3NhZ2UgaW4gZG1lc2cuIEhhcmRjb2RlcyBicmluZyAKPj4+Pj4+
Pj4gcHJvYmxlbXMgd2l0aAo+Pj4+Pj4+PiBmb3J3YXJkIGNvbXBhdGliaWxpdHkgYW5kIHRoYXQn
cyB3aHkgaG9zdCBzaG91bGQgb2ZmbG9hZCB0aGVtIAo+Pj4+Pj4+PiBhd2F5IHRvCj4+Pj4+Pj4+
IEZXLgo+Pj4+Pj4KPj4+Pj4+PiBDZXphcnksIEkga25vdyB5b3UgYXJlIG5vdCByZXNwb25zaWJs
ZSBmb3IgYWxsIHRoaXMsIGJ1dCBhdCB0aGlzIAo+Pj4+Pj4+IHBvaW50IGlmIHdlCj4+Pj4+Pj4g
KEludGVsKSBjYW4ndCBndWFyYW50ZWUgYW55IHNvcnQgb2YgaW50ZXJvcGVyYWJpbGl0eSB3aXRo
IGJvdGggCj4+Pj4+Pj4gZmlybXdhcmUgYW5kCj4+Pj4+Pj4gdG9wb2xvZ3kgd2Ugc2hvdWxkIG1h
a2UgaXQgY2xlYXIgdGhhdCB0aGlzIGRyaXZlciBpcyBub3QgCj4+Pj4+Pj4gcmVjb21tZW5kZWQg
dW5sZXNzCj4+Pj4+Pj4gc3BlY2lmaWMgdmVyc2lvbnMgb2YgdGhlIGZpcm13YXJlL3RvcG9sb2d5
IGFyZSB1c2VkLCBhbmQgYXMgYSAKPj4+Pj4+PiBjb25zZXF1ZW5jZQo+Pj4+Pj4+IHRoZSB0eXBp
Y2FsIGNsaWVudCBkaXN0cm9zIGFuZCBkZXNrdG9wL2xhcHRvcCB1c2VycyBzaG91bGQgdXNlIAo+
Pj4+Pj4+IEhEYXVkaW8KPj4+Pj4+PiBsZWdhY3kgb3IgU09GIChmb3IgRE1JQ3MpCj4+Pj4+Pgo+
Pj4+Pj4gTm90IHRoZSBtb3N0IGVsZWdlbnQgc29sdXRpb24gYnV0IEknbSB3b25kZXJpbmcgaWYg
a2VlcGluZyBhIGNvcHkKPj4+Pj4+IG9mIHRoZSBkcml2ZXIgYXMgaXMgYXJvdW5kIGFuZCB1c2lu
ZyBuZXcgbG9jYXRpb25zIGZvciB0aGUgZml4ZWQKPj4+Pj4+IGZpcm13YXJlIG1pZ2h0IGJlIHRo
ZSBzYWZlc3Qgd2F5IHRvIGhhbmRsZSB0aGlzLsKgIFdlIGNvdWxkIGhhdmUgYQo+Pj4+Pj4gd3Jh
cHBlciB3aGljaCB0cmllcyB0byBsb2FkIHRoZSBuZXdlciBmaXJtd2FyZSBhbmQgdXNlcyB0aGUg
Zml4ZWQKPj4+Pj4+IGRyaXZlciBjb2RlIGlmIHRoYXQncyB0aGVyZSwgb3RoZXJ3aXNlIHRyaWVz
IHRoZSBvbGQgZHJpdmVyIHdpdGgKPj4+Pj4+IHRoZSBleGlzdGluZyBmaXJtd2FyZSBwYXRocy7C
oCBUaGlzIGlzIG9idmlvdXNseSBhIGhvcnJvciBzaG93IGFuZAo+Pj4+Pj4gbGVhdmVzIHRoZSBv
bGQgY29kZSBzaXR0aW5nIHRoZXJlIGJ1dCBnaXZlbiB0aGUgbWlzdGFrZXMgdGhhdAo+Pj4+Pj4g
aGF2ZSBiZWVuIG1hZGUgdGhlIHdob2xlIHNpdHVhdGlvbiBsb29rcyBsaWtlIGEgaG91c2Ugb2Yg
Y2FyZHMuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBNYXJrLiBX
aGlsZSBJJ20gbm90IHlldCBvbiB0aGUgIlNPRiB3aWxsIAo+Pj4+PiBmaXggdGhpcyIgdHJhaW4s
IEknbSBrZWVuIHRvIGFncmVlIHRvIGxlYXZpbmcgdGhpcyBlbnRpcmVseSB0byBTT0YgCj4+Pj4+
IGlmIGl0IGNvbWVzIGRvd24gdG8gdXMgZHVwbGljYXRpbmcgL3NreWxha2UuCj4+Pj4+Cj4+Pj4+
IEhvd2V2ZXIsIHdlIGFyZSBub3QgZ29pbmcgdG8gZ2l2ZSB1cCB0aGF0IGVhc2lseS4gSSdsbCBz
ZWUgaWYgc29tZSAKPj4+Pj4gImdvbGRlbiBjb25maWciIGhhcmRjb2RlcyBjYW4ndCBiZSBwcm92
aWRlZCBpbiBzb21lIGxlZ2FjeS5jIGZpbGUgCj4+Pj4+IHdoaWNoIHdvdWxkIGJlIGZldGNoZWQg
aWYgaW5pdGlhbCBzZXR1cCBmYWlscy4gRS5nLjogMmNvcmVzLCAzc3NwcywgCj4+Pj4+IDFQQUdF
X1NJWkUgcGVyIHRyYWNlIGJ1ZmZlci4uIGFuZCBzdWNoLiBUaGVyZSBhcmUgcXVpdGUgYSBmZXcg
Cj4+Pj4+IGZhY3RvcnMgdG8gdGFrZSBpbnRvIGNvbnNpZGVyYXRpb24gdGhvdWdoLiBJZiAiYXNr
aW5nIiB1c2VyIHZpYSAKPj4+Pj4gZG1lc2cgdG8gdXBncmFkZSB0aGUgZmlybXdhcmUgaWYgaGlz
L2hlciBzZXR1cCBjb250YWlucyBvYnNvbGV0ZSAKPj4+Pj4gYmluYXJ5IGlzIHJlYWxseSBub3Qg
YW4gb3B0aW9uLCB0aGVuIHNvbWUgbWFnaWMgd29yZHMgZ290IHRvIGJlIAo+Pj4+PiBpbnZvbHZl
ZC4KPj4+Pj4KPj4+Pj4gQ3phcmVrCj4+Pj4KPj4+PiBPbiB0aGUgc2Vjb25kIHRob3VnaHQgd2hh
dCBpZiBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGtlcm5lbCBjb2RlLCAKPj4+PiBiaW5hcmllcyB3
b3VsZCBiZSBkdXBsaWNhdGVkPwo+Pj4+IEkuZS4gcmF0aGVyIHRoYW4gdGFyZ2V0aW5nIC9pbnRl
bC9kc3BfZndfY25sLmJpbiwgX25ld18gL3NreWxha2UgCj4+Pj4gd291bGQgYmUgZXhwZWN0aW5n
IC9pbnRlbC9kc3BfZndfY25sX3JlbGVhc2UuYmluPyBTYW1lIHdpdGggdG9wb2xvZ3kgCj4+Pj4g
YmluYXJpZXMuCj4+Pj4gSW4gc3VjaCBjYXNlLCB3ZSAib25seSIgbmVlZCB0byBmaWd1cmUgb3V0
IGhvdyB0byBwcm9wYWdhdGUgbmV3IAo+Pj4+IGZpbGVzIHRvIExpbnV4IGRpc3RvcyBzbyB3aGVu
ZXZlciBzb21lb25lIHVwZGF0ZXMgdGhlaXIga2VybmVsLCBuZXcgCj4+Pj4gYmluYXJpZXMgYXJl
IGFscmVhZHkgcHJlc2VudCBpbiB0aGVpciAvbGliL2Zpcm13YXJlLgo+Pj4+Cj4+Pj4gSWYgc3Vj
aCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFrZSB1cGdyYWRlIHRpbGwg
NS40IAo+Pj4+IG1lcmdpbmcgd2luZG93IGNsb3NlcyBhbmQgdGhlIHBhdGNoZXMgKHJvdWdoIGVz
dGltYXRpb24gaXMgMTUwKSAKPj4+PiB3b3VsZCBkZXNjZW5kIHVwb24gYWxzYS1kZXZlbCBpbiB0
aW1lIGJldHdlZW4gNS40IGFuZCA1LjUuCj4+Pgo+Pj4gSWYgdGhlIGRyaXZlciBhbmQgRlcgdXBk
YXRlIHdpbGwgYmUgd2l0aGluIHRoZSBzYW1lIGtlcm5lbCByZWxlYXNlIAo+Pj4gdGhlbiBJTUhP
Cj4+PiB0aGVyZSBzaG91bGQgYmUgbm8gY29tcGF0aWJpbGl0eSBwcm9ibGVtIGJldHdlZW4gdGhv
c2UgdHdvIAo+Pj4gY29tcG9uZW50cywgcmlnaHQ/Cj4+PiBUaGlzIHdheSBrZXJuZWwgdXNlcnMg
d2lsbGluZyB0byBzdGljayB0byBvbGQgRlcgY2FuIHN0YXkgb24gb2xkZXIgCj4+PiBrZXJuZWwg
dmVyc2lvbiB3aGlsZQo+Pj4gb3RoZXJzIGNhbiB1cGRhdGUgYW5kIHJlY2VpdmUgYWxsIHRoZSBs
YXRlc3QgRlcgZnVuY3Rpb25hbGl0eSB0aGF0IAo+Pj4gd2FzIGRldmVsb3BlZCBhbmQgZW5hYmxl
ZC4KPj4KPj4gSSBhbSBub3QgY29tZm9ydGFibGUgd2l0aCBwcmVjbHVkaW5nIGEga2VybmVsIHVw
ZGF0ZSBiZWNhdXNlIG9mIGEgCj4+IHNpbmdsZSBmaXJtd2FyZSBmaWxlLiBUaGVyZSBhcmUgYWxs
IHNvcnQgb2YgcmVhc29ucyBmb3IgdXBkYXRpbmcgYSAKPj4ga2VybmVsLCBzZWN1cml0eSwgc2lk
ZWJhbmQgYXR0YWNrcyBhbmQgQW5kcm9pZCBDREQgY29tcGF0aWJpbGl0eSBiZWluZyAKPj4gdGhl
IG1vc3Qgb2J2aW91cyBvbmVzLgo+Pgo+Pj4KPj4+IEluIHRlcm1zIG9mIEZXIHRvcG9sb2d5IGNv
bXBhdGliaWxpdHkgdGhlcmUgaXMgYW4gb3B0aW9uIHRvIHJlYWQgZnJvbSAKPj4+IHRvcG9sb2d5
IG1hbmlmZXN0Cj4+PiBhIEZXIHZlcnNpb24gdGhhdCBpdCB3YXMgYnVpbGQgZm9yIGFuZCBpbsKg
IGNhc2UgaWYgaXQgZG9lcyBub3QgbWF0Y2ggCj4+PiBGVyB2ZXJzaW9uIHByZXNlbnQgb24KPj4+
IHRoZSBwbGF0Zm9ybSB0aGVuIHByaW50IHdhcm5pbmcgdGhhdCB0aGUgRlcgdG9wb2xvZ3kgYmlu
YXJ5IHNob3VsZCBiZSAKPj4+IHJlYnVpbGQgZm9yIGN1cnJlbnQKPj4+IEZXIHZlcnNpb24gKHgu
eC54LngpLgo+Pgo+PiBDYW4geW91IHByb3ZpZGUgYSBwb2ludGVyIG9uIGhvdyB0aGUgRlcgdmVy
c2lvbiBpcyBlbWJlZGRlZCBpbiBhIAo+PiAuY29uZi8udHBsZyBmaWxlPyBJIHNlZSBhIGNvdXBs
ZSB3aGVyZSB0aGF0IGluZm9ybWF0aW9uIGRvZXMgbm90IHNlZW0gCj4+IHByZXNlbnQuCj4+Cj4+
PiBUaGUgYWJvdmUgYXBwcm9hY2ggYXQgdGhlIGVuZCBtYXkgYmUgbGVzcyBjb25mdXNpbmcgdGhl
biBzb3VyY2UgY29kZSAKPj4+IG9yIGJpbmFyeSBkdXBsaWNhdGlvbi4KPj4KPiAKPiBJbmRlZWQu
IE91ciBleGlzdGluZyB0b3BvbG9neSBza2lwcyB0aGF0IHBhcnQgb2YgaW50ZXJuYWwgLnhtbCBh
bmQgdGh1cyAKPiBzdWNoIGluZm9ybWF0aW9uIGlzIG5vdCBwcm9wYWdhdGVkIHRvIGtlcm5lbC4K
PiAKPiBQaWVycmUsIGhvdyBhYm91dCB0aGUgYmluYXJ5LWR1cGxpY2F0aW9uIC0gYXMgZGVzY3Jp
YmVkIGFib3ZlPyBCdHcsIAo+IHRoYXQncyBub3QgYSBzaW5nbGUgZmlybXdhcmUgZmlsZSBeKV4g
V2Ugd291bGQgaW1tZWRpYXRlbHkgdXBkYXRlIGFsbCBvZiAKPiB0aGVtLCB0b2dldGhlciB3aXRo
IHRvcG9sb2dpZXMuCgpJIGRpZG4ndCB1bmRlcnN0YW5kIGhvdyB5b3Ugd291bGQgc2VsZWN0IHRo
ZSBuZXcgZmlybXdhcmVzPyBTb21lIGNvZGUgCmNoYW5nZSBuZWVkcyB0byBoYXBwZW4gYXMgd2Vs
bD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
