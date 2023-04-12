Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D736DEB15
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 07:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2C78EF5;
	Wed, 12 Apr 2023 07:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2C78EF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681277369;
	bh=qgPJ0Lpmgs6BAAaAuBha6WowFHxJjfXyFx8ZF4RDF0o=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=czm9pBlPXvbMscSwXmn2ut6o541mqiIz5HoWep/rnRzhC2xxOXpsHauGChAcJbqhC
	 b2BfnMOxVOK2B6gIMRRXbePRPMijX3ZcK5UNFvB9Waw/1Yf2eden9YD75LQ/EJFzFs
	 Uw7wBn1f879lgn0HRvydgs41tSCXkBRns0ew3xCs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68A8BF80571;
	Wed, 12 Apr 2023 07:26:24 +0200 (CEST)
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
In-Reply-To: 
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
Date: Wed, 12 Apr 2023 10:32:47 +0800
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
To: Guenter Roeck <groeck@google.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:23:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKQ46UFSI4UBVEXZF7HKPDT4QLL2LFOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168127718338.26.10170081130264135664@mailman-core.alsa-project.org>
From: Baili Deng via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Baili Deng <bailideng@google.com>
Cc: Mark Brown <broonie@kernel.org>,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49017F8032B; Wed, 12 Apr 2023 04:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEE9BF80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 04:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE9BF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=elK3+Hv7
Received: by mail-ua1-x933.google.com with SMTP id r21so11674043uaf.6
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 19:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681266778; x=1683858778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HfvJNmFxtqx/pgAYso7FBXy8VvoHHUVv8D/LM6+6Jq0=;
        b=elK3+Hv731v3amgypUN1AzhiyBEgs4vBTByJcd1IO7MRm6itvRkkKTAefeC1zHX11g
         94WmSZ4tVj7+T+8FB+KHEejnoZq5CfsamS6vgRvnpFUhAu4WzyXR5DLnL4muCV6roumH
         QXQdmCFnOrCbIJUE3cDasgTC9oCqWkNoB4KQWIlDl7GRvje1B/H7M4UtTrcyi6ob+wL/
         OnLxpTBJ/PegTCWX162/1+xpHajpeerZ8Mf9fb7CAks269O5DfEUlMAODO9ECFMAghD4
         soAVUg+eciM7VT/wuKtcOcWmWa1tv4gsmDRMflDpQOtZ6dDkO5wWwuQQDlIPkvWs7IDs
         pToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681266778; x=1683858778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfvJNmFxtqx/pgAYso7FBXy8VvoHHUVv8D/LM6+6Jq0=;
        b=Bsux48NJgJGeYCImDnWQ+mqnpen+bhs5joPXcFogNI4BviZKCOYcnbX1DTLBMF85TQ
         RL/5BUYXOP1Yx3p+DgXbtw1WVhytjv51K2sw42LlClIrixnMYs5g8HptCBGN5YBxfhPn
         8hoym2uM3sV5FrLbzLHH/peLJsgQA/LAHkNPuGu0KcjVxa0SMacU4JDbQYJ0leNkGLDf
         /QU7B7cJ3UemWjbr6pGC/DPolZEs8M/7BKKhlPjINBlJTHMRJpsTQLoXB8LXP05MXOQN
         +5Ec7jdjvdDVHCYtaaSCwFVgoStivl+a2RXAnjmqP4PHRgER6y7Sx9vhmxIu8DqpCKoX
         fb4A==
X-Gm-Message-State: AAQBX9eT16cPJJTT37gFr9FuukgNFlnaH6HBl2bEy6XQ1PXJlUXJtIYF
	tj+5sEy/jDy6VH1HoMY9EdiJ5JGrtVz3Te4uBlLxIQ==
X-Google-Smtp-Source: 
 AKy350aKJUA0AAG/D49TEe7oU/U6O1BKc7DP+uZeYocQX1AENbc+6wp8zqpDsaCLi4FW1NR3qcHlCrHVGGgdvVxdjnE=
X-Received: by 2002:a1f:2816:0:b0:432:8b30:81b7 with SMTP id
 o22-20020a1f2816000000b004328b3081b7mr409976vko.2.1681266778358; Tue, 11 Apr
 2023 19:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230410092634.4870-1-David.Rau.opensource@dm.renesas.com>
 <d9dac02a-328d-485e-9aff-158852eeb990@sirena.org.uk>
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
In-Reply-To: 
 <CABXOdTfGD_fyi+itsr9Nd834Pb6+4Ej8M9SM5AN=uhXQ1K4DiA@mail.gmail.com>
From: Baili Deng <bailideng@google.com>
Date: Wed, 12 Apr 2023 10:32:47 +0800
Message-ID: 
 <CADP_shKfY6-F_4+_eYv=NC9XcgVA+0H3BkCqH8D9wkqJ5SpMDQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ process
To: Guenter Roeck <groeck@google.com>
X-MailFrom: bailideng@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QKQ46UFSI4UBVEXZF7HKPDT4QLL2LFOJ
X-Message-ID-Hash: QKQ46UFSI4UBVEXZF7HKPDT4QLL2LFOJ
X-Mailman-Approved-At: Wed, 12 Apr 2023 05:23:31 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Mark Brown <broonie@kernel.org>,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKQ46UFSI4UBVEXZF7HKPDT4QLL2LFOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhlIGNoYW5nZSBpbiB0aGUgcGF0Y2ggZG9uZSB0byBhZGRyZXNzIHRoZSBpc3N1ZSBHZXVudGVy
IG1lbnRpb25lZCBpcyB0aGF0DQpkYTcyMTlfYWFkX2hhbmRsZV9nbmRfc3dpdGNoX3RpbWUoKSBp
cyBub3cgY2FsbGVkIGJlZm9yZSBpbnRlcnJ1cHRzIGFyZQ0KZW5hYmxlZC4gVG8gYWRkcmVzcyB0
aGUgbXNsZWVwKCkgaXNzdWUsIHRoZSBkZWxheSBpcyBub3cgYWRkZWQgYXMgYSBkZWxheWVkDQp3
b3JrIG9mIGl0cyBvd24gd29ya3F1ZXVlLg0KDQpPbiBUdWUsIEFwciAxMSwgMjAyMyBhdCAxMDoy
OOKAr1BNIEd1ZW50ZXIgUm9lY2sgPGdyb2Vja0Bnb29nbGUuY29tPiB3cm90ZToNCg0KPiBPbiBU
dWUsIEFwciAxMSwgMjAyMyBhdCA0OjMy4oCvQU0gTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gPg0KPiA+IE9uIE1vbiwgQXByIDEwLCAyMDIzIGF0IDA5OjI2OjM0QU0g
KzAwMDAsIERhdmlkIFJhdSB3cm90ZToNCj4gPg0KPiA+ID4gVGhpcyBjb21taXQgaW1wcm92ZXMg
dGhlIGNvbnRyb2wgb2YgZ3JvdW5kIHN3aXRjaGVzIGluIEFBRCBJUlENCj4gPg0KPiA+IEluIHdo
YXQgd2F5IGRvZXMgaXQgZG8gdGhpcyAtIHdoYXQgd2FzIHByZXZpb3VzbHkgdW5yZWxhYmlsZSBh
bmQgaG93DQo+ID4gZG9lcyB0aGlzIGNoYW5nZSBhZGRyZXNzIHRoYXQ/DQo+DQo+IE9uZSB2ZXJ5
IHNwZWNpZmljIHByb2JsZW0gaXMgdGhhdCBkYTcyMTlfYWFkX2hhbmRsZV9nbmRfc3dpdGNoX3Rp
bWUoKQ0KPiBpcyBjdXJyZW50bHkgY2FsbGVkIGFmdGVyIGludGVycnVwdHMgd2VyZSBlbmFibGVk
LiBBcyBhIHJlc3VsdCwgdGhlDQo+IGRlbGF5IHRpbWUgaXMgbm90IGluaXRpYWxpemVkIGlmIHRo
ZXJlIGlzIGFuIGludGVycnVwdCBiZWZvcmUgdGhlDQo+IGluaXRpYWxpemF0aW9uLiBUaGlzIHJl
c3VsdHMgaW4gYSBuZWdhdGl2ZSB2YWx1ZSBwYXNzZWQgdG8gbXNsZWVwKCkuDQo+IFNpbmNlIHRo
ZSBwYXJhbWV0ZXIgdG8gbXNsZWVwKCkgaXMgdW5zaWduZWQsIHRoaXMgY2F1c2VzIGl0IHRvIHNs
ZWVwDQo+IGZvcmV2ZXIgd2hpY2ggaW4gdHVybiBjYXVzZXMgYSBzdWJzdGFudGlhbCBudW1iZXIg
b2YgaHVuZyB0YXNrIGNyYXNoZXMNCj4gaW4gQ2hyb21lT1MuIFBsdXMsIG9mIGNvdXJzZSwgdGhl
IGNvZGUgZG9lc24ndCByZWFsbHkgZG8gYW55dGhpbmcgaW4NCj4gdGhpcyBzaXR1YXRpb24uDQo+
DQo+IEEgc2Vjb25kYXJ5IHByb2JsZW0gbWF5IGJlIHRoYXQgY2FsbGluZyBtc2xlZXAoKSB3aXRo
IGEgcG90ZW50aWFsbHkNCj4gbGFyZ2Ugc2xlZXAgdGltZSBvbiBhIHN5c3RlbSB3b3JrZXIgaXNu
J3QgcmVhbGx5IGEgZ29vZCBpZGVhLCBidXQgSQ0KPiBkaWRuJ3QgZXhwbG9yZSB0aGUgaW1wYWN0
IGZ1cnRoZXIuDQo+DQo+IEd1ZW50ZXINCj4NCg==
