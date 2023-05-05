Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749BA6F7CEA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 08:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47A352B8E;
	Fri,  5 May 2023 08:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47A352B8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683268183;
	bh=9RctiI104Vtcx/uyUjfjcxE4IeafCtPLiQcd0YEtgmY=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ga5V7LdxMztITsrLulVeaQdn9G0I8/o3MSNzys4p9hZSsXKOxcOlBA4gXNxcNysyc
	 6tWfa3S+IsuEhMu1PvXJSeq3VqnbIHa3hwBTEmNCiDN0bIgHtsKGSGZ8Q92SeM6VwH
	 S7cQ1iAz5rojkqBnAOUnEd35v32Lci8i0DQG0QuU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE3CF8052D;
	Fri,  5 May 2023 08:28:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C638F8052D; Fri,  5 May 2023 08:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE5E0F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 08:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5E0F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=br8J/huJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3ClthiPMISx7O31WZbrmHK0tZGc+ul2ZGBW7A5icFmutQ5J+bb5qPtr2JgTqH83xw0wzkQ5JmXeZ2KoP7EHWz6tFdfyDD4QWN+Kfx3eKfIsp3cufDpRjvQtUT07ohQyBsfkxSNtTXVM2C84W8D4sLJIWAk9oEg4P4/XBPxoUhuNrIVTEsaYpesOMzFhezKOahnrvgtRPyQzk6qcIk9nPw9uU99noPQ4jMSf42znnGBeAmkDDPPPf0GiU4djUrGG3UprHYvf3ULifQUAFKe7UUZ9fSOU4Qo0CzGQunLgPj9Z5vPo5LvlxCRZ0gl0kdG+SCF4/15/CKrY+8TXP709NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWOmuJVMC3OBUyA4jjcR0iCNVVGA6arIvZ515W8dB50=;
 b=WdMZ1ACs9YizUvmyIELdKgB7KlVYtfoRLq6qNiVOnf5ppJEWz60p6kz/s76dxwt4fUElW1viAo13P56l9NmH9N3p119QBVvUDGkKHb87XCaq78uAekQUuzme/JalMVLa3PyGOogKlHl+rzlr3Bzvatwq6m4AviHkP29W48iGW6O7ss9mBlXkq31QKJUsBI3sBCW9JWMZqF/RfsErJu3w3JRtFJiqoxhv5uKjjgt00tHjMsWT6GhAyZFmaue3y+JqJmCkqaSIczhEX6tsc6wE93pyeRqj47xnMBMcbgUaTXfv9pvEPqWKALUdeB9jWySFPs6Vp0z077hrDQ53TSsfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWOmuJVMC3OBUyA4jjcR0iCNVVGA6arIvZ515W8dB50=;
 b=br8J/huJi8ioqETBQWqKpO21qr3ia35N8htKRdqMV86ZeGPprQQ0DeRfZHyWU6VnkpfUvxWGB3gmGuQSsxhtbHlA5PeoK4lKMfcBBHQ5SUsa1OT6PpZ+Z40+WS31HOTmibAFnWcat16B8AVYz5OikBjrT7lWZyykk6wg6IwZ3RQ=
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com (2603:1096:604:10b::11)
 by TYCPR01MB11042.jpnprd01.prod.outlook.com (2603:1096:400:3a4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 06:27:30 +0000
Received: from OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157]) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 ([fe80::2de2:b2ee:d931:157%6]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 06:27:27 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Mark Brown <broonie@kernel.org>, David.Rau.opensource
	<David.Rau.opensource@dm.renesas.com>
Subject: RE: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Thread-Topic: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Thread-Index: AQHZfmGULNc3wnPjeEqi4hHyum/KIq9KHtIAgAEYaAA=
Date: Fri, 5 May 2023 06:27:27 +0000
Message-ID: 
 <OS3PR01MB66416F9900BD264A06932DAFCD729@OS3PR01MB6641.jpnprd01.prod.outlook.com>
References: <20230504082218.24059-1-David.Rau.opensource@dm.renesas.com>
 <ZFO1eLaz11iLo1Td@finisterre.sirena.org.uk>
In-Reply-To: <ZFO1eLaz11iLo1Td@finisterre.sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6641:EE_|TYCPR01MB11042:EE_
x-ms-office365-filtering-correlation-id: f95ca81a-7abc-4faf-b7fa-08db4d31cbfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MXpl8+5OuX6HIUCC6GC9D2pHR0PPZzaLzlegqv4OTu5IMQexO0jrmdoYuqK56QwJ7+3jPnCBpl4FiEtXKP7nNq2tNRK5QKMWZq1b97dSeNG0C/DHfsjr75aDWEuYhGsG0YAD3BPojXvU3emdSCLnJMe+C1B/srVP7gtJqlweeogXHrSGTycRZvCKzE9BS910KiNCGtZrWdf4TVFglQySJoHh1c8GoymKangMjgzQImom6BOFqMys/ew3+AW19X1mKbnNsfV8ZsGWmawTH53oroY70ZDN9zGq2RSbyPllV9he4ZgwVhKe0ACBSnVlOIG0TQwkp5GEow6TIqrUn98ljtwZNLFpuEi4I0rseBvIgy1VrKzJWR8dnT/W86TXkKHHpnkz6HyV3IiiDVFDXg01Z6WXlSHCR0CBp51Qa4atI4xBh/3c52jsACAFUhr3EOHo2P9quLo/EceknVRDh1yV4tL6YDV96Vnv/KtrJBtqivprXXtxx8mRRqgQux6IgRF8HQhpvdBncHr6Ez7i5hFa9O+WPQdzf3ebdpCMh6s5qDpkR5NJvBK312zgVOPevy0RoiUOF/T2SZthGI9UJ3VPsH+bR/dtTUTUsTVYgs0JKo+aFuhAijjQxhAqL/ZWx+TB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6641.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(71200400001)(7696005)(76116006)(4326008)(66946007)(478600001)(66556008)(66446008)(64756008)(66476007)(316002)(54906003)(110136005)(33656002)(86362001)(83380400001)(53546011)(55236004)(9686003)(26005)(6506007)(52536014)(8936002)(5660300002)(2906002)(8676002)(41300700001)(55016003)(186003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?RpHmuQ5qboaW3K3NE5X/onDQukzGhaQvNwbkRgmMj9iVUwW8IthkaR1jhE7t?=
 =?us-ascii?Q?OFO8ZUbUB6WtpTx6Iol/SGV/CI9mpIRSnJKLc0iusCrPgyXEpRHN3oKoF8Jk?=
 =?us-ascii?Q?mrWDbQH94yfzpFrxFTRIzTZjpVSBDz9x8B3PdHrgcYNO4xorPfRuzvBuodfK?=
 =?us-ascii?Q?rS+YGCE7rZFS4u1QSBRAk/bhbfEtZOk+LR/hbYiyZ+z3kbdvN1Lr7YfRpqkA?=
 =?us-ascii?Q?esJCsyDWBKdW7T8l9flhGBhZGIiy3zeNB8MJsX4n64NbdOEj4+EtZJ1dVZ2e?=
 =?us-ascii?Q?6RhL5Hwsr1Na3S2xAIgXSJMhMgyROm/6aoPWlbAAoTuicueqb9LbTX2UrpHi?=
 =?us-ascii?Q?8CWN19Sst1oe68lD849VkzhLxbZLekO9SedbPWK9ZNRntBP9HuR30ep5GicI?=
 =?us-ascii?Q?NI1rkpMTawKg6qksdAuaBeulkUm1Z0VUBFpLKkeTgptYSoOF+6Iq7GTV8+DH?=
 =?us-ascii?Q?t79u/3faTclOGcIzauiNOHRw8U6Sk/5N/fqv5qyFozKHM+pMkwHk4SskDkZm?=
 =?us-ascii?Q?q3+qHPAIfhxoGOVAievvcVK2YNLT3Frh6B2xCbynYdIOdbvjbn9XoynzCBRf?=
 =?us-ascii?Q?5mzj8MjI9PQAxvVwkAXXctEVzARpeWNkTQD+BKjZS7lSFwblSFvo+9JpLXG2?=
 =?us-ascii?Q?6M0P/dkBbcXuoeA35xxpitp2rEjfD5KkaKpHIZdqhy2YPeOvsDIWkgIZw66z?=
 =?us-ascii?Q?jb+DFZVKEpRFEh1T2cZFKFDZI/RuVPCkKl5s+gVxnA9djmV88RzRKlhOHHQS?=
 =?us-ascii?Q?xt3jZs6/F1zQX2L6h6M3zUWYg2Gli/K79BY2hNcmQb/bixEjAiXTWhZXBujX?=
 =?us-ascii?Q?Os99bdNqx9xJ99/QSodXKKFSVykMAv+MPbIq23IMXB/s7p4mP3Af/9foB+Ta?=
 =?us-ascii?Q?OMzyRKGGxZaQZHRXZ/2EEzZduQJHHihvDP58blPJUO88JVct/6yeZf3gi6M0?=
 =?us-ascii?Q?KfGO1YIp2oPvCCz1+Mgp6ExeCn4sbjMjnMxqfQ/2cT5H+yf5fvGe6gVopfLl?=
 =?us-ascii?Q?J1T6aBQJ4KjlGa/9stNClVRNrflQR3xw7opQsyw/f57rQNtvvhgtcE6QVLUN?=
 =?us-ascii?Q?hDu4HCM8puVqm8/wbNjGXDyTAs927HrU9LbFZ0pikC9tVNHWskzlIdc6qdxW?=
 =?us-ascii?Q?o5+8Od5vbAQqM4/9jfgYqL2fjpbfte+6NKuf8AnQ3pYI7KcPHpf0NRdtQXA7?=
 =?us-ascii?Q?+1sh/wK9GMz+kR/b06KIF7TW07D/DzspfCNRayxog7ijrEmGKFqNKbAG9k81?=
 =?us-ascii?Q?HDcRd+yqKiS0aGvmjftd4/JQKCrmfZLo39oO9ivCwNpGTG4JTb0EifpjT3Sa?=
 =?us-ascii?Q?gcM2ld0XlLvm7oC8l/zYKwUgehV1tnUR+CYCJ/iLs/0x2zWMcCYmdVPrjFqK?=
 =?us-ascii?Q?6BS68oqSmPyooWO0sviOH9YnLsD2+Lq/NNUIHJUKCyiMMOImslmtjeedX/mr?=
 =?us-ascii?Q?0cFuXstxhjZdBvJgt1M5Y2Jb0buUBxuCga+yoKmcwqy2V5Zn30rgaw4AOLbb?=
 =?us-ascii?Q?K8eTlT6vi11sbB/nv0aHHWxwOymyY/M/Cit+10Izs65hfi1XrUsAqrlhZEmM?=
 =?us-ascii?Q?u1CsV0usnjCgYYEcyg+yhQbWKR7LlQr1zz8KrPtyfIdz4rKdm7aUczLI+vXt?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6641.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f95ca81a-7abc-4faf-b7fa-08db4d31cbfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 06:27:27.4035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 AR5iqaj39dOpfNkuJdoPIEBkeT/azpssNNv3g0I3lwgwUKygYpgpTmrQfMiCpxAH5Z3AoIgcIKRG0wuWtb22HKHuj32uUyRkYai7+pCjBuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11042
Message-ID-Hash: UVQFNVOFDM75SELTVRB2HO7VPIMPNQLF
X-Message-ID-Hash: UVQFNVOFDM75SELTVRB2HO7VPIMPNQLF
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNJY7EMQZWLSG6KQBNBMPORR7JBYDYWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Thursday, May 4, 2023 21:39
To: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
Cc: support.opensource@diasemi.com; lgirdwood@gmail.com; perex@perex.cz; ti=
wai@suse.com; alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: da7219: Add Jack insertion detection polarity se=
lection

On Thu, May 04, 2023 at 08:22:18AM +0000, David Rau wrote:

> +choice
> +	bool "DA7219 Jack insertion detection polarity selection"
> +	default DA7219_DEFAULT_JACK_INSERTION_POLARITY if (SND_SOC_DA7219)
> +
> +config DA7219_DEFAULT_JACK_INSERTION_POLARITY
> +    bool "Default polarity"
> +	depends on SND_SOC_DA7219
> +    help
> +	  Select this option if your DA7219 codec with default Jack insertion d=
etection polarity (Low).
> +
> +config DA7219_INVERTED_JACK_INSERTION_POLARITY
> +    bool "Inverted polarity"
> +	depends on SND_SOC_DA7219
> +    help
> +	  Select this option if your DA7219 codec with inverted Jack insertion =
detection polarity (High).

> I would expect these things to be fixed for a given board and therefore c=
onfigured with a DT property rather than a kernel config.  It should be pos=
sible to use the same kernel on multiple boards.
Thanks for the kind suggestion.
Now I am working on another implementation that retrieve DT data for multip=
le boards like you said. =20

> +
> +endchoice
> +
> +endif # SND_SOC_DA7219
> +
>  config SND_SOC_DA732X
>  	tristate
>  	depends on I2C
> diff --git a/sound/soc/codecs/da7219-aad.c=20
> b/sound/soc/codecs/da7219-aad.c index 993a0d00bc48..9d16112cff6b=20
> 100644
> --- a/sound/soc/codecs/da7219-aad.c
> +++ b/sound/soc/codecs/da7219-aad.c
> @@ -879,6 +879,18 @@ static void da7219_aad_handle_gnd_switch_time(struct=
 snd_soc_component *componen
>  	}
>  }
> =20
> +static void da7219_aad_handle_polarity(struct snd_soc_component=20
> +*component) {
> +	snd_soc_component_write(component, 0xF0, 0x8B);
> +
> +	if (IS_ENABLED(CONFIG_DA7219_DEFAULT_JACK_INSERTION_POLARITY))
> +		snd_soc_component_write(component, 0x75, 0x80);
> +	else if (IS_ENABLED(CONFIG_DA7219_INVERTED_JACK_INSERTION_POLARITY))
> +		snd_soc_component_write(component, 0x75, 0x00);
> +
> +	snd_soc_component_write(component, 0xF0, 0x00); }
> +
>  /*
>   * Suspend/Resume
>   */
> @@ -955,8 +967,12 @@ int da7219_aad_init(struct snd_soc_component *compon=
ent)
>  	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
>  			    DA7219_BUTTON_CONFIG_MASK, 0);
> =20
> +	/* Handle the default ground switch delay time */
>  	da7219_aad_handle_gnd_switch_time(component);
> =20
> +	/* Handle the Jack insertion detection polarity */
> +	da7219_aad_handle_polarity(component);
> +
>  	da7219_aad->aad_wq =3D create_singlethread_workqueue("da7219-aad");
>  	if (!da7219_aad->aad_wq) {
>  		dev_err(component->dev, "Failed to create aad workqueue\n");
> --
> 2.17.1
>=20
