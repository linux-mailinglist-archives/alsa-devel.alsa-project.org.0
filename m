Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9D47B3781
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 18:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53C4DF6;
	Fri, 29 Sep 2023 18:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53C4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696003746;
	bh=/oXvknkc57tHxQm8AD5SsJMkim9yBUgEvI1Bf2UG4yY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V+oSDcy69aUSW7GE1bWBBw4DDjSw0eGyukkqvC9EuHe97G7+dJbWgSfYxIDvk+IHl
	 mCyqyodrz//RRCm5jHSeOQODXlbn9ZOoHCmFh2oUpqSk/pQj39AC4edItbx8ANs4nj
	 ELB/jtSvubte7/ozkRTEunIsk9dAjj3vItI3HD88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74CA0F801D5; Fri, 29 Sep 2023 18:08:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B38F801D5;
	Fri, 29 Sep 2023 18:08:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4CDDF801D5; Fri, 29 Sep 2023 18:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0666DF800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0666DF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=a2CTfKgm
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so5636415e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696003683; x=1696608483;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2NePoGwQnoPG+4T0AwzYMJ5BXZjdkKQNTDKXR8Fj3o4=;
        b=a2CTfKgmDPGl25oU1SNzp0ndkX9pVr1+3DSHZLEHhHDK2KCXLsqcZTtVV4l40ssY8o
         nw/yMfTGTWqOY/2rR6Zk7Ba4jdomua6CyS9mvLOEJQvlbyPcnsJBbzCGi+L9pK5sgYvV
         kYeyHvH9EGHSo55xkITg1nohqRGrYzJ7Gi5lreuThJQd8uPnQWt7z/N4W3D7mtbkAwiN
         48BCWxE/Lgcivg77mcPZfkg2W11pp6jESQ+rwHQJKnFnxdWnKQzgdORi6NoxaTgZSH8I
         Wu+NFNq1sbCgCvk6TqAvEwtbMy3E09XGu0aQXxnWk2LCLiqUh8WBzUdDLfvHSvyLj9QZ
         d/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003683; x=1696608483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NePoGwQnoPG+4T0AwzYMJ5BXZjdkKQNTDKXR8Fj3o4=;
        b=oKzdHdzF/2SuGiC4wfnpPmZ9NeEPiZQsFDdBvuri70RD0k3c6atgsRA4WWeU3VTkQV
         WlDbWYwZEYoQBTbmd0va2Je9I7k9QJnP3wFmkSfSHAla1uWWkjWRnaUT4a1LjL/wQ94q
         D/tShc6vNf7YjpxmfCHD6gCXapmpCbNA0DeFnXPiDkArDNGLJL7njmDJtfpRselJzeQ+
         V1hhDh4EK/XUyswaDXa4h9naZbRVWn3LwuoFKjXzC5aJ5C8xWbj0e8zuBZ1Rwv5I9LKJ
         fEHBUFNGshqgzBFk67SIDw1nBwilaJ89vr1HqTLpFGD6vDtt+Vec5XEYMpOxtB1pMMhB
         fVqg==
X-Gm-Message-State: AOJu0Yw0Rucc9BH8806zoA13SLcMXlFx8qDuNgmI3xwKQ45s+UrxSeK9
	21mnKt4w5UiXo7v8QqMXBKzu71lcXw5fWAtphguC/A==
X-Google-Smtp-Source: 
 AGHT+IHDBZydPb1jHTtiNp4hmV0vofbR8Rckw8rvTLFRmf/uZf8BiCcL/0vCyZbFCbxwWzoGsp9Q349yhyTo6Tsv/4Q=
X-Received: by 2002:a05:600c:3b86:b0:405:3ab3:e640 with SMTP id
 n6-20020a05600c3b8600b004053ab3e640mr3784692wms.20.1696003682573; Fri, 29 Sep
 2023 09:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
In-Reply-To: 
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 29 Sep 2023 09:07:51 -0700
Message-ID: 
 <CAKwvOd=SGfLsRUHfG7djrNx5GE8Hpc+nF6rtK6qUJBG8qq6+tA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of
 COUNT_ARGS()
To: tiwai@suse.com, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID-Hash: QD4YHUXEQVSZPIIT27WSVMAKAAZO664B
X-Message-ID-Hash: QD4YHUXEQVSZPIIT27WSVMAKAAZO664B
X-MailFrom: ndesaulniers@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QD4YHUXEQVSZPIIT27WSVMAKAAZO664B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgOTo1MOKAr0FNIE5pY2sgRGVzYXVsbmllcnMgPG5kZXNh
dWxuaWVyc0Bnb29nbGUuY29tPg0Kd3JvdGU6DQoNCj4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQg
ODozOOKAr0FNIEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IFJlcGxhY2UgY3VzdG9tIGFuZCBub24tcG9ydGFibGUg
aW1wbGVtZW50YXRpb24gb2YgQ09VTlRfQVJHUygpLg0KPiA+DQo+ID4gRml4ZXM6IGU2NGI2NzRi
YzlkNyAoInNvZnR3YXJlIG5vZGU6IGltcGxlbWVudCByZWZlcmVuY2UgcHJvcGVydGllcyIpDQo+
ID4gUmVwb3J0ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29t
Pg0KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9aUW9JTE42UUNqem9zQ09z
QGdvb2dsZS5jb20NCj4NCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghDQo+IENsb3NlczogaHR0cHM6
Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTkzNQ0KPiBSZXZpZXdl
ZC1ieTogTmljayBEZXNhdWxuaWVycyA8bmRlc2F1bG5pZXJzQGdvb2dsZS5jb20+DQo+DQoNCkNh
biBzb21lb25lIHBpY2sgdGhpcyB1cCBmb3IgbGludXgtbmV4dD8NCg0KQ0kgZm9yIGxpbnV4LW5l
eHQgaGFzIGJlZW4gcmVkIGZvciBkYXlzIG92ZXIgdGhpcy4NCg0KDQoNCj4NCj4gT2YgY291cnNl
IExpbnV4IHdvdWxkIGhhdmUgYSBtYWNybyBmb3IgdGhpcyEgIEkgc2hvdWxkIGhhdmUga25vd24u
DQo+IFRyeWluZyB0byB3cmFwIG15IGhlYWQgYXJvdW5kIGl0LiBBd2Vzb21lDQo+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIGluY2x1ZGUvbGludXgvcHJvcGVydHkuaCB8IDMgKystDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Byb3BlcnR5LmggYi9pbmNsdWRlL2xpbnV4
L3Byb3BlcnR5LmgNCj4gPiBpbmRleCAxNjg0ZmNhOTMwZjcuLjU1YzI2OTJmZmE4YyAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Byb3BlcnR5LmgNCj4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L3Byb3BlcnR5LmgNCj4gPiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+ICAjaWZuZGVmIF9MSU5V
WF9QUk9QRVJUWV9IXw0KPiA+ICAjZGVmaW5lIF9MSU5VWF9QUk9QRVJUWV9IXw0KPiA+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9hcmdzLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+DQo+
ID4gICNpbmNsdWRlIDxsaW51eC9md25vZGUuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3N0ZGRl
Zi5oPg0KPiA+IEBAIC0zMTQsNyArMzE1LDcgQEAgc3RydWN0IHNvZnR3YXJlX25vZGVfcmVmX2Fy
Z3Mgew0KPiA+ICAjZGVmaW5lIFNPRlRXQVJFX05PREVfUkVGRVJFTkNFKF9yZWZfLCAuLi4pICAg
ICAgICAgICAgICAgICAgICBcDQo+ID4gIChjb25zdCBzdHJ1Y3Qgc29mdHdhcmVfbm9kZV9yZWZf
YXJncykgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgLm5v
ZGUgPSBfcmVmXywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
ID4gLSAgICAgICAubmFyZ3MgPSBBUlJBWV9TSVpFKCgodTY0W10peyAwLCAjI19fVkFfQVJHU19f
IH0pKSAtIDEsIFwNCj4gPiArICAgICAgIC5uYXJncyA9IENPVU5UX0FSR1MoX19WQV9BUkdTX18p
LCAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgLmFyZ3MgPSB7IF9fVkFfQVJH
U19fIH0sICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gIH0NCj4gPg0KPiA+
IC0tDQo+ID4gMi40MC4wLjEuZ2FhODk0NjIxN2EwYg0KPiA+DQo+DQo+DQo+IC0tDQo+IFRoYW5r
cywNCj4gfk5pY2sgRGVzYXVsbmllcnMNCj4NCg0KDQotLSANClRoYW5rcywNCn5OaWNrIERlc2F1
bG5pZXJzDQo=
