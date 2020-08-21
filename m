Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64424D15C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 11:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12A11686;
	Fri, 21 Aug 2020 11:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12A11686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598001815;
	bh=cnwjXpnGN6Gn0m2rSOMDdAe9yhT6nhfknyihg4yeoUQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fPePLO7A+0faNPjyqRf0s6VWJUQceuOtBNisko8IOjpylKDbn++L7HYmCRgctVT6o
	 to40rjrsYMWbwt1v3BvJiEeMSQ7xuyw421UHQjteQ/Q6Euyuc8RfFNG7hJ7cljW7/5
	 75rtCtp8r0/QppW4AmMDStmNscTuXM2IeCeEPkJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03072F80216;
	Fri, 21 Aug 2020 11:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0593F80218; Fri, 21 Aug 2020 11:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B089F800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B089F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="DGt0uP7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPn9tyRhmJtxmnCkmqlZCp6E5QGHNrUN45PRs2jD+vjhmdigGaUDMvcEBZq5DmsuXDfZ88hXzXQegLLgrECphnO5AwErE7/St8EVwWzDMe5DNnvwYGYKZbO8IijDsw/1sP/8fVJ83lbakVUEhZN4rC4C0/LSCa9mNSM4NfkscsBn38yNAONP1TpohbDVs+tXkF09A52kYZWOfDEqf8TR/IseWR/x7rwnVIXw7Zofrfpxb9kfA3ODK7ea3e5ojdonf7wjFcp68mQ1jMkxHATNo1uy2vVdofILAXJ0nzQvd9j8eTIoingTsGOkknkVSsANSrA2l1BOfO5TZzUlOuD84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnwjXpnGN6Gn0m2rSOMDdAe9yhT6nhfknyihg4yeoUQ=;
 b=aQd9TfY2LTUBBYe3W2vGEXetnZAjfYYAV3uJTseRNcuAFx+fnKGFHMwNBu29j9xQ/0b6w5cEgGjsdRsCUK5enwP/fZsAXBRADULK7ptN9aXVyN63neJi0teqq/jeOxSNc6XM6tbIqxrFmYCvuE5uDLcxggvaN/uQDOFKDs9TgRnnPRCyvz/da/juqLvwTS+xGUwC6TBJ6Rq4yMyEUPFpg7TgXGEt6LdxVLMg8fxj0yM82+XbBkZO3rmhrP7+a734yXDF5T49jyNcXah3vcvUUHQMbVA/5NLhEz9atKx2HdwtGWyI4tZuum0xzNadll/x11ZirpA53NBG64JMOFXK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnwjXpnGN6Gn0m2rSOMDdAe9yhT6nhfknyihg4yeoUQ=;
 b=DGt0uP7VEcmnWLZTbqSOfcj95SfdqS3IMhKsc5sEbYTMAg2nUL0qtUdxVRM2D2KU8bP9SkZ0JEXRYzUfWVvAYirFz2Bf67OJtbOGXLHOgwB/B3cPQD7kq7v29Kd0ydh7uc3lIVGFtOCHi8m+f6B7hK14pXZCRHgXWMRnvcEsQEE=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VE1PR04MB7470.eurprd04.prod.outlook.com (2603:10a6:800:1a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 09:21:37 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::ad7f:d95a:5413:a950%3]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 09:21:37 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Richard Leitner <richard.leitner@skidata.com>
Subject: RE: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Topic: pcm|dmaengine|imx-sdma race condition on i.MX6
Thread-Index: AQHWcWQbD9eqMlwY2U27XyctTVPmVak3Rd/wgASnXICAA2IfgIAANxuAgAFCSvCAAT0iAIAATlSQ
Date: Fri, 21 Aug 2020 09:21:37 +0000
Message-ID: <VE1PR04MB6638271FA459E4068391ABF8895B0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20200813112258.GA327172@pcleri>
 <VE1PR04MB6638EE5BDBE2C65FF50B7DB889400@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <61498763c60e488a825e8dd270732b62@skidata.com>
 <16942794-1e03-6da0-b8e5-c82332a217a5@metafoo.de>
 <6b5799a567d14cfb9ce34d278a33017d@skidata.com>
 <VE1PR04MB6638A7AC625B6771F9A69F0D895A0@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <20200821043418.GA65616@pcleri>
In-Reply-To: <20200821043418.GA65616@pcleri>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: skidata.com; dkim=none (message not signed)
 header.d=none;skidata.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4219dbeb-ce1d-4a89-be7b-08d845b39b41
x-ms-traffictypediagnostic: VE1PR04MB7470:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB74701A8B9321A2BBF02068D5895B0@VE1PR04MB7470.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +pmPoeIX1mNRkPxCBaeSUA4FblZH+F8hvduwamiH0Hh7U3x/jf4J2hHwc3ezBPFvYhwWv39IMrNlRP2nCdzAoNSgzvgGgsI4yjzYrw/3JAYRPBk5vPhnKpH49JyAkMPr/BOp88fwcJ/8xRngRvAjzYnKHaCgfPgFvPD1yxXTSo0mQFhoOnJOi5N2ibiKSI9DTRgyexc/E0Rf4hlHZkgq9SSUZ/B8Rij4l2h22zDuaoDFcvf/Y8+fAM7Zio/JLwCOp6vq7bCTmcQ/bB+BPVSolLjkW4plmTKyEjzHDAKc5TeSLNhWXwRDRG9DdFXIgfHEGpqx2CDFNkarWsgOiprkE4H+kMgg7zDnYzBZS7rhg26dWd4cTwlBtF+HGLWFDqD9WKrBOssmPDsNViyYO5/v3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(2906002)(66476007)(64756008)(66446008)(66556008)(66946007)(7416002)(71200400001)(76116006)(6506007)(53546011)(86362001)(4326008)(6916009)(478600001)(52536014)(5660300002)(186003)(966005)(8936002)(4744005)(316002)(55016002)(9686003)(7696005)(54906003)(26005)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uyfZic1K9d9MbY9sr56IUf9KjAIxmvY2Vq7OPzhKnV25ZOef2UlDp2auz0JFuS/Ogyx4WpQqW04NVscOqaVGKx6CIMt8FGLU7d0PtWPK8CJCUuvAr+zFCR/WTQg7Z8bYzn5dVbKeOs68/+DSt/i0vpUl5mtp/ULIzLZ0Iwv4KigvCT2pqF/oUr2+ENn1ASfbSwNWhizq5zhPXLHXRb+cnHhYvghbeF5uoRFw/ZP8eJBQxirXMlyN1J1h+WnM7QZeiwpSe7+UKa/1q4iSdRJGxz+pUmn+3YSP0vE4MlNV+U5AaCvYg/LzV30cjtwPNkEVoF7zW5BMBBCDqIZgn7GKvqQ9aNpEhBLQHe2WPDkuiPst9OG6qEN5aOEJS+ELd54cgJyOdhu8g98JcYIZ2PSejToQrmk+4YneUC7y8nLAbzn8HaY3L/ZXaIQXnVO5BEMhddFalvAi+XLVSPAGJ9yz+c7NBgUulRH7TxPKvn8FZl6OVVh/Bvcvx8tnw++RO1wsz8VGJqRk0JPNCdOtFKsFnPXfJMwMsj6slzjHAbtP6hkj+BpxtekzXIiufHqRcwwttjujfzcAxBFTHPimlcJ2Y3Cfg9priQLRAgLpoHT9UKFvtC93qEuN4uOG720Ttd/LMdjmFCprqec5McmuMCFD4Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4219dbeb-ce1d-4a89-be7b-08d845b39b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 09:21:37.8615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M2mfbT0XvsRY/38sXwpz2SsysXND0GzAslOkOWp6/HX4ULLwRn2TX3zHIzkDR+Pto3/42GIzP4SkFJ2YI1Q5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7470
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, "timur@kernel.org" <timur@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
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

On 2020/08/21 12:34 Richard Leitner <richard.leitner@skidata.com> wrote:=20
> On Thu, Aug 20, 2020 at 03:01:44PM +0000, Robin Gong wrote:
> > On 2020/08/19 22:26 Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
> wrote:
> > >
> > > @Robin:
> > > Is it possible to tag the commits for the stable-tree
> > > Cc: stable@vger.kernel.org?
> > Could my patch work in your side? If yes, I will add
> > Cc: stable@vger.kernel.org
>=20
> I've tested the patches 3 & 4 (removing sdmac->context_loaded) of the ser=
ies
> you mentioned and sent Tested-by tags for them [1,2], as they fix the EIO
> problems for our use case.
>=20
> So from our side they are fine for stable.
>=20
Okay, I thought that's just decrease the issue in your side not totally fix=
, and the patch
I post in https://www.spinics.net/lists/arm-kernel/msg829972.html
could resolve the potential next descriptor wrongly freed by vchan_get_all_=
descriptors
in sdma_channel_terminate_work. Anyway, I'll add ' Cc: stable@vger.kernel.o=
rg' and
your Tested-by tags in 3&4, then resend it again, thanks.
