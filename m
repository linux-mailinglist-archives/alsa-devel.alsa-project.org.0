Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 191FAC89E1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 15:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E21167D;
	Wed,  2 Oct 2019 15:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E21167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570023467;
	bh=2wgFWG59Wgluw5GuMQP/WZfcb7hKDiEPq1E4PalFou0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTDthyo1xYjKPeE0XN+yTlpukVE3foI1FEqYtZT5iK2cA9OAdBhSj8rpdco817L2R
	 rI+TNIcrHnEZleGPhSyikocBqEV9eahwBu/5FQK8KP8LJS9WtrSzzzwW3YKS9tSgtr
	 rKyZvV3v7wKI6BQ5hhqB1Dng6tpw2ppnnR7jvVAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 183EEF80391;
	Wed,  2 Oct 2019 15:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03EF3F80391; Wed,  2 Oct 2019 15:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97967F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 15:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97967F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CEwJVEoE"
Received: by mail-wr1-x442.google.com with SMTP id y19so19716406wrd.3
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 06:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=SKsMv8qnMo+5vAVsJhy/p0hqFSrqBGNR2va/5wYlCuM=;
 b=CEwJVEoE0/j9CZxiEx8eaD9UtVNmxSeBk+wSYk0Ie4EqY8VXts8uiIcXkz+nV50KXu
 yKdlBWYBdjU2d2dEgqeyVK70H6nm/GN2aoIrvE3GxkvaqFYa6pmrVa9iV51u9/J25UoW
 cvRIh4cpLWJ6r2tXFe5dU4Eja4scW/+Jf/dVf9blzrjUhqBBVi6fdkfWDAlT2m4VYw9j
 RS1aUXbe1apSFbPzvdFUBTrZsiNYDvViq6YCDRMYebDVzvsORWFdvB4S4q3Mf+YPQyl9
 5lxeJL8TFr+Zx1zQbjeKLVPl0sAR3PWqHeCBpK8ZwtJMiuLws18C+B1rzUO8JsTTB2XM
 z+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SKsMv8qnMo+5vAVsJhy/p0hqFSrqBGNR2va/5wYlCuM=;
 b=m3W9eFjiUc/PP8oysOViIouoD/ULcvq4L0OY90QEM/P82S10HrmlEGmNKiV1mqO/rt
 WoQM6eEekVW4Tp0Xd5WkbVh3VBBGRm4kuZCq34yox8NglUkMCDgQM+h4fFNb+ROYgFIJ
 JxGtDe0wkZKpKG2CddH/I2uVSotq5xhCF6+Azup8ioFCZeZHUAP+wRFE4dkgiBn2jvkN
 vtpxO8MwkPEus4fkO1749zR61ht/7mla6phVLL1ynaxjm674abApMMq89E6LelbQ5Pm9
 aH/rqE0uZyQo5pi29cvSqBCHnnu0bYnEQbt2Krpm94yg+LgCB2lWa9fcPt6r8mT+RlSQ
 qJbQ==
X-Gm-Message-State: APjAAAWFbQ+VJesmCv0hhVRiJ1TgSie1kAB5ltkobI5erwwmITfA3ykU
 HHkubPHV2yGgwpkpqhro85nozg==
X-Google-Smtp-Source: APXvYqwmQEJTRFI2E4QtGacDdNY5KlrW5j4hYCbn4S/SB7PHxXD8maaacFuWFSKfjW3MsMrj5O0Gxw==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr2822249wrr.390.1570023355697; 
 Wed, 02 Oct 2019 06:35:55 -0700 (PDT)
Received: from dell ([2.27.167.122])
 by smtp.gmail.com with ESMTPSA id m18sm23191103wrg.97.2019.10.02.06.35.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Oct 2019 06:35:55 -0700 (PDT)
Date: Wed, 2 Oct 2019 14:35:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Message-ID: <20191002133553.GA21172@dell>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569891524-18875-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191001064539.GB11769@dell>
 <2ff13a61-a346-4d49-ab3a-da5d2126727c@amd.com>
 <20191001120020.GC11769@dell>
 <BN6PR12MB180930BD7D03FD7DEB14D7C1F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <20191002123759.GD11769@dell>
 <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR12MB1809451A3152488F3D8D1371F79C0@BN6PR12MB1809.namprd12.prod.outlook.com>
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

T24gV2VkLCAwMiBPY3QgMjAxOSwgRGV1Y2hlciwgQWxleGFuZGVyIHdyb3RlOgoKPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgo+ID4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIsIDIwMTkgODozOCBBTQo+ID4g
VG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4KPiA+IENj
OiBSQVZVTEFQQVRJLCBWSVNITlUgVkFSREhBTiBSQU8KPiA+IDxWaXNobnV2YXJkaGFucmFvLlJh
dnVsYXBhdGlAYW1kLmNvbT47IExpYW0gR2lyZHdvb2QKPiA+IDxsZ2lyZHdvb2RAZ21haWwuY29t
PjsgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPjsgSmFyb3NsYXYKPiA+IEt5c2VsYSA8
cGVyZXhAcGVyZXguY3o+OyBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuY29tPjsgTXVrdW5kYSwK
PiA+IFZpamVuZGFyIDxWaWplbmRhci5NdWt1bmRhQGFtZC5jb20+OyBNYXJ1dGhpIFNyaW5pdmFz
IEJheXlhdmFyYXB1Cj4gPiA8TWFydXRoaS5CYXl5YXZhcmFwdUBhbWQuY29tPjsgTWVodGEsIFNh
bmp1Cj4gPiA8U2FuanUuTWVodGFAYW1kLmNvbT47IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+OyBEYW4KPiA+IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPjsgbW9kZXJhdGVkIGxpc3Q6U09VTkQgLSBTT0MgTEFZRVIKPiA+IC8gRFlOQU1JQyBBVURJ
TyBQT1dFUiBNQU5BR0VNLi4uIDxhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc+Owo+ID4gb3Bl
biBsaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzddIEFTb0M6IGFtZDogUmVnaXN0ZXJpbmcgZGV2aWNlIGVuZHBvaW50cyB1c2luZyBN
RkQKPiA+IGZyYW1ld29yawo+ID4gCj4gPiBPbiBUdWUsIDAxIE9jdCAyMDE5LCBEZXVjaGVyLCBB
bGV4YW5kZXIgd3JvdGU6Cj4gPiAKPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
ID4gPiA+IEZyb206IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gPiA+ID4gU2Vu
dDogVHVlc2RheSwgT2N0b2JlciAxLCAyMDE5IDg6MDAgQU0KPiA+ID4gPiBUbzogUkFWVUxBUEFU
SSwgVklTSE5VIFZBUkRIQU4gUkFPCj4gPiA+ID4gPFZpc2hudXZhcmRoYW5yYW8uUmF2dWxhcGF0
aUBhbWQuY29tPgo+ID4gPiA+IENjOiBSQVZVTEFQQVRJLCBWSVNITlUgVkFSREhBTiBSQU8KPiA+
ID4gPiA8VmlzaG51dmFyZGhhbnJhby5SYXZ1bGFwYXRpQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4
YW5kZXIKPiA+ID4gPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IExpYW0gR2lyZHdvb2QK
PiA+IDxsZ2lyZHdvb2RAZ21haWwuY29tPjsKPiA+ID4gPiBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+OyBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6PjsKPiA+ID4gPiBUYWth
c2hpIEl3YWkgPHRpd2FpQHN1c2UuY29tPjsgTXVrdW5kYSwgVmlqZW5kYXIKPiA+ID4gPiA8Vmlq
ZW5kYXIuTXVrdW5kYUBhbWQuY29tPjsgTWFydXRoaSBTcmluaXZhcyBCYXl5YXZhcmFwdQo+ID4g
PiA+IDxNYXJ1dGhpLkJheXlhdmFyYXB1QGFtZC5jb20+OyBNZWh0YSwgU2FuanUKPiA+IDxTYW5q
dS5NZWh0YUBhbWQuY29tPjsKPiA+ID4gPiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5v
bmljYWwuY29tPjsgRGFuIENhcnBlbnRlcgo+ID4gPiA+IDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+OyBtb2RlcmF0ZWQgbGlzdDpTT1VORCAtIFNPQyBMQVlFUiAvCj4gPiA+ID4gRFlOQU1JQyBB
VURJTyBQT1dFUiBNQU5BR0VNLi4uIDxhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc+Owo+ID4g
b3Blbgo+ID4gPiA+IGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiA+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzddIEFTb0M6IGFtZDogUmVnaXN0ZXJpbmcgZGV2aWNlIGVu
ZHBvaW50cwo+ID4gPiA+IHVzaW5nIE1GRCBmcmFtZXdvcmsKPiA+ID4gPgo+ID4gPiA+IE9uIFR1
ZSwgMDEgT2N0IDIwMTksIHZpc2hudSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gSGkgSm9uZXMs
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBhbSB2ZXJ5IFRoYW5rZnVsIHRvIHlvdXIgcmV2aWV3IGNv
bW1lbnRzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFjdHVhbGx5IFRoZSBkcml2ZXIgaXMgbm90IHRv
dGFsbHkgYmFzZWQgb24gTUZELiBJdCBqdXN0IHVzZXMKPiA+ID4gPiA+IG1mZF9hZGRfaG90cGx1
Z19kZXZpY2VzKCkgYW5kIG1mZF9yZW1vdmVfZGV2aWNlcygpIGZvciBhZGRpbmcKPiA+IHRoZQo+
ID4gPiA+ID4gZGV2aWNlcyBhdXRvbWF0aWNhbGx5Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlbWFp
bmluZyBjb2RlIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggTUZEIGZyYW1ld29yay4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTbyBJIHRob3VnaHQgSXQgd291bGQgbm90IGJyZWFrIHRoZSBjb2Rpbmcgc3R5
bGUgYW5kIG1vdmVkIGFoZWFkCj4gPiA+ID4gPiBieSB1c2luZyB0aGUgTUZEIEFQSSBieSBhZGRp
bmcgaXRzIGhlYWRlciBmaWxlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IElmIGl0IGlzIGFueSB2aW9s
YXRpb24gb2YgY29kaW5nIHN0YW5kYXJkIHRoZW4gSSBjYW4gbW92ZSBpdCB0bwo+ID4gPiA+ID4g
ZHJpdmVycy9tZmQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBwYXRjaCBjb3VsZCBiZSBhIHNo
b3cgc3RvcHBlciBmb3IgdXMuUGxlYXNlIHN1Z2dlc3QgdXMgaG93Cj4gPiA+ID4gPiBjYW4gd2Ug
bW92ZSBhaGVhZCBBU0FQLgo+ID4gPiA+Cj4gPiA+ID4gRWl0aGVyIG1vdmUgdGhlIE1GRCBwYXJ0
cyB0byBkcml2ZXJzL21mZCwgb3Igc3RvcCB1c2luZyB0aGUgTUZEIEFQSS4KPiA+ID4KPiA+ID4g
VGhlcmUgYXJlIG1vcmUgZHJpdmVycyBvdXRzaWRlIG9mIGRyaXZlcnMvbWZkIHVzaW5nIHRoaXMg
QVBJIHRoYW4KPiA+ID4gZHJpdmVycyBpbiBkcml2ZXJzL21mZC4KPiA+IAo+ID4gUGVvcGxlIGRv
IHdyb25nIHRoaW5ncyBhbGwgdGhlIHRpbWUuICBJdCBkb2Vzbid0IG1ha2UgdGhlbSByaWdodC4K
PiA+IAo+ID4gPiBJbiBhIGxvdCBvZiBjYXNlcyBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbW92
ZSB0aGUgZHJpdmVyIHRvIGRyaXZlcnMvbWZkLgo+ID4gCj4gPiBJbiB0aG9zZSBjYXNlcywgdGhl
IHBsYXRmb3JtX2RldmljZV8qKCkgQVBJIHNob3VsZCBiZSB1c2VkLgo+IAo+IFdoeSBkbyB3ZSBo
YXZlIGJvdGg/ICBJdCdzIG5vdCBjbGVhciB0byBtZSBvbiB3aGVuIHdlIHNob3VsZCB1c2Ugb25l
CgpUaGUgcGxhdGZvcm1fZGV2aWNlXyooKSBBUEkgaXMgdGhlIGRlIGZhY3RvIEFQSSB0byB1c2Ug
Zm9yIHJlZ2lzdGVyaW5nCmRldmljZXMuICBtZmRfKigpIGlzIGEgZnJhbWV3b3JrIGJ1aWx0IG9u
LXRvcCBvZiB0aGF0IGZvciBkZXZpY2VzCndoaWNoIHJlZ2lzdGVyIHN1Yi1kZXZpY2VzIHRoYXQg
ZG8gbm90IHJlYXNvbmFibHkgcmVzaWRlIGVsc2V3aGVyZS4KClRoZSBtZmRfKigpIGhlbHBlciBm
dW5jdGlvbnMgc2hvdWxkIG9ubHkgYmUgdXNlZCBieSBNRkQgZGV2aWNlcy4KCj4gdnMgdGhlIG90
aGVyLiAgVGhlc2UgYXJlIG5vdCBwbGF0Zm9ybXMgcGVyIHNlLCB0aGV5IGFyZSBQQ0kgZGV2aWNl
cwo+IHRoYXQgaGFwcGVuIHRvIGhhdmUgb3RoZXIgZGV2aWNlcyBvbiB0aGVtLiAgT24gcHJldmlv
dXMgcHJvamVjdHMsIEkKPiB3YXMgdG9sZCB0byB1c2UgbWZkIGFuZCBubyBvYmplY3Rpb25zIHdl
cmUgcmFpc2VkIGF0IHRoYXQgdGltZS4KCldobyB0b2xkIHlvdSB0byB1c2UgTUZEIEFQSSBvdXRz
aWRlIG9mIGRyaXZlcnMvbWZkPyAgVGhhdCdzIGEgaGFjay4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3
aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
