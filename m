Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9B1301BE
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jan 2020 11:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0D0177B;
	Sat,  4 Jan 2020 11:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0D0177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578133061;
	bh=ZAjCRAaE9b6+W1gtfpGkJo/1FdN7AtIuhD748TL7dX4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4h71PDyWyYzwbTmi6loOxJt6GB5jVvlTg64dJUwv1OowTVxuyzLNkLuSkZlheexs
	 kJFaOoBlDZrXPdCjctr4oycNqvszJ5Kt2P9vCsdLehYXwmU1Qpgpm+pwq5XSGubs9s
	 LSSrOos1tDKvGBhdyDWkIjhqOaBxNYaNVTeC24is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA6DDF80157;
	Sat,  4 Jan 2020 11:15:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA83F80157; Sat,  4 Jan 2020 11:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDC5AF80116
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 11:15:51 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 72650A003F;
 Sat,  4 Jan 2020 11:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 72650A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578132951; bh=vOm20R7cZ0rLH/FB+M9Gngfe2GLWtD/tPFqhX3+2LC8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WaFZAL5AtV2wt8ey+U4dFVdn9vU2U83txbs67CedEqaFAj4taQrRIMZbtD63XAz9W
 1Dw/qP0b+yGV9q8hqpnPLyrQLwpOXhYwvKsZP238Rz+9Lvz5Mkzpm4jbIjj51tbeyl
 PZGzCMlNuKofhmkAJ2TCIh/RPe2Q70QtCWi8EJMY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat,  4 Jan 2020 11:15:47 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bernie Innocenti <bernie@codewiz.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org
References: <1ae8f294-a6c7-d104-8e57-a86cf5b9b07c@codewiz.org>
 <f2c43959-aa1f-6136-f387-e4f44c2f889d@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <aad66928-98e6-cdf6-5535-c69b2d9bba40@perex.cz>
Date: Sat, 4 Jan 2020 11:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f2c43959-aa1f-6136-f387-e4f44c2f889d@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: Fix CFL and CML FW
 nocodec binary names.
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

RG5lIDAyLiAwMS4gMjAgdiAxOTowMCBQaWVycmUtTG91aXMgQm9zc2FydCBuYXBzYWwoYSk6Cj4g
Cj4gCj4gT24gMTIvMjkvMTkgNjoxNSBQTSwgQmVybmllIElubm9jZW50aSB3cm90ZToKPj4gR3Jl
ZXRpbmdzIExpYW0gYW5kIFBpZXJyZSwKPj4KPj4gICA+IEBAIC0xNDksNyArMTQ5LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzb2ZfZGV2X2Rlc2MgY21sX2Rlc2MgPSB7Cj4+ICAgPsKgwqDCoMKg
IC5jaGlwX2luZm8gPSAmY25sX2NoaXBfaW5mbywKPj4gICA+wqDCoMKgwqAgLmRlZmF1bHRfZndf
cGF0aCA9ICJpbnRlbC9zb2YiLAo+PiAgID7CoMKgwqDCoCAuZGVmYXVsdF90cGxnX3BhdGggPSAi
aW50ZWwvc29mLXRwbGciLAo+PiAgID4twqDCoMKgIC5ub2NvZGVjX2Z3X2ZpbGVuYW1lID0gInNv
Zi1jbmwucmkiLAo+PiAgID4rwqDCoMKgIC5ub2NvZGVjX2Z3X2ZpbGVuYW1lID0gInNvZi1jbWwu
cmkiLAo+Pgo+PiBXaGVyZSBpcyB0aGlzIG5ldyBmaXJtd2FyZSBmaWxlPyBUaGlzIHBhdGNoIGhh
cyBmbG93biBpbnRvIEZlZG9yYQo+PiBrZXJuZWxzIDUuNC41LTMwMS5mYzMxIGFuZCA1LjUuMC0w
LnJjMy5naXQwLjEuZmMzMiwgYW5kIG5vdyBJJ20gZ2V0dGluZwo+PiB0aGlzIGVycm9yIHdoZW4g
dGhlIG1vZHVsZSBsb2FkcyBvbiBhIFRoaW5rcGFkIFgxIEdlbiA3Ogo+Pgo+PiAgIMKgIHNvZi1h
dWRpby1wY2kgMDAwMDowMDoxZi4zOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IKPj4gaW50ZWwv
c29mL3NvZi1jbWwucmkgZmFpbGVkIHdpdGggZXJyb3IgLTIKPj4KPj4gVGhlIG90aGVyIC5yaSBm
aWxlcyBjb21lIHdpdGggYWxzYS1maXJtd2FyZSwgYnV0IHNvZi1jbWwucmkgaXMgYWJzZW50IGlu
Cj4+IHRoZSBsYXRlc3QgdXBzdHJlYW0gcmVsZWFzZSAoYWxzYS1maXJtd2FyZS0xLjIuMSkuCj4+
Cj4+IFRoZSBvbmx5IHJlZmVyZW5jZSBJIGNvdWxkIGZpbmQgaXMgdGhpcyBzeW1saW5rLCBidXQg
aXQncyBub3QgY2xlYXIgdG8KPj4gbWUgaG93IGFuZCB3aGVuIGl0IHdpbGwgZ2V0IGludG8gZGlz
dHJpYnV0aW9uczoKPj4KPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGlu
dXgtZmlybXdhcmUvY29tbWl0L2JlZmY3MzJlNjY0MmJkNzdkYWM1ZGQwODUxNDI2NGYwNTVmYzRk
MTAjZGlmZi03NmMxNDE3MTI1NjNjYzlkNDczMGViNjNhY2IzNmFkNVIzODA3LVIzODA4Cj4gCj4g
WWVzLCBzb3JyeSBmb3IgdGhlIGRlbGF5LiB3ZSBydW4gb3V0IG9mIHRpbWUgYXQgdGhlIGVuZCBv
ZiAyMDE5IChuZWVkZWQKPiB0byB2ZXJpZnkgdGhlIGNvbXBpbGF0aW9uIG9mIHRoZSBmaXJtd2Fy
ZSBzaWduZWQgd2l0aCB0aGUgY29tbXVuaXR5IGtleQo+IGFuZCBtYXRjaGluZyBjaGFuZ2VzIGlu
IHRoZSBTT0YgZHJpdmVyIHRvIHNlbGVjdCB0aGUgcmlnaHQgZmlsZXMgWzFdKS4KPiBPbmNlIHRo
aXMgaXMgZG9uZSwgd2Ugd2lsbCBtYWtlIGEgcHVsbCByZXF1ZXN0IHNvIHRoYXQgdGhlIHJlbGVh
c2VzIGZsb3cKPiBpbnRvIGxpbnV4LWZpcm13YXJlLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5j
b20vdGhlc29mcHJvamVjdC9saW51eC9wdWxsLzE2NDYKCk15IGNvbW1lbnRzIGZvciB0aGUgbGlu
dXgtZmlybXdhcmUgY29tbWl0OgoKaHR0cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGlu
dXgtZmlybXdhcmUvY29tbWl0L2JlZmY3MzJlNjY0MmJkNzdkYWM1ZGQwODUxNDI2NGYwNTVmYzRk
MTAjcjM2NjU2NzM0CgpCZXJuaWUsIEkgbWFpbnRhaW4gdGhlIGFsc2EtZmlybXdhcmUgcGFja2Fn
ZSBmb3IgRmVkb3JhIGFuZCB0cnlpbmcgdG8gY2F0Y2ggCnRoZSBJbnRlbCBjaGFuZ2VzIHRvIG1h
a2UgdGhpbmdzIHdvcmtpbmcgZm9yIG5ldyBsYXB0b3BzIHdpdGggdGhpcyBJbnRlbCBoYXJkd2Fy
ZS4KCgkJCQkJSmFyb3NsYXYKCi0tIApKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpM
aW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
