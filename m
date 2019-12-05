Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277AA11410D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 13:56:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A657C1669;
	Thu,  5 Dec 2019 13:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A657C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575550605;
	bh=akDWs+e/d6cH4S5HzMzrGpn3IeANLmUzxTViaNFf1WA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwKvWEQmAbkedvNHcV1n8fZlxPZqJMzGRBbWxOMlDHKbJJxlut1khZ2AbyRrqyz0K
	 nAdGEDaKtZimYqnDlsNXM56VnMfdxWrepKdD0Jx0hW8UCknOmkqSQQSNshVyUFT+MV
	 E8kxTTsYxsiQMqP88P5bSvhJy4ovkHfsRtEkqxPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D837AF80227;
	Thu,  5 Dec 2019 13:55:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB0BFF801F8; Thu,  5 Dec 2019 13:54:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20056.outbound.protection.outlook.com [40.107.2.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F070CF8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 13:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F070CF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="EvTd+nHx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXCtBm/knlnQewLYXr45RVwRacV+l8Jqx1FaBjXmiI1yz4/LZXcVMwC+DfZ6CYHls6uZYylaL+c1eiI8U9YalNnOm4Lua9oo75iN0patBYXq6su/vCMxQY79OU3+/a7VkFLK25+Qo6+ACo+DN1qavJjdfBmlm9NKWWVGRWvQdeKDq61TMwDjaT55OBh7S0ultrr8aVQzRvI2cpFt0SE/vjd9Yz6k18nHISJSTz8Sx4vzex8z6d0dCR7fOhJPG+9DNm2QtM2uP2MQZMXKlb8wEtPnFEBKZ6ty9IyNRWWlqLcfcpGqcWApgalBsZWdj+JxUFnc1RyUC0bigZdpRI+INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkoi0UPW2bWZzOucL+LfDx+I5xcUtEDgvbF15TzJnM0=;
 b=ZFvoAIt+SPg8LOELm+zewSo9urC7iskVg64O++hcmshYVXYoIxkrbcSkpYiXFLBYHvtsU3eWJiFVTd9EO3iJMJndlFV2MpKlu37dmz2rUXDSmwoNIZbU96YjmWlwveOFwceAx9YTTXBvqxDFY6IrBdb/9r7NDrnqiDc2SPm2VdHLkuYyyAuYMRsnx39r6++yJUn2Z6TkIRWO38nQWNY7t8QpDqKP0NX3IYUjn4KXx5XyvEln0TutTW6qNFWQuW/DYSkeQZdj4ThfXUbrNaTh4EDCic/DytGDUwK++ll1lEEGVxsy4UVrRvpjZ5u7eQWTo2TvHWd5fEczX63dpFXepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nkoi0UPW2bWZzOucL+LfDx+I5xcUtEDgvbF15TzJnM0=;
 b=EvTd+nHxLaWV7epk1Xxlul3HbwfIj17wy8ut6tGzjX+T1IlE3NClYJjZrMY+4RznzsyUolo8K+hvCN22kjwr90JKQjBAre+m09hZjZYlyHBudD3aFoD1png42xtKw6JupUgq/SB/Au8GhsT9hKjAX39Jp8+33e0Oz3rD0+0p3/E=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1PR0402MB3439.eurprd04.prod.outlook.com (52.134.2.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 5 Dec 2019 12:54:53 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad%4]) with mapi id 15.20.2495.026; Thu, 5 Dec 2019
 12:54:53 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "eballetbo@gmail.com" <eballetbo@gmail.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>
Thread-Topic: [alsa-devel] [PATCH 2/2] ASoC: soc-pcm: remove
 soc_pcm_private_free()
Thread-Index: AQHVq2swVrWOWeHzHUOiI7TxgG5tCA==
Date: Thu, 5 Dec 2019 12:54:53 +0000
Message-ID: <7ed222a2289c8d6544098a2937ed4a7f6960bac2.camel@nxp.com>
References: <87r226x8aq.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xax88g.wl-kuninori.morimoto.gx@renesas.com>
 <CAFqH_536+0uuAzjXFPrS8OVeoqStSNZjz_rrSeqyh3dNuWBcbQ@mail.gmail.com>
In-Reply-To: <CAFqH_536+0uuAzjXFPrS8OVeoqStSNZjz_rrSeqyh3dNuWBcbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2339e0fc-9b2a-4046-62b9-08d779825293
x-ms-traffictypediagnostic: VI1PR0402MB3439:
x-microsoft-antispam-prvs: <VI1PR0402MB34396D49AED2C20284E9BD92F95C0@VI1PR0402MB3439.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(4326008)(76176011)(4744005)(102836004)(186003)(66946007)(64756008)(66446008)(66556008)(66476007)(118296001)(5660300002)(71200400001)(316002)(86362001)(76116006)(71190400001)(14454004)(6486002)(91956017)(305945005)(36756003)(25786009)(99286004)(478600001)(229853002)(2906002)(6506007)(6512007)(81166006)(50226002)(11346002)(26005)(2616005)(54906003)(110136005)(8676002)(8936002)(966005)(44832011)(81156014)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3439;
 H:VI1PR0402MB3839.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R3ye5q1+4jt2M6VltlETweyZTT7HzD+Xlcdn0riDB6o6JZWjG4C7NGQ8UlcTcdxx+hbqTeO+XAuVx+Czd0sYcyjKRvdGKlfEBQ0/UhMuZ2MREL5ChmlwragvsUGz5Lg1Q1ToJZwT8x6lx2PmhiuzHP7rZFdy3OWj7FNdb1e6OujvztisvyQeLy5TamWJGK0N21IUBDcN6Th+J5RNoT6uGzDapR9LG1lK7g+RjcoSqQx39FNyCFouQ7w3dbckTgVmmTV5QO0I8I+dC17vtjt9tEmiSv71Z/xf7VmKDMuKjQPkq4oQzkAcvAvVdkPiLeEzZcESa/awZWXi2Jq3MdhEMzJUi7DCrUHuUjYPMISpnQbWoYkvOCDZMdTtaP3YmMNxRVCCs3nTQqtihAl9YKb8O9PtYLSYP2I57yuQdkVpdd6vBjBd34aQzeJEulG+DIj1595Apv0ZGL2N7CQLoISF6gd7sI3SiSevY9pHxknAtEwAkw0x3O6vvjq7ko5kHm4iFHzuDM8Rx+tsCrKmkhdUkg==
x-ms-exchange-transport-forked: True
Content-ID: <9170AE320BFA2D4493C9C634CD18F8E7@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2339e0fc-9b2a-4046-62b9-08d779825293
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 12:54:53.3285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDHxjvrqMzlNWP/sNL6nYxcjuY4XONAaS/pNAuYZsJIc4VJp/ajuWLtmLAlb8d9D0HwhPwZjVu+Q7OZt4r/52A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3439
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: soc-pcm: remove
 soc_pcm_private_free()
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


> I didn't look into detail yet, but after applying this patch my
> Samsung Chromebook Plus started to show different warnings like this,
> probably caused because in my case the driver is deferring?
> 
> I'll try to take a look, but if anyone already knows the cause,
> please
> let me know.
> 

Hi Enric,

Can you try:

https://patchwork.kernel.org/patch/11265061/

It should be already in Mark's tree.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
