Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 315FDF27D5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 07:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41DD1671;
	Thu,  7 Nov 2019 07:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41DD1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573109768;
	bh=KTbXbhNsKmPQkO719gj9PNoJFwWWuTav4hFtAbf5nmU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=upLNRSnmoUqqdz69q2pMoaPwQ5tGkqta+TToE4pQFotnuj7kVSxdj7UprW0didL5i
	 1oAG977++JkkckRPKB1/fTYFJs2NK+nulqfV2eg7pwFzHsG9ldFZy7ThNut3AdWvle
	 F7L8yTQUksL7LTQ9iZcnU8/2iYN/vuh3WV50iN9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE2DF80291;
	Thu,  7 Nov 2019 07:54:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C417F8049B; Thu,  7 Nov 2019 07:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00083.outbound.protection.outlook.com [40.107.0.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F83F80291
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 07:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F83F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="qiDxy/Db"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi/KBz4Qz2RrnpYz/cZKtYATD2tgOP9ztmSo66lJhR3hj78tgMdQzD4y1a5Duoz6SrvuddM1QPJ2rXIKjXCQ4zL34dLzMRIQWzr09M5JdMThblZElLPjTb4paODTkeeORqA15bZAP0LKCKgFdRZNjvKCB6zUfS6UP5VLIZnwfd0qHwMA1ph29nDGit8+q/Kzl2ZAx3eWSdIUffZz7OCwr5TRDHfXfRUl9NSGeEBW8NV4xX8A49ggeps1IMO9tOMdHyAJTYKzmGBuRUY7VF8Re1dgxlcd9493IzyMKxhlFhW27OYuaYZwXD7tfg6704c3PQI/2w1HSFWfPIA5etajnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDFmqqS6COuYQO74r3uSpZS1axn1dQue4H4BZuq6h8k=;
 b=UYMK3tY85zoC/GW692zYUh/j14YNWr9G6AluS+JNWRkIqIkjl7g1gWemeUk3/nJC6Nclt36h20zXNOqsz+x3iTCKY/u9jzUBHB2X7hTXr3kBCjG55qNZzJcpamivGQHo3P7DRJu5fA6vc843TMwRv96lKT1R265M1NuXfRVrTK8ORYhg3Yjlt8pzzG/T189ShdOb2A8fd+1RfPsic2z1C/+IYzAs7iT8wvAZO44JwMNvu1Q3bUtmpAAX3iHC8kPQcJgfwjsmmOBWU9TbFw3aCJYS8AKJ+e2IIRMnvvNQxgC8T3EWl4srVH/2YHort40rsadaqQJCPS26XOxXUphNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDFmqqS6COuYQO74r3uSpZS1axn1dQue4H4BZuq6h8k=;
 b=qiDxy/DbVb20O+zhmYB9Z1hh5kV0zHiwBAipOCoqRtPuzw6CY667NdikyfpgUtzY+U0pZfy0JSvFB2iK1Nn1u21W8xmNYIakI2JAXTxrhJLz5zNCArWN16W3KBP6GEIIeUwBEmobNVRbj9goE03GGRhMtcvrCld2HaRCqPwyMpQ=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.254.214) by
 AM0PR04MB6356.eurprd04.prod.outlook.com (10.255.182.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 06:54:17 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::24aa:9d65:b376:5ae7%7]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 06:54:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Thread-Topic: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
Thread-Index: AdWVOCo8/iuGnMlWR7WHQ55etboNNQ==
Date: Thu, 7 Nov 2019 06:54:16 +0000
Message-ID: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34df17a9-71a3-46d7-ac14-08d7634f4ea8
x-ms-traffictypediagnostic: AM0PR04MB6356:
x-microsoft-antispam-prvs: <AM0PR04MB635696F8CBDD83797B2F0DAEE3780@AM0PR04MB6356.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(476003)(486006)(316002)(54906003)(86362001)(7696005)(53546011)(66476007)(186003)(6506007)(66446008)(64756008)(102836004)(26005)(66556008)(71200400001)(71190400001)(4326008)(66946007)(14444005)(2906002)(256004)(76116006)(3846002)(55016002)(25786009)(8676002)(33656002)(8936002)(6916009)(14454004)(305945005)(6116002)(7736002)(478600001)(229853002)(7416002)(5660300002)(66066001)(81156014)(99286004)(52536014)(74316002)(81166006)(6436002)(9686003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6356;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HUnltuQYoDaFtVZXYGzwCHhojhmjxDow0LoEyWCTEiIe+xwWk2MKUKRx+Cggu/IipiSiZ4Zqs5eYbej59VTgQOwgHiYAiHpVn+snUw7zVx0+kPiidPVXugfVXX/ybc1quaGqfMKKWAGrJ/nwPXp3mU/Cos9MlziAUFgmLNgP8WJ88P7c8Nyeq3iiFehI3gaHiftEctYfU9IHQlLV7EueE/H6B3R6bzm/q/RYIcwqx9Rk4VXsFh0UMoOC2xJHUdx4pnxfvHgwqKZ+bbuySoVY21+ftPrsy28LRkd2Cna5la6iAgQWzFa5pmf5av86ykNOr7EfjxUtM4yMCw20dOLy9Zl8AToZg2FefFIm0zLftxBULhtB+QZ0WEUj1cIcKwnIzwDiptUpVuwYOfypc84m4pDyAuMdsdRYT8aIguEu4t08vlEUyCxLt0md1sTj/sg3
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34df17a9-71a3-46d7-ac14-08d7634f4ea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 06:54:16.7798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+6k7J4ZfSgpZOEcGAWQAc6WTLOOG1sS5Vsqo8E59JIK+SGl710jPRFl5AOCDYd1Bd6nOOCYO4faIC5JwqqbCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6356
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi
> 
> Hi Shengjiu,
> 
> Comments inline.
> 
> On Wed, Nov 6, 2019 at 9:30 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> >
> > Audmix support two substream, When two substream start to run, the
> > trigger function may be called by two substream in same time, that the
> > priv->tdms may be updated wrongly.
> >
> > The expected priv->tdms is 0x3, but sometimes the result is 0x2, or
> > 0x1.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_audmix.c | 6 ++++++  sound/soc/fsl/fsl_audmix.h | 1
> > +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> > index c7e4e9757dce..a1db1bce330f 100644
> > --- a/sound/soc/fsl/fsl_audmix.c
> > +++ b/sound/soc/fsl/fsl_audmix.c
> > @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct
> snd_pcm_substream *substream, int cmd,
> >                                   struct snd_soc_dai *dai)  {
> >         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> > +       unsigned long lock_flags;
> >
> >         /* Capture stream shall not be handled */
> >         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> > @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct
> snd_pcm_substream *substream, int cmd,
> >         case SNDRV_PCM_TRIGGER_START:
> >         case SNDRV_PCM_TRIGGER_RESUME:
> >         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > +               spin_lock_irqsave(&priv->lock, lock_flags);
> 
> Why do we need to disable interrupts here? I assume that lock is only
> used in process context.
> 
It is in atomic context, so I think it is ok to disable interrupt. 

Best regards
Wang shengjiu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
