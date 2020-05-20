Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D51DB245
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 13:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E606A17E5;
	Wed, 20 May 2020 13:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E606A17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589975481;
	bh=zXOUhjZMnPktnCnKz4ujk9HzStj+8Jv8BXI8cSnAh6I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vM7I3RZxJJgsvQHohnlXCwodzt+lTfkup7qAE/SNaq8k0ww6220pbzNspj+1rRaG1
	 7fqCnQ8UQ7OcX7Rglx/tmvC8Kb0CVDO11qNu3VUbvwZ+sfYxOOcZg8hLJm2YKI20/e
	 l4ZAn3VlSd2G5gwU+ordKqUJjTnAj8jgG6TctBBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 812FBF80111;
	Wed, 20 May 2020 13:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E64F801F9; Wed, 20 May 2020 13:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9DE1F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 13:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DE1F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qy6vxFdR"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KBnQjh123349;
 Wed, 20 May 2020 06:49:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589975366;
 bh=Gx25CuLYfdYGhNovA6QelhZHtLk7dH6680FoFIGjqIQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qy6vxFdRGl539Oz6QJR0Mnx2biWsJAaAsL7irz8665lfM5Cdi3j7l2IdXZO3C1KMc
 qwJaCeUi3Hd+UGW27XdevkW+g/3k0RdFtchTfbdkKy7KArGKBUOO02Stt51KxmpXAc
 cGWBIVCBTd4g+sKv9o0yjj3YM/Be4U0oDe1fkQ3A=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KBnQeF028457
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 06:49:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 06:49:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 06:49:26 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KBnOvm024082;
 Wed, 20 May 2020 06:49:25 -0500
Subject: Re: [PATCH v2 2/3] bindings: sound: Add documentation for TI j721e
 EVM (CPB and IVI)
To: Rob Herring <robh@kernel.org>
References: <20200512131633.32668-1-peter.ujfalusi@ti.com>
 <20200512131633.32668-3-peter.ujfalusi@ti.com>
 <20200519222132.GA488519@bogus>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <65631db2-5cb2-003a-0526-65d26372616b@ti.com>
Date: Wed, 20 May 2020 14:50:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519222132.GA488519@bogus>
Content-Type: multipart/mixed; boundary="------------689C9A95A3E3A49AACBEA3AD"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

--------------689C9A95A3E3A49AACBEA3AD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On 20/05/2020 1.21, Rob Herring wrote:
> On Tue, May 12, 2020 at 04:16:32PM +0300, Peter Ujfalusi wrote:
>> The audio support on the Common Processor Board board is using
>> pcm3168a codec connected to McASP10 serializers in parallel setup.
>>
>> The Infotainment board plugs into the Common Processor Board, the supp=
ort
>> of the extension board is extending the CPB audio support by adding
>> the two codecs on the expansion board.
>>
>> The audio support on the Infotainment Expansion Board consists of McAS=
P0
>> connected to two pcm3168a codecs with dedicated set of serializers to =
each.
>> The SCKI for pcm3168a is sourced from j721e AUDIO_REFCLK0 pin.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> ---
>>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  93 ++++++++++++
>>  .../sound/ti,j721e-cpb-ivi-audio.yaml         | 142 +++++++++++++++++=
+
>>  2 files changed, 235 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-c=
pb-audio.yaml
>>  create mode 100644 Documentation/devicetree/bindings/sound/ti,j721e-c=
pb-ivi-audio.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audi=
o.yaml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
>> new file mode 100644
>> index 000000000000..0355ffc2b01b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/ti,j721e-cpb-audio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments J721e Common Processor Board Audio Support
>> +
>> +maintainers:
>> +  - Peter Ujfalusi <peter.ujfalusi@ti.com>
>> +
>> +description: |
>> +  The audio support on the board is using pcm3168a codec connected to=
 McASP10
>> +  serializers in parallel setup.
>> +  The pcm3168a SCKI clock is sourced from j721e AUDIO_REFCLK2 pin.
>> +  In order to support 48KHz and 44.1KHz family of sampling rates the =
parent
>> +  clock for AUDIO_REFCLK2 needs to be changed between PLL4 (for 48KHz=
) and
>> +  PLL15 (for 44.1KHz). The same PLLs are used for McASP10's AUXCLK cl=
ock via
>> +  different HSDIVIDER.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: ti,j721e-cpb-audio
>> +
>> +  model:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: User specified audio sound card name
>> +
>> +  ti,cpb-mcasp:
>> +    description: phandle to McASP10
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  ti,cpb-codec:
>> +    description: phandle to the pcm3168a codec used on the CPB
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +  clocks:
>> +    items:
>> +      - description: PLL4 clock
>> +      - description: PLL15 clock
>> +      - description: McASP10 auxclk clock
>> +      - description: PLL4_HSDIV0 parent for McASP10 auxclk (for 48KHz=
)
>> +      - description: PLL15_HSDIV0 parent for McASP10 auxclk (for 44.1=
KHz)
>> +      - description: AUDIO_REFCLK2 clock
>> +      - description: PLL4_HSDIV2 parent for AUDIO_REFCLK2 clock (for =
48KHz)
>> +      - description: PLL15_HSDIV2 parent for AUDIO_REFCLK2 clock (for=
 44.1KHz)
>=20
> What h/w are these connected to?

These clocks are internal to the SoC with the exception of AUDIO_REFCLK2
which is routed to SoC pin.

> You have no control interface here, so how do you have clocks?

I need to control these clocks, the sound card is the user of these clock=
s.

> Defining parent clocks seems wrong, too. This seems to just be a=20
> collection of clocks a driver happens to need. Really, you should be=20
> able query possible parents and select one with the right frequency=20
> multiple.

The issue in hand is that I need to dynamically switch between certain
parents of the cpb-mcasp (for McASP) and audio-refclk2 (for the codec)
based on sampling rate of the stream.

The McASP auxclk parent can be selected from 7 source and I must use the
two dedicated ones.
The REFCLK2 parent can be selected from 30 source.

It is also a limitation of the system that I can not query directly the
PLL4/PLL15 frequencies, I can only get the frequency on the HSDIVs, but
I can not get the divider on them.
In order to handle the constraints on clocking I need to know the source
rate so the dividers can be taken into account. The codec is picky when
it comes to clocking and there is a need to switch between
256/512/768xFS based SCKI in order to be able to support sampling rates.

At the moment I have fixed clocks in place for the pll4/15 with the
rates they are configured so the dts can switch to a real clock which I
can use in the future.
As things are it is unlikely that I will ever going to have access to
them, but I wanted to avoid in the bindings:
ti,j721e-pll4-rate =3D <1179648000>;
ti,j721e-pll15-rate =3D <1083801600>;

>> +
>> +  clock-names:
>> +    items:
>> +      - const: pll4
>> +      - const: pll15
>> +      - const: cpb-mcasp
>> +      - const: cpb-mcasp-48000
>> +      - const: cpb-mcasp-44100
>> +      - const: audio-refclk2
>> +      - const: audio-refclk2-48000
>> +      - const: audio-refclk2-44100
>> +
>> +required:
>> +  - compatible
>> +  - model
>> +  - ti,cpb-mcasp
>> +  - ti,cpb-codec
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |+
>> +    sound {
>> +        compatible =3D "ti,j721e-cpb-audio";
>> +        model =3D "j721e-cpb";
>> +
>> +        status =3D "okay";
>=20
> Don't show status in examples.

Oops, it is a leftower

>=20
>> +
>> +        ti,cpb-mcasp =3D <&mcasp10>;
>> +        ti,cpb-codec =3D <&pcm3168a_1>;
>> +
>> +        clocks =3D <&pll4>, <&pll15>,
>> +                 <&k3_clks 184 1>,
>> +                 <&k3_clks 184 2>, <&k3_clks 184 4>,
>> +                 <&k3_clks 157 371>,
>> +                 <&k3_clks 157 400>, <&k3_clks 157 401>;
>> +        clock-names =3D "pll4", "pll15",
>> +                      "cpb-mcasp",
>> +                      "cpb-mcasp-48000", "cpb-mcasp-44100",
>> +                      "audio-refclk2",
>> +                      "audio-refclk2-48000", "audio-refclk2-44100";
>> +    };

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------689C9A95A3E3A49AACBEA3AD
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFki4nsBCAD3BM+Ogt951JlaDloruEjoZk/Z+/37CjP0fY2mqLhBOzkpx95u
X1Fquf0KfVk+ZzCd25XGOZEtpZNlXfbxRr2iRWPS5RW2FeLYGvg2TTJCpSr+ugKu
OOec6KECCUotGbGhpYwBrbarJNEwDcAzPK7UJYa1rhWOmkpZJ1hXF1hUghB84q35
8DmN4sGLcsIbVdRFZ1tWFh4vGBFV9LsoDZIrnnANb6/XMX78s+tr3RG3GZBaFPl8
jO5IIv0UIGNUKaYlNVFYthjGCzOqtstHchWuK9eQkR7m1+Vc+ezh1qK0VJydIcjn
OtoMZZL7RAz13LB9vmcJjbQPnI7dJojz/M7zABEBAAG0JlBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+iQFOBBMBCAA4FiEE+dBcpRFvJjZw+uta
LCayis85LN4FAlki4nsCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQLCay
is85LN4QjggAzxxxXqiWpA3vuj9yrlGLft3BeGKWqF8+RzdeRvshtNdpGeIFf+r5
AJVR71R1w89Qeb4DGXus7qsKiafdFGG7yxbuhw8a5wUm+ZncBXA+ETn3OyVtl8g8
r/ZcPX420jClBNTVuL0sSnyqDFDrt5f+uAFOIwsnHdpns174Zu9QhgYxdvdZ+jMh
Psb745O9EVeNvdfUIRdrVjb4IhJKNIzkb0Tulsz5xeCJReUYpxZU1jzEq3YZqIou
+fi+oS4wlJuSoxKKTmIXtSeEy/weStF1XHMo6vLYqzaK4FyIuclqeuYUYSVy2425
7TMXugaI+O85AEI6KW8MCcu1NucSfAWUabkBDQRZIuJ7AQgAypKq8iIugpHxWA2c
Ck6MQdPBT6cOEVK0tjeHaHAVOUPiw9Pq+ssMifdIkDdqXNZ3RLH/X2svYvd8c81C
egqshfB8nkJ5EKmQc9d7s0EwnYT8OwsoVb3c2WXnsdcKEyu2nHgyeJEUpPpMPyLc
+PWhoREifttab4sOPktepdnUbvrDK/gkjHmiG6+L2owSn637N+Apo3/eQuDajfEu
kybxK19ReRcp6dbqWSBGSeNB32c/zv1ka37bTMNVUY39Rl+/8lA/utLfrMeACHRO
FGO1BexMASKUdmlB0v9n4BaJFGrAJYAFJBNHLCDemqkU7gjaiimuHSjwuP0Wk7Ct
KQJfVQARAQABiQE2BBgBCAAgFiEE+dBcpRFvJjZw+utaLCayis85LN4FAlki4nsC
GwwACgkQLCayis85LN7kCwgAoy9r3ZQfJNOXO1q/YQfpEELHn0p8LpwliSDUS1xL
sswyxtZS8LlW8PjlTXuBLu38Vfr0vGav7oyV7TkhnKT3oBOLXanyZqwgyZSKNEGB
PB4v3Fo7YTzpfSofiwuz03uyfjTxiMGjonxSb+YxM7HBHfzjrOKKlg02fK+lWNZo
m5lXugeWD7U6JJguNdYfr+U4zYIblelUImcIE+wnR0oLzUEVDIWSpVrl/OqS3Rzo
mw8wBsHksTHrbgUnKL0SCzYc90BTeKbyjEBnVDr+dlfbxRxkB8h9RMPMdjodvXzS
Gfsa9V/k4XAsh7iX9EUVBbnmjA61ySxU/w98h96jMuteTg=3D=3D
=3DeQmw
-----END PGP PUBLIC KEY BLOCK-----

--------------689C9A95A3E3A49AACBEA3AD--
