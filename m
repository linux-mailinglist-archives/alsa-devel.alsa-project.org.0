Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015C365B6F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 16:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA66D11C;
	Tue, 20 Apr 2021 16:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA66D11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618930115;
	bh=4bXnyTUaaCU/KlbUZdgp5Z3hyavO+QVIfMVf6hc3dmA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/RPCZmUUhaTilOp82l7T8ZJ4KT6jqhNM3zGTN+BYJc286SfXppRrdtMT59kymLJb
	 EmFkD06Hk+RO9RF/0roMwo0aWQmQATZ03bqN21RgdaD+Vr5eCnko9jQHyPqhV3MMsb
	 8NXHbDfO7A5h3dyDzhUhBI9J1gNVmRA/liD3ghcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B88F80168;
	Tue, 20 Apr 2021 16:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFF12F80253; Tue, 20 Apr 2021 16:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-oln040092003080.outbound.protection.outlook.com [40.92.3.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1B88F80164
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 16:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1B88F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="BSqPJnWQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nputi9yWoOzWZjD8pQ480IYqP8fHeAvYx+Jt7EGHIte/Bluz1NGt77oIb/lcHSPnp8hgTEFEdFbQerRb1GSjc2TcaflII0twbd7FE6bp5WE/ZMQBUDuaKhCoCFCSnwD4uaKKkW7c0k3EZgUE1Bm3Ym3hhn36sgnp64dq0Lgq5ONWIWBzzfeeVHf4IBzltnOFLb3r+ekqjKYY7kYbFmcI05RoUvrtpdyZ4bEHgAJX+W7SSjRF85g7mXP5ON2AKhUrZhfR97ShDw7QR/NpkisVvb9xtZK5EAHCV4OyYFe6UJKxf/LXsJh/AwrCmumMlHzKDHT+D0IN0ZUxMf/++ZLjbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zIJzvnsgvD9WtnM7Zkc/0lhfLhVONLve1otw7575l0=;
 b=LdSRB52xgL5kgDWetzLiOtxGMIn6r2bQs4BRQPIMchcpRg+D65WROskJTqmq32DbkC4zNjTjQaw/YlrMWvzsevQQTjQNcd0yTUn7ajEO5NW6HOuT6WYWklaQLhF5UeFquN9LsX9TRd+/78jXm5G18AORK5rDK9vQOY9nVY+/cQsJihhWgjJLKFQpevHz2lPROWayZgBvI7p42isfZU3hPODarQB4qH0fuqcM5GkqT6oTFLYpekez4g5xxWRkh4t/7UsiP0GbcjmgofnSWy7q4i7V4OoOyV6DjWFYwIY+0yRvA3wT2/q9xiZ9r3eLX+mZOvBFMNyKMpSObWaTl8cFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zIJzvnsgvD9WtnM7Zkc/0lhfLhVONLve1otw7575l0=;
 b=BSqPJnWQYBx/Vq6atYrOf42sIucMeHJFlbQsYLayuTpv3PfE7V1j/vOISb8TulJagRG77ZB3RlfvE6PgbmLMDOcgvTAKisS03WlFJ28JcCCVSVA1VlVOD2cxeahBF2nkJRdrWKiGrjjFzKJsH4/S4+FWL9RY958GIQbLjPPJ+kBpaQbHn1EwmxaJjIMK9DZcdllrCZ+LgAgvpl9w2S6haku2DxBc8YUX9ma2swc8b7zt3rnLfbXxg2PWjoVTao177fvXhaKuWB8D7t2cLP9D5dg+FLxGcfo33342tJ10Jb1rjLGLqC1FJoCtD2Ft3YofvXPgvz6KOC46r96jeVEecw==
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
 (10.152.74.55) by CY1NAM02HT044.eop-nam02.prod.protection.outlook.com
 (10.152.74.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 14:46:42 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e45::43) by CY1NAM02FT031.mail.protection.outlook.com
 (2a01:111:e400:7e45::436) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend
 Transport; Tue, 20 Apr 2021 14:46:41 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:59D83F73EABEC8FD674E2737EFEA4B5CDA519AE032A4E9F50E1677BABC18B226;
 UpperCasedChecksum:D28FB22E71F37FA37382931E1E1ED75ECC3B612642BB09C1D89C037C9668712A;
 SizeAsReceived:7776; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 14:46:41 +0000
Date: Tue, 20 Apr 2021 09:46:39 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [v6 3/3] dt-bindings: Add Rockchip rk817 audio CODEC support
Message-ID: <SN6PR06MB53425F044B5696A9443B469BA5489@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210419155718.17348-1-macromorgan@hotmail.com>
 <SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
 <5cad7e70-89ca-6e4c-47cc-1248250108c7@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cad7e70-89ca-6e4c-47cc-1248250108c7@gmail.com>
X-TMN: [t6fCGqx5QCqoYh4OSq7BZNCVpcWaxmbn]
X-ClientProxiedBy: SN6PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:805:de::19) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210420144639.GA25513@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR05CA0006.namprd05.prod.outlook.com (2603:10b6:805:de::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 14:46:40 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9a9de985-faac-4493-9e6b-08d9040b1c10
X-MS-TrafficTypeDiagnostic: CY1NAM02HT044:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqivxNwTP2HrmV/U5wwBefxLNybfCZ6m7kvJX7tULHswPOOhCFfIyOMkS/+zrBuj6jtTK5NzCZhG05Q5+h9sasPTJuCJZzr01R7+/qxGF8hnn+pTvinF11wdslQ+skESZCmmjonns5DZI124LT2HvT7b4fKM0kEKVKNLvw3s1PNP2Rjfi8SaKtKmhTyzipW+zqVQwTdXxf8zslfefyacx5xhiVUE+GHM9zg3RRD+kB4cIpRZm2pxncqs85PSyhU/KeapdXxJq2wtRf+f025pScSIs0VGuoXWBev5zPbgj0tGRdvtKA0h6ia5kGeUw6uBERcelXhTt0nP4EdOpIfiifRuzM3CxeafauXkaw5elMslJJeFr8qOl0T7GRONIUKpuZZcWSIikMxVJ684xLfUwQeGdWmHnwkVBgzjKyRNndE=
X-MS-Exchange-AntiSpam-MessageData: bzdh0lxEHN+wMmNnroiTF9oONJNOXtj/awDA+NEpO9BxMJ0xzzjMLdoOlrPqlGi0MaQ2FKCVt11gACeQ+mjQJXBYyCpqd924nW1kODxVg9WJ0zcB3pIgBlQo7F4pRCSEa1S0r3H8//TGSNp+NZDPZw==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9de985-faac-4493-9e6b-08d9040b1c10
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:46:41.9014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT044
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, lee.jones@linaro.org
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

On Mon, Apr 19, 2021 at 08:37:57PM +0200, Johan Jonker wrote:
> Hi Chris,
> 
> Never use hotmail.com for sending patches.
> They corrupt Message-ID, so use for example Gmail.

Understood. I'll get a gmail set up as soon as possible. Sorry if this
message comes through funky (still on Hotmail, been using it since 96).

> 
> X-Microsoft-Original-Message-ID:
>  <20210419155718.17348-3-macromorgan@hotmail.com>
> 
> Message-ID:
> <SN6PR06MB53420A0E831C17342A73188BA5499@SN6PR06MB5342.namprd06.prod.outlook.com>
> 
> ====
> 
> If you like rk817.txt should be converted to YAML, which is beyond your
> serie, so move these changes to rk817.txt instead for now if rob+dt
> agrees. ;)

Will do, assuming everyone agrees.

> 
> ====
> 
> Include the dts patch back in, so we can compare it with the
> documentation changes.
> 

Acknowledged.

> On 4/19/21 5:57 PM, Chris Morgan wrote:
> > Create dt-binding documentation to document rk817 codec.
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> > Changes in v6:
> >  - Included additional project maintainers for correct subsystems.
> >  - Removed unneeded compatible from DT documentation.
> >  - Removed binding update for Odroid Go Advance (will do in seperate series).
> > Changes in v5:
> >  - Move register definitions from rk817_codec.h to main rk808.h register
> >    definitions.
> >  - Add volatile register for codec bits.
> >  - Add default values for codec bits.
> >  - Removed of_compatible from mtd driver (not necessary).
> >  - Switched to using parent regmap instead of private regmap for codec.
> > Changes in v4:
> >  - Created set_pll() call.
> >  - Created user visible gain control in mic.
> >  - Check for return value of clk_prepare_enable().
> >  - Removed duplicate clk_prepare_enable().
> >  - Split DT documentation to separate commit.
> > Changes in v3:
> >  - Use DAPM macros to set audio path.
> >  - Updated devicetree binding (as every rk817 has this codec chip).
> >  - Changed documentation to yaml format.
> >  - Split MFD changes to separate commit.
> > Changes in v2:
> >  - Fixed audio path registers to solve some bugs.
> > 
> >  .../bindings/sound/rockchip,rk817-codec.yaml  | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> > new file mode 100644
> > index 000000000000..0059ef54d6b5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/rockchip,rk817-codec.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fsound%2Frockchip-rk817.yaml%23&amp;data=04%7C01%7C%7C7f2c986dc85e4a835aae08d9036242b2%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637544542817084121%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Dlh0Gn0DH%2FLwLWGr%2BxqAmVU7mUVwzMrsX2LYiIyGDtU%3D&amp;reserved=0
> > +$schema: https://na01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7C%7C7f2c986dc85e4a835aae08d9036242b2%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637544542817084121%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=82MFRpHilkJCkQKT1Esi6UX1F4WZJEE4%2BOOZL0bFQpg%3D&amp;reserved=0
> > +
> > +title: Rockchip rk817 audio codec
> > +
> > +description:
> > +  The rk817 codec is an I2C codec integrated with every Rockchip
> > +  rk817 PMIC MFD.
> 
> If you want to convert rk817.txt to rockchip,rk817.yaml then add
> 
> maintainers:
>   - Heiko Stuebner <heiko@sntech.de>

Heiko is on here anyway as I believe he has one of these devices to
test and asked previously that I include him as I upstream things
for the Odroid Go Advance.

> 
> > +
> > +properties:
> > +
> 
> > +  "#sound-dai-cells":
> > +    const: 1
> 
> Move things with "#" below as much as possible.
> 

Ack

> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: "mclk"
> > +
> 

Ack

> > +  mic-in-differential:
> > +    description: the microphone is in differential mode.
> > +    $ref: /schemas/types.yaml#/definitions/flag
> 
> This is part of a sub node now.
> 

Correct, will update this when I move it to the rk808 documentation.

> > +
> > +required:
> 
> > +  - compatible
> 
> Add compatible "rockchip,rk817" to properties
> 

Will make sure I note these updates as "optional for the rk817" in the
MFD devicetree bindings. The "compatible" is listed there.

> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +rk817: pmic@20 {
> 
> > +	compatible = "rockchip,rk817";
> 
> Without rockchip,rk817.yaml this example will generate notifications.
> 

I'm afraid I don't understand.  I'll update the rk808 documentation to
show the correct bindings, if it's still incorrect please let me know.

> > +	reg = <0x20>;
> > +	interrupt-parent = <&gpio0>;
> 
> > +	interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> 
> add include for IRQ_TYPE_LEVEL_LOW

I do not understand, I'll update the rk808, if it's still wrong please
let me know.

> 
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pmic_int>, <&i2s_8ch_mclk>;
> 
> > +	#sound-dai-cells = <0>;
> 
> Move things with "#" down below the list in possible.
> 

Acknowledged.

> > +	clocks = <&cru SCLK_I2S_8CH_OUT>;
> 
> add include for SCLK_I2S_8CH_OUT
> 
> > +	clock-names = "mclk";
> 
> ----
> Heiko's sort rules:
> 
> compatible
> reg
> interrupts
> [alphabetical]
> status [if needed]
> 
> ----
> 
> 
> > +
> 
> > +	........
> 
> remove
> 
> > +
> 
> > +	rk817_codec: codec {
> 
> 
> Move to rk817.txt example.
> 
> > +			mic-in-differential;
> 
> > +			status = "okay";
> 
> Never use status in examples.
> 

Acknowledged.

> > +	};
> > +
> 
> > +	........
> 
> remove
> 
> > +
> > +};
> > 
> 
