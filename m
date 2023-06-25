Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FE73D12F
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 15:46:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DBE74C;
	Sun, 25 Jun 2023 15:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DBE74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687700818;
	bh=/dgXGPEnIuU6+bBqIaYhtVFVOCweUsU/2i0MHh7SHAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AaUuFzqE5d+i7cRB0TEAc/1o1DZSBHbm2jxQGE9taRQrJ7l0p53Qsc4J4Q2gyqfnj
	 DhCkTadmnyq8oiFqqkEVV9cXKFsvjJaoVtERAqfBE0NFzpk2SNLj+ZQ65pE+POwugp
	 k6lvsvi9YEfalNO5xQi4Mcevxsj2mZowzm6VNWaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42996F8051E; Sun, 25 Jun 2023 15:46:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B366DF80212;
	Sun, 25 Jun 2023 15:46:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 247C4F80246; Sun, 25 Jun 2023 15:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2525BF80124
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 15:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2525BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=DIu9Ny/7
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-262e839647eso334473a91.2
        for <alsa-devel@alsa-project.org>;
 Sun, 25 Jun 2023 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687700745; x=1690292745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9um6ptaOKAi61nB5XO7Dl3qnm1zJlbhB7/bYZ4qz2kM=;
        b=DIu9Ny/7jaoTNLkGF8/WA5PPNK+jRdr7UQ0oUK8gpDleZDBYKkEZTRWvV3q0WCVDkr
         GT9WGDqQAd6NM3Hv1OBgtl8/K9UJmgSuJRLqsWXBXFXz9xRKraV4dO1gJ8knuWzH89FD
         5ZBp0RxbEzte21jPDl7kMB+sxKGvhF7PqHUrgXYtdti8GcQuUInbzrjXCOqFFOZDBhMO
         IMo7/KqAaRWozkJvnoh0Iekll7VhVmEMiZQsJ3TqFXKC1y0eUPCjoaPqTzuR0cjVbcs2
         xJTlHHmr8A6MBvUO6sq0WtDEOTraSRGzMEPDoZJ5FSgONJaq67twdWxH0KwyA7EKLbZm
         hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687700745; x=1690292745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9um6ptaOKAi61nB5XO7Dl3qnm1zJlbhB7/bYZ4qz2kM=;
        b=Cnvetclx8FVyRBpPyBzbRYFYkUoiFlWukWPkW+Xa9zjGxiJWsdfoHm1EWmu1LdzDm/
         gWGcXoO4pcp5uQ7s9vSyn0i+0+1KOzfJtPD4I4OCEXJxKWOlst5/HGjgkk9KWVQGZF2U
         4OFviqihOa/uN74Ositt0ikEo4H4t8JCtewaLbwjhzb5IyN88BeN5jOkr7Q+vU71733C
         zW9wkpqO6oIVta0L696Pxvsn0fcQGSwNQvf52ZjwskErpj2qdgUdOhRPQroa4VWA5Bu9
         Zc/8WI2Pe4yODfzRiIlhZtGBGFh3kMjvYdbLP+EHi97Z1SUrXCqKsdaB+ArkpwiIvy8K
         wG3w==
X-Gm-Message-State: AC+VfDxeisFrYhcOf713/uiTF1R4h73JIxne8IdzfhIeWii44ZmqfLG8
	SW1g5iWKNw8NUMTw12kW1WkCcWKishDpSIwCzQ4=
X-Google-Smtp-Source: 
 ACHHUZ7vkizBq3N3yfXSjDuGR6Zka/LKQnjrdgn0dMXOeeTF+VYjwYV4P6nmFxHwa1+WFqaETkla1uT7JKiYDkyc20I=
X-Received: by 2002:a17:90b:3714:b0:261:685:95b6 with SMTP id
 mg20-20020a17090b371400b00261068595b6mr11812001pjb.13.1687700745344; Sun, 25
 Jun 2023 06:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230521225702.1608-1-rdunlap@infradead.org>
In-Reply-To: <20230521225702.1608-1-rdunlap@infradead.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 25 Jun 2023 21:45:34 +0800
Message-ID: 
 <CAA+D8AMArTYodVhJuLfptvUDKUw4o7miPXYdaAsi_O=UdMKbpQ@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] ASoC: fsl MPC52xx drivers require PPC_BESTCOMM
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>,
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID-Hash: WLXHFMUEMOHPCZI33ZBX57QORZKVYGSX
X-Message-ID-Hash: WLXHFMUEMOHPCZI33ZBX57QORZKVYGSX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLXHFMUEMOHPCZI33ZBX57QORZKVYGSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgNjo1N+KAr0FNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPiB3cm90ZToNCg0KPiBCb3RoIFNORF9NUEM1Mnh4X1NPQ19QQ00wMzAgYW5k
IFNORF9NUEM1Mnh4X1NPQ19FRklLQSBzZWxlY3QNCj4gU05EX1NPQ19NUEM1MjAwX0FDOTcuIFRo
ZSBsYXR0ZXIgc3ltYm9sIGRlcGVuZHMgb24gUFBDX0JFU1RDT01NLA0KPiBzbyB0aGUgMiBmb3Jt
ZXIgc3ltYm9scyBzaG91bGQgYWxzbyBkZXBlbmQgb24gUFBDX0JFU1RDT01NIHNpbmNlDQo+ICJz
ZWxlY3QiIGRvZXMgbm90IGZvbGxvdyBhbnkgZGVwZW5kZW5jeSBjaGFpbnMuDQo+DQo+IFRoaXMg
cHJldmVudHMgYSBrY29uZmlnIHdhcm5pbmcgYW5kIGJ1aWxkIGVycm9yczoNCj4NCj4gV0FSTklO
RzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgU05EX1NPQ19NUEM1MjAw
X0FDOTcNCj4gICBEZXBlbmRzIG9uIFtuXTogU09VTkQgWz15XSAmJiAhVU1MICYmIFNORCBbPW1d
ICYmIFNORF9TT0MgWz1tXSAmJg0KPiBTTkRfUE9XRVJQQ19TT0MgWz1tXSAmJiBQUENfTVBDNTJ4
eCBbPXldICYmIFBQQ19CRVNUQ09NTSBbPW5dDQo+ICAgU2VsZWN0ZWQgYnkgW21dOg0KPiAgIC0g
U05EX01QQzUyeHhfU09DX1BDTTAzMCBbPW1dICYmIFNPVU5EIFs9eV0gJiYgIVVNTCAmJiBTTkQg
Wz1tXSAmJg0KPiBTTkRfU09DIFs9bV0gJiYgU05EX1BPV0VSUENfU09DIFs9bV0gJiYgUFBDX01Q
QzUyMDBfU0lNUExFIFs9eV0NCj4gICAtIFNORF9NUEM1Mnh4X1NPQ19FRklLQSBbPW1dICYmIFNP
VU5EIFs9eV0gJiYgIVVNTCAmJiBTTkQgWz1tXSAmJg0KPiBTTkRfU09DIFs9bV0gJiYgU05EX1BP
V0VSUENfU09DIFs9bV0gJiYgUFBDX0VGSUtBIFs9eV0NCj4NCj4gRVJST1I6IG1vZHBvc3Q6ICJt
cGM1MjAwX2F1ZGlvX2RtYV9kZXN0cm95Ig0KPiBbc291bmQvc29jL2ZzbC9tcGM1MjAwX3BzY19h
Yzk3LmtvXSB1bmRlZmluZWQhDQo+IEVSUk9SOiBtb2Rwb3N0OiAibXBjNTIwMF9hdWRpb19kbWFf
Y3JlYXRlIg0KPiBbc291bmQvc29jL2ZzbC9tcGM1MjAwX3BzY19hYzk3LmtvXSB1bmRlZmluZWQh
DQo+DQo+IEZpeGVzOiA0MGQ5ZWMxNGU3ZTEgKCJBU29DOiByZW1vdmUgQlJPS0VOIGZyb20gRWZp
a2EgYW5kIHBjbTAzMCBmYWJyaWMNCj4gZHJpdmVycyIpDQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiBDYzogR3JhbnQgTGlrZWx5IDxncmFu
dC5saWtlbHlAc2VjcmV0bGFiLmNhPg0KPiBDYzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwu
b3JnPg0KPiBDYzogTGlhbSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT4NCj4gQ2M6IFNo
ZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdAZ21haWwuY29tPg0KPiBDYzogWGl1Ym8gTGkgPFhp
dWJvLkxlZUBnbWFpbC5jb20+DQo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4g
Q2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IENjOiBKYXJvc2xhdiBLeXNlbGEg
PHBlcmV4QHBlcmV4LmN6Pg0KPiBDYzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT4NCj4N
Cg0KQWNrZWQtYnk6IFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdAZ21haWwuY29tPg0KDQpC
ZXN0IHJlZ2FyZHMNCldhbmcgc2hlbmdqaXUNCg0KPiAtLS0NCj4gdjI6IHVzZSBjb3JyZWN0IGVt
YWlsIGFkZHJlc3MgZm9yIE1hcmsgQnJvd24uDQo+DQo+ICBzb3VuZC9zb2MvZnNsL0tjb25maWcg
fCAgICA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+DQo+IGRpZmYgLS0gYS9zb3VuZC9zb2MvZnNsL0tjb25maWcgYi9zb3VuZC9zb2Mv
ZnNsL0tjb25maWcNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9LY29uZmlnDQo+ICsrKyBiL3NvdW5k
L3NvYy9mc2wvS2NvbmZpZw0KPiBAQCAtMjQzLDcgKzI0Myw3IEBAIGNvbmZpZyBTTkRfU09DX01Q
QzUyMDBfQUM5Nw0KPg0KPiAgY29uZmlnIFNORF9NUEM1Mnh4X1NPQ19QQ00wMzANCj4gICAgICAg
ICB0cmlzdGF0ZSAiU29DIEFDOTcgQXVkaW8gc3VwcG9ydCBmb3IgUGh5dGVjIHBjbTAzMCBhbmQg
V005NzEyIg0KPiAtICAgICAgIGRlcGVuZHMgb24gUFBDX01QQzUyMDBfU0lNUExFDQo+ICsgICAg
ICAgZGVwZW5kcyBvbiBQUENfTVBDNTIwMF9TSU1QTEUgJiYgUFBDX0JFU1RDT01NDQo+ICAgICAg
ICAgc2VsZWN0IFNORF9TT0NfTVBDNTIwMF9BQzk3DQo+ICAgICAgICAgc2VsZWN0IFNORF9TT0Nf
V005NzEyDQo+ICAgICAgICAgaGVscA0KPiBAQCAtMjUyLDcgKzI1Miw3IEBAIGNvbmZpZyBTTkRf
TVBDNTJ4eF9TT0NfUENNMDMwDQo+DQo+ICBjb25maWcgU05EX01QQzUyeHhfU09DX0VGSUtBDQo+
ICAgICAgICAgdHJpc3RhdGUgIlNvQyBBQzk3IEF1ZGlvIHN1cHBvcnQgZm9yIGJicGxhbiBFZmlr
YSBhbmQgU1RBQzk3NjYiDQo+IC0gICAgICAgZGVwZW5kcyBvbiBQUENfRUZJS0ENCj4gKyAgICAg
ICBkZXBlbmRzIG9uIFBQQ19FRklLQSAmJiBQUENfQkVTVENPTU0NCj4gICAgICAgICBzZWxlY3Qg
U05EX1NPQ19NUEM1MjAwX0FDOTcNCj4gICAgICAgICBzZWxlY3QgU05EX1NPQ19TVEFDOTc2Ng0K
PiAgICAgICAgIGhlbHANCj4NCg==
