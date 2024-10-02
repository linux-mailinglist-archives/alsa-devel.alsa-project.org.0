Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A20995175
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 16:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E88484A;
	Tue,  8 Oct 2024 16:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E88484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728397425;
	bh=iNx8QhebqtKgA1DFPtqAnefK2Jxmv7jM6AKdbh54cBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DG36sDABaaUxRpgrDBms7+8GgogogJZ3kAKPy5QJUeuh+sYVBTl23FeFETghXeEzy
	 um2lDNTl6I1By0xXvnZVuJWARapQc8du3LD6O6BuTOvlb6y85NGD87903NYeFHvyHd
	 prPZ2ejIlGTUnd41hFdH4HaMMx/q6TSJeZ2Nx098=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F4BF806F2; Tue,  8 Oct 2024 16:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C481F806FC;
	Tue,  8 Oct 2024 16:21:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68921F80517; Wed,  2 Oct 2024 17:26:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DE07F800C9
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 17:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DE07F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hoRNigk9
Received: by mail-pg1-x542.google.com with SMTP id
 41be03b00d2f7-7e6ba3f93fdso4281459a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Oct 2024 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727882777; x=1728487577;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e08fOABoO2/9HhG+qmutW6dx4wAzzxU7lCeUDy/HDU4=;
        b=hoRNigk9T3sFAaLXrXCjWn/aUZADQ5EtrZezHLxfNfUiS3Dp8ihaWEf4Fbed2iRPZr
         y0i+wJvoTOQ4EnAKdgPcV/qimWg008mD/H4IlKVvJc5Gri32F9D2iTbmZoeznGoPGU80
         kLCoIBtafw1OtbkI1iJp9fl1/VcVKcJHAwaF8svDgHcU02fq9aGxf9vOZhRTvTwJNkOf
         g1ciootPTxWBbm7NkXM5y0y3cfyde/Jf3WP49eJ0nrVD/pPRqCnco60bjW0xC1yfAR4J
         woFFG2HTO0LHcjwOluR1tT4QRh7Q6wEyRL41tXVVo5VKGHSOhvNgPTGoAHiQ+IlD4EEl
         RXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882777; x=1728487577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e08fOABoO2/9HhG+qmutW6dx4wAzzxU7lCeUDy/HDU4=;
        b=RBVAF0JtRx4iUxb6J+bAWs+Mm9ArJuEplL8pGDTq1W7xyID0Q/Rdn8MKO6zG4LG5DM
         zHiEPAX+vPfq/IxsMyWHNtHKNaw4T4qhkGScg9R7ePjRrs6iZX4ivYa9AzJW4TbGj3dH
         gN9MWcaXVFsWirxE+bolwkEr5aZdhPi143O6EkFOZPMglRltDFHKmwe4Cfe7f+6iIEcZ
         LF7ukF2rHzcDloTGoWGyWt6eeb6DXTh0Mwqh3mhR0G44x3pLsrfNn9a58ZNK4DMltZ0O
         bzZLpUdK75CWbrAKXvRLE+PkThyAkkyzHiA5VdnO4GNW5BklFFw3mlwnz+x+HbB2zTFu
         jpBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMtqoSaYW+mvo/ypd9YaNxTCS8MPzSjMyj0BubNqFTVoKttBl6CVadbZa1Hlf9eTlvBpuh0HQ2WBhm@alsa-project.org
X-Gm-Message-State: AOJu0Yyke8XcEqmXmypnHCRjydr3uTczp1HDnZASkRQoPFAZ4B1fRG+k
	zpGYU1QNQFptfSTkzONk+6qFafWmuaIeveZ2+iWK0k0RpBSF1NcP/XSVJw7CU3cws8MLq/11pjC
	ka/vjL/jC0As/3W02T7o9CWIq8Ug=
X-Google-Smtp-Source: 
 AGHT+IEx0BtDjWygOA8ser5BZYF8YJct0hdxpBC+kGB6kkVQj/F3R/P28AfJtQd5snhZ8KWltTiv8MrloL0rPhKSEZQ=
X-Received: by 2002:a05:6a21:1519:b0:1cf:2d62:8584 with SMTP id
 adf61e73a8af0-1d5db209e4dmr6024982637.11.1727882777092; Wed, 02 Oct 2024
 08:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241001210209.2554-1-zichenxie0106@gmail.com>
 <33fa69c0-62c7-47bd-a740-acbde41e5b22@kernel.org>
In-Reply-To: <33fa69c0-62c7-47bd-a740-acbde41e5b22@kernel.org>
From: Zichen Xie <zichenxie0106@gmail.com>
Date: Wed, 2 Oct 2024 10:26:06 -0500
Message-ID: 
 <CANdh5G75h7NDEUQfWD_6_qEDV-OL9R9KtxzTbNX9u87gUSNR=w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenyuan0y@gmail.com, zzjas98@gmail.com, stable@vger.kernel.org
X-MailFrom: zichenxie0106@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DO3ZHJUFCZS6YIQTIAO5PPMRAZI4D6N5
X-Message-ID-Hash: DO3ZHJUFCZS6YIQTIAO5PPMRAZI4D6N5
X-Mailman-Approved-At: Tue, 08 Oct 2024 14:21:17 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DO3ZHJUFCZS6YIQTIAO5PPMRAZI4D6N5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pg0KPiBEcm9wLCB5b3UgY2Fubm90IHJlcG9ydCBvd24gd29yay4gVG8gd2hvbSBkbyB5b3UgcmVw
b3J0IGl0Pw0KDQpJJ2xsIGRyb3AgdGhlIHJlcG9ydCB0YWcgYW5kIHJlLWNvbW1pdC4gVGhhbmsg
eW91IGZvciB5b3VyIHN1Z2dlc3Rpb24hDQoNCiBXYXMgdGhpcyBjb21waWxlZD8gQmFzZWQgb24g
dGhlIHByZXZpb3VzIHdvcmsgSSBoYXZlIGRvdWJ0cy4NCg0KWWVzLCBpdCBjb21waWxlcy4gU29y
cnkgZm9yIHB1dHRpbmcgeW91IGludG8gc3VjaCBkb3VidHMuDQoNCg0KT24gV2VkLCBPY3QgMiwg
MjAyNCBhdCAxMjo0N+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4g
d3JvdGU6DQoNCj4gT24gMDEvMTAvMjAyNCAyMzowMiwgR2F4LWMgd3JvdGU6DQo+ID4gQSBkZXZt
X2t6YWxsb2MoKSBpbiBhc29jX3Fjb21fbHBhc3NfY3B1X3BsYXRmb3JtX3Byb2JlKCkgY291bGQN
Cj4gPiBwb3NzaWJseSByZXR1cm4gTlVMTCBwb2ludGVyLiBOVUxMIFBvaW50ZXIgRGVyZWZlcmVu
Y2UgbWF5IGJlDQo+ID4gdHJpZ2dlcnJlZCB3aXRob3V0IGFkZHRpb25hbCBjaGVjay4NCj4gPiBB
ZGQgYSBOVUxMIGNoZWNrIGZvciB0aGUgcmV0dXJuZWQgcG9pbnRlci4NCj4gPg0KPiA+IEZpeGVz
OiBiNTAyMmEzNmQyOGYgKCJBU29DOiBxY29tOiBscGFzczogVXNlIHJlZ21hcF9maWVsZCBmb3Ig
aTJzY3RsIGFuZA0KPiBkbWFjdGwgcmVnaXN0ZXJzIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaWNo
ZW4gWGllIDx6aWNoZW54aWUwMTA2QGdtYWlsLmNvbT4NCj4gPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZw0KPiA+IFJlcG9ydGVkLWJ5OiBaaWNoZW4gWGllIDx6aWNoZW54aWUwMTA2QGdtYWls
LmNvbT4NCj4NCj4gRHJvcCwgeW91IGNhbm5vdCByZXBvcnQgb3duIHdvcmsuIFRvIHdob20gZG8g
eW91IHJlcG9ydCBpdD8NCj4NCj4gV2FzIHRoaXMgY29tcGlsZWQ/IEJhc2VkIG9uIHRoZSBwcmV2
aW91cyB3b3JrIEkgaGF2ZSBkb3VidHMuDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQo+DQo+DQo=
