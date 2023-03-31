Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0106D15C2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 04:56:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0599F1F7;
	Fri, 31 Mar 2023 04:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0599F1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680231404;
	bh=X/tsONxZ8L1WAeAR1ROCGDulqWscAhL3Lp5vAG+Z23w=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llaRv9NqbxThnCXFsYYX8HFDce7w9sBW3IlmMZY4YzouHwXYHpEcAMwdQWGFH4ju4
	 q1jw05uJ3lKtmu9JaJwAvWBB01dt83Dq/SnQyj0LUhoZseh+KRwVUTECcgtKN/vdlw
	 lQnF8iZFahNP5gt2m6IJo2jXPksIShNHmeVCUbHs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F834F8021D;
	Fri, 31 Mar 2023 04:55:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D00DF80272; Fri, 31 Mar 2023 04:55:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62D4FF8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 04:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D4FF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j6snYCTS
Received: by mail-wr1-x432.google.com with SMTP id h17so20980751wrt.8
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680231337; x=1682823337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0f0oYaBiIjZngwKKrarE3ZU4R7VLA65VkJQmbsO7p4=;
        b=j6snYCTSc3mn9magen+ARP9tyBjdlqAg7Msxhi4LmTS+IMoHqzu/tVUg95/7GQ6fK1
         Ab33kcxf2rMwtLKQFmY0q2/ynhw8dxHAA/ErsVFtm/f8HYQqlkegFOko3J2MRW/gozSA
         zbFnAUPiwIsIfxZeD3NpRyiDH1t8mHcxYUHFlEa3a5uH/Q4E0EOa5K2KdXoGm2ikXbEJ
         cFacjZNut43G140mcjfDOYCH49vCCq1WXMeWr4OoqMcEDx1mVacsHdDwvKbriOa6D9An
         8vEDs5Gks6sYn2jJamaaMSvpCJ2dMNSlgydmr867/IW5q8kungIpa1YhWEGPeH+UTAyt
         yw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680231337; x=1682823337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0f0oYaBiIjZngwKKrarE3ZU4R7VLA65VkJQmbsO7p4=;
        b=S7VHGukG1IXIDiaZc9q610X/H2bLFw0I4HO09G0KXblZ6iqJR+v7wt0TDe3oBtnQY7
         TMmIsMHeq9+NLdULVPOT+73VtffsyYGFygZzG+StOHBcJ7CJh1SgETGvYgRjSKJb5JUN
         xrVGMsnGezNWnLqehrnsqk3CaVmLV39wYsWF+LjkcdyRq4dy9hv3jWy81eCZbRfyFag7
         1olH3XtetZhndS+6aGBypVMDhi5WAfOmap8XU7Su/8kG9NAZLQ0cZ8AVn1Ce782f2KOv
         7FKKVq8UCD6OufDxXEnhCmi3MafHsnznjBD6aPu8U7uFse5n5/gFhKa/hSYsQtFOnRPN
         eyUQ==
X-Gm-Message-State: AAQBX9ejamsCVXvKTL+ibr5oavpFz09JdbvBWFGvVSUZ8gp188ptmJSK
	XrrJMX5vXXVd671PCGhgnrKrnOd6X6s0ff62dz0=
X-Google-Smtp-Source: 
 AKy350aoW6eyWZ7Vy7uL9TzBTgI+9gM4kG0Y6ga+Ywwo/3Ce7novHeVGH33oyhBjPnINiHx5c4pgOiCGaiSL/Y/+Rnw=
X-Received: by 2002:a5d:5152:0:b0:2c7:17b8:5759 with SMTP id
 u18-20020a5d5152000000b002c717b85759mr4385251wrt.3.1680231336775; Thu, 30 Mar
 2023 19:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230330083040.77085-1-emas@bang-olufsen.dk>
In-Reply-To: <20230330083040.77085-1-emas@bang-olufsen.dk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 31 Mar 2023 10:55:25 +0800
Message-ID: 
 <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Message-ID-Hash: BDAOF4YPK6GIZZHIJKDSIGITBBK7NQUW
X-Message-ID-Hash: BDAOF4YPK6GIZZHIJKDSIGITBBK7NQUW
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
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDAOF4YPK6GIZZHIJKDSIGITBBK7NQUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgNDozMOKAr1BNIEVtaWwgQWJpbGRnYWFyZCBTdmVuZHNl
biA8DQpFTUFTQGJhbmctb2x1ZnNlbi5kaz4gd3JvdGU6DQoNCj4gU2xvdCB3aWR0aCBzaG91bGQg
Zm9sbG93IHRoZSBwaHlzaWNhbCB3aWR0aCBvZiB0aGUgZm9ybWF0IGluc3RlYWQgb2YgdGhlDQo+
IGRhdGEgd2lkdGguDQo+DQo+IFRoaXMgaXMgbmVlZGVkIGZvciBmb3JtYXRzIGxpa2UgU05EUlZf
UENNX0ZNVEJJVF9TMjRfTEUgd2hlcmUgcGh5c2ljYWwNCj4gd2lkdGggaXMgMzIgYW5kIGRhdGEg
d2lkdGggaXMgMjQuIEJ5IHVzaW5nIHRoZSBwaHlzaWNhbCB3aWR0aCwgZGF0YQ0KPiB3b24ndCBn
ZXQgbWlzYWxpZ25lZC4NCg0KDQpUaGVyZSBhcmUgZGlmZmVyZW50IHJlcXVpcmVtZW50cyBmb3Ig
dGhpcyBzbG90IHdpZHRoLiBTb21lIG5lZWQgcGh5c2ljYWwNCndpZHRoLA0KU29tZSBuZWVkIGZv
cm1hdCB3aWR0aC4gV2UgbmVlZCB0byBiZSBjYXJlZnVsIGFib3V0IGNoYW5nZSBoZXJlLg0KDQpB
Y3R1YWxseSB0aGVyZSBpcyAuc2V0X3RkbV9zbG90IEFQSSBmb3Igc2xvdCBzcGVjaWZpYyBzZXR0
aW5nLCBwbGVhc2UgdXNlDQp0aGlzIEFQSS4NCg0KYmVzdCByZWdhcmRzDQp3YW5nIHNoZW5naml1
DQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogRW1pbCBTdmVuZHNlbiA8ZW1hc0BiYW5nLW9sdWZzZW4u
ZGs+DQo+IC0tLQ0KPiAgc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgfCAyICstDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gaW5k
ZXggOTM5YzZiZGQyMmM0Li4yMTNlMmQ0NjIwNzYgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9m
c2wvZnNsX3NhaS5jDQo+ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+IEBAIC01MTks
MTMgKzUxOSwxMyBAQCBzdGF0aWMgaW50IGZzbF9zYWlfaHdfcGFyYW1zKHN0cnVjdA0KPiBzbmRf
cGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPiAgICAgICAgIHVuc2lnbmVkIGludCBjaGFubmVs
cyA9IHBhcmFtc19jaGFubmVscyhwYXJhbXMpOw0KPiAgICAgICAgIHN0cnVjdCBzbmRfZG1hZW5n
aW5lX2RhaV9kbWFfZGF0YSAqZG1hX3BhcmFtczsNCj4gICAgICAgICBzdHJ1Y3QgZnNsX3NhaV9k
bF9jZmcgKmRsX2NmZyA9IHNhaS0+ZGxfY2ZnOw0KPiArICAgICAgIHUzMiBzbG90X3dpZHRoID0g
cGFyYW1zX3BoeXNpY2FsX3dpZHRoKHBhcmFtcyk7DQo+ICAgICAgICAgdTMyIHdvcmRfd2lkdGgg
PSBwYXJhbXNfd2lkdGgocGFyYW1zKTsNCj4gICAgICAgICBpbnQgdHJjZV9tYXNrID0gMCwgZGxf
Y2ZnX2lkeCA9IDA7DQo+ICAgICAgICAgaW50IGRsX2NmZ19jbnQgPSBzYWktPmRsX2NmZ19jbnQ7
DQo+ICAgICAgICAgdTMyIGRsX3R5cGUgPSBGU0xfU0FJX0RMX0kyUzsNCj4gICAgICAgICB1MzIg
dmFsX2NyNCA9IDAsIHZhbF9jcjUgPSAwOw0KPiAgICAgICAgIHUzMiBzbG90cyA9IChjaGFubmVs
cyA9PSAxKSA/IDIgOiBjaGFubmVsczsNCj4gLSAgICAgICB1MzIgc2xvdF93aWR0aCA9IHdvcmRf
d2lkdGg7DQo+ICAgICAgICAgaW50IGFkaXIgPSB0eCA/IFJYIDogVFg7DQo+ICAgICAgICAgdTMy
IHBpbnMsIGJjbGs7DQo+ICAgICAgICAgdTMyIHdhdGVybWFyazsNCj4gLS0NCj4gMi4zNC4xDQo+
DQo=
