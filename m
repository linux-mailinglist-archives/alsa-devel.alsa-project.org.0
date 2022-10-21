Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB760AE16
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096F374D7;
	Mon, 24 Oct 2022 16:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096F374D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622897;
	bh=AIUX0+O64nykYk3SsLF5dIKIudlMpR5Eb4vKr7571lo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uj+k3obhlfwf00rktsnPKrSkCqBbmbEBap2GGvtKO2USUh4ESiFnT/aK0tp5r+6Rd
	 DCpNHGXCQyXPAivMRaY+aHJiy2zN18txevOzUcglZji9g7WHFIae5DB7KRGkwLadm/
	 t+Zy2oQAPsGo+YS00NBOEDX1sfwMMyt7GJwOjHVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A9FF8058C;
	Mon, 24 Oct 2022 16:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC6DCF800B5; Fri, 21 Oct 2022 21:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB19F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB19F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="k6SoNyV6"
Received: from [10.0.0.163] (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: david.heidelberg)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C58B066025FA;
 Fri, 21 Oct 2022 20:17:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666379872;
 bh=5JoqpvIeIVnbkgZEA0L2xNRd9xGh1NYvaRQdmk73hpA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k6SoNyV6QY1zZ+StUQYv2+IHEtSM6JxTuxNVwMPL2eBg7iLnw2Fm83DK4aRiB/A6g
 047caoIrXZ/mW8tWLa7Dp3RLXan5KvZBNeLA3hyrQTIEEd19zcsdHZSHSwey9BN0Q3
 /EelXBGFXlVSSap8IUWMVMHOE0Nv845OLUIm67z8OA7Xhl3Wz754v0c8Xtd0uYT5kW
 QW5PpV6JMjsfTjjMXPS2Wr0Gq95Ve9fIbCFhksbCSI61XHiENTcirBfvlolyyupDHZ
 iulkNMJeM01jnRSE8JevDftfrg6hObczJVWvn66hWl9ClV8FBg3bZ662dTei56OnSq
 UPrSsXSOVNz5Q==
Message-ID: <aedd2f30-3f27-757f-6d2b-d34067b9e6d6@collabora.com>
Date: Fri, 21 Oct 2022 21:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
From: David Heidelberg <david.heidelberg@collabora.com>
Autocrypt: addr=david.heidelberg@collabora.com; keydata=
 xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGNPwqEeILN
 MURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFib3JhLmNvbT7ClgQT
 FggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsDBQkFo5qABQsJCAcCBhUKCQgL
 AgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5YqSWAOuIumAqgWvke6BEsaIGWGQzXSuKj
 er/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQB
 l1UBBQEBB0AEk7jXEwDApGOwMH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYh
 BEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0Y
 uAOKJCnnwrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
 wueLHBdwHg6zAQ==
In-Reply-To: <20221021190908.1502026-3-nfraprado@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7IDW3YrPnWNDMBG09VTeo65l"
X-Mailman-Approved-At: Mon, 24 Oct 2022 16:44:48 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7IDW3YrPnWNDMBG09VTeo65l
From: David Heidelberg <david.heidelberg@collabora.com>
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Message-ID: <aedd2f30-3f27-757f-6d2b-d34067b9e6d6@collabora.com>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
In-Reply-To: <20221021190908.1502026-3-nfraprado@collabora.com>
Content-Type: multipart/mixed; boundary="------------J2fwV7r1wXG0m4q6aeHfxIlj"

--------------J2fwV7r1wXG0m4q6aeHfxIlj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IERhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT4NCg0KT24gMjEvMTAvMjAyMiAyMTowOSwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6DQo+IFRoZSBydDU2ODJzIGNvZGVjIGNhbiBoYXZlIHR3byBzdXBwbGllczog
QVZERCBhbmQgTUlDVkRELiBBZGQgcHJvcGVydGllcw0KPiBmb3IgdGhlbS4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJv
cmEuY29tPg0KPiAtLS0NCj4NCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvcmVhbHRlayxydDU2ODJzLnlhbWwgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVhbHRlayxydDU2ODJzLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVhbHRlayxydDU2ODJzLnlh
bWwNCj4gaW5kZXggZWE1M2E1NTAxNWM0Li5jYTEwMzdlNzZmOTYgMTAwNjQ0DQo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yZWFsdGVrLHJ0NTY4
MnMueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvcmVhbHRlayxydDU2ODJzLnlhbWwNCj4gQEAgLTkwLDYgKzkwLDEwIEBAIHByb3BlcnRp
ZXM6DQo+ICAgICAiI3NvdW5kLWRhaS1jZWxscyI6DQo+ICAgICAgIGNvbnN0OiAwDQo+ICAg
DQo+ICsgIEFWREQtc3VwcGx5OiB0cnVlDQo+ICsNCj4gKyAgTUlDVkRELXN1cHBseTogdHJ1
ZQ0KPiArDQo+ICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICAgDQo+ICAgcmVx
dWlyZWQ6DQo=
--------------J2fwV7r1wXG0m4q6aeHfxIlj
Content-Type: application/pgp-keys; name="OpenPGP_0x69F567861C1EC014.asc"
Content-Disposition: attachment; filename="OpenPGP_0x69F567861C1EC014.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYlvLOxYJKwYBBAHaRw8BAQdA5CoWEzz4igpwK4h6lK6ZformRk84+ymcfkGN
PwqEeILNMURhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT7ClgQTFggAPhYhBEo7kSl22BK0F1Np/mn1Z4YcHsAUBQJiW8s7AhsD
BQkFo5qABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEGn1Z4YcHsAU84kBAK5Y
qSWAOuIumAqgWvke6BEsaIGWGQzXSuKjer/TXuFuAQCwc9ITSVXWWTSpdFt2+4z7
Wch8tIGlbIFcS9dCFddwCc44BGJbyzsSCisGAQQBl1UBBQEBB0AEk7jXEwDApGOw
MH/X0UAPBH8Y3isjxhNMjpyRcnl2CwMBCAfCfgQYFggAJhYhBEo7kSl22BK0F1Np
/mn1Z4YcHsAUBQJiW8s7AhsMBQkFo5qAAAoJEGn1Z4YcHsAU0PEA/j0YuAOKJCnn
wrkf3ozPP0sutA5bojoARwcIaZKO/zvIAP9PwTC9DGLg+8LJm7m2Lyf0LxLA8FXD
wueLHBdwHg6zAQ=3D=3D
=3DOQS+
-----END PGP PUBLIC KEY BLOCK-----

--------------J2fwV7r1wXG0m4q6aeHfxIlj--

--------------7IDW3YrPnWNDMBG09VTeo65l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRKO5EpdtgStBdTaf5p9WeGHB7AFAUCY1LwXQAKCRBp9WeGHB7A
FO9pAP9zwthSYYt9lC+meBeHS4DNmDJlPdVDLfrzj7KcwatqwgEA02fTCaJRzCSS
fzPRIZBbpaXBnfP5RvDu4QZoTynFBAQ=
=Yczf
-----END PGP SIGNATURE-----

--------------7IDW3YrPnWNDMBG09VTeo65l--
