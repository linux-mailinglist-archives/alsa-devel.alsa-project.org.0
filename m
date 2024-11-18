Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77269D11D9
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2024 14:28:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E20AB846;
	Mon, 18 Nov 2024 14:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E20AB846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731936486;
	bh=j+2aLqPO8jT7pUqSoOdhBzttb3wUlOWGxh1jMETKNlc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hEazPSE7mMu0ZTeq9D6kVcFkwp4iCdX77G7UXsixylGXdscQ5uSLYqhLeV++CL4yH
	 qLC2uRoVB0kaHW9UaC64fO4Ux2V6Ej9wwC45JnTsnZrhyhhKEHhG9paJJxPm5hZe/b
	 m++xiveN/NlZx33JynponVWUAOy+DiGC1epclIP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8403CF805AF; Mon, 18 Nov 2024 14:27:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A25F805B0;
	Mon, 18 Nov 2024 14:27:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51B4BF8026D; Mon, 18 Nov 2024 14:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73B8EF800BA
	for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2024 14:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B8EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TjnKsS73
Received: by mail.gandi.net (Postfix) with ESMTPSA id 491CE6000C;
	Mon, 18 Nov 2024 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C3aT8RFdCdTNdeyQreq16da7/I4iz4pcsvKIIFnCgCA=;
	b=TjnKsS73E0DI6Iz1Q01nvGmPESd+7DxF6LViNdUq0cX9Z0fhcRy+zhf1rsWcq79PUow3za
	RedWyADTe3BipekMwV1ef4XY/nveNr9lfcgJe4eucg+cC4f9nqXU1Al0w+rzpPv1ZlTkL4
	HWjP5twPA9CmE/HK7Q7xBEyU4DBsvYCeyZt+WyrLoXwfeDK9DI6KYjnW7Ab8tBOVTaZS3K
	YNrfEQzODkE3MW1LaAnQM5yksYIAph0J7GYoc5gRUVBOMDwH6TOBPu39VY25t+GtnWI1PU
	t+GuJMr7+z3Ssm8X8RkzTw6qDTocV4cBUXJ4Bck+T4PF979v2jPhGguDTJplDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <tudor.ambarus@linaro.org>,  <michael@walle.cc>,  <broonie@kernel.org>,
  <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <robh@kernel.org>,  <conor+dt@kernel.org>,  <krzk+dt@kernel.org>,
  <venkatesh.abbarapu@amd.com>,  <linux-spi@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <nicolas.ferre@microchip.com>,  <alexandre.belloni@bootlin.com>,
  <claudiu.beznea@tuxon.dev>,  <michal.simek@amd.com>,
  <linux-arm-kernel@lists.infradead.org>,  <alsa-devel@alsa-project.org>,
  <patches@opensource.cirrus.com>,  <git@amd.com>,
  <amitrkcian2002@gmail.com>,  <beanhuo@micron.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: mtd: Add bindings for describing
 concatinated MTD devices
In-Reply-To: <20241026075347.580858-2-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:46 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-2-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:27:21 +0100
Message-ID: <87frnoy8na.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: DKVY3ZFP4RLLZQZ3O3OQAOGAEXAZZBWL
X-Message-ID-Hash: DKVY3ZFP4RLLZQZ3O3OQAOGAEXAZZBWL
X-MailFrom: miquel.raynal@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKVY3ZFP4RLLZQZ3O3OQAOGAEXAZZBWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/10/2024 at 13:23:46 +0530, Amit Kumar Mahapatra <amit.kumar-mahapatra=
@amd.com> wrote:

> This approach was suggested by Rob [1] during a discussion on Miquel's
> initial approach [2] to extend the MTD-CONCAT driver to support stacked
> memories.
> Define each flash node separately with its respective partitions, and add
> a 'concat-parts' binding to link the partitions of the two flash nodes th=
at
> need to be concatenated.
>
> flash@0 {
>         compatible =3D "jedec,spi-nor"
>         ...
>                 partitions {

Wrong indentation here and below which makes the example hard to read.

>                 compatible =3D "fixed-partitions";
>                         concat-partition =3D <&flash0_partition &flash1_p=
artition>;
>                         flash0_partition: partition@0 {
>                                 label =3D "part0_0";
>                                 reg =3D <0x0 0x800000>;
>                         }
>                 }
> }
> flash@1 {
>         compatible =3D "jedec,spi-nor"
>         ...
>                 partitions {
>                 compatible =3D "fixed-partitions";
>                         concat-partition =3D <&flash0_partition &flash1_p=
artition>;
>                         flash1_partition: partition@0 {
>                                 label =3D "part0_1";
>                                 reg =3D <0x0 0x800000>;
>                         }
>                 }
> }

This approach has a limitation I didn't think about before: you cannot
use anything else than fixed partitions as partition parser.

> Based on the bindings the MTD-CONCAT driver need to be updated to create
> virtual mtd-concat devices.
>
> [1] https://lore.kernel.org/all/20191118221341.GA30937@bogus/
> [2] https://lore.kernel.org/all/20191113171505.26128-4-miquel.raynal@boot=
lin.com/
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../mtd/partitions/fixed-partitions.yaml       | 18 ++++++++++++++++++
>  .../bindings/mtd/partitions/partitions.yaml    |  6 ++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-parti=
tions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partiti=
ons.yaml
> index 058253d6d889..df4ccb3dfeba 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.y=
aml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.y=
aml
> @@ -183,3 +183,21 @@ examples:
>              read-only;
>          };
>      };
> +
> +  - |
> +    partitions {
> +        compatible =3D "fixed-partitions";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;

This is not strictly related but I believe we will soon have issues with
these, as we will soon cross the 4GiB boundary.

> +        concat-parts =3D <&part0 &part1>;
> +
> +        part0: partition@0 {
> +            label =3D "flash0-part0";
> +            reg =3D <0x0000000 0x100000>;
> +        };
> +
> +        part1: partition@100000 {
> +            label =3D "flash1-part0";
> +            reg =3D <0x0100000 0x200000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.=
yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> index 1dda2c80747b..86bbd83c3f6d 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> @@ -32,6 +32,12 @@ properties:
>    '#size-cells':
>      enum: [1, 2]
>=20=20
> +  concat-parts:
> +    description: List of MTD partitions phandles that should be concaten=
ated.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 2
> +    maxItems: 4
> +
>  patternProperties:
>    "^partition(-.+|@[0-9a-f]+)$":
>      $ref: partition.yaml

Fine by me otherwise.

Thanks,
Miqu=C3=A8l
