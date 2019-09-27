Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 514CCC01A5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 11:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D48A01670;
	Fri, 27 Sep 2019 11:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D48A01670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569574993;
	bh=4J9azZmosrRguD1/vw3Ov1XC26zpoaNPOrrH8EORmiQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3YG3yy8ZqRAtb6xkJFMrSrBpjWrPWbjppL2iemB/ZNhNsfhFNLqy1QPyIUvKhXNn
	 4Sms1VaxvIRUuWNwSpjK4HtgSB1CU50Qis+N3z6SlOROWwhqLnKeg/04pijbumng1s
	 EPf4Dl28O7G/Qf7IHwbykTxy3o45wFWuheG96kh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A8BCF804CA;
	Fri, 27 Sep 2019 11:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EC1AF8049A; Fri, 27 Sep 2019 11:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C700F80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 11:01:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3EBF3A003F;
 Fri, 27 Sep 2019 11:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3EBF3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569574883; bh=9mIF7QfuS2EwJB+BWrRKuCOhqLgvGVPTSP5ULeVXa+Y=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=1Xb+nKYbR7jfRkLTlZxWnBZfyrzeL6dvc0vaw0wd5LGF3UeugDrH9p9xBgiyEKl+u
 1BkoVjkRrLk+wVutxi8EcBxRINVdO5i9S/HvdczCzn/DEeG44H7dzn7zf6F7fGuy9h
 ynYX7kbMbjqOAVcA7/nPG51uXGU98H9gqpPYB/7I=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Sep 2019 11:01:18 +0200 (CEST)
To: Hui Wang <hui.wang@canonical.com>, Mark Pearson <mpearson@lenovo.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
 <153ba191eb3c4849b6e65db5fc8e8760@lenovo.com>
 <4cb6bec8-1dac-9114-c230-c9196763e58d@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cc8e8881-a210-610d-d4fb-fdf8daef942c@perex.cz>
Date: Fri, 27 Sep 2019 11:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4cb6bec8-1dac-9114-c230-c9196763e58d@canonical.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

RG5lIDI3LiAwOS4gMTkgdiAxMDoyMSBIdWkgV2FuZyBuYXBzYWwoYSk6Cj4gU28gZmFyLCB0aGUg
YWxzYS1saWIgc3RpbGwgZGVwZW5kcyBvbiB0aGUgY2FyZC0+bmFtZS9sb25nLW5hbWUgdG8gZmlu
ZCAKPiB0aGUgbmVlZGVkIFVDTSwgSSBrbm93IHNvbWUgRGVsbCBtYWNoaW5lcyBhbHNvIHVzZXMg
c29mIGRyaXZlciAoc28gdGhlIAo+IGNhcmQtPm5hbWUvbG9uZy1uYW1lIGlzIGFsc28gc29mLXNr
bF9oZGFfY2FyZCksIHNvIGlmIHRoaXMgVUNNIGlzIAo+IG1lcmdlZCwgaXQgd2lsbCBiZSBzaGFy
ZWQgd2l0aCBEZWxsIG1hY2hpbmVzLiBCdXQgb24gdGhvc2UgRGVsbCAKPiBtYWNoaW5lcywgdGhl
cmUgaXMgbm8gQkFTUyBTcGVha2VyLCBhbmQgRGVsbCBtYWNoaW5lcyBoYXZlIHN0aCB0aGF0IAo+
IExlbm92byBtYWNoaW5lcyBkb24ndCBoYXZlLCBsaWtlIGhlYWRzZXQtbWljIGFuZCBoZWFkcGhv
bmUtbWljLiBIb3cgdG8gCj4gbWFrZSB0aGlzIFVDTSB3b3JrIG9uIGJvdGggTGVub3ZvIGFuZCBE
ZWxsIG1hY2hpbmVzPwoKVGhhbmtzIGZvciB0aGlzIGluZm8uIFRoZSBsb25nLW5hbWUgY29udGFp
bnMgRE1JIGluZm8sIHNvIEkgdXBkYXRlZCB0aGUKY29uZmlndXJhdGlvbiBpbiB0aGlzIHdheToK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11Y20tY29uZi9jb21taXQvYWM4
MzE5MjQ1ZTEyMTNlNDZhMWFlNWMyZGU0ZGRkNGEwYzg5MjZlMgoKaHR0cHM6Ly9naXRodWIuY29t
L2Fsc2EtcHJvamVjdC9hbHNhLXVjbS1jb25mL2NvbW1pdC85YmQwYmYzNGE1NzFhNGEzYzM4ZDc0
MDk4OTcyZDgyYzU4ZmFjODBlCgooZXZlcnl0aGluZyBpcyBpbiB0aGUgdXBkYXRlZCAnaW1wb3J0
JyBicmFuY2gpCgpTbyB5b3UgY2FuIGFkZCB0aGUgc3BlY2lmaWMgY29uZmlnIGZvciB0aGUgRGVs
bCBkZXZpY2UsIHRvby4KCgkJCQkJSmFyb3NsYXYKCgo+IAo+IFJlZ2FyZHMsCj4gCj4gSHVpLgo+
IAo+IAo+IE9uIDIwMTkvOS8yNCDkuIvljYg4OjA2LCBNYXJrIFBlYXJzb24gd3JvdGU6Cj4+Pj4g
SSB0aGluayB0aGUgZmlyc3Qgb3JkZXIgd291bGQgYmUgdG8gaGF2ZSB0aGUgZmlsZSBjbGVhbmVk
LXVwLCB3aXRoIGl0cwo+Pj4+IEludGVsIG9yaWdpbiBjbGVhcmx5IHN0YXRlZCB3aXRoIGEgc2ln
bmVkLW9mZi1ieSB0YWcuCj4+Pj4KPj4+PiBUaGVuIG9uY2UgdGhpcyBpcyBkb25lLCB0aGUgRGVi
aWFuIHBhY2thZ2UgY3JlYXRpb24gbmVlZHMgdG8gYmUKPj4+PiBoYW5kbGVkICh1c2luZyBlaXRo
ZXIgdGhlIEFMU0EgcmVwbyBvciB0aGUgY2xvbmVkIHZlcnNpb24gb24gU09GCj4+Pj4gR2l0SHVi
KS4gSSBkb24ndCBoYXZlIGFueSBleHBlcmllbmNlIHdpdGggRGViaWFuIHBhY2thZ2VzIHNvIGNh
bid0Cj4+Pj4gcmVhbGx5IGNvbW1lbnQgb24gdGhlIGVmZm9ydCBpdCB3b3VsZCB0YWtlLgo+Pj4g
SSBkaWQgc29tZSBjbGVhbnVwcyBoZXJlOgo+Pj4KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbHNh
LXByb2plY3QvYWxzYS11Y20tCj4+PiBjb25mL2NvbW1pdC9mNzk2ZjA4NTJhMDk3ZTIzOGZhOWY1
ZWZiMTc0ZTk1YjVlZTZjOGI3Cj4+Pgo+Pj4gUGllcnJlLCBjb3VsZCB5b3UgY29uZmlybSB0aGUg
b3JpZ2luYWwgc291cmNlIGFuZCBhcmUgeW91IG9rIHdpdGggdGhhdD8KPj4+Cj4+IEkgZ290IGNv
bmZpcm1hdGlvbiBmcm9tIEludGVsIHRoYXQgdGhleSBhcmUgdGhlIG9yaWdpbmFsIHNvdXJjZSAt
IHRoZXkgcHJvdmlkZWQgbWUgd2l0aCB0aGUgZmlsZXMgKGFzIGFuIGFzaWRlIGluIGNhc2UgaXQg
aXMgaW1wb3J0YW50LCBvcmlnaW5hbGx5IHRoZXkgd2VyZSB3b3JraW5nIHdpdGggQ2Fub25pY2Fs
IG9uIGdldHRpbmcgVWJ1bnR1IHdvcmtpbmcgb24gb25lIG9mIG91ciAoTGVub3ZvKSBwbGF0Zm9y
bXMpLiBJIHdhcyBmb2xsb3dpbmcgdXAgd2l0aCBDYW5vbmljYWwgdG8ganVzdCBjaGVjayB3aGF0
IHRoZXkgaGFkIGRvbmUgYnV0IGhhdmVuJ3QgaGVhcmQgYmFjayB5ZXQuCj4+Cj4+IFNpbmNlIElu
dGVsIGhhcyBwcm92aWRlZCB0aGUgZmlsZXMgdG8gbWUgZGlyZWN0bHkgLSBjYW4gSSBhY3QgYXMg
YW4gb3JpZ2luYWwgc291cmNlIGNvbmZpcm1hdGlvbj8KPj4KPj4KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4gQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCj4+IGh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo+PgoKCi0tIApKYXJvc2xh
diBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PgpMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFBy
b2plY3Q7IFJlZCBIYXQsIEluYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
