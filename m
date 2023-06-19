Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA57349FB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 04:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1936C836;
	Mon, 19 Jun 2023 04:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1936C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687140968;
	bh=kJlioqJHChCAJ71Sbdir42Rq+KUBWFfGdXMlf2RQ6eU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PJ6ya6KtjrPN5hLHsPQGdsEwc8b+CQsxn1AMeX3qccEJdFi+Gexf+oaQl0ldfuJib
	 ztJjK0JSLPUuOVI4e7oRt3UOAgncFpMbNRQR4gffWBio/MJQ9ikheRxJEqHAtBCSTk
	 faOZP+4bFnRnOzpMR62Y0quB55YWUpYoK2etJs9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B441AF80132; Mon, 19 Jun 2023 04:15:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A3FF80130;
	Mon, 19 Jun 2023 04:15:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55AAEF80132; Mon, 19 Jun 2023 04:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75A3AF800E5
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 04:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75A3AF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=qL6SLh1l
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-543b17343baso1252903a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Jun 2023 19:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687140885; x=1689732885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w0uvLTYVJ3T8cSG1TwSPs0VLhCp5ZmVWs5OHrwQBj5I=;
        b=qL6SLh1l2LBqXHCU8V1cfuypozqvTQSDxG4vhGTYQ8bbgGJgIrX4fx4GwxkMyXYs2F
         EZGgjSpoXSdk5PtW6Zh7mpkLHlaFa3iYjRq1CAq0/Gmj9PUpe5TFUk3+auHsOtnEUa5X
         rSjMjlHj0MIvkeph5j1AJrUvXd7aq97hTVf1f/qksrR5ofKe33zu4Wrt0sVS5jb4Uu0D
         igPQbZRTowdtv7pBn61WJAEnVH1ictkAjNcbzQKLWst/oqCUsvLlvG/EsmQqWB52ZlXf
         nq+DvNzeNlGN4i3QkG5FfPvtIV4C2iXtt4oX/cLU7Hoh3OUr4hKEgehLuNLFLC+WaLzh
         NArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687140885; x=1689732885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0uvLTYVJ3T8cSG1TwSPs0VLhCp5ZmVWs5OHrwQBj5I=;
        b=QQFzqJd49jPnNs0552/X6/8Hdo7IeGufbPl9pqicZBStL7stuscalTYIXDozD6rG7u
         y5+BgreE9lnpEh0NZKYvilXbTgRjh624E2wxxXQ5Cr9Zpca0XjAkQdJ9z5LGdWypV0LB
         z2k7wIQND8wnQzduSqqVBkn6cHIRlSbzyTestIAt6ZnvgfR4mby7721G6eRX9chJNGN/
         /W5KmFzUHNmCAxGCepQUDqSNO074svlhg5It3HC3ZLSFtGydB625avspLS0s75IduseL
         3BntlxqF/y9EndvhjGiFm6hInTIgRpfldfkeBhQyYEvO6haPezIfrJCVrEhVjkpfklmC
         mU3w==
X-Gm-Message-State: AC+VfDzf3/3w+jIhyZjnq0yv71dR3PI44SJC1ntLF6rEImQqinJQlLpL
	yEqrKqgEUNpyOWKtGv1AlYIOXG9dchVI9CHUzqs=
X-Google-Smtp-Source: 
 ACHHUZ6mqbsOaVJDJQRBG23wENKFPy4oTQXM31UIqXXsp/G2AcP0kHvV25mS5byRqp1s8A9Br6UgyBR2rBWepPkkmyg=
X-Received: by 2002:a05:6a21:6d88:b0:11d:5b5d:ddf0 with SMTP id
 wl8-20020a056a216d8800b0011d5b5dddf0mr6206344pzb.49.1687140884957; Sun, 18
 Jun 2023 19:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230614121509.443926-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230614121509.443926-1-claudiu.beznea@microchip.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jun 2023 10:14:33 +0800
Message-ID: 
 <CAA+D8APLC5jk2jFmeT6HEP84Hr8XdL5gqiopZDUrz0sSB+7JOw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: check return value of devm_kasprintf()
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-imx@nxp.com, viorel.suman@nxp.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Message-ID-Hash: AJ63XGOE6LG4K7FK3LAFE2MHZSCODTRD
X-Message-ID-Hash: AJ63XGOE6LG4K7FK3LAFE2MHZSCODTRD
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
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJ63XGOE6LG4K7FK3LAFE2MHZSCODTRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgODoxNeKAr1BNIENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1
LmJlem5lYUBtaWNyb2NoaXAuY29tPg0Kd3JvdGU6DQoNCj4gZGV2bV9rYXNwcmludGYoKSByZXR1
cm5zIGEgcG9pbnRlciB0byBkeW5hbWljYWxseSBhbGxvY2F0ZWQgbWVtb3J5Lg0KPiBQb2ludGVy
IGNvdWxkIGJlIE5VTEwgaW4gY2FzZSBhbGxvY2F0aW9uIGZhaWxzLiBDaGVjayBwb2ludGVyIHZh
bGlkaXR5Lg0KPiBJZGVudGlmaWVkIHdpdGggY29jY2luZWxsZSAoa21lcnIuY29jY2kgc2NyaXB0
KS4NCj4NCj4gRml4ZXM6IGI4NmVmNTM2Nzc2MSAoIkFTb0M6IGZzbDogQWRkIEF1ZGlvIE1peGVy
IG1hY2hpbmUgZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVk
aXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQo+DQoNCkFja2VkLWJ5OiBTaGVuZ2ppdSBXYW5nIDxz
aGVuZ2ppdS53YW5nQGdtYWlsLmNvbT4NCg0KQmVzdCByZWdhcmRzDQpXYW5nIHNoZW5naml1DQoN
Cj4gLS0tDQo+DQo+IEhpLA0KPg0KPiBUaGlzIGhhcyBiZWVuIGFkZHJlc3NlZCB1c2luZyBrbWVy
ci5jb2NjaSBzY3JpcHQgcHJvcG9zZWQgZm9yIHVwZGF0ZQ0KPiBhdCBbMV0uDQo+DQo+IFRoYW5r
IHlvdSwNCj4gQ2xhdWRpdSBCZXpuZWENCj4NCj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIzMDUzMDA3NDA0NC4xNjAzNDI2LTEtY2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbS8NCj4NCj4gIHNvdW5kL3NvYy9mc2wvaW14LWF1ZG1peC5jIHwgOSArKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9mc2wvaW14LWF1ZG1peC5jIGIvc291bmQvc29jL2ZzbC9pbXgtYXVkbWl4LmMNCj4gaW5k
ZXggMmM1N2ZlOWQyZDA4Li5hZjA2MjY4ZWU1N2IgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9m
c2wvaW14LWF1ZG1peC5jDQo+ICsrKyBiL3NvdW5kL3NvYy9mc2wvaW14LWF1ZG1peC5jDQo+IEBA
IC0yMjgsNiArMjI4LDggQEAgc3RhdGljIGludCBpbXhfYXVkbWl4X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+DQo+ICAgICAgICAgICAgICAgICBkYWlfbmFtZSA9IGRl
dm1fa2FzcHJpbnRmKCZwZGV2LT5kZXYsIEdGUF9LRVJORUwsICIlcyVzIiwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmVfbmFtZV9wcmVmLCBhcmdzLm5wLT5m
dWxsX25hbWUNCj4gKyAxKTsNCj4gKyAgICAgICAgICAgICAgIGlmICghZGFpX25hbWUpDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPg0KPiAgICAgICAgICAgICAg
ICAgZGV2X2luZm8ocGRldi0+ZGV2LnBhcmVudCwgIkRBSSBGRSBuYW1lOiVzXG4iLCBkYWlfbmFt
ZSk7DQo+DQo+IEBAIC0yMzYsNiArMjM4LDggQEAgc3RhdGljIGludCBpbXhfYXVkbWl4X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNhcHR1cmVfZGFpX25hbWUgPQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRldm1fa2FzcHJpbnRmKCZwZGV2LT5kZXYsIEdGUF9LRVJORUwsICIlcw0KPiAlcyIsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGFpX25hbWUsICJD
UFUtQ2FwdHVyZSIpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNhcHR1cmVfZGFp
X25hbWUpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07
DQo+ICAgICAgICAgICAgICAgICB9DQo+DQo+ICAgICAgICAgICAgICAgICBwcml2LT5kYWlbaV0u
Y3B1cyA9ICZkbGNbMF07DQo+IEBAIC0yNjMsNiArMjY3LDggQEAgc3RhdGljIGludCBpbXhfYXVk
bWl4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJBVURNSVgtUGxheWJhY2stJWQiLCBpKTsNCj4g
ICAgICAgICAgICAgICAgIGJlX2NwID0gZGV2bV9rYXNwcmludGYoJnBkZXYtPmRldiwgR0ZQX0tF
Uk5FTCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFVRE1JWC1D
YXB0dXJlLSVkIiwgaSk7DQo+ICsgICAgICAgICAgICAgICBpZiAoIWJlX25hbWUgfHwgIWJlX3Bi
IHx8ICFiZV9jcCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+
DQo+ICAgICAgICAgICAgICAgICBwcml2LT5kYWlbbnVtX2RhaSArIGldLmNwdXMgPSAmZGxjWzJd
Ow0KPiAgICAgICAgICAgICAgICAgcHJpdi0+ZGFpW251bV9kYWkgKyBpXS5jb2RlY3MgPSAmZGxj
WzNdOw0KPiBAQCAtMjg3LDYgKzI5Myw5IEBAIHN0YXRpYyBpbnQgaW14X2F1ZG1peF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgICAgICAgICAgICAgICAgcHJpdi0+
ZGFwbV9yb3V0ZXNbaV0uc291cmNlID0NCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2bV9r
YXNwcmludGYoJnBkZXYtPmRldiwgR0ZQX0tFUk5FTCwgIiVzICVzIiwNCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZGFpX25hbWUsICJDUFUtUGxheWJhY2siKTsNCj4g
KyAgICAgICAgICAgICAgIGlmICghcHJpdi0+ZGFwbV9yb3V0ZXNbaV0uc291cmNlKQ0KPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gKw0KPiAgICAgICAgICAgICAg
ICAgcHJpdi0+ZGFwbV9yb3V0ZXNbaV0uc2luayA9IGJlX3BiOw0KPiAgICAgICAgICAgICAgICAg
cHJpdi0+ZGFwbV9yb3V0ZXNbbnVtX2RhaSArIGldLnNvdXJjZSAgID0gYmVfcGI7DQo+ICAgICAg
ICAgICAgICAgICBwcml2LT5kYXBtX3JvdXRlc1tudW1fZGFpICsgaV0uc2luayAgICAgPSBiZV9j
cDsNCj4gLS0NCj4gMi4zNC4xDQo+DQo+DQo=
