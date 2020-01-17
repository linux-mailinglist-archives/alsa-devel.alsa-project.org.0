Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE8140751
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 11:06:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F73417CF;
	Fri, 17 Jan 2020 11:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F73417CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579255580;
	bh=5RJHsYuqWSzfK7V7qZfX6KavjCLXiyrhtkoOGRQsteo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hd2ac2PX9PLBhUNBTh0vjYRYYjDAL1BNBMCKjchGzkkrtNdOIxkeHFFM6IHEfsHmZ
	 PDb1xkupFlFyrwzTxXwe0pxcTo17ZcWLmmI8Sdfg7q3er1trhGgOU5QWpoNwm5Agec
	 lRTYybBFJGsogiud+TuFiFJDdCZa/MZmtZy00kqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6F9F800E9;
	Fri, 17 Jan 2020 11:04:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67429F801EB; Fri, 17 Jan 2020 11:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D35FF800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 11:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D35FF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 02:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; d="scan'208";a="214426950"
Received: from unknown (HELO [10.239.159.75]) ([10.239.159.75])
 by orsmga007.jf.intel.com with ESMTP; 17 Jan 2020 02:04:20 -0800
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
 <s5h5zhbp27i.wl-tiwai@suse.de>
 <a1b549b7-a902-b2ee-e2e4-53f73893def3@linux.intel.com>
 <s5h1rrypla9.wl-tiwai@suse.de>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <d6cee7a3-bbd4-0706-fcc2-96b403f6c58e@linux.intel.com>
Date: Fri, 17 Jan 2020 18:13:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5h1rrypla9.wl-tiwai@suse.de>
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

CgpPbiAyMDIwLzEvMTcg5LiL5Y2IMzo1NywgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIEZyaSwg
MTcgSmFuIDIwMjAgMDY6MzA6MTggKzAxMDAsCj4gS2V5b24gSmllIHdyb3RlOgo+Pgo+PiBPbiAy
MDIwLzEvMTcg5LiK5Y2INDozNywgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pgo+PiBIaSBUYWthc2hp
LCBJIGdldCB5b3VyIGNvbmNlcm4gaGVyZSwgYnV0IGlmIHdlIHN3aXRjaCB0byB1c2UgZG1hX21h
eAo+PiBsaW1pdCwgd2Ugd29uJ3QgY2hhbmdlIHRoZSBwcmVhbGxvY2F0ZWQgYnVmZmVyLCBpdCB3
aWxsIGJlIHN0aWxsIDY0S0IKPj4gZm9yIGVhY2ggc3RyZWFtLCB1c2VyIHNwYWNlIGNhbiBhc2sg
Zm9yIHJlLWFsbG9jYXRlIGJ1ZmZlciBmb3IgZWFjaAo+PiBzdHJlYW0gdXAgdG8gMzJNQiwgYnV0
IHRob3NlIHBpbm5lZCBhbmQgY2FuJ3QgYmUgc3dhcHBlZCBvdXQgb25lcyBhcmUKPj4gdGhlIDY0
S0IgcHJlYWxsb2NhdGVkIG9uZXMgb25seSwgYW0gSSB3cm9uZz8KPiAKPiBObywgaW4gZ2VuZXJh
bCwgYWxsIHNvdW5kIGhhcmR3YXJlIGJ1ZmZlcnMgYXJlIHBpbm5lZC4KClNvcnJ5LCBJIG11c3Qg
aGF2ZSBiZWVuIHdyb25nIGhlcmUsIHdoYXQgSSB3YXMgZm9jdXNpbmcgb24gaXMgdGhvc2UgCmFs
bG9jYXRlZCBTRyBETUEgYnVmZmVycywgSSBhbSBub3Qgc3VyZSBpZiB0aGV5IGFyZSB0aG9zZSB5
b3UgY2FsbGVkIAoiaGFyZHdhcmUgYnVmZmVycyIgaGVyZS4KCk15IHVuZGVyc3RhbmRpbmcgd2Fz
IGxpa2UgdGhpczoKCjEuIGluIHBjbV9uZXcoKSBzdGFnZSwgdGhlIGRldmljZSBQQ00gZHJpdmVy
IHNob3VsZCBjYWxsIApzbmRfcGNtX2xpYl9wcmVhbGxvY2F0ZV9wYWdlcygpLT4KCXNuZF9wY21f
bGliX3ByZWFsbG9jYXRlX3BhZ2VzKCktPgoJCXByZWFsbG9jYXRlX3BjbV9wYWdlcygpCmFuZCB0
aGVuIHRoZSBzdWJzdHJlYW0tPmRtYV9idWZmZXIgaXMgaW5pdGlhbGl6ZWQgd2l0aCB0aGUgcHJl
YWxsb2NhdGVkIApidWZmZXIuCgoyLiBpbiBwY21fb3BlbigpIHN0YWdlLCB0aGUgZGV2aWNlIFBD
TSBkcml2ZXIgc2hvdWxkIGNhbGwKc25kX3BjbV9saWJfbWFsbG9jX3BhZ2VzKCktPgoJc25kX2Rt
YV9hbGxvY19wYWdlcygpIC8vaWYgd2UgbmVlZCB0byByZWFsbG9jYXRlIGJpZ2dlciBidWZmZXIu
ICpUaGUgCnN1YnN0cmVhbS0+ZG1hX2J1ZmZlciB3b24ndCBiZSBmcmVlZCwgVGFrYXNoaSwgdGhp
cyBpcyB3aGF0IEkgdGhvdWdodCAKeW91IG5hbWVkICJwaW5uZWQiIGJ1ZmZlci4qIEFuZCB0aG9z
ZSByZWFsbG9jYXRlZCBiaWdnZXIgYnVmZmVyIHZpYSAKc25kX2RtYV9hbGxvY19wYWdlcygpIHdp
bGwgYmUgZnJlZWQgYXQgcGNtX2Nsb3NlKCkgcGVyIG15IHVuZGVyc3RhbmRpbmc/CgpUaGFua3Ms
Cn5LZXlvbgoKPiAKPiAKPiBUYWthc2hpCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBBbHNhLWRldmVsIG1haWxpbmcgbGlzdAo+IEFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
