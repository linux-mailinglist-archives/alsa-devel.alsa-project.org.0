Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDAD2936D7
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 10:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEC0A1717;
	Tue, 20 Oct 2020 10:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEC0A1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603182749;
	bh=BRaIZzqKvnVOXoxidroCWZAJidCcUm9knkqOPSZdKI0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUxfuP3izd40wqD8z/YhN3R284wae5/SgYy5qI7pCM3qnqoWJiu4kTT6rFca9/pIB
	 +SS9Q8dOP7EJexEYl4ENKRbzvcPebZVZk9oHzf+AfuLCNGDfD1xKpa0FBL7EuLDpMC
	 JWMtcYHvoem0tENMoEe/1BXDA309WsyVL7ZSsKqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FDA0F8010F;
	Tue, 20 Oct 2020 10:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E5EF801F2; Tue, 20 Oct 2020 10:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E0EF80090
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 10:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E0EF80090
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kUn2G-00036F-3p; Tue, 20 Oct 2020 10:30:24 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kUn2E-0005oA-K0; Tue, 20 Oct 2020 10:30:22 +0200
Message-ID: <ea670e2ed677d67afdb52e876eeee35eb9d7949e.camel@pengutronix.de>
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Date: Tue, 20 Oct 2020 10:30:22 +0200
In-Reply-To: <20201019215628.GA3650804@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-9-git-send-email-spujar@nvidia.com>
 <20201019215628.GA3650804@bogus>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, tiwai@suse.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, devicetree@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Hi Sameer, Rob,

On Mon, 2020-10-19 at 16:56 -0500, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 08:12:55PM +0530, Sameer Pujar wrote:
> > Convert device tree bindings of graph to YAML format.
>=20
> Thanks for doing this.

Seconded.

> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/graph.txt  | 128 -------------------=
-

The removed Documentation/devicetree/bindings/graph.txt is referenced by
a lot of files, tree-wide. Should the references be updated in the same
series?

> >  Documentation/devicetree/bindings/graph.yaml | 170 +++++++++++++++++++=
++++++++
> >  2 files changed, 170 insertions(+), 128 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/graph.txt
> >  create mode 100644 Documentation/devicetree/bindings/graph.yaml
>=20
> I'd like to move this to the dtschema repository instead.
>=20
> > diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentati=
on/devicetree/bindings/graph.yaml
> > new file mode 100644
> > index 0000000..67804c1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/graph.yaml
> > @@ -0,0 +1,170 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>=20
> As the original text defaulted to GPL2, this needs Philipp's permission=
=20
> to re-license.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/graph.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for device graphs
> > +
> > +description: |
> > +  The hierarchical organisation of the device tree is well suited to d=
escribe
> > +  control flow to devices, but there can be more complex connections b=
etween
> > +  devices that work together to form a logical compound device, follow=
ing an
> > +  arbitrarily complex graph.
> > +  There already is a simple directed graph between devices tree nodes =
using
> > +  phandle properties pointing to other nodes to describe connections t=
hat
> > +  can not be inferred from device tree parent-child relationships. The=
 device
> > +  tree graph bindings described herein abstract more complex devices t=
hat can
> > +  have multiple specifiable ports, each of which can be linked to one =
or more
> > +  ports of other devices.
> > +
> > +  These common bindings do not contain any information about the direc=
tion or
> > +  type of the connections, they just map their existence. Specific pro=
perties
> > +  may be described by specialized bindings depending on the type of co=
nnection.
> > +
> > +  To see how this binding applies to video pipelines, for example, see
> > +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +  Here the ports describe data interfaces, and the links between them =
are
> > +  the connecting data buses. A single port with multiple connections c=
an
> > +  correspond to multiple devices being connected to the same physical =
bus.
> > +
> > +maintainers:
> > +  - Philipp Zabel <p.zabel@pengutronix.de>
> > +
> > +definitions:
> > +
> > +  port:
> > +    type: object
> > +    description: |
> > +      If there is more than one 'port' or more than one 'endpoint' nod=
e
> > +      or 'reg' property present in the port and/or endpoint nodes then
> > +      '#address-cells' and '#size-cells' properties are required in re=
levant
> > +      parent node.
>=20
> reg property.

What about #address-cells and #size-cells in port and ports nodes?
These must either be #address-cells =3D <1>, #size-cells =3D <0>, or they
can be absent if the parent node already has the same, or if a port node
only contains a single endpoint.

> > +
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        type: object
> > +        properties:
>=20
> reg?
>=20
> > +          remote-endpoint:
> > +            description: |
> > +              phandle to an 'endpoint' subnode of a remote device node=
.
> > +            $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  ports:
> > +    type: object
> > +    patternProperties:
> > +      "^port(@[0-9a-f]+)?$":
> > +        $ref: "#/definitions/port"
>=20
> No reason for this to be under 'definitions'. Just move down.
>=20
> > +
> > +properties:
> > +  ports:
> > +    $ref: "#/definitions/ports"
> > +
> > +patternProperties:
> > +  "^port(@[0-9a-f]+)?$":
> > +    $ref: "#/definitions/port"
> > +
> > +additionalProperties: false
>=20
> This needs to be true here. But you need this within 'ports' and 'port'.=
=20
> (I think... I think we only have extra properties within endpoint=20
> nodes.)=20
>=20
> > +
> > +examples:
> > +  # Organisation of ports and endpoints:
> > +  #
> > +  # Ports are described by child 'port' nodes contained in the device =
node.
> > +  # Each port node contains an 'endpoint' subnode for each remote devi=
ce port
> > +  # connected to this port. If a single port is connected to more than=
 one
> > +  # remote device, an 'endpoint' child node must be provided for each =
link.
> > +  # If more than one port is present in a device node or there is more=
 than
> > +  # one endpoint at a port, or a port node needs to be associated with=
 a
> > +  # selected hardware interface, a common scheme using '#address-cells=
',
> > +  # '#size-cells' and 'reg' properties is used to number the nodes.
> > +  - |
> > +    device {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        port@0 {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +            reg =3D <0>;
> > +
> > +            endpoint@0 {
> > +                reg =3D <0>;
> > +                // ...
> > +            };
> > +            endpoint@1 {
> > +                reg =3D <1>;
> > +                // ...
> > +            };
> > +        };
> > +
> > +        port@1 {
> > +            reg =3D <1>;
> > +
> > +            endpoint {
> > +                // ...
> > +            };
> > +        };
> > +    };
> > +
> > +  # All 'port' nodes can be grouped under an optional 'ports' node, wh=
ich
> > +  # allows to specify #address-cells, #size-cells properties for the '=
port'
> > +  # nodes independently from any other child device nodes a device mig=
ht
> > +  # have.
> > +  - |
> > +    device {
> > +        // ...
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +                reg =3D <0>;
> > +                // ...
> > +
> > +                endpoint@0 {
> > +                    reg =3D <0>;
> > +                    // ...
> > +                };
> > +                endpoint@1 {
> > +                    reg =3D <1>;
> > +                    // ...
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +                reg =3D <1>;
> > +                // ...
> > +            };
> > +        };
> > +    };
> > +
> > +  # Links between endpoints:
> > +  #
> > +  # Each endpoint should contain a 'remote-endpoint' phandle property =
that
> > +  # points to the corresponding endpoint in the port of the remote dev=
ice.
> > +  # In turn, the remote endpoint should contain a 'remote-endpoint' pr=
operty.
> > +  # If it has one, it must not point to anything other than the local =
endpoint.
> > +  # Two endpoints with their 'remote-endpoint' phandles pointing at ea=
ch other
> > +  # form a link between the containing ports.
> > +  - |
> > +    device-1 {
> > +        port {
> > +            device_1_output: endpoint {
> > +                remote-endpoint =3D <&device_2_input>;
> > +            };
> > +        };
> > +    };
> > +
> > +    device-2 {
> > +        port {
> > +            device_2_input: endpoint {
> > +                remote-endpoint =3D <&device_1_output>;
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --=20
> > 2.7.4
> >=20

regards
Philipp
