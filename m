Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90845E1BEF
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 15:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91B21662;
	Wed, 23 Oct 2019 15:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91B21662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571836364;
	bh=7brupA0NZbPosLTZgYSKMsX13Wo1FfNuyWIuqYKLY48=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2lwl5hTk9DYZwW8nTwiIu663fBWQFqAbg21Bg0efCYVsD6Ad0llGo+DP55GP/uQl
	 t7olr9RG+fOdojPjRfXgls/jAnl4HhgKN9g3smcSFNirVf8qZ0+phhv7oHMzDvyuIc
	 UBHmuHBbwm/YqQapUvzxN6sJBqdslRZ2L9qSCGJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4D4F80368;
	Wed, 23 Oct 2019 15:10:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D4AF80368; Wed, 23 Oct 2019 15:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A6F8F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 15:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A6F8F80274
Received: by mail-ed1-f67.google.com with SMTP id l25so4460796edt.6
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 06:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lzwXfyhUE7yc9zrzbjqMe71sKuHvjq9U3aqm0Bd1AoI=;
 b=tAmJKUeT0dUDh98opICxxxXWEF0jQWPHvFENMNOlJKFmDepWWI+c7HyfDOYShpkAbz
 suuN6kNSUBnlfO1/R+aisNGIOd9warU1oriNmT9w0UMDYKWa6EMXeEVzT+Mz9EeVfFks
 0vXtZMS74rnvu0cj/AGbripaktjaOvEzlzamBPVmjWN06t10nRpX3T4tgdYaGhk2sEa8
 Qb5f6TooyRPYdjOYBITvQjKNxT7Yq/IGldzTFj3KubLszEW3to2wRciPd5MhNXnfhDxF
 j9SblLkAqzI+qG0MVaZ05HzenA5NM3gLVjDdPNT9CnOx/cQe6KTDrI4ODpeykHzA2etZ
 x0wA==
X-Gm-Message-State: APjAAAWrOrdSwUsO82AfKnfUdiiJpez65IkkQCp2LlnBfMhxvCIfLMdy
 udJL5g7zwb4PYbEIlVd4oyQ=
X-Google-Smtp-Source: APXvYqyft44OcCGb0xN0+fC1gmfK8usNRgvA/I5KY4vuTv2zLifQ5kptU9qNo1AQahi2rM4m7Aa/dg==
X-Received: by 2002:aa7:c595:: with SMTP id g21mr36717915edq.79.1571836252860; 
 Wed, 23 Oct 2019 06:10:52 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id b12sm785479edq.75.2019.10.23.06.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 06:10:52 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:10:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023131049.GG11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010202802.1132272-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Lihua Yao <ylhuajnu@outlook.com>, Kukjin Kim <kgene@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>,
 linux-pwm@vger.kernel.org, Sergio Prado <sergio.prado@e-labworks.com>,
 linux-pm@vger.kernel.org, Lihua Yao <ylhuajnu@163.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/36] ARM: samsung platform cleanup
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTA6Mjg6MDJQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBJJ3ZlIHNwZW50IHNvbWUgdGltZSBsb29raW5nIGF0IHRoZSByZW1haW5pbmcgQVJN
djQvQVJNdjUgcGxhdGZvcm1zCj4gdGhhdCBhcmUgbm90IHBhcnQgb2YgQVJDSF9NVUxUSVBMQVRG
T1JNLCBhbmQgdHJpZWQgdG8gZ2V0IHRoZW0gY2xvc2VyCj4gdG8gdGhhdC4gSGVyZSBpcyB3aGF0
IGNhbWUgb3V0IG9mIHRoYXQgZm9yIHRoZSBzYW1zdW5nIHBsYXRmb3JtczoKPiAKPiAqIEV4eW5v
cyBhbmQgczVwdjIxMCBhcmUgbWFkZSBpbmRlcGVuZGVudCBvZiBwbGF0LXNhbXN1bmcKPiAqIGRl
dmljZSBkcml2ZXJzIHN0b3AgdXNpbmcgbWFjaC8qLmggaGVhZGVycyBmb3IgczNjMjR4eAo+ICAg
KGFuZCBvdGhlciBwbGF0Zm9ybXMgbm90IGluIHRoaXMgc2VyaWVzKQo+ICogczNjMjR4eCBhbmQg
czNjNjR4eCBnZXQgbWVyZ2VkIGludG8gbWFjaC1zM2MsIHJlbW92aW5nCj4gICB0aGUgbmVlZCBm
b3IgcGxhdC1zYW1zdW5nIChJIGhhdmUgb3RoZXIgcGF0Y2hlcyBmb3IgdGhlCj4gICByZW1haW5p
bmcgcGxhdC0qIGRpcmVjdG9yaWVzKQo+ICogbWFjaC9pby5oIGdldHMgY2xlYW5lZCB1cCB0byBv
bmx5IGJlIG5lZWRlZCBmb3IgQkFTVAo+ICAgUEMxMDQgbW9kZSAobG9va2luZyBmb3IgaWRlYXMg
dG8gcHJvY2VlZCkKPiAqIG1hY2gvaXJxcy5oIHJlbWFpbnMgZm9yIG5vdywgdGhpcyBzdGlsbCBu
ZWVkcyB0byBiZSBjb252ZXJ0ZWQKPiAgIHRvIHNwYXJzZSBJUlFzLgo+IAo+IFNvbWUgYml0cyBh
cmUgYSBsaXR0bGUgdWdseSwgYnV0IG92ZXJhbGwgSSB0aGluayB0aGlzIGEgYmlnCj4gaW1wcm92
ZW1lbnQuCj4gCj4gVGhlIGNvbnRlbnRzIGFyZSBhdmFpbGFibGUgZm9yIHRlc3RpbmcgaW4KPiAK
PiBnaXQ6Ly9rZXJuZWwub3JnOi9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXJuZC9wbGF5Z3Jv
dW5kLmdpdCBzM2MtbXVsdGlwbGF0Zm9ybQoKV2hlbiBzZW5kaW5nIHYyLCBjYW4geW91IENjOgoK
UGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29tPgpMaWh1YSBZYW8g
PHlsaHVham51QG91dGxvb2suY29tPgoob3IgTGlodWEgWWFvIDx5bGh1YWpudUAxNjMuY29tPiBp
ZiBvdXRsb29rLmNvbSBib3VuY2VzKQpTZXJnaW8gUHJhZG8gPHNlcmdpby5wcmFkb0BlLWxhYndv
cmtzLmNvbT4KU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgoKVGhl
c2UgYXJlIGZvbGtzIHdoaWNoIHRvIG15IGtub3dsZWRnZSBoYWQgd29ya2luZyBTM0MgYW5kIFM1
UCBib2FyZHMKc28gbWF5YmUgdGhleSBjb3VsZCBwcm92aWRlIHRlc3RpbmcuCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
