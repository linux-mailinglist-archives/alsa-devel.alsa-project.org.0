Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8D6B2ED8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 21:44:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A73189E;
	Thu,  9 Mar 2023 21:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A73189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678394680;
	bh=KXEGog7h4zzUdBdjNiIIcmH1deC9VXevK7ZVAaE7UJA=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=JjiJQJ/jWWZvUH8hkvyBjrDq9tSjisiyz9tgMuUM6C1k+fAje+K+rj9dffd2Exvx5
	 f7KM36BtKRU9yRF6fO43LTgek1ybViX8OiMuVDckf6yAgj/1gCf0FN1TaWo+J2fYId
	 0P6pfCM530+VUpZfU9g57EmTe0BF46OB4ecJWMt4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9253F8042F;
	Thu,  9 Mar 2023 21:43:49 +0100 (CET)
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Date: Thu, 9 Mar 2023 11:37:11 +0000
References: <e1446fd1-adff-4a43-aeaa-e0ea6628722d@sirena.org.uk>
In-Reply-To: <e1446fd1-adff-4a43-aeaa-e0ea6628722d@sirena.org.uk>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Thu, 09 Mar 2023 20:43:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GJ5OYIBOVKO7AR7FPE4LQKBYLIJQWQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167839462908.26.13229086463800336255@mailman-core.alsa-project.org>
From: Emil Abildgaard Svendsen via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Cc: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05FBBF8042F; Thu,  9 Mar 2023 12:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22E62F800C9
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 12:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22E62F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk
 header.a=rsa-sha256 header.s=selector1 header.b=RnOooI+Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LacbX2dkbbqC4k3D6sC1dF3ZNP4IuE3SiLlg3uICs+orK81XsqNBA2mu0V61hsbsmBmjwKUa2+OYP/v2MG5dhp6YAlhwXd+sR7mN8GkvjtoKtlkCaKFv8X7hsNz8dpgDrb3X2vWbdhKinGP6dt5Y8J7WJJW2C58vXmUFe+ggOh2FG0lKTgul8LfkRjAJMzoUAHXQODaJKr6LQ5CEyAByY2n/ZzvcT5fgZgdMfHbKZCHomrxOTfMTrmDUsQhBK3afdrcNUOIOf/fuJX2nv7/t38QEsT/26Z2j4pix2mI7VgDK3c7lwtlWEfKL78Rzg0f7kcSgBkvO4iak6bpy8VSY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3j3L4hrnn56TIaR/blvrM1DEnQQaHq45PsK9kmTXVE=;
 b=BNPfzLIIKCMGT4r+54vos96ruv+ayR+82rdMlYMnmvsfJ9yylPnzWDBRSH5Hs8w2WDIBtpCze/Zoon3q7NXgOoaok6fGnhusp7hBDt7VdQFhQjMxuKkn3bD4OQUGbb9CX/y7/GuRVZTMGI1aDUmL4N2ltS3g+fRcc8q0mIfHxP2aN62/0CDYrocaNwMwXk/AX2RPRD26ybAxT85Ytkpyhei9NSEtaKzKmnl3PzppKVJuvryoygHMALmdEzjOiE7bC8lE2uu/jtRZ7HKYCghRyrJll479jiX5+RSa+cJgY/Sptee8PDlKBj25fLps6QCCzNw+aQydUdR0RNFw2bvm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3j3L4hrnn56TIaR/blvrM1DEnQQaHq45PsK9kmTXVE=;
 b=RnOooI+YWekmvnSxvj/3XrhJz5LJOoXC4iaRMwdPONiBZjf5rFJF0Z43+dNNl/ymWpgaZ1VUZu1NhxYKirVdz889hSftpYlvvCo6XG+GqcBHzDknhjNm7oNcKkPVdyZ4mGuoR9VMheOTMNeljyB4BjSOguGO9Tlsuo79FyzQU48=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by DU0PR03MB8910.eurprd03.prod.outlook.com (2603:10a6:10:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.26; Thu, 9 Mar
 2023 11:37:11 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::7ccd:3294:6981:aef7%3]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 11:37:11 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Thread-Topic: [PATCH v2 0/1] ASoC: hdmi-codec: only startup/shutdown on
 supported streams
Thread-Index: AQHZUlQFM7hTaZvX2UuXEHQa49Xywa7yO/KAgAAWVAA=
Date: Thu, 9 Mar 2023 11:37:11 +0000
Message-ID: <20230309113702.485664-1-emas@bang-olufsen.dk>
References: <e1446fd1-adff-4a43-aeaa-e0ea6628722d@sirena.org.uk>
In-Reply-To: <e1446fd1-adff-4a43-aeaa-e0ea6628722d@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|DU0PR03MB8910:EE_
x-ms-office365-filtering-correlation-id: a360f1bd-c37d-48fe-8631-08db20929f40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YRicQgx+DT5iQHP3c66zQOfwJm+tZvaTriktWE2392Y5tluA0xIFwQ0tjr1L10OAEfZhXOMuS2EgSZfhwm5QRFx04Cym0nZxIGuR7kwkxQqbUZGhUeUbPwDxEoGFJJuTN0WJNb1YZ+YysqPMchZLBPhvKGEdsNDhmVFAiXdT3WUOuohI86MKN6Xu4vS75kesK9IUoTC9z1CH4oclvm2aqnB3ePCk8Cfe0HUF/rxN1zwz8nu2uNgO3aMJ0aX89vtJI6emLaM+2S8e4qnQ18qfbVTx92JCZPoVhvRfsTRaJ1xpKPH3YphKWQBDBuy0ngT2phqYqGI0eWV2CMVybhRVvOnrAFj/ptjIzMb9ICrPZ5OqlH1pxxq4qUGHqxDoV5kKGbWdMs1GQAB+oQN9S/gyQ1l+5sbJXWIZEjtuTN+NZYJJGJsnLOBUA8NeyQWc6vWz9Vae5vmY6wPggjDT96ApuQTGX9tg7hD4pDfzRtZMutrgYlJpEC++wPdjnW3jNCl1BblHi56B4UQzMnDSk629VWb0pKANHCEoqoBdYADmEmrU4qvcyg82i2wNl4sqt0JaD31UFe5mP0Nm2c3AlyoZsIejF+hcF63ApFZmNf4q0CeGtTqnaBy/IRwRS68s8Ugto3Lb816jRzYThro64vuCR5vJI2rX+N6HRcg5fV7YD7r0sKjURoD9EvtiTf39f17zeW8irruxnNptDB73StowlA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199018)(6916009)(4744005)(8976002)(8936002)(66446008)(66476007)(41300700001)(66556008)(66946007)(2906002)(76116006)(64756008)(4326008)(8676002)(5660300002)(316002)(54906003)(478600001)(71200400001)(91956017)(1076003)(36756003)(53546011)(26005)(6506007)(6512007)(6486002)(186003)(2616005)(122000001)(86362001)(38070700005)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?8KK2ZNCWpWvKhISG/9A08MahazxF+9oHhe990TByQuRy9NJAJlyHMlOE?=
 =?Windows-1252?Q?hgP3ncOPWFyfZ3iDkr9FKONYrCcg8LkOv8mmzSYGTA24pT5qT7pfTEOC?=
 =?Windows-1252?Q?CA0vpgbeVX8UROqGnvczedZT2zoEqIGBCjeYLkiAPHoW3cqhf2sGIqyw?=
 =?Windows-1252?Q?17gztiU7FTE6TJRBYoFQuXjGi1/k7TQPiQsNOfDF+LQ/M6OJnDCtPay2?=
 =?Windows-1252?Q?pWRzyEkvqHnuHctK/yYu/Ym00fJiUiP41et/iSad5SDvXOSzWeKBlCUr?=
 =?Windows-1252?Q?JCyXL6Owrfp+mGbDwJEUwwy4yBbBpIsFkuece20JiZkNPVOrFvvOMSSp?=
 =?Windows-1252?Q?qHUhusii9osZh2fbNiTJO1K0Ltb1guxkhM5n1I+62Z1QfyWTilDj7DvQ?=
 =?Windows-1252?Q?5GDh76M6OxZzdUIul5c+BkJHOdzEnYoTwJrieqIT4PItAw9y/2NO+for?=
 =?Windows-1252?Q?cK7LzTOqSc0zoytRWM+esJh2dmIORvPtTPQ+oGpkHXWesbxVRnFL3ydp?=
 =?Windows-1252?Q?1eV9lmde/pBUPRYJjC3kByZnx2rChUhBJKGv1pswsCsG6xPHoVO3MCKM?=
 =?Windows-1252?Q?qX0D0HzMLKSp4T/4ul+lJvrkNnw//Z17y6uXXnkeTi341OUrwt0wLvyA?=
 =?Windows-1252?Q?7ZaXKbmUAU4so6bP6cpVma8BqxlFMX25gzvIZKf2e8mFDH47hi7a3t++?=
 =?Windows-1252?Q?bMjg0RFItI7wippZGPO69K5xVFIkxg/g/7dWkBnNBY9AHkXfEhcXROa+?=
 =?Windows-1252?Q?lZXlocCWE4bUhkzR5LcgGAnbSZtHOAPYHz6gv/L8moCKOA3L4GOzAd7g?=
 =?Windows-1252?Q?ht113qYzcwwI7NFBk3R4+56oy9F4fdpAbFgIee8bu5BQUvD/HctpE/jU?=
 =?Windows-1252?Q?EJLltKnvcmJvxZtz+HNN0HB+VHY2btvNy3m90s/0b3OXKNkUWBwmIU0H?=
 =?Windows-1252?Q?ba+kjRdG3mvsh06rklwsaB95lOoKHJ+Whnxw+2soE0rtyslcRMLWA4hL?=
 =?Windows-1252?Q?w9N+M8ncXEpU3Me8Q7TyaIo3YXsqQIyeKB4rqDfv8CcCthJt+KH4MiJj?=
 =?Windows-1252?Q?ZNt7ggG1V0b4/CE1rFFqXwi8PoEVDQ7tsTVXG6nqzGWfs105mXurFDiw?=
 =?Windows-1252?Q?QbwedkpB2mrGZgncEP14/OdnJeHfgmjWu5+an43Qu1n37q9mYdFyh6B1?=
 =?Windows-1252?Q?2p5M6YNnmP8ENTEZVIu9FQ5mNpGR9LYNcrZkicRjaVWciXToDihqS0lu?=
 =?Windows-1252?Q?AgRxDmlsVuEN1/UFnsR2IRS0MkDrf8WjtCM7SDUJq4YsW8vl5pt0HaY9?=
 =?Windows-1252?Q?iCy/xGh8C1ZnBaRYW5VIrLx43LUlsILxipIetWUR7HLb173ycSb1t/No?=
 =?Windows-1252?Q?/B8EmIx/uu1A4l9m+kz/tEQad/LTxfcnfpnEoxTRMvgkP5xc5FfBhf9Q?=
 =?Windows-1252?Q?dHBrbOS8DTouA79ZrLVmJg3xevkySdZzAfXm2KsTtm2b70idcIjZUbnM?=
 =?Windows-1252?Q?G8yNzHsKJ06ldYS/rWYSX4N/LKu1eiORjiNQXCYR2YeRjdFX/1YuYprj?=
 =?Windows-1252?Q?jvD/1hkuU1n7dHhRJaCUE4GEVG2U2cnAVJhSxx05uipZP/IcitVxNyqj?=
 =?Windows-1252?Q?8EJXLv/fAjo9+weP9VdWLj2fzYzB20KBr/3yLS6t24n/hM6lHzcvqypy?=
 =?Windows-1252?Q?9MDyI48mh3MHKlZkubf5PVlbMh8qaBk9uuxuO91cSE9omXkH2u5LDg?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a360f1bd-c37d-48fe-8631-08db20929f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 11:37:11.1864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 DUInb0vE6IEopmHPxhyt+kHp0rnVGNKIH2n3De0VCAPN4QiDOcZPIHfBH9Sr9bXS/z95b/eCUacQF+dxrKjMcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8910
X-MailFrom: EMAS@bang-olufsen.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3GJ5OYIBOVKO7AR7FPE4LQKBYLIJQWQC
X-Message-ID-Hash: 3GJ5OYIBOVKO7AR7FPE4LQKBYLIJQWQC
X-Mailman-Approved-At: Thu, 09 Mar 2023 20:43:46 +0000
CC: =?Windows-1252?Q?Alvin_=8Aipraga?= <ALSI@bang-olufsen.dk>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-patches@vger.kernel.org" <linux-patches@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GJ5OYIBOVKO7AR7FPE4LQKBYLIJQWQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/9/23 11:17, Mark Brown wrote:
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that=
=20
> any important information is recorded in the changelog rather than being
> lost.=20

That makes sense. I will remember it from now on. Thanks!=
