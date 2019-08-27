Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B59EC13
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 17:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFD6165D;
	Tue, 27 Aug 2019 17:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFD6165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566918632;
	bh=pc7YGAvjqnI/Wv7zXuShc4kbI00WgoVcNj+vYSVxjuY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=um7zgguxBjAgiPrV5ZxNd4cZD90E+SIyAwjL4OoxkgQN1fS4RGVlYetNSi7ZsykCw
	 qaIlnsWpQSeslQFo7oVmxmZi1285lFpo2ExgQr/8tSqYCDnkLQgBtQfRiCTqd3nucS
	 HuXnvSDMG9HC3fmYhhvE822AR3Up1NekVyXHNfVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E78BF80274;
	Tue, 27 Aug 2019 17:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6761F80142; Tue, 27 Aug 2019 17:08:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C901DF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 17:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C901DF80142
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 08:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="171225937"
Received: from blavena-mobl.ger.corp.intel.com (HELO [10.252.27.63])
 ([10.252.27.63])
 by orsmga007.jf.intel.com with ESMTP; 27 Aug 2019 08:08:27 -0700
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
 <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
 <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
 <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
 <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
 <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
 <c67909a4-aae4-64f2-6e55-d513030fe085@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <d3474fdb-9479-b6f7-07fb-9f7c2d4ccbe3@intel.com>
Date: Tue, 27 Aug 2019 17:08:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c67909a4-aae4-64f2-6e55-d513030fe085@linux.intel.com>
Content-Language: en-US
Cc: "Wasko, Michal" <michal.wasko@intel.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, "Kaczmarski,
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

T24gMjAxOS0wOC0yNyAxNzowMCwgUGllcnJlLUxvdWlzIEJvc3NhcnQgd3JvdGU6Cgo+Pj4+Pj4+
Pj4gT24gdGhlIHNlY29uZCB0aG91Z2h0IHdoYXQgaWYgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyBr
ZXJuZWwgCj4+Pj4+Pj4+PiBjb2RlLCBiaW5hcmllcyB3b3VsZCBiZSBkdXBsaWNhdGVkPwo+Pj4+
Pj4+Pj4gSS5lLiByYXRoZXIgdGhhbiB0YXJnZXRpbmcgL2ludGVsL2RzcF9md19jbmwuYmluLCBf
bmV3XyAKPj4+Pj4+Pj4+IC9za3lsYWtlIHdvdWxkIGJlIGV4cGVjdGluZyAvaW50ZWwvZHNwX2Z3
X2NubF9yZWxlYXNlLmJpbj8gU2FtZSAKPj4+Pj4+Pj4+IHdpdGggdG9wb2xvZ3kgYmluYXJpZXMu
Cj4+Pj4+Pj4+PiBJbiBzdWNoIGNhc2UsIHdlICJvbmx5IiBuZWVkIHRvIGZpZ3VyZSBvdXQgaG93
IHRvIHByb3BhZ2F0ZSBuZXcgCj4+Pj4+Pj4+PiBmaWxlcyB0byBMaW51eCBkaXN0b3Mgc28gd2hl
bmV2ZXIgc29tZW9uZSB1cGRhdGVzIHRoZWlyIGtlcm5lbCwgCj4+Pj4+Pj4+PiBuZXcgYmluYXJp
ZXMgYXJlIGFscmVhZHkgcHJlc2VudCBpbiB0aGVpciAvbGliL2Zpcm13YXJlLgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IElmIHN1Y2ggb3B0aW9uIGlzIHZhbGlkLCB3ZSBjYW4gcG9zdHBvbmUgL3NreWxh
a2UgdXBncmFkZSB0aWxsIAo+Pj4+Pj4+Pj4gNS40IG1lcmdpbmcgd2luZG93IGNsb3NlcyBhbmQg
dGhlIHBhdGNoZXMgKHJvdWdoIGVzdGltYXRpb24gaXMgCj4+Pj4+Pj4+PiAxNTApIHdvdWxkIGRl
c2NlbmQgdXBvbiBhbHNhLWRldmVsIGluIHRpbWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gSWYgdGhlIGRyaXZlciBhbmQgRlcgdXBkYXRlIHdpbGwgYmUgd2l0aGluIHRo
ZSBzYW1lIGtlcm5lbCAKPj4+Pj4+Pj4gcmVsZWFzZSB0aGVuIElNSE8KPj4+Pj4+Pj4gdGhlcmUg
c2hvdWxkIGJlIG5vIGNvbXBhdGliaWxpdHkgcHJvYmxlbSBiZXR3ZWVuIHRob3NlIHR3byAKPj4+
Pj4+Pj4gY29tcG9uZW50cywgcmlnaHQ/Cj4+Pj4+Pj4+IFRoaXMgd2F5IGtlcm5lbCB1c2VycyB3
aWxsaW5nIHRvIHN0aWNrIHRvIG9sZCBGVyBjYW4gc3RheSBvbiAKPj4+Pj4+Pj4gb2xkZXIga2Vy
bmVsIHZlcnNpb24gd2hpbGUKPj4+Pj4+Pj4gb3RoZXJzIGNhbiB1cGRhdGUgYW5kIHJlY2VpdmUg
YWxsIHRoZSBsYXRlc3QgRlcgZnVuY3Rpb25hbGl0eSAKPj4+Pj4+Pj4gdGhhdCB3YXMgZGV2ZWxv
cGVkIGFuZCBlbmFibGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBhbSBub3QgY29tZm9ydGFibGUgd2l0
aCBwcmVjbHVkaW5nIGEga2VybmVsIHVwZGF0ZSBiZWNhdXNlIG9mIGEgCj4+Pj4+Pj4gc2luZ2xl
IGZpcm13YXJlIGZpbGUuIFRoZXJlIGFyZSBhbGwgc29ydCBvZiByZWFzb25zIGZvciB1cGRhdGlu
ZyAKPj4+Pj4+PiBhIGtlcm5lbCwgc2VjdXJpdHksIHNpZGViYW5kIGF0dGFja3MgYW5kIEFuZHJv
aWQgQ0REIAo+Pj4+Pj4+IGNvbXBhdGliaWxpdHkgYmVpbmcgdGhlIG1vc3Qgb2J2aW91cyBvbmVz
Lgo+Pj4+Pj4+Cj4+Pj4gVGhlIHNpbmdsZSBmaXJtd2FyZSBmaWxlIHdpbGwgbm90IGJlIGEgYmxv
Y2tlciBhcyB0aGUgZHJpdmVyIAo+Pj4+IGluY2x1ZGVkIGluIHVwZGF0ZWQga2VybmVsIHdpbGwg
c3VwcG9ydCBpdC4KPj4+PiBBbGwgeW91IGhhdmUgdG8gZG8gaXMgdGhlIGxpdHRsZSBlZmZvcnQg
dG8gcmUtZ2VuZXJhdGUgeW91ciBjdXN0b20gCj4+Pj4gdG9wb2xvZ3kgZm9yIHRoZSBuZXcgZmly
bXdhcmUgdGFyZ2V0Lgo+Pj4+IFRoZSBlbnRpcmUgb3BlcmF0aW9uIHNob3VsZCBub3QgYmUgYSBw
cm9ibGVtIGFzIHRoZXJlIGFyZSBkZWRpY2F0ZWQgCj4+Pj4gdXRpbGl0aWVzIGxpa2UgRkRLIHRv
IGRvIHRoYXQuCj4+Pgo+Pj4gVGhlIGlzc3VlIGlzIHRoZSBzYW1lIHdoZXRoZXIgaXQncyBhIHRv
cG9sb2d5IGZpbGUgb3IgYSBmaXJtd2FyZSAKPj4+IGZpbGUuIFRoZSBpZGVhbCBzaXR1YXRpb24g
aXMgdGhhdCB3aGVuIHRoZSBrZXJuZWwgaXMgdXBkYXRlZCBpdCAKPj4+IGhhbmRsZXMgYm90aCBp
biBiYWNrd2FyZHMgY29tcGF0aWJsZSB3YXlzLgo+Pj4KPj4+IElmIHRvIGRlYWwgd2l0aCBhIG5l
dyBmaXJtd2FyZSBmaWxlIHlvdSBoYXZlIHRvIHJlZ2VuZXJhdGUgYSBuZXcgCj4+PiB0b3BvbG9n
eSwgeW91IGFyZSBpbiBhIGRpZmZlcmVudCBtb2RlbCBhbHRvZ2V0aGVyLgo+Pj4KPj4+PiBZb3Vy
IHN0YXRlbWVudCBQaWVycmUgc3VnZ2VzdCB0aGF0IGV2ZXJ5b25lIHNob3VsZCBhdm9pZCBhbnkg
Cj4+Pj4gZnVuY3Rpb25hbCBjaGFuZ2VzIGluIGtlcm5lbAo+Pj4+IHRoYXQgYXJlIG5vdCBjcml0
aWNhbCBiZWNhdXNlIHRoYXQgd291bGQgYmUgcHJvYmxlbWF0aWMgZm9yIG90aGVycyAKPj4+PiB3
aG8gc3dpdGNoIGZyb20gb2xkZXIga2VybmVsIHZlcnNpb24uCj4+PiDCoMKgQWxsIEkgc2FpZCB3
YXMgdGhhdCB5b3UgY2Fubm90IGFzc3VtZSB0aGF0IHBlb3BsZSB3aG8gYXJlIHVzaW5nIGFuIAo+
Pj4gb2xkIGZpcm13YXJlL2RyaXZlciB3aWxsIHJlbWFpbiBvbiBhbiBvbGQga2VybmVsLgo+Pj4K
Pj4+IE1hcmsgbWFkZSBhbiBpbml0aWFsIHByb3Bvc2FsIHRvIGVzc2VudGlhbGx5IGZyZWV6ZSB0
aGUgY3VycmVudCAKPj4+IHNvbHV0aW9uLCB3aGljaCB3b3VsZCBtYWtlIGl0IHBvc3NpYmxlIHRv
IHVwZGF0ZSB0aGUga2VybmVsIGJ1dCBrZWVwIAo+Pj4gdGhlIHNhbWUgc2t5bGFrZSBkcml2ZXIg
aW4gbGVnYWN5L21haW50ZW5hbmNlIG1vZGUgb25seSwgYW5kIGFuICduZXcnIAo+Pj4gb3B0aW9u
IHRoYXQgd291bGQgcmVseSBvbiBhbiB1cGRhdGVkIGRpc3RyaWJ1dGlvbiBvZiBmaXJtd2FyZS9k
cml2ZXIuIAo+Pj4gSSBkaWQgbm90IGdldCB0aGUgY291bnRlciBwcm9wb3NhbCBmcm9tIENlemFy
eSBhdCBhbGwuCj4+Cj4+IEFpbid0IG15IHByZXZpb3VzIG1lc3NhZ2U6Cj4+Cj4+IC0KPj4KPj4g
T24gdGhlIHNlY29uZCB0aG91Z2h0IHdoYXQgaWYgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyBrZXJu
ZWwgY29kZSwgCj4+IGJpbmFyaWVzIHdvdWxkIGJlIGR1cGxpY2F0ZWQ/Cj4+IEkuZS4gcmF0aGVy
IHRoYW4gdGFyZ2V0aW5nIC9pbnRlbC9kc3BfZndfY25sLmJpbiwgX25ld18gL3NreWxha2Ugd291
bGQgCj4+IGJlIGV4cGVjdGluZyAvaW50ZWwvZHNwX2Z3X2NubF9yZWxlYXNlLmJpbj8gU2FtZSB3
aXRoIHRvcG9sb2d5IGJpbmFyaWVzLgo+PiBJbiBzdWNoIGNhc2UsIHdlICJvbmx5IiBuZWVkIHRv
IGZpZ3VyZSBvdXQgaG93IHRvIHByb3BhZ2F0ZSBuZXcgZmlsZXMgCj4+IHRvIExpbnV4IGRpc3Rv
cyBzbyB3aGVuZXZlciBzb21lb25lIHVwZGF0ZXMgdGhlaXIga2VybmVsLCBuZXcgYmluYXJpZXMg
Cj4+IGFyZSBhbHJlYWR5IHByZXNlbnQgaW4gdGhlaXIgL2xpYi9maXJtd2FyZS4KPj4KPj4gSWYg
c3VjaCBvcHRpb24gaXMgdmFsaWQsIHdlIGNhbiBwb3N0cG9uZSAvc2t5bGFrZSB1cGdyYWRlIHRp
bGwgNS40IAo+PiBtZXJnaW5nIHdpbmRvdyBjbG9zZXMgYW5kIHRoZSBwYXRjaGVzIChyb3VnaCBl
c3RpbWF0aW9uIGlzIDE1MCkgd291bGQgCj4+IGRlc2NlbmQgdXBvbiBhbHNhLWRldmVsIGluIHRp
bWUgYmV0d2VlbiA1LjQgYW5kIDUuNS4KPj4KPj4gLQo+Pgo+PiBhIGNvdW50ZXIgcHJvcG9zYWw/
Cj4gCj4geW91IGRpZG4ndCBleHBsYWluIGhvdyB0aGUgJ2R1cGxpY2F0ZWQgYmluYXJpZXMnIHdv
dWxkIGJlIHNlbGVjdGVkLiBBbmQgCj4gJ2luc3RlYWQgb2YnIG1lYW5zIHlvdSBzdWdnZXN0ZWQg
YW4gYWx0ZXJuYXRpdmUgdG8gTWFyaydzIHByb3Bvc2FsLgoKV2hhdCBJIGhhdmUgaW4gbWluZDoK
CldlIGxlYXZlIHRoZSBvbGQgc3R1ZmYgYXMgaXMsIGUuZzoKL2xpYi9maXJtd2FyZS9pbnRlbC9k
c3BfZndfY25sLmJpbiAtPiBwb2ludHMgdG8gX29sZF8gRlcgYmluYXJpZXMKL2xpYi9maXJtd2Fy
ZS88UENJLUlEPi1JTlRFTC08b2VtX2RhdGFfZnJvbV9OSExUIC0+IHBvaW50cyB0byBvbGQgdG9w
b2xvZ3kKCkV4aXN0aW5nIC9za3lsYWtlIGkuZS4gYmVmb3JlIG91ciBpbml0aWFsaXphdGlvbiBy
ZWZhY3RvciB3b3VsZCAoa2VybmVscyAKPDUuNT8pIHdvdWxkIHN0aWxsIHBvaW50IHRvIHRoZXNl
IGFuZCBzaW5jZSB0aGV5IGFyZSBub3QgYmVpbmcgcmVtb3ZlZCAKZnJvbSBsaW51eC1maXJtd2Fy
ZSwgbm90aGluZyBnZXRzIGJyb2tlbi4KCgpBbmQgdGhlbiB3ZSAiZHVwbGljYXRlIiBhbmQgc2lt
cGx5IGFwcGVuZCB0aGUgbmV3IG9uZXM6Ci9saWIvZmlybXdhcmUvaW50ZWwvZHNwX2Z3X2NubF9y
ZWxlYXNlLmJpbiAtPiBwb2ludHMgdG8gX25ld18gRlcKL2xpYi9maXJtd2FyZS9kZndfY25sX3J0
Mjc0IC0+IHBvaW50cyB0byBfbmV3XyB0b3BvbG9neQoKVXBkYXRlZCAvc2t5bGFrZSB3b3VsZCBz
aW1wbHkgZXhwZWN0IHRoZSBfbmV3XyBmaWxlcyBhbmQgdG90YWxseSBpZ25vcmUgCnRoZSBvbGQg
b25lcyBpLmUuOiBkZXNjcmlwdG9ycyB3b3VsZCBiZSBwb2ludGluZyB0byBkc3BfZndfY25sX3Jl
bGVhc2UgCmFuZCBkZndfY25sX3J0Mjc0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
