Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376876CCA1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6CFE832;
	Wed,  2 Aug 2023 14:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6CFE832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690979241;
	bh=k1Up1J0ahMBhkm0/itxqwJvBYL3m0ilZqdji+QvoLDE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMTqRoTjVwCHuezbCXfb/dkPDNsfRC4UUJfbevtDxd+X+89Qo31waTeOcwFsgaZ6s
	 Ihs7t4RFM+PMBvXCOi8rv/17WequVZ4pq31EeL1H4S1lfch+ihV3dG9j9TouTQ2fTJ
	 OcJbWUnVCskxYk/vNuAQlNOi5Zh2rt669MA/UmKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 784D7F80549; Wed,  2 Aug 2023 14:26:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AD2AF80557;
	Wed,  2 Aug 2023 14:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 513B2F80558; Wed,  2 Aug 2023 14:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 885BEF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 885BEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=SA3agbuc
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso72451125e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690979156; x=1691583956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k1Up1J0ahMBhkm0/itxqwJvBYL3m0ilZqdji+QvoLDE=;
        b=SA3agbuc44leDaKqRekrqsUUB1rtkIUm9MmWNFxk4mOQk3WxP5nZ/7e1LoNWYP4CXS
         Py4IYLR2KrofiPfLQ44bsvaOQrwJEpHGv7nHtfJg6zgAG7PeglW1MD0C8jeCdjpib95D
         bcdPlkIVCbyx2IIcpEDufKew344DIehgBBtFEGWPv7OoX9RTWoHPaMptLCteq485j/a0
         j7nZvUVs0EQE6iqZ5cPlSp92AQ4RKzXaGduWiM4Qj5CCzJY0r0LjhQ0oDL++gd859VO0
         n66DFvRcUbe9yYah2JU84ElsRXlPRnr3a2xSUTI3DPKEYE2uy4Rf8MAxqmS6VBKewmg7
         QDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690979156; x=1691583956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1Up1J0ahMBhkm0/itxqwJvBYL3m0ilZqdji+QvoLDE=;
        b=VPVJ5BF3cNNqeq0pbTAOqv/k+H2J5JkThplt4fqUsc7iyHJVtCbP/Qb+DY7SraABXX
         Mdp1GO3jFlRHLZh38m5cm4nOzRyYbYH5goSCnB47iGUuSTaxwYAcKrQZtP2urv90Qo0G
         qazwFXv3bIdeC5AVcXBPq1qKGXvdrfl23mmhp98FDrH9t2wEXhziYNoBSzoZaf8JFulS
         O3TO2RJ9wABwL0Vy72a8pktQBZkJaughUgF+NfjusSnl1DCER/5K3HxCpj6kwXqm0T7X
         /tfAOcB+DmnqW2ic90SGr/uGTRh+3yyvkyGpcgnoJ6hf0F5Ycp4jwGWSgk+YBpGkWnNe
         J3pg==
X-Gm-Message-State: ABy/qLYjS/AYWF9uunpaHbo4GvEwERvWvugSmcnMknDWP7W8Tmi5uYTg
	bE0syO+0Jtgb7Nw4PV01rp0=
X-Google-Smtp-Source: 
 APBJJlFOD1LvBknVCpG/Fkk8logG8H0x+3cU8bTj0Ciq/xHm3IdKJzFNt4v0vbrz5opybt9Q8RfP0g==
X-Received: by 2002:a05:600c:296:b0:3fb:e643:1225 with SMTP id
 22-20020a05600c029600b003fbe6431225mr4725461wmk.13.1690979156032;
        Wed, 02 Aug 2023 05:25:56 -0700 (PDT)
Received: from [192.168.43.53] ([46.188.187.196])
        by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcc15000000b003fc01f7b415sm1562309wmh.39.2023.08.02.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 05:25:55 -0700 (PDT)
Message-ID: <5b9f9d7d6d694a7c55cd64d407ed235b5f4dbed5.camel@gmail.com>
Subject: Re: [PATCH 24/38] ASoC: cirrus: merge DAI call back functions into
 ops
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Jaroslav Kysela
	 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Date: Wed, 02 Aug 2023 14:25:53 +0200
In-Reply-To: <87bkfqtg8j.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
	 <87bkfqtg8j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
Message-ID-Hash: HIEWC7UXUMAZ2F2OFRIBVT3YLV56BRMZ
X-Message-ID-Hash: HIEWC7UXUMAZ2F2OFRIBVT3YLV56BRMZ
X-MailFrom: alexander.sverdlin@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HIEWC7UXUMAZ2F2OFRIBVT3YLV56BRMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkhCgpPbiBXZWQsIDIwMjMtMDgtMDIgYXQgMDA6NTUgKzAwMDAsIEt1bmlub3JpIE1vcmltb3Rv
IHdyb3RlOgo+IEFMU0EgU29DIG1lcmdlcyBEQUkgY2FsbCBiYWNrcyBpbnRvIC5vcHMuCj4gVGhp
cyBwYXRjaCBtZXJnZSB0aGVzc2UgaW50byBvbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuaW5v
cmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPgoKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KCj4g
LS0tCj4gwqBzb3VuZC9zb2MvY2lycnVzL2VwOTN4eC1pMnMuYyB8IDIgKy0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9z
b3VuZC9zb2MvY2lycnVzL2VwOTN4eC1pMnMuYyBiL3NvdW5kL3NvYy9jaXJydXMvZXA5M3h4LWky
cy5jCj4gaW5kZXggYWZjNmI1YjU3MGVhLi41MjJkZTRiODAyOTMgMTAwNjQ0Cj4gLS0tIGEvc291
bmQvc29jL2NpcnJ1cy9lcDkzeHgtaTJzLmMKPiArKysgYi9zb3VuZC9zb2MvY2lycnVzL2VwOTN4
eC1pMnMuYwo+IEBAIC00MDcsNiArNDA3LDcgQEAgc3RhdGljIGludCBlcDkzeHhfaTJzX3Jlc3Vt
ZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkKPiDCoCNlbmRpZgo+IMKgCj4g
wqBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29wcyBlcDkzeHhfaTJzX2RhaV9vcHMg
PSB7Cj4gK8KgwqDCoMKgwqDCoMKgLnByb2JlwqDCoMKgwqDCoMKgwqDCoMKgwqA9IGVwOTN4eF9p
MnNfZGFpX3Byb2JlLAo+IMKgwqDCoMKgwqDCoMKgwqAuc3RhcnR1cMKgwqDCoMKgwqDCoMKgwqA9
IGVwOTN4eF9pMnNfc3RhcnR1cCwKPiDCoMKgwqDCoMKgwqDCoMKgLnNodXRkb3duwqDCoMKgwqDC
oMKgwqA9IGVwOTN4eF9pMnNfc2h1dGRvd24sCj4gwqDCoMKgwqDCoMKgwqDCoC5od19wYXJhbXPC
oMKgwqDCoMKgwqA9IGVwOTN4eF9pMnNfaHdfcGFyYW1zLAo+IEBAIC00MTgsNyArNDE5LDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhaV9vcHMgZXA5M3h4X2kyc19kYWlfb3BzID0g
ewo+IMKgCj4gwqBzdGF0aWMgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBlcDkzeHhfaTJzX2Rh
aSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKgLnN5bW1ldHJpY19yYXRlwqA9IDEsCj4gLcKgwqDCoMKg
wqDCoMKgLnByb2JlwqDCoMKgwqDCoMKgwqDCoMKgwqA9IGVwOTN4eF9pMnNfZGFpX3Byb2JlLAo+
IMKgwqDCoMKgwqDCoMKgwqAucGxheWJhY2vCoMKgwqDCoMKgwqDCoD0gewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLmNoYW5uZWxzX21pbsKgwqDCoD0gMiwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5jaGFubmVsc19tYXjCoMKgwqA9IDIsCgotLSAKQWxleGFu
ZGVyIFN2ZXJkbGluLgoK

