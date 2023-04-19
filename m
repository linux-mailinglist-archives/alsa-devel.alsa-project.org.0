Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9326E7226
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 06:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C12EAF;
	Wed, 19 Apr 2023 06:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C12EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681877655;
	bh=wCfGrGgIqDYJIarsMFBzN1CGRGBWo+SaYw60/7LMBJg=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jzcIPLcrD609bggprjjazNdKJq+zCDcxtJ/hW3QLCgWe+CUMhJ+Eg3CXlAQY4SMXl
	 t2kI88sv28k06bLHPJ9tE2PK34n8qgOj7JadNDF8aXjX0jzmbXwgjn0//BMtIAcu7u
	 f4xgj8afzCFPEo4CGftPsWVfv8t29fToYQue5iOE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9680F80149;
	Wed, 19 Apr 2023 06:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E405F80155; Wed, 19 Apr 2023 06:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64D8AF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 06:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D8AF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XMIwSffg
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f0a80b686eso18838895e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 21:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877592; x=1684469592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0akbJljmojF3UJNSUOLXeu8f3O++7bqonY0yv+A1TrU=;
        b=XMIwSffgsGWjELoKkkm698JTXva7wRaUxD245dGJdtvmwZe4HSog5T6nxs8g6QraRl
         8elWDC/a5LMy2iF2eSnljf8f09kg8AaBqLNQMAQ5+Fl7MJe5PtuCG5nF6ZsaCmaw4VBF
         a5g6A2GH1AUgyCYga8ATIXJRSND/TT4jtMTQ8gvgrwNHX4gAHTFajG5vdMa+xlbU2zjg
         rn1hfOE/e0+zM2iJ+EVZ/ZpBeXk+CyIiWjdZAdLUsk8AJZBqNdpRl9LYcRCNIMj8icfq
         OAJUqzF/vZLLiqbrGwB/Bd8LyfjwBbs/IqGzXyq/LkwJAOnoGnZ7epkqURMTkZvWxV6u
         CMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877592; x=1684469592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0akbJljmojF3UJNSUOLXeu8f3O++7bqonY0yv+A1TrU=;
        b=dHsv95yFuXTEoAExIBUfQGu4OOVVoN4Yh55WSx4srpTr+bawl44nB49lwAcLABMEWT
         N75S+2z//9Nrhn81ZQEtgCMr64RSMWHAZxmZZZ2O9F2d3D/Bc4dNI7H2PCErDuXlEj/W
         rXBHHznffUCth2MIM5XnrjATSH41lg2xGfr/F/uLYnqGaqRMD6VQstAypq006JVYaIzW
         Uc+MVLmoOJSkFse+jmL3kPzwHeamS1chxJeWuznyVSceCosSqqBfPFBbfRba7h15bbiT
         RZ4lz5HQsNAv9R0mQq6QJBUJHAUXNnMS1YBVdmV18duA0/02fazwpNGMjQjJiDYj1NR9
         yC2A==
X-Gm-Message-State: AAQBX9cOTXYBUhXl2XtC/VhfpjVBiCsBW9Xabhdajyie4XdBdIcmEEtg
	Gl9c7uk+a1U9s0QpW9vQLYsKubLh+7kq6Dh1GOgzfiI2NXs=
X-Google-Smtp-Source: 
 AKy350ZiAxYLGbvX9YTP+GPSMewg+Ha4vzTJrde1v7HprSxa3S1Bn0zu7KGPozGuiItBEeId16ueHNoV2fe+7Bdw3oM=
X-Received: by 2002:a5d:4492:0:b0:2c7:17b8:5759 with SMTP id
 j18-20020a5d4492000000b002c717b85759mr672199wrq.3.1681877591909; Tue, 18 Apr
 2023 21:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:13:00 +0800
Message-ID: 
 <CAA+D8AOX0Ad0U_6ZQhjGx+zMgr6TVkG53iesiX77pQcgnNFSFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Message-ID-Hash: PZUEARCZPYBZCY6DOV2FPM4FKYZMFIXN
X-Message-ID-Hash: PZUEARCZPYBZCY6DOV2FPM4FKYZMFIXN
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Natalia Petrova <n.petrova@fintech.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZUEARCZPYBZCY6DOV2FPM4FKYZMFIXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgOTozM+KAr1BNIE5pa2l0YSBaaGFuZGFyb3ZpY2ggPA0K
bi56aGFuZGFyb3ZpY2hAZmludGVjaC5ydT4gd3JvdGU6DQoNCj4gZG1hX3JlcXVlc3Rfc2xhdmVf
Y2hhbm5lbCgpIG1heSByZXR1cm4gTlVMTCB3aGljaCB3aWxsIGxlYWQgdG8NCj4gTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGVycm9yIGluICd0bXBfY2hhbi0+cHJpdmF0ZScuDQo+DQo+IENvcnJl
Y3QgdGhpcyBiZWhhdmlvdXIgYnksIGZpcnN0LCBzd2l0Y2hpbmcgZnJvbSBkZXByZWNhdGVkIGZ1
bmN0aW9uDQo+IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwoKSB0byBkbWFfcmVxdWVzdF9jaGFu
KCkuIFNlY29uZGx5LCBlbmFibGUNCj4gc2FuaXR5IGNoZWNrIGZvciB0aGUgcmVzdWxpbmcgdmFs
dWUgb2YgZG1hX3JlcXVlc3RfY2hhbigpLg0KPiBBbHNvLCBmaXggZGVzY3JpcHRpb24gdGhhdCBm
b2xsb3dzIHRoZSBlbmFjdGVkIGNoYW5nZXMgYW5kIHRoYXQNCj4gY29uY2VybnMgdGhlIHVzZSBv
ZiBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKCkuDQo+DQo+IEZpeGVzOiA3MDZlMmM4ODExNTgg
KCJBU29DOiBmc2xfYXNyY19kbWE6IFJldXNlIHRoZSBkbWEgY2hhbm5lbCBpZg0KPiBhdmFpbGFi
bGUgaW4gQmFjay1FbmQiKQ0KPiBDby1kZXZlbG9wZWQtYnk6IE5hdGFsaWEgUGV0cm92YSA8bi5w
ZXRyb3ZhQGZpbnRlY2gucnU+DQo+IFNpZ25lZC1vZmYtYnk6IE5pa2l0YSBaaGFuZGFyb3ZpY2gg
PG4uemhhbmRhcm92aWNoQGZpbnRlY2gucnU+DQo+DQoNCkFja2VkLWJ5OiBTaGVuZ2ppdSBXYW5n
IDxzaGVuZ2ppdS53YW5nQGdtYWlsLmNvbT4NCg0KQmVzdCByZWdhcmRzDQp3YW5nIHNoZW5naml1
DQoNCj4gLS0tDQo+ICBzb3VuZC9zb2MvZnNsL2ZzbF9hc3JjX2RtYS5jIHwgMTEgKysrKysrKyst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbF9hc3JjX2RtYS5jIGIvc291bmQvc29j
L2ZzbC9mc2xfYXNyY19kbWEuYw0KPiBpbmRleCAzYjgxYTQ2NTgxNGEuLjA1YTdkMTU4OGQyMCAx
MDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfYXNyY19kbWEuYw0KPiArKysgYi9zb3Vu
ZC9zb2MvZnNsL2ZzbF9hc3JjX2RtYS5jDQo+IEBAIC0yMDksMTQgKzIwOSwxOSBAQCBzdGF0aWMg
aW50IGZzbF9hc3JjX2RtYV9od19wYXJhbXMoc3RydWN0DQo+IHNuZF9zb2NfY29tcG9uZW50ICpj
b21wb25lbnQsDQo+ICAgICAgICAgICAgICAgICBiZV9jaGFuID0NCj4gc29jX2NvbXBvbmVudF90
b19wY20oY29tcG9uZW50X2JlKS0+Y2hhbltzdWJzdHJlYW0tPnN0cmVhbV07DQo+ICAgICAgICAg
ICAgICAgICB0bXBfY2hhbiA9IGJlX2NoYW47DQo+ICAgICAgICAgfQ0KPiAtICAgICAgIGlmICgh
dG1wX2NoYW4pDQo+IC0gICAgICAgICAgICAgICB0bXBfY2hhbiA9IGRtYV9yZXF1ZXN0X3NsYXZl
X2NoYW5uZWwoZGV2X2JlLCB0eCA/ICJ0eCIgOg0KPiAicngiKTsNCj4gKyAgICAgICBpZiAoIXRt
cF9jaGFuKSB7DQo+ICsgICAgICAgICAgICAgICB0bXBfY2hhbiA9IGRtYV9yZXF1ZXN0X2NoYW4o
ZGV2X2JlLCB0eCA/ICJ0eCIgOiAicngiKTsNCj4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIo
dG1wX2NoYW4pKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFp
bGVkIHRvIHJlcXVlc3QgRE1BIGNoYW5uZWwgZm9yDQo+IEJhY2stRW5kXG4iKTsNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgICAgICAgICAgICB9DQo+
ICsgICAgICAgfQ0KPg0KPiAgICAgICAgIC8qDQo+ICAgICAgICAgICogQW4gRURNQSBERVZfVE9f
REVWIGNoYW5uZWwgaXMgZml4ZWQgYW5kIGJvdW5kIHdpdGggRE1BIGV2ZW50IG9mDQo+IGVhY2gN
Cj4gICAgICAgICAgKiBwZXJpcGhlcmFsLCB1bmxpa2UgU0RNQSBjaGFubmVsIHRoYXQgaXMgYWxs
b2NhdGVkIGR5bmFtaWNhbGx5Lg0KPiBTbyBubw0KPiAgICAgICAgICAqIG5lZWQgdG8gY29uZmln
dXJlIGRtYV9yZXF1ZXN0IGFuZCBkbWFfcmVxdWVzdDIsIGJ1dCBnZXQNCj4gZG1hX2NoYW4gb2YN
Cj4gLSAgICAgICAgKiBCYWNrLUVuZCBkZXZpY2UgZGlyZWN0bHkgdmlhIGRtYV9yZXF1ZXN0X3Ns
YXZlX2NoYW5uZWwuDQo+ICsgICAgICAgICogQmFjay1FbmQgZGV2aWNlIGRpcmVjdGx5IHZpYSBk
bWFfcmVxdWVzdF9jaGFuLg0KPiAgICAgICAgICAqLw0KPiAgICAgICAgIGlmICghYXNyYy0+dXNl
X2VkbWEpIHsNCj4gICAgICAgICAgICAgICAgIC8qIEdldCBETUEgcmVxdWVzdCBvZiBCYWNrLUVu
ZCAqLw0KPg0K
