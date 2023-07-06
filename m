Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBB749A80
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85C33E7;
	Thu,  6 Jul 2023 13:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85C33E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688642441;
	bh=BeEu9DnRSBuLANcu2k7yqUMRiXL0LWdIQbjNisIOJKc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONUtf/3rIqXWO1920pjCqHqRBSJHt6oH1fqam/tC6fk+p4vrU8tTaE4ptodyR58qg
	 nvSeVE6FZSPjRj7iSkOhn0MGqh1OhejEZDIC0R93b9UsW7hz8IstnuwG8jOJpppWNc
	 K0ZeYIwo36CBMyNwusDteWfPPzbfnWFchg/hmGWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49B36F80544; Thu,  6 Jul 2023 13:19:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF507F80124;
	Thu,  6 Jul 2023 13:19:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11C62F80125; Thu,  6 Jul 2023 13:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4EE9F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4EE9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=aOtY4pQJ
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-66f3fc56ef4so1238647b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688642379; x=1691234379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Au9X7NkxtrT0jnVQVc4JQ7c3LuGMAw4J5ki5nmDTQ=;
        b=aOtY4pQJTY1hbfFiaZCw8v+xyMzdLnKFqJ/7prHynKDB/+sCmMlWd/iDm7i9tEgTJu
         mcRsNbYMSyIfMCm7Alfs5HvGUFPPqsRQR+fUhbYX9W7V9RUW/9D04D3+ZCZIXm05EOv7
         jPBKS4oFA5wsiNExV3ZlQSd3JSfKY5tO/wVrPHJVuqsQlMNccz9t8E5/LlrVmKKKPmOF
         xhpuj4t9/8v4SDCCc9dxyoXEirdvkdhBhMv4bJMAo4+0p3jQ6uFjUsqNd/x2CyirHv70
         qS+nHNdEdgM113R3YBsn/c1tAxhNKqDcux8NgvL1Ep8rPdrLRP8nYjwosLSAcmHsrztL
         Uzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642379; x=1691234379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7Au9X7NkxtrT0jnVQVc4JQ7c3LuGMAw4J5ki5nmDTQ=;
        b=Vf1JHjZjsdt5JLK0R13EmSg72DPNk4QbkTBq6IuCqCAFQwgSrU7OzoJoUfkxOre7Bh
         3TxFzziVqolVJUVLlEVqZANPbTRwjGGbehUjabMRdTvz1yLnT3ekKabT4eFyGUirOX1+
         X1pdzLgOHY9fnEjHEJssLNeSFiUJDzQ5nWqaUOMGOOW2G4KOegMaMjQkVPQ85UGQwuRk
         l6zbftV2OzrQK6MERSF/zubcMmATeNI+drii2V4484BagdTy7KaZZ2Hp6O/OsHRUhu/9
         YDTDSV1tmH5LqcULfnvPTDe19icFKLxQwfogqPgzrFUYSLzgZNa3FiTEmtAWKD0P57hE
         IrbA==
X-Gm-Message-State: ABy/qLao9Fen2cVcXPeC0h8hjw33ZDqxORWf7PQ3JDeetpqg5bxw8imF
	UAcUDifAxZyx9SdeE13fkYaw18quxkxs8ZSEkGs=
X-Google-Smtp-Source: 
 APBJJlGuBOSrm41copfyuAHMoUBKp8B7KwOUqRPL2+y2WJlF8Q9LfBOzQAtN9zVSuZoBe7eqnCz3uoscwB5hMUU1528=
X-Received: by 2002:a05:6a00:1886:b0:668:7494:384a with SMTP id
 x6-20020a056a00188600b006687494384amr2892558pfh.12.1688642379213; Thu, 06 Jul
 2023 04:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se>
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
In-Reply-To: 
 <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 Jul 2023 19:19:28 +0800
Message-ID: 
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Fabio Estevam <festevam@gmail.com>
Cc: Andreas Henriksson <andreas@fatal.se>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>
Message-ID-Hash: PKCPQPQXSOAXPPZBD5CLND4FMKO2HDBP
X-Message-ID-Hash: PKCPQPQXSOAXPPZBD5CLND4FMKO2HDBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKCPQPQXSOAXPPZBD5CLND4FMKO2HDBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCA3OjA44oCvUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToNCg0KPiBIaSBBbmRyZWFzLA0KPg0KPiBPbiBUaHUsIEp1bCA2LCAy
MDIzIGF0IDU6NDfigK9BTSBBbmRyZWFzIEhlbnJpa3Nzb24gPGFuZHJlYXNAZmF0YWwuc2U+DQo+
IHdyb3RlOg0KPg0KPiA+IFdlJ3ZlIGJlZW4gd29ya2luZyBvbiBhbiBpLk1YOE1QIHdoZXJlIE1D
TEsgbmVlZHMgdG8gYmUgaW5wdXQgYW5kIGZvdW5kDQo+ID4gdGhhdCB0aGlzIGVuYWJsZXMgdGhl
IE1DTEsgYXMgb3V0cHV0IGRlc3BpdGUgbm90IGhhdmluZyBzZXQgdGhlDQo+ID4gYGZzbCxzYWkt
bWNsay1kaXJlY3Rpb24tb3V0cHV0O2AgZGV2aWNldHJlZSBwcm9wZXJ0eSBpbiBvdXIgRFQuDQo+
ID4gUmV2ZXJ0aW5nIHRoZSBwYXRjaCBmaXhlcyB0aGUgaXNzdWVzIGZvciB1cy4NCj4gPg0KPiA+
IEkgaGF2ZSB0byBzYXkgdGhhdCB0aGUgY29kZSBjb21tZW50IG1hZGUgbWUgYSBiaXQgY29uZnVz
ZWQsIGJ1dCBvbmNlDQo+ID4gSSBmb3VuZCB0aGUgY29tbWl0IG1lc3NhZ2UgSSB1bmRlcnN0b29k
IHdoeSB0aGlzIGNvZGUgZXhpc3RlZC4NCj4gPiBJZiB0aGlzIGlzIHJlYWxseSBpLk1YOE1NIHNw
ZWNpZmljIG1heWJlIG1lbnRpb24gdGhhdCBpbiB0aGUgY29kZQ0KPiA+IGNvbW1lbnQgYW5kIHBs
ZWFzZSBtYWtlIHRoZSBjb2RlIGFjdHVhbGx5IG9ubHkgdHJpZ2dlciBvbiBpLk1YOE1NLg0KPiA+
IEl0IHNlZW1zIHRvIG1lIGxpa2UgdGhlc2UgYWxsIGZ1bGZpbGwgdGhlIGN1cnJlbnQgY3JpdGVy
aWE6DQo+ID4gaW14N3VscCwgaW14OG1xLCBpbXg4bW0sIGlteDhtcCwgaW14OHVscCwgaW14OTMN
Cj4gPg0KPiA+IFNob3VsZCBJIHJlcG9ydCB0aGlzIGluIGJ1Z3ppbGxhLmtlcm5lbC5vcmcgPw0K
Pg0KPiBTaG91bGQgd2UgZG8gYSBmaXggbGlrZSB0aGlzPw0KPg0KPiAtLS0gYS9zb3VuZC9zb2Mv
ZnNsL2ZzbF9zYWkuYw0KPiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYw0KPiBAQCAtMTQ1
Myw3ICsxNDUzLDcgQEAgc3RhdGljIGludCBmc2xfc2FpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UNCj4gKnBkZXYpDQo+DQo+ICAgICAgICAgLyogU2VsZWN0IE1DTEsgZGlyZWN0aW9uICov
DQo+ICAgICAgICAgaWYgKHNhaS0+bWNsa19kaXJlY3Rpb25fb3V0cHV0ICYmDQo+IC0gICAgICAg
ICAgIHNhaS0+c29jX2RhdGEtPm1heF9yZWdpc3RlciA+PSBGU0xfU0FJX01DVEwpIHsNCj4gKyAg
ICAgICAgICAgc2FpLT5zb2NfZGF0YS0+bWF4X3JlZ2lzdGVyID49IEZTTF9TQUlfTUNUTCAmJg0K
PiBzYWktPm1jbGtfZGlyZWN0aW9uX291dHB1dCkgew0KPiAgICAgICAgICAgICAgICAgcmVnbWFw
X3VwZGF0ZV9iaXRzKHNhaS0+cmVnbWFwLCBGU0xfU0FJX01DVEwsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRlNMX1NBSV9NQ1RMX01DTEtfRU4sDQo+IEZTTF9TQUlfTUNU
TF9NQ0xLX0VOKTsNCj4gICAgICAgICB9DQo+DQoNCk5vLCB0aGlzIGlzIHRoZSBjb2RlIGluIHBy
b2JlKCkuDQpUaGUgY29kZSB3aXRoIHRoZSBpc3N1ZSBpcyBpbiBmc2xfc2FpX3NldF9iY2xrKCku
DQoNClRoZSBjbGVhbiB3YXkgZm9yIGZpeGluZyBpcyB0byByZW1vdmUgdGhlIGNvZGUgaW4gZnNs
X3NhaV9zZXRfYmNsaygpDQphbmQgYWRkICJmc2wsc2FpLW1jbGstZGlyZWN0aW9uLW91dHB1dDsi
IHByb3BlcnR5IGluIGR0cyBmb3Igc29tZQ0Kbm9kZS4NCg0KYmVzdCByZWdhcmRzDQp3YW5nIHNo
ZW5naml1DQo=
