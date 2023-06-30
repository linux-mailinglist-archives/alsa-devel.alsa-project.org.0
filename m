Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C873774456A
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jul 2023 01:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 646711F1;
	Sat,  1 Jul 2023 01:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 646711F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688169362;
	bh=AHmNQxLTObikLsLoMkkqz0zd4EdIDYpno+ei3/HGNhQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ev+oKugw5NKNhmBMsC75sSo183aOiAOMDTL2HPBHAWpDNSsf/rWzEZSYhpfRoehZk
	 QhsL5gyqJ0vepwz4S3bLEpIdwSz8yhqMY5UQnWEHMOYiaVx78ZEsIbRwxtK4D53Xt6
	 vT4RnFI9AT517qVnHZm6z5gyl/oe2Vr8Iue4ocZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A999AF8027B; Sat,  1 Jul 2023 01:54:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA3DF80212;
	Sat,  1 Jul 2023 01:54:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B038AF80246; Sat,  1 Jul 2023 01:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 227FBF80093
	for <alsa-devel@alsa-project.org>; Sat,  1 Jul 2023 01:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 227FBF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=KVVhPg1O;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CegcoqFh
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4FA405C0174;
	Fri, 30 Jun 2023 19:54:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 30 Jun 2023 19:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1688169271; x=1688255671; bh=AHmNQxLTObikLsLoMkkqz0zd4EdIDYpno+e
	i3/HGNhQ=; b=KVVhPg1O3wIGUi7WOG6U9EyeWNw9DKGNQgJDa6dJ3Lg09PvwRcs
	VSNb+c2TeTyNNX+I6Ql6PFV7rQtwHun1oR0PsNyctztiy4wG8Hc0ipYTlG66srlO
	LKURgP/+mxUoa7aiwf8zSbiUA0aPF7A8SbcLF0Q8HWFf2H9UtPWxge2PQ+sZaPyx
	GA4z5gd24NCrWiRxZqQ+qRpTFyq3qa1TWMoPEnePXEsv7G6f6bgE17/ElIPww5cr
	7F42Jap5KYcbyuVwy6lRq2ZZfU7sGc0lD3WL2jIXrb4HjlAzPDa0D2YuuoiXqCbe
	phvoaOw+ZvFtaJunDOiYgH4bzozV0vQgGUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1688169271; x=1688255671; bh=AHmNQxLTObikLsLoMkkqz0zd4EdIDYpno+e
	i3/HGNhQ=; b=CegcoqFhf2tioYAhBNbyXXINn3oSlW0vYnLqriV97eRuQRgZNKl
	YN1kL5NFJmUjOawF7JvtT5wx8VqgAnhIPAyZ5Iu/ISbKOg7B4U/+vbmebqPbCHGw
	pftaMPsCObmCSp97/CIUV8WU6Kg21FrGYUowzS62Vj43yUgZy8TR0snuYbGEmPZG
	BElneYVgaee06hBMMYM7pzz9obrrAz+lWMn7GA++kCR67knMFeo2HzFBAZaGzH/o
	H6yilZ1gUf2W/g+HDGB2qRt4ZTQ3BNCRH0vUE5+IrP3ojfKUi8XFxdlXC/iWdsGI
	SVOH2LcULjxHFjgjcZqpwLNJWq374iZ7JVg==
X-ME-Sender: <xms:NmufZKKCn6mIqJ5bQ_59vakg8g7Jdo15iBUE8Hv5s3ibVKc_o0pPsQ>
    <xme:NmufZCJHlrn4qt68z05fj4LJAbzzKcm6PYVmtUFO8KnDtJ_nWzsMeFPFfNGHP4q91
    -saGdTQFgHfOvfVTLg>
X-ME-Received: 
 <xmr:NmufZKstnQ-_1gwCcru0762T9sYcBFjqvcAFqMBCmPN2qUQdh9WhpqAWEHoFZgqW7eBTrQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdejgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthgsredttderjeenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epfffgfeeiudeutdeftdevudeflefhffdukedttdevtddvveegfeevleeutdetgfeknecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:NmufZPZ_e4V1BdTKTRyf-62xG3xBTRTi_6DkC5yPOpaRjLH3vr6n6A>
    <xmx:NmufZBZEmFHlgtyR1WSdO2BmwR9tDwuKaPD__VYqy8kfVJuxu-LjCg>
    <xmx:NmufZLBdL-StYn1KTb6rQOKykPGbuP9PMRLTkKBMltEu8mIuWwJqOQ>
    <xmx:N2ufZEzPAqxkRO-Vu1ZjtgEULLGwpEZTMkMvUk24MszWSaDNXzFyxw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 19:54:27 -0400 (EDT)
Message-ID: <edee8624d54d92fdf8de1ae98bb6f2c2c5c08506.camel@ljones.dev>
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
From: Luke Jones <luke@ljones.dev>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, sbinding@opensource.cirrus.com,
 andy.chi@canonical.com, tangmeng@uniontech.com,
 alsa-devel@alsa-project.org,  linux-kernel@vger.kernel.org
Date: Sat, 01 Jul 2023 11:54:22 +1200
In-Reply-To: <87h6qpcq0i.wl-tiwai@suse.de>
References: <20230630043106.914724-1-luke@ljones.dev>
	 <20230630043106.914724-2-luke@ljones.dev> <87h6qpcq0i.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 (by Flathub.org) 
MIME-Version: 1.0
Message-ID-Hash: QFZZCKGJW7FPWCKTX4SGV2KADHY2UQXQ
X-Message-ID-Hash: QFZZCKGJW7FPWCKTX4SGV2KADHY2UQXQ
X-MailFrom: luke@ljones.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFZZCKGJW7FPWCKTX4SGV2KADHY2UQXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gRnJpLCAyMDIzLTA2LTMwIGF0IDEwOjI5ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4g
T24gRnJpLCAzMCBKdW4gMjAyMyAwNjozMTowNSArMDIwMCwKPiBMdWtlIEQuIEpvbmVzIHdyb3Rl
Ogo+ID4gCj4gPiAtLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwo+ID4gKysrIGIv
c291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKPiA+IEBAIC01ODgzLDcgKzU4ODMsNyBAQCBz
dGF0aWMgdm9pZAo+ID4gYWxjX2ZpeHVwX2hlYWRzZXRfbW9kZV9hbGMyNTVfbm9faHBfbWljKHN0
cnVjdCBoZGFfY29kZWMgKmNvZGVjLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3BlYy0+cGFyc2VfZmxhZ3MgfD0gSERBX1BJTkNGR19IRUFEU0VU
X01JQzsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWxjMjU1X3NldF9kZWZh
dWx0X2phY2tfdHlwZShjb2RlYyk7Cj4gPiAtwqDCoMKgwqDCoMKgwqB9IAo+ID4gK8KgwqDCoMKg
wqDCoMKgfQo+ID4gwqDCoMKgwqDCoMKgwqDCoGVsc2UKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYWxjX2ZpeHVwX2hlYWRzZXRfbW9kZShjb2RlYywgZml4LCBhY3Rpb24pOwo+
ID4gwqB9Cj4gCj4gVGhpcyBjaGFuZ2UgbG9va3MgaXJyZWxldmFudC7CoCBDb3VsZCB5b3UgZHJv
cCBpdD8KPiBJZiBpdCBuZWVkcyB0byBiZSBmaXhlZCwgcHV0IGluIGFub3RoZXIgY2xlYW51cCBw
YXRjaC4KPiAKPiAKPiB0aGFua3MsCj4gCj4gVGFrYXNoaQoKTG9va3MgbGlrZSBpdCB3YXMgYSB3
aGl0ZXNwYWNlIHRoaW5nIHRoYXQgZ290IGNhdWdodCB3aGVuIHNhdmVkIGluIG15CmVkaXRvci4g
SSdsbCBkcm9wIGFuZCBzZW5kIGNsZWFudXAuCg==

