Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D988102D8C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 21:29:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0EF4169C;
	Tue, 19 Nov 2019 21:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0EF4169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574195348;
	bh=Xu5L99pXCxU95o3xtmWBrHcSdrIjGmSb6Odfv8qPYCc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XOyO0JYQS28CQxflQuAVtKPMUgIp+Mxiy/3TqYd2dtC5NTfEdhFer6C9hO5aHXF4l
	 G9rrkvUD8TzwohqiLbAJXD17cpJV12tKqzktBDn48GYi2qRbjWa0NNxVuAO4eA/u2J
	 RUwAkVMXT4Q7WIoVoft/K0f19Cvx3QoeYcvz+TVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5129F80138;
	Tue, 19 Nov 2019 21:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5718F80138; Tue, 19 Nov 2019 21:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63EE3F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 21:27:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65877A003F;
 Tue, 19 Nov 2019 21:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65877A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574195239; bh=7XgQm/Z01XFB5Wkrl+Mr6yMDq+sVySyJe3NyqHW+MT8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=j3Sd3ub7A90luZKS5bkLVWIXZdw9Q+Ibovv2gMdiMtoJpWT4UMi5jjpyupZatksCN
 KVZg72YC0LcBOFr3U0dCFm54Fxsm0LglMmJC+pQIz6t38CQj2/3xh4tqd7lbRXUG0B
 knsO//U9rg2aaYZVpZSN69xOxbR9EBSY60VW4EkQ=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 19 Nov 2019 21:27:14 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191119174933.25526-1-perex@perex.cz>
 <20191119174933.25526-2-perex@perex.cz>
 <72dfc285-70e8-706d-3018-535bda1e8630@linux.intel.com>
 <f2de9597-c9c2-7696-622b-a2bbc2c32bb7@perex.cz>
 <fb07b326-4c5d-43a7-4525-9d5fa71db95d@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <afd834ff-cfb8-404c-2246-1b11b28d142b@perex.cz>
Date: Tue, 19 Nov 2019 21:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <fb07b326-4c5d-43a7-4525-9d5fa71db95d@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: Intel - use control components
 to describe card config
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

RG5lIDE5LiAxMS4gMTkgdiAyMDozOSBQaWVycmUtTG91aXMgQm9zc2FydCBuYXBzYWwoYSk6Cj4g
Cj4+Pj4gK2NvbmZpZyBTTkRfU09DX0lOVEVMX1VTRV9DVExfQ09NUE9ORU5UUwo+Pj4+ICvCoMKg
wqAgYm9vbCAiVXNlIENUTCBjb21wb25lbnRzIGZvciBJL08gY29uZmlndXJhdGlvbiIKPj4+PiAr
wqDCoMKgIGhlbHAKPj4+PiArwqDCoMKgwqDCoCBTb21lIGRyaXZlcnMgbWlnaHQgcGFzcyB0aGUg
SS9PIGNvbmZpZ3VyYXRpb24gdGhyb3VnaCB0aGUKPj4+PiArwqDCoMKgwqDCoCBzb3VuZGNhcmQn
cyBkcml2ZXIgbmFtZSBpbiB0aGUgY29udHJvbCB1c2VyIHNwYWNlIEFQSS4KPj4+PiArwqDCoMKg
wqDCoCBUaGUgbmV3IHNjaGVtZSBpcyB0byBwdXQgdGhpcyBpbmZvcm1hdGlvbiB0byB0aGUgY29t
cG9uZW50cwo+Pj4+ICvCoMKgwqDCoMKgIGZpZWxkIGluIHRoZSBBTFNBJ3MgY2FyZCBpbmZvIHN0
cnVjdHVyZS4gU2F5IFksIGlmIHlvdQo+Pj4+ICvCoMKgwqDCoMKgIGhhdmUgQUxTQSB1c2VyIHNw
YWNlIHZlcnNpb24gMS4yLjIrLgo+Pj4+ICsKPj4+Cj4+PiBJZiB0aGlzIGlzIGF0IHRoZSBib2Fy
ZCBsZXZlbCwgdGhlbiBtYXliZSBtb3ZlIHRoaXMgdG8KPj4+IHNvdW5kL3NvYy9pbnRlbC9ib2Fy
ZHMvS2NvbmZpZwo+Pj4KPj4+IEkgYW0gbm90IHN1cmUgYWJvdXQgdGhlIGFsc2EtbGliIGRlcGVu
ZGVuY3ksIGl0J3MgYSBiaXQgb2RkLCBpc24ndCBpdD8KPj4+IHNob3VsZG4ndCB0aGlzIGJlIGhh
bmRsZWQgdmlhIHByb3RvY29sIHZlcnNpb25zPyBvciBhIGNvbmZpZ3VyYXRpb24KPj4+IHByb3Zp
ZGVkIGJ5IGFsc2EtbGliIHNvbWVob3c/Cj4+Cj4+IEl0J3Mgbm90IGFib3V0IHRoZSBwcm90b2Nv
bC4gSXQncyBhYm91dCB0byBtb3ZlIHRoaXMgdHlwZSBvZiBpbmZvcm1hdGlvbgo+PiB0byBhbm90
aGVyIHBsYWNlLiBJIGNhbiByZW1vdmUgdGhlIEFMU0EgdmVyc2lvbiBzZW50ZW5jZSBmcm9tIHRo
ZSBoZWxwLAo+PiBiZWNhdXNlIGl0J3MganVzdCBhIGhpbnQuIEkgd291bGQgbGlrZSB0byBjcmVh
dGUgdWNtMiBjb25maWd1cmF0aW9ucwo+PiBiYXNlZCBvbiB0aGlzIHJhdGhlciB0aGFuIHRoZSBt
aXN1c2VkIGxvbmcgY2FyZCBuYW1lcy4KPiAKPiBJIGFtIHdpdGggeW91IG9uIHRoZSBpZGVhLCBp
dCdzIHRoZSB0cmFuc2l0aW9uIHRoYXQgd29ycmllcyBtZS4gSSBndWVzcwo+IGZvciBhIGRpc3Ry
byB0aGF0IHdvdWxkIGJlIGZpbmUsIG9uZSB3b3VsZCBob3BlIHRoYXQgdGhlcmUgaXMgYQo+IGNv
bW11bmljYXRpb24gYmV0d2VlbiB0aGUgYWxzYS1saWIgYW5kIHRoZSBrZXJuZWwgY29uZmlndXJh
dGlvbnMgcGFydHMsCj4gYnV0IGZvciBhIHJhbmRvbSB1c2VyIHRoZXJlJ3MgYSBjaGFuY2UgdGhh
dCB0aGV5IHdvdWxkIG5vdCBzZWxlY3QgdGhpcwo+IGFuZCBub3QgdXNlIHVjbTIgYW5kIHZpY2Ug
dmVyc2EuCj4gCj4gaXQncyBhbHNvIHBhaW5mdWwgZm9yIGtlcm5lbCBkZXZlbG9wZXJzIHRvIHJl
bHkgb24gdG8tYmUtcmVsZWFzZWQKPiBhbHNhLWxpYiBjaGFuZ2VzLCB3ZSd2ZSBiZWVuIHRoZXJl
IHdpdGggU09GIGFuZCBJIGRvbid0IGtub3cgaG93IG1hbnkKPiB0aW1lcyB3ZSBoYWQgcmVwb3J0
cyBvZiBpc3N1ZXMgcmVsYXRlZCB0byBhbHNhLWxpYiBzZXR1cCBwcm9ibGVtcy4KCkkgdGhpbmsg
dGhhdCB0aGUgbW9zdCBvZiBpc3N1ZXMgd2VyZSBiZWNhdXNlIHRoZXJlIHdhcyBubyBzdGFibGUg
dWNtIHVwc3RyZWFtIApmb3IgU09GLiBJJ3ZlIHNlZW4gbXVsdGlwbGUgdmFyaWFudHMgb2YgVUNN
IGNvbmZpZ3VyYXRpb24gZmlsZXMgZm9yIFNPRiAoYW5kIApldmVyeXRoaW5nIHdpbGwgYmUgZmlu
YWxpemVkIHdpdGggNS41IGtlcm5lbCEpLgogID4gSGVyZSBpdCdkIGJlIHdvcnNlIHNpbmNlIGFs
c2EtbGliIHVwZGF0ZXMgd291bGQgbmVlZCB0byBiZSBkZXBsb3llZCBvbiB0YXJnZXQKPiBkZXZp
Y2VzLgo+IAo+IEFnYWluIEkgYW0gbm90IGFnYWluc3QgdGhlIGlkZWEsIGJ1dCBhbnl0aGluZyB3
ZSBjYW4gZG8gdG8gcmV1c2UKPiBmcmljdGlvbiBkdXJpbmcgdGhlIHRyYW5zaXRpb24gd2lsbCBo
ZWxwIGEgZ3JlYXQgZGVhbC4KClRoaW5raW5nIG1vcmUsIHdlIGNhbiBjcmVhdGUgYW4gdWNtMiBj
b25maWd1cmF0aW9uIHdoaWNoIHdpbGwgaGFuZGxlIGJvdGggCmNhc2VzIChpbmRlcGVuZGVudCBv
biBDT05GSUdfU05EX1NPQ19JTlRFTF9VU0VfQ1RMX0NPTVBPTkVOVFMpLiBJIHByZXBhcmVkIGFu
IApleGFtcGxlOgoKaHR0cHM6Ly9naXRodWIuY29tL2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25m
L2NvbW1pdC9mMWMwMDgzNDgzZTE4NGViN2E1ZWVlMWY3ZDhjYjRkZjY2Y2FjMDg1CgoJCQkJCUph
cm9zbGF2CgotLSAKSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4KTGludXggU291bmQg
TWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
