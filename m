Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2816B6D90
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 03:39:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FD2145C;
	Mon, 13 Mar 2023 03:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FD2145C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678675152;
	bh=z4Kdd4BO5IJI3bOIbH/4HiQdARN7pN2ix3iJ5IC07IA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OlAcUTE5zEirQ88RQD90FsmjQgYvtcPRGwJnXy/wAq98hwQ/NGG+SB6jhLJUaPmJE
	 fgCQzTSYoLjsw8ESVoPk5E8KfI9/gPsdibga/L5owP6UR1yRf+u5Do0QuZMbbxtktO
	 6o7Ek0iISgBqok1HZbzsZYY6Nwy9DuuEO/D69reA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 791A8F8032D;
	Mon, 13 Mar 2023 03:38:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8431F80423; Mon, 13 Mar 2023 03:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A13B8F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 03:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13B8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lgdcwdPU
Received: by mail-wr1-x42f.google.com with SMTP id q16so9936269wrw.2
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Mar 2023 19:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678674972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gDld+TDvRTSZpnOyaBdnpYWhKB/swJgkgw9s8jNhfk=;
        b=lgdcwdPUMoaQp60rxku2lJ1lImnE8twIQb496kuQAtbFzZgau7WxibL/x6JCTG47xW
         xBaFkwzzgsXeV4iGJ0acjTFaIU/Z39ou4fgp4AethteKLGjqpA08N6ylR2uLIY7PDsBU
         qL3Jhvs6EUfDRmXH4FhgigStfR+768t5wFl5ldcze/nOSVwS/vt5VoHdyU5+f8agwdvl
         cN6cP0X79ZqEVmkRJ6Ktb202h84KGX9OEoJiSGHZR9LvEMkbLb4zKknB3oDUmaVOAIz0
         MagHqngAqz+nJqBnl4UI1AmWWXpTisd1aRMNy0MKG8iJG4cpfl+oDMlo8imYQLwduL02
         kpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678674972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gDld+TDvRTSZpnOyaBdnpYWhKB/swJgkgw9s8jNhfk=;
        b=1gT8gid1t7q4VIBBlKUo4KF2toJ6CfyjZB15pd8FhU6BQ7IcwdSK5EpKbWr+dbRpZx
         R+/8+pSMWb5JDZBN/xDsNCP2ssmhYkWNQfCpC3Zrg4KjdPl7gcLc6GykkE9XAGVZsu6c
         y9E8LrSGtucGHbqesBnATFa2n8pbv1gGaPnwDjdEHYX7k6TMjXA3YPSA4c2iWWm5dqf3
         xgrQmE1u/7CHYa2SKhNWnAzqq5ImeSRjj9F88OTDc3E+Wq1E7Ub3uEBMCbuzCj5p4lCn
         OXHty0IEBnEZz8CHoOw7uQtV0rucywVUIvdkLID72jvtLlY9MFzm9/A+YP0kr6KKUqkj
         3Q6A==
X-Gm-Message-State: AO0yUKXX5XlFFZAVDrWCSpWHf8ntaBEU5vyvm0DyxUwP+MUjV8uqntj/
	CvpeifKMpuHMCrIuGy39A4HDlZbf6ShNy/X3Op4=
X-Google-Smtp-Source: 
 AK7set/bg3U6J8L17ysf60blRlBaV7THIzjNEIH16C6j48z9LNsKJtlq11r1yXrldCMACYsfRcBtztoe1KhpsDjCf8g=
X-Received: by 2002:adf:f584:0:b0:2cb:80af:e8ab with SMTP id
 f4-20020adff584000000b002cb80afe8abmr6952447wro.11.1678674972526; Sun, 12 Mar
 2023 19:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com>
 <875yb5frnl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yb5frnl.wl-kuninori.morimoto.gx@renesas.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Mar 2023 10:36:01 +0800
Message-ID: 
 <CAA+D8AOztY7Qp3hs3OOhKuhCDFzqWjSrk240S0CzLR7cg94GLA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix hw->formats cleared by
 soc_pcm_hw_init() for dpcm
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: WI4HTLWUM62JBAGKFK7RTDJPCN4Y7ASQ
X-Message-ID-Hash: WI4HTLWUM62JBAGKFK7RTDJPCN4Y7ASQ
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
CC: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI4HTLWUM62JBAGKFK7RTDJPCN4Y7ASQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkNCg0KT24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgNzo1OeKAr0FNIEt1bmlub3JpIE1vcmltb3Rv
IDwNCmt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPiB3cm90ZToNCg0KPg0KPiBIaSBT
aGVuZ2ppdQ0KPg0KPiA+IFRoZSBody0+Zm9ybWF0cyBtYXkgYmUgc2V0IGJ5IHNuZF9kbWFlbmdp
bmVfcGNtX3JlZmluZV9ydW50aW1lX2h3cGFyYW1zKCkNCj4gPiBpbiBjb21wb25lbnQncyBzdGFy
dHVwKCkvb3BlbigpLCBidXQgc29jX3BjbV9od19pbml0KCkgd2lsbCBpbml0DQo+ID4gaHctPmZv
cm1hdHMgaW4gZHBjbV9ydW50aW1lX3NldHVwX2ZlKCkgYWZ0ZXIgY29tcG9uZW50J3MNCj4gc3Rh
cnR1cCgpL29wZW4oKSwNCj4gPiB3aGljaCBjYXVzZXMgdGhlIHZhbHVhYmxlIGh3LT5mb3JtYXRz
IHRvIGJlIGNsZWFyZWQuDQo+ID4NCj4gPiBTbyBuZWVkIHRvIHN0b3JlIHRoZSBody0+Zm9ybWF0
cyBiZWZvcmUgaW5pdGlhbGl6YXRpb24sIHRoZW4gcmVzdG9yZQ0KPiA+IGl0IGFmdGVyIGluaXRp
YWxpemF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hlbmdqaXUgV2FuZyA8c2hlbmdq
aXUud2FuZ0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9zb2Mvc29jLXBjbS5jIHwgNCAr
KysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2Mvc29jLXBjbS5jIGIvc291bmQvc29jL3NvYy1wY20uYw0KPiA+IGlu
ZGV4IDVlYjA1NmI5NDJjZS4uNzk1OGM5ZGVmZDQ5IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3Nv
Yy9zb2MtcGNtLmMNCj4gPiArKysgYi9zb3VuZC9zb2Mvc29jLXBjbS5jDQo+ID4gQEAgLTE2NjEs
MTAgKzE2NjEsMTQgQEAgc3RhdGljIHZvaWQgZHBjbV9ydW50aW1lX3NldHVwX2ZlKHN0cnVjdA0K
PiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtKQ0KPiA+ICAgICAgIHN0cnVjdCBzbmRfcGNt
X2hhcmR3YXJlICpodyA9ICZydW50aW1lLT5odzsNCj4gPiAgICAgICBzdHJ1Y3Qgc25kX3NvY19k
YWkgKmRhaTsNCj4gPiAgICAgICBpbnQgc3RyZWFtID0gc3Vic3RyZWFtLT5zdHJlYW07DQo+ID4g
KyAgICAgdTY0IGZvcm1hdHMgPSBody0+Zm9ybWF0czsNCj4gPiAgICAgICBpbnQgaTsNCj4gPg0K
PiA+ICAgICAgIHNvY19wY21faHdfaW5pdChodyk7DQo+ID4NCj4gPiArICAgICBpZiAoZm9ybWF0
cykNCj4gPiArICAgICAgICAgICAgIGh3LT5mb3JtYXRzICY9IGZvcm1hdHM7DQo+ID4gKw0KPg0K
PiBJZiBteSB1bmRlcnN0YW5kaW5nIHdhcyBjb3JyZWN0LCBkcGNtX3J1bnRpbWVfc2V0dXBfZmUo
KSAoQikgaXMgY2FsbGVkDQo+IGFmdGVyIF9fc29jX3BjbV9vcGVuKCkgKEEpLCBhbmQgeW91IHVw
ZGF0ZWQgKEIpIHBhcnQuDQo+DQo+ICAgICAgICAgc3RhdGljIGludCBkcGNtX2ZlX2RhaV9zdGFy
dHVwKC4uLikgew0KPiAgICAgICAgICAgICAgICAgLi4uDQo+IChBKSAgICAgICAgICAgICByZXQg
PSBfX3NvY19wY21fb3BlbihmZSwgZmVfc3Vic3RyZWFtKTsNCj4gICAgICAgICAgICAgICAgIC4u
Lg0KPiAoQikgICAgICAgICAgICAgZHBjbV9ydW50aW1lX3NldHVwX2ZlKGZlX3N1YnN0cmVhbSk7
DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICB9DQo+DQo+IEJ1dCwgaXQgaXMgZG9p
bmcgc2FtZSB0aGluZ3MgdW5kZXIgKEEpLCB0b28uDQo+IERvIHdlIG5lZWQgdG8gaW5pdGlhbGl6
ZSBodyBtYW55IHRpbWVzID8gSSdtIG5vdCBzdXJlLg0KPiBDYW4gd2Ugc2ltcGx5IHJlbW92ZSBz
b2NfcGNtX2h3X2luaXQoKSBmcm9tIGRwY21fcnVudGltZV9zZXR1cF9mZSgpID8NCj4NCj4gKEEp
ICAgICBzdGF0aWMgaW50IF9fc29jX3BjbV9vcGVuKCkNCj4gICAgICAgICB7DQo+ICAgICAgICAg
ICAgICAgICAuLi4NCj4gKFgpICAgICAgICAgICAgIHNvY19wY21faW5pdF9ydW50aW1lX2h3KHN1
YnN0cmVhbSk7DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICB9DQo+DQoNCkhlcmUg
dGhlcmUgaXMgY29uZGl0aW9uOg0KDQogICAgICAgIC8qIER5bmFtaWMgUENNIERBSSBsaW5rcyBj
b21wYXQgY2hlY2tzIHVzZSBkeW5hbWljIGNhcGFiaWxpdGllcyAqLw0KICAgICAgICBpZiAocnRk
LT5kYWlfbGluay0+ZHluYW1pYyB8fCBydGQtPmRhaV9saW5rLT5ub19wY20pDQogICAgICAgICAg
ICAgICAgZ290byBkeW5hbWljOw0KDQogICAgICAgIC8qIENoZWNrIHRoYXQgdGhlIGNvZGVjIGFu
ZCBjcHUgREFJcyBhcmUgY29tcGF0aWJsZSAqLw0KICAgICAgICBzb2NfcGNtX2luaXRfcnVudGlt
ZV9odyhzdWJzdHJlYW0pOw0KDQp3aGljaCBvbmx5IGNhbGxzIHNvY19wY21faW5pdF9ydW50aW1l
X2h3KCkgZm9yIG5vbiBkcGNtIGNhc2UuDQoNClNvIHRoZSBpbml0aWFsaXphdGlvbiBvZiBodyBp
cyBub3QgbWFueSB0aW1lcy4NCg0KRm9yIGRwY20gdGhlIGNvZGUgaGVyZSB3aWxsIGJlIHNraXBw
ZWQuIFRoZSBpbml0aWFsaXphdGlvbiBoYXBwZW5zDQpvbmx5IGluIGRwY21fcnVudGltZV9zZXR1
cF9mZSgpLg0KDQpCZXN0IHJlZ2FyZHMNCldhbmcgc2hlbmdqaXUNCg0KDQo+IChYKSAgICAgc3Rh
dGljIHZvaWQgc29jX3BjbV9pbml0X3J1bnRpbWVfaHcoLi4uKQ0KPiAgICAgICAgIHsNCj4gPT4g
ICAgICAgICAgICAgIHU2NCBmb3JtYXRzID0gaHctPmZvcm1hdHM7DQo+DQo+IChZKSAgICAgICAg
ICAgICBzbmRfc29jX3J1bnRpbWVfY2FsY19odyhydGQsIGh3LCBzdWJzdHJlYW0tPnN0cmVhbSk7
DQo+DQo+ID0+ICAgICAgICAgICAgICBpZiAoZm9ybWF0cykNCj4gPT4gICAgICAgICAgICAgICAg
ICAgICAgaHctPmZvcm1hdHMgJj0gZm9ybWF0czsNCj4gICAgICAgICB9DQo+DQo+IChZKSAgICAg
aW50IHNuZF9zb2NfcnVudGltZV9jYWxjX2h3KC4uLikNCj4gICAgICAgICB7DQo+ICAgICAgICAg
ICAgICAgICAuLi4NCj4gPT4gICAgICAgICAgICAgIHNvY19wY21faHdfaW5pdChodyk7DQo+ICAg
ICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICB9DQo+DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBo
ZWxwICEhDQo+DQo+IEJlc3QgcmVnYXJkcw0KPiAtLS0NCj4gS3VuaW5vcmkgTW9yaW1vdG8NCj4N
Cg==
