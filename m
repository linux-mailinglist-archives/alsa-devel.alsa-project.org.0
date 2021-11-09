Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3A44AD83
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 13:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30511654;
	Tue,  9 Nov 2021 13:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30511654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636461022;
	bh=K9YuDBGyFQL6LGftnreCec1a45FaTwatJfaA3K7976U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZd/IRojijDmDGziUWoXuM7Lt/4NEND0tLw3ZlZz0mO3hu/fBNb7/Wse/5mDqFHzc
	 zeHagpUjkhkpYlYsRTKv4WjvYlBMxLjlOYm+rW+fnZin3whw6OfJyae4cUXHZeTWFQ
	 86Eon5BAGi4KB2SBA+r3NmOe6v9JJ6SN1F91cWDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8601F80224;
	Tue,  9 Nov 2021 13:29:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD887F802D2; Tue,  9 Nov 2021 13:29:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 787AFF800C9
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 13:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 787AFF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="QhK8ZufL"
Received: from [127.0.0.1] (37-48-50-181.nat.epc.tmcz.cz [37.48.50.181])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id BE6E520064;
 Tue,  9 Nov 2021 13:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1636460931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/KTxYwpPq7QKcYnuyQGk0KK0u6IPgYbFhdr9d5r8Aqc=;
 b=QhK8ZufLm8qirdnmNWtHrkyJM9HQwJgcPOQdznKkQ6ITURh3M4mHt2v/X067xI6NKrCepB
 8FvB4Ves1xltpqQdHOymcejNB/GwxBZNfH9jilgKMygPVM+pPoIRicTlm0B+PCOL5Bp2wj
 i54Q7l9/cGzMpEJFRzkYWyudv+KqHng=
Date: Tue, 09 Nov 2021 12:24:36 +0000
From: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: sound: gtm601: convert to YAML
In-Reply-To: <YYmQ7OCIIb2AbnjY@robh.at.kernel.org>
References: <20211030121753.50191-1-david@ixit.cz>
 <YYmQ7OCIIb2AbnjY@robh.at.kernel.org>
Message-ID: <A1DBDD90-C79D-4455-9AC7-92C9DFB0F298@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, - <kernel@puri.sm>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, phone-devel@vger.kernel.org,
 ~okias/devicetree@lists.sr.ht
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

I agree, I'll adapt Librem 5 dts to follow original convention and resend=
=2E


-------- P=C5=AFvodn=C3=AD zpr=C3=A1va --------
Odes=C3=ADlatel: Rob Herring <robh@kernel=2Eorg>
Odesl=C3=A1no: 8=2E listopadu 2021 21:04:44 UTC
Komu: David Heidelberg <david@ixit=2Ecz>
Kopie: Liam Girdwood <lgirdwood@gmail=2Ecom>, Mark Brown <broonie@kernel=
=2Eorg>, - <kernel@puri=2Esm>, ~okias/devicetree@lists=2Esr=2Eht, phone-dev=
el@vger=2Ekernel=2Eorg, alsa-devel@alsa-project=2Eorg, devicetree@vger=2Eke=
rnel=2Eorg, linux-kernel@vger=2Ekernel=2Eorg
P=C5=99edm=C4=9Bt: Re: [PATCH v2] dt-bindings: sound: gtm601: convert to Y=
AML

On Sat, Oct 30, 2021 at 02:17:52PM +0200, David Heidelberg wrote:
> Convert GTM601 binding to the YAML format=2E
>=20
> Signed-off-by: David Heidelberg <david@ixit=2Ecz>
> ---
> v2:
>  - add #sound-dai-cells
>  - put kernel@puri=2Esm into maintainers
>=20
>  =2E=2E=2E/devicetree/bindings/sound/gtm601=2Etxt      | 19 ----------
>  =2E=2E=2E/devicetree/bindings/sound/gtm601=2Eyaml     | 36 ++++++++++++=
+++++++
>  2 files changed, 36 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/gtm601=2Etxt
>  create mode 100644 Documentation/devicetree/bindings/sound/gtm601=2Eyam=
l
>=20
> diff --git a/Documentation/devicetree/bindings/sound/gtm601=2Etxt b/Docu=
mentation/devicetree/bindings/sound/gtm601=2Etxt
> deleted file mode 100644
> index efa32a486c4a=2E=2E000000000000
> --- a/Documentation/devicetree/bindings/sound/gtm601=2Etxt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -GTM601 UMTS modem audio interface CODEC
> -
> -This device has no configuration interface=2E The sample rate and chann=
els are
> -based on the compatible string
> -	"option,gtm601" =3D 8kHz mono
> -	"broadmobi,bm818" =3D 48KHz stereo
> -
> -Required properties:
> -
> -  - compatible : one of
> -	"option,gtm601"
> -	"broadmobi,bm818"
> -
> -
> -Example:
> -
> -codec: gtm601_codec {
> -	compatible =3D "option,gtm601";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/gtm601=2Eyaml b/Doc=
umentation/devicetree/bindings/sound/gtm601=2Eyaml
> new file mode 100644
> index 000000000000=2E=2Ee81a6aa75522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/gtm601=2Eyaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2=2E0-only OR BSD-2-Clause
> +%YAML 1=2E2
> +---
> +$id: http://devicetree=2Eorg/schemas/sound/gtm601=2Eyaml#
> +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
> +
> +title: GTM601 UMTS modem audio interface CODEC
> +
> +maintainers:
> +  - kernel@puri=2Esm
> +
> +description: >
> +  This device has no configuration interface=2E The sample rate and cha=
nnels are
> +  based on the compatible string
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: broadmobi,bm818
> +          - const: option,gtm601

This does not match what the binding originally said=2E And generally this=
=20
combined with the one below should never be valid=2E

> +      - items:
> +          - enum:
> +              - broadmobi,bm818  # 48 kHz stereo
> +              - option,gtm601  # 8 kHz mono
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gtm601_codec {
> +        compatible =3D "option,gtm601";
> +    };
> --=20
> 2=2E33=2E0
>=20
>=20
