Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D8989DA1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 11:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2E481926;
	Mon, 30 Sep 2024 11:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2E481926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727687091;
	bh=5vfmCoWhJfN9myIJ8um04DTZKKRCmBeNbBVzguOQXMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nErpeeClh2pAcnJi/foeQshKZNTWsLUVJGN/Oqu8BdhpXWvHj/u481Xf8Y52jzq6v
	 1fAgjC5uUkMT8wcEzMWad5vY1qglowaVeCaRmR3wJMoXD+m/4+QkbX9TB522nOqMxB
	 K147YPpunKaKP0uA0cEl44hbone1H5IRzenVDzSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E999F805A9; Mon, 30 Sep 2024 11:04:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87638F805AD;
	Mon, 30 Sep 2024 11:04:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 825B1F80508; Mon, 30 Sep 2024 11:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BCC5F80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 11:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BCC5F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oopwFy97
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29C2D40009;
	Mon, 30 Sep 2024 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727687053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/Yd74SXWwnJNHzkH+B1zGDPYPSWPzutmB3r6NlN8+k=;
	b=oopwFy97Xs7m4K3UfEGC1hiSSNHKTDyWZt9dJs73tB3PhVekjYUwWjFTpXxO9rhGuwRcmO
	7EY460BtJoyBI+PszIgN0UqnD7FmeuGdO66U/wzlSL49YKAnVFWxzKZQqg5GViNphID+YS
	GoW6P4MpEYAGoSwerOwunKoJeKsq5S7j+qpOV5xD/FKvGAzX4OMK2gx61LXZ8CWjDIOEXS
	+7H8X+m6td/vhZ38an6ytEtNTgQNe8GqLcq3hxsAfAS0En8/N59vH5/z446z+0K/TdOA5Y
	riEwwRZm+c++1OUJ0NH0ycTAbZzXXGCnsAHUqCs6sQ6pgE8FYRgGMxIkB8Voig==
Date: Mon, 30 Sep 2024 11:04:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, "michael@walle.cc"
 <michael@walle.cc>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>, Rob Herring
 <robh@kernel.org>, "cornor+dt@kernel.org" <cornor+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
 <claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
Subject: Re: Add stacked and parallel memories support in spi-nor
Message-ID: <20240930110408.6ec43e97@xps-13>
In-Reply-To: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
References: 
 <IA0PR12MB7699B360C7CF59E0A3D095F9DC8D2@IA0PR12MB7699.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: 4I6RNOQPLDF565UAAOBRYDNMG4PG6O6I
X-Message-ID-Hash: 4I6RNOQPLDF565UAAOBRYDNMG4PG6O6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4I6RNOQPLDF565UAAOBRYDNMG4PG6O6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

> For implementing this the current DT binding[1] [2] [3] need to be update=
d as follows.
>=20
>=20
>=20
> stacked-memories DT changes:
>=20
> - Flash size information can be retrieved directly from the flash, so it =
has been removed from the DT binding.
>=20
> - Each stacked flash will have its own flash node. This approach allows f=
lashes of different makes and sizes to be stacked together, as each flash w=
ill be probed individually.
>=20
> -  Each of the flash node will have its own "reg" property that will cont=
ain its physical CS.

These three first points are just describing the existing bindings for
non-concatenated situations.

> - The stacked-memories DT bindings will contain the phandles of the flash=
 nodes connected in stacked mode.
>=20
> - The first flash node will contain the mtd partition that would have the=
 cross over memory staring at a memory location in the first flash and endi=
ng at some memory location of the 2nd flash

I don't like that much. Describing partitions past the actual device
sounds wrong. If you look into [1] there is a suggestion from Rob to
handle this case using a property that tells us there is a
continuation, so from a software perspective we can easily make the
link, but on the hardware description side the information are correct.

If this description is accepted, then fine, you can deprecate the=20
"stacked-memories" property.

>  - The new layer will update the mtd->size and other mtd_info parameters =
after both the flashes are probed and will call mtd_device_register with th=
e combined information.

Okay, this is back to the mtd-concat thing I initially proposed, but I
believe it can work.

[...]

> parallel-memories DT changes:
>=20
> - Flash size information can be retrieved directly from the flash, so it =
has been removed from the DT binding.

It's not really about the size but more about the fact that two
memories are in use. If the stacked situation does not require anything
specific besides the partitions trick, then you can assume that double
reg flashes are just two flashes and this can be your way to
discriminate the data organization. But I don't like much this shortcut
because it is not future proof, and instead I'd keep the stacked-memory
property. If you don't like the size, I don't really care, just use it
as a boolean. But I believe we need some naming to tell the OS that the
data is spread in a specific way inside the memory devices.

> - Each flash connected in parallel mode should be identical and will have=
 one flash node for both the flash devices.

This is already the case.

> - The "reg" prop will contain the physical CS number for both the connect=
ed flashes.

This is already the case.

> - The new layer will double the mtd-> size and register it with the mtd l=
ayer.

This is not a DT change.


Thanks,
Miqu=C3=A8l
