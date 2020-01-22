Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC3144BB8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 07:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B731658;
	Wed, 22 Jan 2020 07:24:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B731658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579674324;
	bh=44p71kcd15g6d7XtqlWU6NmB/wxeldbUwDhqzVrS1f8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGAm36wY8D2l43iyo1q3/mwZVDGTa+Eg6UP1CwNdzkjt/wnMFJMtRnrf2kgqVxeHA
	 +oce6uH1eRy3uxOA6Gb2/ZpMQzfAPvUImTMFkgwrFq+fpV75Ke8bsFoRliWk24plwF
	 YuuJj1YQzj9V8A4r1PZ34jH2khti8TJhc7ZQPMLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D178FF8020C;
	Wed, 22 Jan 2020 07:23:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E43DF8020C; Wed, 22 Jan 2020 07:23:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 390BBF800BA
 for <alsa-devel@alsa-project.org>; Wed, 22 Jan 2020 07:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 390BBF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K2/S4unh"
Received: by mail-wr1-x443.google.com with SMTP id q6so5909373wro.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 22:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yjvd1axR1PqdZTIc08mAWLXgtWgaoB8nmRFDHlqUans=;
 b=K2/S4unhlBehk1R8CImxKUVzTj990lKFx5dXDMkTvyEXr4UKrzrzaJWtzTJK4oAVny
 /XjEoKXgkRFpLdunILsdbOB7Et62ma1dPT+77evlk85kGROQyYzEjeqITh0kcJjEOV84
 TG4vliwoXpPeJ/aCpyUQnyynCOmZqeBut0z67FnDACKkXPqwiOSFokDTHybWPToOwf1u
 1ldo2LER1/QRDhDA9m/r5mBKuXfQxg42gG8T73pVTPCsi/jyvbDgHjM6TqubwBJrtjOx
 YBUorN29LqnOwdjYjBoT9/WDOcZXAgwS0JAVzypCHaHt1osWC0F/yqUh4kC5Q8olNcJR
 oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yjvd1axR1PqdZTIc08mAWLXgtWgaoB8nmRFDHlqUans=;
 b=QxsbnC6weFvQviLelb31enrZZ8E8gj0HbNZjD9FyiOzKc1bWpAFAhR24PkjSmQqRDs
 t/PSOtwkQgB4VG78vlD/jQxo7mYIQK7SjLHTeyfwMtjyQKGjyhA75Yj248hAvyMpkX7E
 4UjzrnYJHRxh8ZuMHgyAx+jcmy33DK5an+Bqhlfc+ah6ImA+Pd+b0H3ar4ArtCcWsYGJ
 9jOr+Gjx9+lsZHU0+KU10W1vGwEYhS4KstBrXFA82hzpJsqRllaWOvFyezx9r8b7rkES
 l/3Xo1xkTSdsvFbumyTt2dIswvRQoi+lPbWt4tx8L+SR4jFQLfkJBTVrsTUmjlpq982c
 Tung==
X-Gm-Message-State: APjAAAV3OnQH4qasj+ZhGznpJaPNgMUey8y0npMlktCEwbmpMmU1G5M4
 YQMjatyO0xYJ8ZeG8tVx7uA=
X-Google-Smtp-Source: APXvYqwCc0NSmc1uA3xXZfLgQ5hogHHHXFIsuV5k40DFrrvLSeqTJgiNuYig6ngVcci+7DDK6HQwzQ==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr9019793wrn.274.1579674213025; 
 Tue, 21 Jan 2020 22:23:33 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id f1sm56691885wrp.93.2020.01.21.22.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 22:23:31 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
Date: Wed, 22 Jan 2020 09:23:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
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

MjIuMDEuMjAyMCAwNzozMiwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6CltzbmlwXQo+Pj4+PiAr
c3RhdGljIGludCB0ZWdyYTIxMF9pMnNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqDCoCBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRl
dik7Cj4+Pj4+ICvCoMKgwqDCoCBpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRl
di0+ZGV2KSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZWdyYTIxMF9pMnNfcnVu
dGltZV9zdXNwZW5kKCZwZGV2LT5kZXYpOwo+Pj4+IFRoaXMgYnJlYWtzIGRldmljZSdzIFJQTSBy
ZWZjb3VudGluZyBpZiBpdCB3YXMgZGlzYWJsZWQgaW4gdGhlIGFjdGl2ZQo+Pj4+IHN0YXRlLiBU
aGlzIGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQuIEF0IG1vc3QgeW91IGNvdWxkIHdhcm4gYWJvdXQg
dGhlCj4+Pj4gdW54cGVjdGVkIFJQTSBzdGF0ZSBoZXJlLCBidXQgaXQgc2hvdWxkbid0IGJlIG5l
Y2Vzc2FyeS4KPj4+IEkgZ3Vlc3MgdGhpcyB3YXMgYWRkZWQgZm9yIHNhZmV0eSBhbmQgZXhwbGlj
aXQgc3VzcGVuZCBrZWVwcyBjbG9jawo+Pj4gZGlzYWJsZWQuCj4+PiBOb3Qgc3VyZSBpZiByZWYt
Y291bnRpbmcgb2YgdGhlIGRldmljZSBtYXR0ZXJzIHdoZW4gcnVudGltZSBQTSBpcwo+Pj4gZGlz
YWJsZWQgYW5kIGRldmljZSBpcyByZW1vdmVkLgo+Pj4gSSBzZWUgZmV3IGRyaXZlcnMgdXNpbmcg
dGhpcyB3YXkuCj4+IEl0IHNob3VsZCBtYXR0ZXIgKGlmIEknbSBub3QgbWlzc2luZyBzb21ldGhp
bmcpIGJlY2F1c2UgUlBNIHNob3VsZCBiZSBpbgo+PiBhIHdyZWNrZWQgc3RhdGUgb25jZSB5b3Un
bGwgdHJ5IHRvIHJlLWxvYWQgdGhlIGRyaXZlcidzIG1vZHVsZS4gTGlrZWx5Cj4+IHRoYXQgdGhv
c2UgZmV3IG90aGVyIGRyaXZlcnMgYXJlIHdyb25nLgo+Pgo+PiBbc25pcF0KPiAKPiBPbmNlIHRo
ZSBkcml2ZXIgaXMgcmUtbG9hZGVkIGFuZCBSUE0gaXMgZW5hYmxlZCwgSSBkb24ndCB0aGluayBp
dCB3b3VsZCB1c2UKPiB0aGUgc2FtZSAnZGV2JyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgcmVmIGNv
dW50LiBEb2Vzbid0IGl0IHVzZSB0aGUgbmV3Cj4gY291bnRlcnM/Cj4gSWYgUlBNIGlzIG5vdCB3
b3JraW5nIGZvciBzb21lIHJlYXNvbiwgbW9zdCBsaWtlbHkgaXQgd291bGQgYmUgdGhlIGNhc2UK
PiBmb3Igb3RoZXIKPiBkZXZpY2VzLiBXaGF0IGJlc3QgZHJpdmVyIGNhbiBkbyBpcyBwcm9iYWJs
eSBkbyBhIGZvcmNlIHN1c3BlbmQgZHVyaW5nCj4gcmVtb3ZhbCBpZgo+IGFscmVhZHkgbm90IGRv
bmUuIEkgd291bGQgcHJlZmVyIHRvIGtlZXAsIHNpbmNlIG11bHRpcGxlIGRyaXZlcnMgc3RpbGwK
PiBoYXZlIGl0LAo+IHVubGVzcyB0aGVyZSBpcyBhIHJlYWwgaGFybSBpbiBkb2luZyBzby4KCkkg
dG9vayBhIGNsb3NlciBsb29rIGFuZCBsb29rcyBsaWtlIHRoZSBjb3VudGVyIGFjdHVhbGx5IHNo
b3VsZCBiZQpyZXNldC4gU3RpbGwgSSBkb24ndCB0aGluayB0aGF0IGl0J3MgYSBnb29kIHByYWN0
aWNlIHRvIG1ha2UgY2hhbmdlcwp1bmRlcm5lYXRoIG9mIFJQTSwgaXQgbWF5IHN0cmlrZSBiYWNr
LgoKPj4+Pj4gK8KgwqDCoMKgIGludCByeF9maWZvX3RoOwo+Pj4+IENvdWxkIHJ4X2ZpZm9fdGgg
YmUgbmVnYXRpdmU/Cj4+PiByeF9maWZvX3RoIGl0c2VsZiBkb2VzIG5vdCB0YWtlIG5lZ2F0aXZl
IHZhbHVlcywgZXhwbGljaXQKPj4+IHR5cGVjYXN0aW5nPiBpcyBhdm9pZGVkIGluICJpZiIgY29u
ZGl0aW9uIGJ5IGRlY2xhcmluZyB0aGlzIGFzICJpbnQiCj4+IEV4cGxpY2l0IHR5cGVjYXN0aW5n
IGlzbid0IG5lZWRlZCBmb3IgaW50ZWdlcnMuCj4gCj4gV2hhdCBJIG1lYW50IHdhcywgcnhfZmlm
b190aCBpcyBjaGVja2VkIGFnYWluc3QgYSAnaW50JyB2YXJpYWJsZSBpbiBhbgo+ICJpZiIgY29u
ZGl0aW9uLgoKV2hhdCdzIHRoZSBwcm9ibGVtIHdpdGggY29tcGFyaW5nIG9mIHVuc2lnbmVkIHdp
dGggc2lnbmVkPwoKQmVzaWRlcywgY2lmX2NvbmYuYXVkaW9fY2ggPiBJMlNfUlhfRklGT19ERVBU
SCBjYW4ndCBiZSBldmVyIHRydWUsIGlzbid0Cml0PyBJMlNfUlhfRklGT19ERVBUSD02NCwgY2hh
bm5lbHNfbWF4PTE2CgpMYXN0bHksIG5vdGhpbmcgc3RvcHMgeW91IHRvIG1ha2UgbWF4X3RoIHVu
c2lnbmVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
