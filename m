Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D286AC88CC
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 14:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A3D1672;
	Wed,  2 Oct 2019 14:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A3D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570019992;
	bh=CZr9vttyj6gyNUORi7phsDWJa5D+lNs6a3fevV2UelU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxUJdWC/lVM6TKd4rvlT+j49bZ14d4xxzOCsXuKpUxWJmaALejM0++tY6vSq9818A
	 Xah9dTFYI7UBsZQ40ON7iczCY4CQrgZIgDuR1Sjv2Uf5Ai1uByB7Uv5eXrpm0/gGYZ
	 +0Ov/1HRKwEmmW9WK8EmV0GULtuuekHp9C1xG5fA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A090BF803F3;
	Wed,  2 Oct 2019 14:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3BCF8016F; Wed,  2 Oct 2019 14:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02362F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 14:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02362F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sM6qtA+y"
Received: by mail-wr1-x444.google.com with SMTP id b9so19492218wrs.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=uGk0NsnReW3v26x69JoF4U/XFHQmuXUFuiRSC/I83Fg=;
 b=sM6qtA+y6e7x1nTHaofxM9BD/VTOgP5onwXKS6WOPTvz/Fn+5Bc1DTKW/8qf11Dqyi
 fCWGOI0yGP+HVLyfkD9tqXvA+95gLwYxx3+dsBe780mV9990tfSkH63E6BX1jB+ZApZg
 m48sydXZOM/FlfZwrgQFIQedpUwJem5Gzb8IMJWlAAoJimdgFJ7MzVtExlu2tFEsZG82
 tYQceUIze60tVwcsIc27yjS61uLF0CFPSZ+gm4SCJLH6k4RZi8kVftQFDALOxUj2eQBB
 bSt0hqyl4yoChI9MoQeU4yktEtLk5HjfPB8EVjpzN3Zzm7NeH6xCH87LzIvb5uJUJQ7M
 ZYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uGk0NsnReW3v26x69JoF4U/XFHQmuXUFuiRSC/I83Fg=;
 b=OUiUb2QJl3iVReLctSmu+fukF7fdoHcbRqD+9HchVZJJE7tPE4cgg7rQQoBF/w/TBV
 U5KqtEEZZvCXjRMLtofdPanoNcjE8jzPg8xo89LDxcP92PCNQbAHHqbODErFHQvAOzM7
 uXykNefp8CT87GYoSkIf7Ucwaj4uUt/Wlpj9Te/VtAETXVPDZjQh8ALbtLNsieGp0Bix
 wc0maVUq23rPxdri0fhVEfbJfxgEvblSMbmHuEUFJFIUCKj4o/i91dAhVmFzbaCajekq
 wo48Kt7IH2N4GzUsQreCjktSdpGzBCCvvFNaeJhT/7Xr6PvSk2btaC/JYjtQWXPM78oJ
 TMxg==
X-Gm-Message-State: APjAAAVHqeQu2eCHqJ2TQQy0Wbg3vA95MImUBE+Y0BQHrs/K9Zh8G+w6
 ya2Rx50+J+exM0Kd8VVvCsVzFg==
X-Google-Smtp-Source: APXvYqzIexH/mIsTsFrTBb+7hbdKoVIDGAMfo2sUtHTukDZhvnGLGnjD6phrChjA1fuXqRhVNjIBRQ==
X-Received: by 2002:adf:cf02:: with SMTP id o2mr2797118wrj.380.1570019881834; 
 Wed, 02 Oct 2019 05:38:01 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id u83sm7097505wme.0.2019.10.02.05.38.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Oct 2019 05:38:01 -0700 (PDT)
Date: Wed, 2 Oct 2019 13:37:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Message-ID: <20191002123759.GD11769@dell>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell>
 <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mehta, Sanju" <Sanju.Mehta@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Registering device
 endpoints using MFD framework
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

T24gVHVlLCAwMSBPY3QgMjAxOSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOgoKPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDE5IDg6MDAgQU0KPiA+IFRv
OiBSQVZVTEFQQVRJLCBWSVNITlUgVkFSREhBTiBSQU8KPiA+IDxWaXNobnV2YXJkaGFucmFvLlJh
dnVsYXBhdGlAYW1kLmNvbT4KPiA+IENjOiBSQVZVTEFQQVRJLCBWSVNITlUgVkFSREhBTiBSQU8K
PiA+IDxWaXNobnV2YXJkaGFucmFvLlJhdnVsYXBhdGlAYW1kLmNvbT47IERldWNoZXIsIEFsZXhh
bmRlcgo+ID4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBMaWFtIEdpcmR3b29kIDxsZ2ly
ZHdvb2RAZ21haWwuY29tPjsKPiA+IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IEph
cm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+Owo+ID4gVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmNvbT47IE11a3VuZGEsIFZpamVuZGFyCj4gPiA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29t
PjsgTWFydXRoaSBTcmluaXZhcyBCYXl5YXZhcmFwdQo+ID4gPE1hcnV0aGkuQmF5eWF2YXJhcHVA
YW1kLmNvbT47IE1laHRhLCBTYW5qdQo+ID4gPFNhbmp1Lk1laHRhQGFtZC5jb20+OyBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPjsgRGFuCj4gPiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT47IG1vZGVyYXRlZCBsaXN0OlNPVU5EIC0gU09DIExBWUVS
Cj4gPiAvIERZTkFNSUMgQVVESU8gUE9XRVIgTUFOQUdFTS4uLiA8YWxzYS1kZXZlbEBhbHNhLXBy
b2plY3Qub3JnPjsKPiA+IG9wZW4gbGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4K
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi83XSBBU29DOiBhbWQ6IFJlZ2lzdGVyaW5nIGRldmlj
ZSBlbmRwb2ludHMgdXNpbmcgTUZECj4gPiBmcmFtZXdvcmsKPiA+IAo+ID4gT24gVHVlLCAwMSBP
Y3QgMjAxOSwgdmlzaG51IHdyb3RlOgo+ID4gCj4gPiA+IEhpIEpvbmVzLAo+ID4gPgo+ID4gPiBJ
IGFtIHZlcnkgVGhhbmtmdWwgdG8geW91ciByZXZpZXcgY29tbWVudHMuCj4gPiA+Cj4gPiA+IEFj
dHVhbGx5IFRoZSBkcml2ZXIgaXMgbm90IHRvdGFsbHkgYmFzZWQgb24gTUZELiBJdCBqdXN0IHVz
ZXMKPiA+ID4gbWZkX2FkZF9ob3RwbHVnX2RldmljZXMoKSBhbmQgbWZkX3JlbW92ZV9kZXZpY2Vz
KCkgZm9yIGFkZGluZyB0aGUKPiA+ID4gZGV2aWNlcyBhdXRvbWF0aWNhbGx5Lgo+ID4gPgo+ID4g
PiBSZW1haW5pbmcgY29kZSBoYXMgbm90aGluZyB0byBkbyB3aXRoIE1GRCBmcmFtZXdvcmsuCj4g
PiA+Cj4gPiA+IFNvIEkgdGhvdWdodCBJdCB3b3VsZCBub3QgYnJlYWsgdGhlIGNvZGluZyBzdHls
ZSBhbmQgbW92ZWQgYWhlYWQgYnkKPiA+ID4gdXNpbmcgdGhlIE1GRCBBUEkgYnkgYWRkaW5nIGl0
cyBoZWFkZXIgZmlsZS4KPiA+ID4KPiA+ID4gSWYgaXQgaXMgYW55IHZpb2xhdGlvbiBvZiBjb2Rp
bmcgc3RhbmRhcmQgdGhlbiBJIGNhbiBtb3ZlIGl0IHRvCj4gPiA+IGRyaXZlcnMvbWZkLgo+ID4g
Pgo+ID4gPiBUaGlzIHBhdGNoIGNvdWxkIGJlIGEgc2hvdyBzdG9wcGVyIGZvciB1cy5QbGVhc2Ug
c3VnZ2VzdCB1cyBob3cgY2FuIHdlCj4gPiA+IG1vdmUgYWhlYWQgQVNBUC4KPiA+IAo+ID4gRWl0
aGVyIG1vdmUgdGhlIE1GRCBwYXJ0cyB0byBkcml2ZXJzL21mZCwgb3Igc3RvcCB1c2luZyB0aGUg
TUZEIEFQSS4KPiAKPiBUaGVyZSBhcmUgbW9yZSBkcml2ZXJzIG91dHNpZGUgb2YgZHJpdmVycy9t
ZmQgdXNpbmcgdGhpcyBBUEkgdGhhbgo+IGRyaXZlcnMgaW4gZHJpdmVycy9tZmQuCgpQZW9wbGUg
ZG8gd3JvbmcgdGhpbmdzIGFsbCB0aGUgdGltZS4gIEl0IGRvZXNuJ3QgbWFrZSB0aGVtIHJpZ2h0
LgoKPiBJbiBhIGxvdCBvZiBjYXNlcyBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbW92ZSB0aGUg
ZHJpdmVyIHRvIGRyaXZlcnMvbWZkLgoKSW4gdGhvc2UgY2FzZXMsIHRoZSBwbGF0Zm9ybV9kZXZp
Y2VfKigpIEFQSSBzaG91bGQgYmUgdXNlZC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGlu
YXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
