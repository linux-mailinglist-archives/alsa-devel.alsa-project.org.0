Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EE71F893
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 04:44:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088491F4;
	Fri,  2 Jun 2023 04:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088491F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685673892;
	bh=RzB6yjgjQgGUFqxkNi3QghckQ/rTjBk0izrlTxDPCR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UPMHNRxfd52hll4ZbbPu6l5v6sLOfj4tO9ypXpHWhAxrdXr4fLlrZzTUhgArl6Rfw
	 1PkMNyraWC7PjgGyVw4l7M94DauEWOWZMtvHMD/FRSOMSnShxgL19JZ7QGRHBAA2f7
	 atq9c223NIRuJoqr4WmwLvAVlUTl6NjPMhxAFoK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DAFBF80494; Fri,  2 Jun 2023 04:44:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DD0F80132;
	Fri,  2 Jun 2023 04:44:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DBC5F80149; Fri,  2 Jun 2023 04:43:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97692F800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 04:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97692F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Q8+6gAwv
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f60804faf4so14585975e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 19:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685673826; x=1688265826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7cVgh41cB56ZwBQc5auMOmbHnoylbtnEaXxcEFXrCkg=;
        b=Q8+6gAwvQm3mkfBcjKfRHTMkg6VRwfRaARy8Or+hDZS8V8F07JEFXUyQbDSyUnVN05
         LpYm5oYnk6atD8VVstSc3Cl1ZsJcny86M/Bc3sbGg5/lLM6k/yt0PUbk5mchk728IRIK
         TU9esCVwGSFOAfVi9v+QTm3Rc7Hyvw+RCP7B0upSf7mSPiN+33Swkr+GTnZgAjP1DSNw
         RtnLAgTFfHJXIpckUF8FnCCe0bPNL7EUPOguBb4alMrdqAAM1+bWPdLS9GK+aRW2se8l
         oPKGQQRWEftF0kMp+RlYzAQ7EpbZ2IBowOWj3UftfX4F8UQ1/XFZ+HVph8eRdx8yfXQl
         K74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685673826; x=1688265826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cVgh41cB56ZwBQc5auMOmbHnoylbtnEaXxcEFXrCkg=;
        b=dNyvLVnSX+u7cwi0buk7aFiCtSn3WHo1sbJdO2K00S8bx2VI3A2D7Rcm01dyKOn+fQ
         4LnwdjTI7PD5CDxHGu0ixqBunxkjy9lq8y6VdGvBRSC86loN6nua5QoU5qXooC6uu25n
         dgR3KUcJGqlPZVTWA918aFsrrDHXMgh4mUlnSeigVj4xSHthXc5BMQnMbympchEFdwsW
         XURKE7MsI6O+u8tT4dE6iiTxGg39ojWp9+v968PDivd6LqZpZsd51LY7ZqAGXXLbDDmD
         6I6JVvPx1zJlFaeJQz9i6EqXaFFWU/5N+ISQ287bh5ElSmJs02bMyPmqKN9DMZCASmOR
         qTiw==
X-Gm-Message-State: AC+VfDxb+MZQHoOUTOHUdnQjYUSQYo203ByVr+ElSue47TuMdMQ2H/Ei
	fGci7KC1YqDGFi1wJBpZfiahVNIWWUPrMJ0tgWc=
X-Google-Smtp-Source: 
 ACHHUZ4LtA8ru8OSkCtasFHOSmHlHQzQnBMH3+moMNHSO5F2m5tChotTQ58ICIWExoM5p70S0WdzAITRb7RTJsIp/X8=
X-Received: by 2002:a05:600c:292:b0:3f6:ae3:5948 with SMTP id
 18-20020a05600c029200b003f60ae35948mr891246wmk.33.1685673826427; Thu, 01 Jun
 2023 19:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230530103012.3448838-1-chancel.liu@nxp.com>
In-Reply-To: <20230530103012.3448838-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 2 Jun 2023 10:43:34 +0800
Message-ID: 
 <CAA+D8AMKa2AVjFj+VDUG2uVpfrPD8fwpXrmK6_N05owQE+EN1w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous
 mode with BYP asserted
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com
Message-ID-Hash: 6RSMWSWLYQ5UCUG2OAZXCI5S2JJOJPSL
X-Message-ID-Hash: 6RSMWSWLYQ5UCUG2OAZXCI5S2JJOJPSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RSMWSWLYQ5UCUG2OAZXCI5S2JJOJPSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgNjozMOKAr1BNIENoYW5jZWwgTGl1IDxjaGFuY2VsLmxp
dUBueHAuY29tPiB3cm90ZToNCg0KPiBUaGVyZSdzIGFuIGlzc3VlIG9uIFNBSSBzeW5jaHJvbm91
cyBtb2RlIHRoYXQgVFgvUlggc2lkZSBjYW4ndCBnZXQgQkNMSw0KPiBmcm9tIFJYL1RYIGl0IHN5
bmMgd2l0aCBpZiBCWVAgYml0IGlzIGFzc2VydGVkLiBJdCdzIGEgd29ya2Fyb3VuZCB0bw0KPiBm
aXggaXQgdGhhdCBlbmFibGUgU0lPTiBvZiBJT01VWCBwYWQgY29udHJvbCBhbmQgYXNzZXJ0IEJD
SS4NCj4NCj4gRm9yIGV4YW1wbGUgaWYgVFggc3luYyB3aXRoIFJYIHdoaWNoIG1lYW5zIGJvdGgg
VFggYW5kIFJYIGFyZSB1c2luZyBjbGsNCj4gZm9ybSBSWCBhbmQgQllQPTEuIFRYIGNhbiBnZXQg
QkNMSyBvbmx5IGlmIHRoZSBmb2xsb3dpbmcgdHdvIGNvbmRpdGlvbnMNCj4gYXJlIHZhbGlkOg0K
PiAxLiBTSU9OIG9mIFJYIEJDTEsgSU9NVVggcGFkIGlzIHNldCB0byAxDQo+IDIuIEJDSSBvZiBU
WCBpcyBzZXQgdG8gMQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFuY2VsIExpdSA8Y2hhbmNlbC5s
aXVAbnhwLmNvbT4NCj4NCg0KQWNrZWQtYnk6IFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdA
Z21haWwuY29tPg0KDQpCZXN0IHJlZ2FyZHMNCldhbmcgU2hlbmdqaXUNCg0KPiAtLS0NCj4gIHNv
dW5kL3NvYy9mc2wvZnNsX3NhaS5jIHwgMTEgKysrKysrKysrLS0NCj4gIHNvdW5kL3NvYy9mc2wv
ZnNsX3NhaS5oIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMg
Yi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuYw0KPiBpbmRleCBkOTM0NDAyNWRjMTYuLjVlMDlmNjM0
YzYxYiAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gKysrIGIvc291
bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gQEAgLTQ5MSwxNCArNDkxLDIxIEBAIHN0YXRpYyBpbnQg
ZnNsX3NhaV9zZXRfYmNsayhzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSwNCj4gYm9vbCB0eCwgdTMy
IGZyZXEpDQo+ICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHNhaS0+cmVnbWFwLCByZWcsIEZT
TF9TQUlfQ1IyX01TRUxfTUFTSywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgRlNMX1NB
SV9DUjJfTVNFTChzYWktPm1jbGtfaWRbdHhdKSk7DQo+DQo+IC0gICAgICAgaWYgKHNhdmVkaXYg
PT0gMSkNCj4gKyAgICAgICBpZiAoc2F2ZWRpdiA9PSAxKSB7DQo+ICAgICAgICAgICAgICAgICBy
ZWdtYXBfdXBkYXRlX2JpdHMoc2FpLT5yZWdtYXAsIHJlZywNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBGU0xfU0FJX0NSMl9ESVZfTUFTSyB8IEZTTF9TQUlfQ1IyX0JZUCwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGU0xfU0FJX0NSMl9CWVApOw0K
PiAtICAgICAgIGVsc2UNCj4gKyAgICAgICAgICAgICAgIGlmIChmc2xfc2FpX2Rpcl9pc19zeW5j
ZWQoc2FpLCBhZGlyKSkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9i
aXRzKHNhaS0+cmVnbWFwLCBGU0xfU0FJX3hDUjIodHgsDQo+IG9mcyksDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGU0xfU0FJX0NSMl9CQ0ksDQo+IEZTTF9T
QUlfQ1IyX0JDSSk7DQo+ICsgICAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhzYWktPnJlZ21hcCwgRlNMX1NBSV94Q1IyKHR4LA0K
PiBvZnMpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRlNM
X1NBSV9DUjJfQkNJLCAwKTsNCj4gKyAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgICAg
cmVnbWFwX3VwZGF0ZV9iaXRzKHNhaS0+cmVnbWFwLCByZWcsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRlNMX1NBSV9DUjJfRElWX01BU0sgfCBGU0xfU0FJX0NSMl9CWVAs
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2F2ZWRpdiAvIDIgLSAxKTsN
Cj4gKyAgICAgICB9DQo+DQo+ICAgICAgICAgaWYgKHNhaS0+c29jX2RhdGEtPm1heF9yZWdpc3Rl
ciA+PSBGU0xfU0FJX01DVEwpIHsNCj4gICAgICAgICAgICAgICAgIC8qIFNBSSBpcyBpbiBtYXN0
ZXIgbW9kZSBhdCB0aGlzIHBvaW50LCBzbyBlbmFibGUgTUNMSyAqLw0KPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ZzbC9mc2xfc2FpLmggYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuaA0KPiBpbmRl
eCAzZWI5OTRhZWYzNmEuLjgyNTRjMzU0N2I4NyAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2Zz
bC9mc2xfc2FpLmgNCj4gKysrIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmgNCj4gQEAgLTExNiw2
ICsxMTYsNyBAQA0KPg0KPiAgLyogU0FJIFRyYW5zbWl0IGFuZCBSZWNlaXZlIENvbmZpZ3VyYXRp
b24gMiBSZWdpc3RlciAqLw0KPiAgI2RlZmluZSBGU0xfU0FJX0NSMl9TWU5DICAgICAgIEJJVCgz
MCkNCj4gKyNkZWZpbmUgRlNMX1NBSV9DUjJfQkNJICAgICAgICAgICAgICAgIEJJVCgyOCkNCj4g
ICNkZWZpbmUgRlNMX1NBSV9DUjJfTVNFTF9NQVNLICAoMHgzIDw8IDI2KQ0KPiAgI2RlZmluZSBG
U0xfU0FJX0NSMl9NU0VMX0JVUyAgIDANCj4gICNkZWZpbmUgRlNMX1NBSV9DUjJfTVNFTF9NQ0xL
MSBCSVQoMjYpDQo+IC0tDQo+IDIuMjUuMQ0KPg0KPg0K
