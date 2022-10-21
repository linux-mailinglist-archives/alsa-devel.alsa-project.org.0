Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C288F60AE15
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 16:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6368874ED;
	Mon, 24 Oct 2022 16:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6368874ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666622878;
	bh=8H8tsjE2P4dRKWye8OGy/jeS4EmvUJPljmhpynzhniQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miI0bGW0RFuq1QQMzNYTnTV6YXEfcvSZScNP/cbYADC8lalBiVEO9gZOOQqWygxUV
	 NWmkDaAiOlQCiqhKV7ZMs9LGsrd3/oXUWOd78PmYwSa3C1SNqr6o9/YyWogn436tNy
	 1AaewOsuFUaaW84uY52Kyyk52yub3CO9zUrTAw6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E297AF8057E;
	Mon, 24 Oct 2022 16:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B12AF80134; Fri, 21 Oct 2022 21:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 612CEF800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 612CEF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="H6rcCyRC"
Received: from [10.0.0.163] (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: david.heidelberg)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C5C7660253A;
 Fri, 21 Oct 2022 20:16:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666379787;
 bh=OYuPcltk7wXqux8hLGHhNWZzeIJU0WgTRQePEpSmk7k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H6rcCyRCBctLqlcYCxMjtnUXHzh7Hr5zLOZ/PGOHhn1K6nG2iGCu+IC8o3vm/5tv2
 J0AwMmy/pvf7aiY+HpTEZfoGWYhl8RoM/YkSZhvkhKuQVB1TdrBR7tNyvfLtKrNtw5
 vxVv+BZoAWszqzAnXW3k+fx/hAZb1n07dDf3Ju05j1sNNmf0+9x9FQrarwg2FsHeoW
 qH+zJK0PmoIQfCtyxajmrtMe+fqk8D5VECJFYXH3tCPZVdpZTH1qJJxLjzTwxvGNGL
 HIqggO0l/40v5yl3F7aTeD4U2LY7o90O3LTVBOKE6TicglGqPcEtbaZFXR0Nm1wtlN
 ZIwAliSXQ7Qtg==
Message-ID: <e16abd0e-5d77-b8c3-ab1a-0f7e007959ad@collabora.com>
Date: Fri, 21 Oct 2022 21:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5682s: Add
 #sound-dai-cells
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-2-nfraprado@collabora.com>
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
In-Reply-To: <20221021190908.1502026-2-nfraprado@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Dwq056HTbDRo1NJKSwSu5dVP"
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
--------------Dwq056HTbDRo1NJKSwSu5dVP
From: David Heidelberg <david.heidelberg@collabora.com>
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Message-ID: <e16abd0e-5d77-b8c3-ab1a-0f7e007959ad@collabora.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5682s: Add
 #sound-dai-cells
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-2-nfraprado@collabora.com>
In-Reply-To: <20221021190908.1502026-2-nfraprado@collabora.com>
Content-Type: multipart/mixed; boundary="------------BFEXJjEwjk1Uz3NY12oqWXvr"

--------------BFEXJjEwjk1Uz3NY12oqWXvr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IERhdmlkIEhlaWRlbGJlcmcgPGRhdmlkLmhlaWRlbGJlcmdAY29sbGFi
b3JhLmNvbT4NCg0KT24gMjEvMTAvMjAyMiAyMTowOSwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6DQo+IFRoZSBydDU2ODJzIGNvZGVjIGNhbiBiZSBwb2ludGVkIHRvIHRocm91
Z2ggYSBzb3VuZC1kYWkgcHJvcGVydHkgdG8gYmUNCj4gdXNlZCBhcyBwYXJ0IG9mIGEgbWFj
aGluZSBzb3VuZCBkcml2ZXIuIGR0YyBleHBlY3RzICNzb3VuZC1kYWktY2VsbHMgdG8NCj4g
YmUgZGVmaW5lZCBpbiB0aGUgY29kZWMncyBub2RlIGluIHRob3NlIGNhc2VzLCBzbyBhZGQg
aXQgaW4gdGhlDQo+IGR0LWJpbmRpbmcgYW5kIHNldCBpdCB0byAwLg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5j
b20+DQo+DQo+IC0tLQ0KPg0KPiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb3VuZC9yZWFsdGVrLHJ0NTY4MnMueWFtbCB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWsscnQ1Njgycy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWsscnQ1Njgycy55YW1s
DQo+IGluZGV4IGNhNWI4OTg3Yjc0OS4uZWE1M2E1NTAxNWM0IDEwMDY0NA0KPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVhbHRlayxydDU2ODJz
LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L3JlYWx0ZWsscnQ1Njgycy55YW1sDQo+IEBAIC04Nyw2ICs4Nyw5IEBAIHByb3BlcnRpZXM6
DQo+ICAgICAgIG1heEl0ZW1zOiAyDQo+ICAgICAgIGRlc2NyaXB0aW9uOiBOYW1lIGdpdmVu
IGZvciBEQUkgd29yZCBjbG9jayBhbmQgYml0IGNsb2NrIG91dHB1dHMuDQo+ICAgDQo+ICsg
ICIjc291bmQtZGFpLWNlbGxzIjoNCj4gKyAgICBjb25zdDogMA0KPiArDQo+ICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICAgDQo+ICAgcmVxdWlyZWQ6DQoNCi0tIA0KRGF2
aWQgSGVpZGVsYmVyZw0KQ29uc3VsdGFudCBTb2Z0d2FyZSBFbmdpbmVlcg0KDQpDb2xsYWJv
cmEgTHRkLg0KUGxhdGludW0gQnVpbGRpbmcsIFN0IEpvaG4ncyBJbm5vdmF0aW9uIFBhcmss
IENhbWJyaWRnZSBDQjQgMERTLCBVSw0KUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMs
IG5vLiA1NTEzNzE4DQoNCg==
--------------BFEXJjEwjk1Uz3NY12oqWXvr
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

--------------BFEXJjEwjk1Uz3NY12oqWXvr--

--------------Dwq056HTbDRo1NJKSwSu5dVP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRKO5EpdtgStBdTaf5p9WeGHB7AFAUCY1LwCAAKCRBp9WeGHB7A
FLwAAPsHxCk9Yzle7iMqW6e9mmZCR67Db58XD37iaR4uZe0OBQD+PuzXDRrgqovM
ad5MBH7ZYz/rVJePDEiNW40JoQ9pNAc=
=xQ7E
-----END PGP SIGNATURE-----

--------------Dwq056HTbDRo1NJKSwSu5dVP--
