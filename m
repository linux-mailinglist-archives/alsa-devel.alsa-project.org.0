Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F539D122A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2024 14:40:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94EB7F4;
	Mon, 18 Nov 2024 14:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94EB7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731937211;
	bh=1dzIu+bDS3mEQECtESSifdxh9boBbAqXLDWb6o78W1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BM8BHQOnEZ6sZc/E0tbYVGescl6pqKj9zb51C2B/46ik5MjaNbbDhCJwFsx4HzvKD
	 YOLct4XJUoZk7zlBNnZDWCJxweXXlbXyF1fd1GQYQZ8kFAC2OoXnOy2Qx+U99dplhi
	 E1eXFAyz3zxzSoxNNPVvOYgmlol2LzPs9u8/NZX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BEF2F805BD; Mon, 18 Nov 2024 14:39:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCCFF805BB;
	Mon, 18 Nov 2024 14:39:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FF9FF8026D; Mon, 18 Nov 2024 14:39:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7151DF800BA
	for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2024 14:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7151DF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kg3o6mNG
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB8351BF208;
	Mon, 18 Nov 2024 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731937174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKBfmWwe0K8YK6G59KsdbaDz2+vE4JtCifokD5Jr7zc=;
	b=kg3o6mNGQfhtXlBOIcFMtnFqK7OJJG4S/uA++2tR7IMdOehPRj+qTUkcxNKZsF0cG/F2tl
	0ZgptP2PYC9FDYJwuWbteP+AZysqliZ5AjXxkJCmIgsRapeZgllNAdrIMyv9zvYXlwzrRx
	ZqV098zadeIDwrUDGNzQUrlE4xBplfMZD43XGUbtqou3is7C9EK0RaSZhQXtjbCbxLyl80
	9aEGY3YDkivEu5QHWUCM9NWfy8H6dVznjYMubOhNE5+h3OOltp9KVebf4/O6lkzkqvisQ/
	Ywr8UohM5O+ut7DpWgSA96aAkUNb0IorayZKgQZrcFnPpicVpPrZE1EBBPPBlg==
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
Subject: Re: [RFC PATCH 2/2] dt-bindings: spi: Update stacked and parallel
 bindings
In-Reply-To: <20241026075347.580858-3-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Sat, 26 Oct 2024 13:23:47 +0530")
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
	<20241026075347.580858-3-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:39:32 +0100
Message-ID: <87y11gwtij.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: H2SZW2LORGHY4IYLU4RRKE2NUBVIDY4Q
X-Message-ID-Hash: H2SZW2LORGHY4IYLU4RRKE2NUBVIDY4Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2SZW2LORGHY4IYLU4RRKE2NUBVIDY4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

On 26/10/2024 at 13:23:47 +0530, Amit Kumar Mahapatra <amit.kumar-mahapatra=
@amd.com> wrote:

> For implementing the proposed solution the current 'stacked-memories' &
> 'parallel-memories' bindings need to be updated as follow.
>
> stacked-memories binding changes:
> - Each flash will have its own flash node. This approach allows flashes of
>   different makes and sizes to be stacked together, as each flash will be
>   probed individually.
> - Each of the flash node will have its own =E2=80=9Creg=E2=80=9D property=
 that will contain
>   its physical CS.
> - Remove the size information from the bindings as it can be retrived
>   drirectly from the flash.
> - The stacked-memories DT bindings will contain the phandles of the flash
>   nodes connected in stacked mode.
>
> The new layer will update the mtd->size and other mtd_info parameters aft=
er
> both the flashes are probed and will call mtd_device_register with the
> combined information.
>
> spi@0 {
>         ...
>         flash@0 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x00>;
>                 stacked-memories =3D <&flash@0 &flash@1>;
>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {
>                         compatible =3D "fixed-partitions";
>                                 concat-partition =3D <&flash0_partition &=
flash1_partition>;
>                                 flash0_partition: partition@0 {
>                                         label =3D "part0_0";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
>         flash@1 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x01>;
>                 stacked-memories =3D <&flash@0 &flash@1>;
>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {

Same comment as before here.

>                         compatible =3D "fixed-partitions";
>                                 concat-partition =3D <&flash0_partition &=
flash1_partition>;
>                                 flash1_partition: partition@0 {
>                                         label =3D "part0_1";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
>
> }
>
> parallel-memories binding changes:
> - Remove the size information from the bindings and change the type to
>   boolen.
> - Each flash connected in parallel mode should be identical and will have
>   one flash node for both the flash devices.
> - The =E2=80=9Creg=E2=80=9D prop will contain the physical CS number for =
both the connected
>   flashes.
>
> The new layer will double the mtd-> size and register it with the mtd
> layer.

Not so sure about that, you'll need a new mtd device to capture the
whole device. But this is implementation related, not relevant for
binding.

>
> spi@1 {
>         ...
>         flash@3 {
>                 compatible =3D "jedec,spi-nor"
>                 reg =3D <0x00 0x01>;
>                 paralle-memories ;

Please fix the typos and the spacing (same above).

>                 spi-max-frequency =3D <50000000>;
>                 ...
>                         partitions {
>                         compatible =3D "fixed-partitions";
>                                 flash0_partition: partition@0 {
>                                         label =3D "part0_0";
>                                         reg =3D <0x0 0x800000>;
>                                 }
>                         }
>         }
> }
>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../bindings/spi/spi-controller.yaml          | 23 +++++++++++++++++--
>  .../bindings/spi/spi-peripheral-props.yaml    |  9 +++-----
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/=
Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 093150c0cb87..2d300f98dd72 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -185,7 +185,26 @@ examples:
>          flash@2 {
>              compatible =3D "jedec,spi-nor";
>              spi-max-frequency =3D <50000000>;
> -            reg =3D <2>, <3>;
> -            stacked-memories =3D /bits/ 64 <0x10000000 0x10000000>;
> +            reg =3D <2>;
> +            stacked-memories =3D <&flash0 &flash1>;
>          };

I'm sorry but this is not what you've talked about in this series.
Either you have flash0 and flash1 and use the stacked-memories property
in both of them (which is what you described) or you create a third
virtual device which points to two other flashes. This example allows
for an easier use of the partitions mechanism on top of a virtual mtd
device but, heh, you're now describing a virtual mtd device, which is
not a physical device as it "should" be.

Thanks,
Miqu=C3=A8l
