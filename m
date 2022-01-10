Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E812948A3A3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 00:29:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768F018ED;
	Tue, 11 Jan 2022 00:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768F018ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641857363;
	bh=yXDqraAzKT52WsrM9VFQRIVY6z/9kz0uY+JG9Hzq0rg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nomx8oa+RW1YgYNlIUj9NV6WJs7iGTMNGWMH5hofrRGlWeV1dsbuUoNnRbNPZ/gim
	 qSwDfKt8tXTTDdYc8owXcaNSOpmmeD1Ej/3a9PegDiSddwTL9D7ww0RIpqZZgq0u8V
	 Dd/6ktdAyzCtTQOqkx/368RSMJLTiDQzFUYKbS5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C08AEF80134;
	Tue, 11 Jan 2022 00:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5829F8012E; Tue, 11 Jan 2022 00:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 143E0F800B6
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 00:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 143E0F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="b7h7LTfI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUuSNc/1lNGLq5gnypVnBC+AbsJcAbRPBJbZxeWpcewifhSdlA1degTkBC4jaM77SzxSq7+FVdho4OYLh3UbeaUMKfX/PtDtLaA4DaYxqkynHdC9uZed0fci2YgKi8bBOH1TMPRXZbTeBqLFiDkixhmOnMWBeh4X6zBGEaZk7DXjQY2NBngJTLlOHcOFhoS4JKnBqcUtRACS3CfeRHwo0ZHU8XGPix1l1+h596gY1TnrCFpfSmDbuTh/M6zrPxloliDbEMl1IYBn5UH8xPSbxD3b6g1Ab6/P0N+KhQhlOlvQ7HiHkMRjQLrLWg3KX8MKvbNKT9c6qOsSs8CtUgYCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/MjlAkrGETDMsKHPeU6q71Eot0TcvZtm2jt8taj74g=;
 b=QZ7jKA6QlAvJlmtCvn6c9UXCC1+WW1W6zFqnUXMnJoBp5xzebcU7eJls6ABnBt5ijBvEMIKpy9J9/6YGkkxRS1NDxTBPs00BQK2Js4fhuZlPXEWW61vGrgY+BZbfH/PBOnhrcgX7mMZ4dgUXRXJJ6Ly/2KGSn7TVKtoANqYRDXG8+SWJxWF+riMlK28YhAOEU8cI3Szkt4XO7/OGJ+GKmir0mW31MQNtMfc0Vd9TBWqCIktDQ3bRplimQy+lsUW1nmyD9mduFvDIRWxtF3g+PkUM02pmJgPiHCncT51KbfWN84W/05FIozYuzsUzeE8jURwPvTjHXQu5L8icc9ZmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/MjlAkrGETDMsKHPeU6q71Eot0TcvZtm2jt8taj74g=;
 b=b7h7LTfISV6JHsbm+EiffBl0U1DhygVzTw5soDNiqcsp2CVVFWCToheQfbcK1oBpxbsXOLEap599MVWxbEotRo1gTI0xDlVSp5whVJKi8y6XObUu/LlocjSKTC685JZpYzUBpi/UauD9rF6+B6+HL/bEVwhN227nb5KfS9UIxXQ=
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8862.jpnprd01.prod.outlook.com (2603:1096:604:157::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 23:27:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::51d8:3d84:115:48ed]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::51d8:3d84:115:48ed%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:27:52 +0000
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Carl Philipp Klemm <philipp@uvos.xyz>, "kuninori.morimoto.gx@gmail.com"
 <kuninori.morimoto.gx@gmail.com>
Subject: RE: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Thread-Topic: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Thread-Index: AQHX/BYXZZgY2C8P2U2p1HC0+RojS6xT9DmAgAA7xACAARamgIAD8KGAgAO/96A=
Date: Mon, 10 Jan 2022 23:27:52 +0000
Message-ID: <OS3PR01MB8426FD3FD1B45BB31C971A56D4509@OS3PR01MB8426.jpnprd01.prod.outlook.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
 <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
 <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
 <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
 <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
In-Reply-To: <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aea84291-c4ca-41e6-90ef-08d9d490d2db
x-ms-traffictypediagnostic: OSZPR01MB8862:EE_
x-microsoft-antispam-prvs: <OSZPR01MB8862683D856B2F32BDB5B66AD4509@OSZPR01MB8862.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 25ig+hGGoH9TkAu6HaGR3d6fdCTvoYc94n3yk4KOvrWHo8hpWFbS0P5kfKk5UunecqvtWWd2PU76MrVBwyF/QZc8kfnigI7yWEBfTtXVcmZBliX9SNFP3TGI9QEz5xl+0m/Jd0lWdCwMwa1L1fOBxZJDX80KSkkSSUVdphVn+H0iPJj29JgbCKkXDwx+1PtOUIlZd1Awhz61hlsLZKkPJy7Chtn/LYzig0S4nVh0WenHPF1anEkUcvQePoxFjFwLaI+HmWQO38+sftMghkiXZwITU+UNsISErE2+fKFVGYcijqqvYTUz2CKAdJcSLJaYwNbpuXI0WFJQBHFT08yavpeXcIxHkHaworgnbksVeGCbxNQ5p0vBgnKm9P2ugVcgDkcags1PSxfQ90OCFm4gORVnQVva8N3gEaWsbPq6hO6HLR1BMHfehhafe/164U5/YRHRD4KPsAn6LQodYarlPwWdBJIZ3HnxWysbECDaPXLZ21kwJC+yEiK07zCF8Zfa6WHT02kU3BXcY98dJA30+VdF7Abjd4A2HhkeH2MQzELnh6mr1vF2X8QjCCUrZQdb/phKxXkLCwPSDODOz7UVG3m+9P1aKgWi5P8ox/s+99ZIO3DTxgKfByxTbtZNtEMTlhMSEttNd6oh2Y1azzUyH4GyMFPWt0sDHX0cWud4HNA4Du6U408YvbaVKM3gS5tn8etEa7sb/MSKcEyNrtTduw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4326008)(6506007)(83380400001)(38070700005)(2906002)(316002)(54906003)(86362001)(26005)(38100700002)(110136005)(64756008)(7696005)(66446008)(66476007)(122000001)(66946007)(107886003)(9686003)(8936002)(76116006)(66556008)(508600001)(71200400001)(33656002)(52536014)(186003)(5660300002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WWvLPvchounRWXAalzwxZd0rAXwo00NxFFALw0f4lf7vOq/1RSg+nu6KtRTR?=
 =?us-ascii?Q?unIOVc4wtPMo7E6MbQFoVps23dml3ajIbBBMNFAN6/eE8S8sQiNicX7SW3oK?=
 =?us-ascii?Q?u4KvjhLF4XG9ifxSMyfRs5B5TIyoQxDGKXWB0mFNfGI38mo4HugaA0OWRB2i?=
 =?us-ascii?Q?Yi3POKE8zx9sJgaP9S8TbCbky0VjIKimVUJmNdeCWqASz/c7aMLGg2GCUuCA?=
 =?us-ascii?Q?qT1eob5WFPo4OEXxeSjJjUK4LNPHt/eZ8jajkj5x79JBxbKbR3A33jRAcGbI?=
 =?us-ascii?Q?xy0osC3JlOvoFPadd6Ar84p1mswXqQHFCxMS2ZYC/LDSQtOZR+xq2RvBFgdz?=
 =?us-ascii?Q?2r2RbOI+R2JE9z7DQejnfVzyVuglJMOYkQmnF7ro9N+NrThBdQgiVPXlzUR5?=
 =?us-ascii?Q?xzavDI/zdEma3LxQaMvrKEO+Djebk15HPi7EMUUj9yRj2lofqRKkjcwMqbHX?=
 =?us-ascii?Q?3m70HUBFWLK8/rEe2LXNBA7iUjhjbsRS3WY9iok9Sd1olYVk+7Vw3ZgH5fkq?=
 =?us-ascii?Q?0/5Xk1tJ0jOUNUt0YEw8IgS/CknrPEtt/S1XiMPXQcjOa6gcMA3lsMnh1aVy?=
 =?us-ascii?Q?q69VP3YjPBY1jlFZujNBf4VyAHER6Ao1dHUqqpNKXi0/7Bn0uYOe6PfSvUpP?=
 =?us-ascii?Q?iM+qlTwRL0olu6JrCa8Di1JioZbkTocLFbhqe887/kK5+O0uJyCXUpoIBYZs?=
 =?us-ascii?Q?7XfjzqgInXR6s+72WglmQP+SFwtVvzSmOe6J/C0rBNxNzTHEX92lFa1ujUUh?=
 =?us-ascii?Q?NxnY6UtwctxD3q5tOTpqAr78yrhSr0RMJWDW0Vb8pLntD8jP4IRWIIKpNUFr?=
 =?us-ascii?Q?wx7uZ/gI3SNQZ2kmw5lDSzjDpMuUA5YOy84iwwwbAtgWLpXrwbFRA3DNoPus?=
 =?us-ascii?Q?xlr8/BcVQIndGqZh4FD0MckcmnJd7HX64yV4nVgxdwAHFvTtwMtXuAAFWLeD?=
 =?us-ascii?Q?8Lgenc3VslscBb2o2ieYkt1b93MYgyoyPROR7JFNKqeb0d1VsyGTtnDRCPGi?=
 =?us-ascii?Q?gk07bI3IxbMPLQj+00oNxiq9nQaDx1htqULv4JELv6hz/tFgvUZ5K36HNiPg?=
 =?us-ascii?Q?9gdMqbZ6oaLsTocL1zESmwpP+8+iAnhlbTvOV/ZpkdgCuCg764QIPXiBKNVR?=
 =?us-ascii?Q?W5wUW1Wimf/eBuQ20a5xyOgpYzmwSSPKuhqbEFOt8oUcVIQyJx/yIb4mTXSX?=
 =?us-ascii?Q?ubPQaSsRB8bGnM0A++5KVRXANpSZgwKz4RsBgfuT9OEg5KsVVzMJPZ+luRza?=
 =?us-ascii?Q?49vKhfKSmK/1uU8zvAst7rtj6wUmD5HBJPjxdSp7h2YDwcfEqHY48pEeFkUj?=
 =?us-ascii?Q?lS7J7ZtOHy3SAOfzzuWal/VNkPa252MkHjc0A2DuUO/9BbXx2bTkSRZapc5u?=
 =?us-ascii?Q?r6FwR0VJ6fXhD1ubeCklmp2s5Cg9Po0oueQq1g//Pp3GhpvSkvIMdJl2Ew9G?=
 =?us-ascii?Q?Cu2+/8EtBBLGnbTkKHaGGyuWuamYfWvvtOwyrRulnqGfaAsPIfpENhBUPKy6?=
 =?us-ascii?Q?y5kaIVxNp0J+NDOOtZl++a3P5gnpMx0dJz+cumOZKxrUt0KAxcsS4M72TPcw?=
 =?us-ascii?Q?xEw8LAVLgb8dZsApba0sO6+CzObUgifn2+MQUAf0k7lCKQg48VT6bMsT8f5N?=
 =?us-ascii?Q?3tifjn7hzCh5F/aIr22ne/FSCSrKmX6STxEjNBiGBIliVdR8QL5Ls3ZhWe2K?=
 =?us-ascii?Q?pwkd+j+GS9neBxOi/0T8hfxPhTV2a26bMCRauqgtNmNP9qeS3Q2ayAsUaV/j?=
 =?us-ascii?Q?IpWi0G4WJw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea84291-c4ca-41e6-90ef-08d9d490d2db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 23:27:52.6057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ID/mmM/eYbSqH98RSJnzPd99/Hxt57RfA7FptyF7ubufn4/A66PsdazKqjz7Qu6YsCBhud7GCxpypElkpNCWwmIl69ZL2mLWdyPwpRUkF4DGbUBuLs/Qnnsw178EdNgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8862
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "merlijn@wizzup.org" <merlijn@wizzup.org>, "sre@kernel.org" <sre@kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
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


Hi Carl

>> (X)	int asoc_simple_init_jack(...)
>> 	{
>> 		...
>> 		if (gpio_is_valid(det)) {
>> 			...
>>=20
>> 			snd_soc_card_jack_new(...);
>> 			snd_soc_jack_add_gpios(...);
>> 			for_each_card_components(card, component)
>> (Y)				snd_soc_component_set_jack(component, ...);
>> 		}
>> 		...
>> 	}
>
> So for the case of cpcap codec on motorola mapphones this dosent help,
> because we dont have a gpio to sense plug state, thus no gpio in dts
> and thus gpio_is_valid will return false, therefore, no jack.
>
> Moving=20
>
> sjack->pin.pin		=3D pin_name;
> sjack->pin.mask		=3D mask;
>
> snd_soc_card_jack_new(card, pin_name, mask,
> 		      &sjack->jack,
> 		      &sjack->pin, 1);
>
> and
>
> for_each_card_components(card, component)
> 			snd_soc_component_set_jack(component, &sjack->jack, NULL);
>
> outside of the if block should make this work, at least cpcap gets the ja=
ck then.

I see.

simple-card is checking hp-det-gpio on DT now.
I guess it can help you if simple-card also check "hp-det" (no gpio)
(and customize previous patch) ?
Is "enable-hp" better naming... ?

Best regards
---
Kuninori Morimoto
