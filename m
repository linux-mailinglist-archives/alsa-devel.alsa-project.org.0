Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C46248341
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 12:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09D931751;
	Tue, 18 Aug 2020 12:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09D931751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597747408;
	bh=lXeVQRGvr1ZFrkuZ6X9XN1moZHKSu5HTRW2Ih94YFmg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k23hf40Cll8BbPwAO/lSZvL0hwhSZyglN+fDSOToGyWpOhdRTDLtIIu+jeK19E91v
	 jI+PE8hbeyrqIK/eLejWF2E95EwgNVVGcy+2IUtDk+6o1r+2gA+XUmDhuJiMIuUKW2
	 J3cs/3kvHNQDWd9xEzGz8iSCjbfuKG9MqHPpZlTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B8DF80114;
	Tue, 18 Aug 2020 12:41:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E64FBF8023F; Tue, 18 Aug 2020 12:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10076.outbound.protection.outlook.com [40.107.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA0DF80104
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 12:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA0DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="UsIh0Yzz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQEBSpXHcvcBUfNNzDeHuGmKa82lIigVlQ/hZHU3+mUkuUlWMRflSGEjRA/wJgGWtz86fGDNNe3agWqPkuqkuJn4MftlBp9KM5SEI/c9GqnzL8BrgSp9veoHiR0drD0yyV90+4Ctx39GG9Bhf9DiGuZkNVdq7XYjq98zwUcJ3uQyTsGU9YKbWXnbsp5md/4cs07Iy3o/7Ra9B378lya1OG+5+9USNYXEfHVFsm8B43PZZVxS0S/JykkKuQL+zAktjzB8oXVb4mSffE2lYlDQZ8GSRRPSqSlcwfZPc+APWc570XAaOKT/xhJqg2OsOPbXCmgMV9VT496pv/s6sPUcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZGK3OXhuVL2oIR+8cf0xFhA2FO9U3k1YcLgce2MFq8=;
 b=lD/lUWPyV5NMbwXIPr2FTcUP0dt5prNUetIESEZgO+hNfRHfJKXtRs+K5dkqZbOfnfw7L31yJ9pjMPcVlHiXxwyHULHoo+hH0uLBKVF87L6FFyORJTWHp5U1ZeZ+9Jb2LLuO5XnogTK0BumrWDrkqB2FDeNHTjjMsmmzOYwuMHRvTO47ogSHoO1PcgXdDsSxMiU5QkpG9JO6EgyXvDGyQt0gnoh8iZsX3uYaV8DncQo4TNi1pBSC3nsosdDf/piB3VjuHS+0PzvQKN67jwVH+d68hRYPXrfE7I7lF5+afwLwVZrXTs/AgqXASxyUOvQK9ZmAHfj/us1sGND6fevFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZGK3OXhuVL2oIR+8cf0xFhA2FO9U3k1YcLgce2MFq8=;
 b=UsIh0Yzzq8HU/kTWYYgiga9Fe9xraL4MaQlfm2xfQg+fCF040Mx2uEjMg6f9xyylwRlm5ypjnWjCXyVwYoawHOPXN/azj6RJeQHBAKHN4iwOpBMLAJ5XKvEiQge4dZUD11jjmVAL9HqoFy+3JGTc38wZUgh+Y4jfgHIu1s9Zxx0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VI1PR04MB6016.eurprd04.prod.outlook.com (2603:10a6:803:d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Tue, 18 Aug
 2020 10:41:30 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950%3]) with mapi id 15.20.3283.027; Tue, 18 Aug 2020
 10:41:30 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQbD9eqMlwY2U27XyctTVPmVak3Rd/wgASnXICAAByKsIAAKTYAgAFgnmA=
Date: Tue, 18 Aug 2020 10:41:30 +0000
Message-ID: <VE1PR04MB66389F7AC7FD9DC401C57183895C0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <VE1PR04MB6638AC2A3AE852C3047E7B97895F0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <a64ae27d9f1348ecae6adc74969cc88c@skidata.com>
In-Reply-To: <a64ae27d9f1348ecae6adc74969cc88c@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 856834b5-50de-4df2-378b-08d8436344ca
x-ms-traffictypediagnostic: VI1PR04MB6016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB60164DCE04C66CAA3F5C616D895C0@VI1PR04MB6016.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tglfKEvJfXjLXkbv0GgXwtqmV7dsgkNvqifQ3k7LFbnIqF+uGzaUraz56MqAuPU3GTfq0o/D1mMUURgj24sVdMDc7nigV+lsQphtPtTk1+2lZy2mC7yuwVUybkWhCVXzDGDsDBAPW2iqvXWXM9TLuXOF0/HBhxcpKBGn0eQYZM3n4qB3nWcylyqKh9QjETtdz0aUg9L7Fw5ZknvO9ei3ysVnn1R88MaZohfVHsi71rQLFFHTaOYOvy7+m4tpKPQYPGcZsb0pwC7LcplLgfp1TSocEhZm1O0+KQt783rZNVwGlybmslfEqtJR5bQrWI/+XjIi/Geg16XO2b3cD7cQg6sds5ZlOSwz7Yafj9EGdVXkWGTdlK16Q1oTDDGe80Sjn/jMKlDUocJaSlEUKqqlnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(6506007)(76116006)(186003)(83380400001)(2906002)(33656002)(53546011)(9686003)(83080400001)(55016002)(6916009)(7696005)(45080400002)(52536014)(966005)(478600001)(7416002)(64756008)(66556008)(66476007)(26005)(316002)(66446008)(54906003)(4326008)(86362001)(8936002)(8676002)(5660300002)(71200400001)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: shd06tCJ7LYSnsl7bnrc32UgVKAXaCzYmTboEYWF3qHN8O6eFJWwLY/6ssW8Epl0nRLLJhgkANrrOSFwE7KiYy0/gUcSQOh2uHlL34r4fqmvsnl/gi49xAVQSgeF3iX3n6wDrqDQTDaOvjqKRzrED/wCb9RwfDalmY9ec4ld1dLbItC+bIoNP0/bdoUKE9hsLnBWgUUcKSMOuQ+MKdEpvMl5VP4Qrduyptfz0fmrhJ0YaIcEwCgjuERmQvt6w3N/0m1WG2rrRcp9ob+8sjAeLXdUYGaAntW63fI6RQtEmzwuGlb01CGBI5bUTawxNQMhF4a8mals+4yuBLxhxLGOuksCNcT5fsU7Hy//H1L3wYcYkzSzUfBUFyual1PfqH9a5QnCx4l0wCnssKnxwRhTyxtesKDLdSjWrmjkfsxQWCJ7zDtfZ8YQnR//ObOmCrTXopkq3tq4UbcLwId1XjRVxIlBDWxWpki5nfQqqey3MbK+lAHe8Se2kJFg/PJWfE6pIp5YBqTyySu+kxB7vuGD7ONh6WKLBxKRC+tU13itZo0ccS5z/rkcxzP38Gow9q0vCGajmTzlhq2/MVQ7dFnWJVoOQG/rpFqWiVt0Sqvq/zxrPz9qOnPPGobjmBWZdHTdk+QnV8hOzpRl/s82tYkK5A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856834b5-50de-4df2-378b-08d8436344ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 10:41:30.5573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAW9XMXR+g43WM1tdMQV7/pu99rX9fLD5kTeRlR6p5JepmWoOJGrHGMfACgfey3yGw0xTTGpveIR6Z5EzYmm7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6016
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
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

On 2020/08/17 19:38 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com> wro=
te:
> > -----Original Message-----
> > From: Robin Gong <yibin.gong@nxp.com>
> > Sent: Montag, 17. August 2020 11:23
> > busy_wait is not good I think, would you please have a try with the
> > attached patch which is based on
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkm=
l
> > .org%2Flkml%2F2020%2F8%2F11%2F111&amp;data=3D02%7C01%7Cyibin.gong
> %40nxp.
> >
> com%7C96a66f37340648e998f108d842a2057e%7C686ea1d3bc2b4c6fa92cd99
> c5c301
> >
> 635%7C0%7C0%7C637332610926324334&amp;sdata=3Dvn80kNlIY%2BB9v9cOlXJ
> patNkn
> > YAMtVx6v7yhfvAE%2FRM%3D&amp;reserved=3D0? The basic idea is to keep
> the
> > freed descriptor into another list for freeing in later
> > terminate_worker instead of freeing directly all in terminate_worker
> > by vchan_get_all_descriptors which may break next descriptor coming
> > soon
>=20
> The idea sounds good, but with this attempt we are still not sure that th=
e 1ms
> (the ultimate reason why this is a problem) is awaited between DMA disabl=
ing
> and re-enabling.
The original 1ms delay is for ensuring sdma channel stop indeed, otherwise,=
 sdma may
still access IPs's fifo like uart/sai... during last Water-Mark-Level size =
transfer. The worst
is some IP such as uart may lead to sdma hang after UCR2_RXEN/ UCR2_TXEN di=
sabled
("Timeout waiting for CH0 ready" would be caught). So I would suggest synch=
ronizing
dma after channel terminated. But for PCM system's limitation, seems no cho=
ice but
terminate async. If sdma could access audio fifo without hang after PCM dri=
ver terminate
dma channel and rx/tx data buffers are not illegal, maybe 1ms is not a must
because only garbage data harmless touched by sdma and ignored by PCM drive=
r.
Current sdma driver with my patches could ensure below:
  -- The last terminated transfer will be stopped before the next quick tra=
nsfer start.
    because load context(sdma_load_context) done by channel0 which is the
    lowest priority. In other words, calling successfully dmaengine_prep_* =
in the
    next transfer means new normal transfer without any last terminated tra=
nsfer
    impact.
  -- No potential interrupt after terminated could be handled before next t=
ransfer
    start because 'sdmac->desc' has been set NULL in sdma_terminate_all.

>=20
> If we are allowed to leave the atomic PCM context on each trigger, synchr=
onize
> the DMA and then enter it back again, everything is fine.
> This might be the most performant and elegant solution.
> However, since we are in an atomic context for a reason, it might not be
> wanted by the PCM system that the DMA termination completion of the
> previous context happens within the next call, but we are not sure about =
that.
> In this case, a busy wait is not a good solution, but a necessary one, or=
 at least
> the only valid solution we are aware of.
>=20
> Anyhow, based on my understanding, either the start or the stop trigger h=
as to
> wait the 1ms (or whats left of it).

