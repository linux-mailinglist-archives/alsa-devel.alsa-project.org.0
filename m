Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0873C951412
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 07:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F6D238E;
	Wed, 14 Aug 2024 07:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F6D238E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723615102;
	bh=5CAD3JgO4EFbDAfJ6UF2ZWI1MGrOViE8WOlLE8VtqaI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bmwHED+5QRSheve30HQYfe66Gry8RU4d0XaPM03FAAOy4KUG2ve0k/GYym87GaIkN
	 p+ltPoLA4nlbGdoJxgwyAYxx1E8SgrGreBKYvDtpYWF4G5msvhW+FJp0i9TkgJcynd
	 QdAiZniVzl3eGQNzdSqba0LpU0GXCmv0eEYrlPuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B495F805A9; Wed, 14 Aug 2024 07:57:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4B8AF805A9;
	Wed, 14 Aug 2024 07:57:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9823F80423; Wed, 14 Aug 2024 07:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SEVP216CU002.outbound.protection.outlook.com
 (mail-koreacentralazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3EDAF80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 07:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3EDAF80107
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8QLchXfBjr5tVz/Tw086O6WkRe8Sa/Q0X8LQn7XM4gNZtR9YdRorNoWJ6gnPExgVAnRcmGSFq7hgKsAk5GzBPfHD5Cre4LJYrhhHc5hwHcabtKFqzH0igGAKdeM3EaBUIRKc6fB/+vApSihb2N2lLtpkNxmZ+xe4vINZluyR+v0gQZq+iT98FI6ip8T1Q8uDFLArn1/4ys0kEd9UgH8TmPjQQzxT3hqSP7jbpWPC3F4eiLFBvDY1hM7bMhHuo6TWNBgaZKbu4L3BZgdSNRu+Rv4Bpm/+uipF3/64AV+iPubtFVWLZJI59Zw5tVS0k56tuucbwhsp5mMTKFAWNf+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0iwd5MKoRvScN9ojWhJmSBic9B9Ylh6TCdIYlRIPuE=;
 b=UhjvQf2imGUNUpWi/B6BSP+t3WftyMZo9Y9QPlu8K2o2L2ZHWlo4X6VY65y41Ocbv8FFYxJ8+xc7l/nTsSbgi9kt2Ufb6rvB8TAzge6mOegveC/4ZQyYINvmeFdjRTddbsCpw/OfKzHWRi2Sg73lwoxR56mX3mkphbOdcxLZHOhcGIANetnrhlNqNVi9Dovil0JjKL9P+ItZ+hC2+zQwaE6yRvMcCWrT8+cWH7lKPJwEwiLwY/o5a6GRWNrqexr1oJ5WPPh3ZHYqbRYsrxtN3invpZ02tzQnvBKXpbIYO8EXANrBCGNRYaawmzfuiJNek1RUOZw3DniwQnP5kT1dOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by PU4P216MB1517.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Wed, 14 Aug
 2024 05:54:19 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Wed, 14 Aug 2024
 05:54:19 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: FW: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHa7UFTFpcIr/dvqEW6ASLb2MRYD7IlQpeAgADxGEA=
Date: Wed, 14 Aug 2024 05:54:19 +0000
Message-ID: 
 <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240813052609.56527-1-kiseok.jo@irondevice.com>
 <20240813052609.56527-2-kiseok.jo@irondevice.com>
 <66113ea5-11a7-41a9-8e28-af0394d7ded7@sirena.org.uk>
In-Reply-To: <66113ea5-11a7-41a9-8e28-af0394d7ded7@sirena.org.uk>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|PU4P216MB1517:EE_
x-ms-office365-filtering-correlation-id: f8cb6304-c938-4e50-9a10-08dcbc2589e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gHuoZneUga4bQJI+dbD+JZGYG2cyTK4tzAvGvnBw0iBadgF8lYJJGqEkKy3l?=
 =?us-ascii?Q?trmgGU7PLmt5LOGMSyk6WA8XJcOARV3yng5fNqYN70KKv6C/G0eJ2z2azalB?=
 =?us-ascii?Q?H+TZzY1riG31xzy64FUyBk+qv0+I/ZcgDQsJV0dpW1qSDRfVGbb/EJ5oOVbd?=
 =?us-ascii?Q?dMDzGcHG/jOGn/RB9zAW4Kq/aQngijj4sCw7TDhh6sXkBLKxve+ESK9q9JBL?=
 =?us-ascii?Q?zC6rgkdXhUs8hqh2ZM0HoPrcFdc+n2n3ICBpvkOqKJJvpEZC2pQl6vr9eVRl?=
 =?us-ascii?Q?tSChLUDupq4EbnkTGpuX/u99VW2nu6Bn9RDmpXTThEzVyx2btH8unbLNt4nC?=
 =?us-ascii?Q?JeHm9qwyAetXJtuncoLEkeY/vmU5gQ3BU80+uCSHq0VNz75dmJHRtT4p1Kn6?=
 =?us-ascii?Q?31fahPDvcxC3osuyuT/9VKghDm8dfMnyuJYarO+nV417/89RI/vFJPMGUtv5?=
 =?us-ascii?Q?n1CASLSzAxfDBoIZDsWr8KgDCz6TyjsYaEU/fsRv6un+2WxYjaAXPzcv8VPE?=
 =?us-ascii?Q?4Lv4759yCCVi0rRufAfq1hGyJvGYuCjtfni7nKf7J+qfG4iL00LaP9Jy0i11?=
 =?us-ascii?Q?xBN8VcY6RPSRebBegmjKVGvX6fpUKq4/PVg2rvsa3KDqBfM+KU/EwMuaoMxq?=
 =?us-ascii?Q?cV87DrEZFdLViJUyYYyA35bYpG6rxKiAF/0iNoh87HEWhkxEUC2Uph3Ib1eD?=
 =?us-ascii?Q?6ApW6b89nB3KsI8a4R2Cc/mQoTYQDoVpZHMefYJiHTqzYAymEalR3L7aBe5W?=
 =?us-ascii?Q?ywo6PwI/GWabFSFBsOaF7HGvoSjS2wgxxUZjJP1eG80rPDktFc2V4K3OW1fi?=
 =?us-ascii?Q?esj4rVEiSV7PXYzBKnR8vfAwLVspNMbbmdXNUxMP8nPwgHdDBdKNpni2zrgH?=
 =?us-ascii?Q?dlFE0EbDx4GoOZS0ydzaW0qIac4jRxMLnahM9/1ud6YbCgl3mwdLJr9UTyyx?=
 =?us-ascii?Q?igiHbBidyOZYcUFG75DhDoov7//ziwMVsf3GUTkkBOOlfwLa4IWTzolM4Q2U?=
 =?us-ascii?Q?OaMwZ1Fvf47OQPq4ETYgY+Gm9wB8Cl9j6WpVOvRqrSuSymbZs8/f6kzgwQiW?=
 =?us-ascii?Q?6T0gYVJprQM3/r57hOuCw8wlm+EZXIV2NTY71KnH6LT6WDhb0HOyDC+5/i+k?=
 =?us-ascii?Q?XuE9idIuubibMblkHZyxSCSaRI+nI0BPysV5luEmE1foEwM/BzdWls460rio?=
 =?us-ascii?Q?UKW6L0AUJ2CD9VeJibMapHgeeGu9QU6uO8sWw0M0+d7cRaYGkCd5e0Kr63en?=
 =?us-ascii?Q?scAAfb85Nn5Y6r/MjC7eymQFZphklkzLveEjn5KRTaLFHdyaqrp8auSQ2OjQ?=
 =?us-ascii?Q?dFpAAote/ftrYcCgjxbbQNSdBXdvmf3ADbo55cNM5YL9EvTmkCHnM2rAjrKW?=
 =?us-ascii?Q?c78vFl7Spxt+RLB5szKn0TMx/4f+AgZutfWPbw9B7MkbgAb+zQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1saRXQsMB1SU8vsIf6fVmpuxZ6M8DS35zYX3iJIQFxGi9kQULlauckaBxGQw?=
 =?us-ascii?Q?kWSVxiHX08s64U4gFORCGHAkdcanYvjo1YBnUJvzfC8YXyMLNr2jgL/Mgs1L?=
 =?us-ascii?Q?5wY8maDrIdvJv9nAwO6SbUIZxzUsNaLsvV4zpRTSs5z2JXoICWnR8jfq0Weu?=
 =?us-ascii?Q?iasay1B8i5kVRj1QhzcDC4SyWVqES6VDWu60tyocVR4jfkLUBtc3pmjN7bFw?=
 =?us-ascii?Q?PQvotDiRHsosUjvWWj7KxCwN6sz0XiDw3jJP948CfbHIzyq7+FOq3VwY54Vu?=
 =?us-ascii?Q?OCU2DeSHIA+m8w+dXSjmkYxxRgDmy0mBPwaXHXHNp5IkQjAUbrlX72bNgqPg?=
 =?us-ascii?Q?Jr7Vj+Ys0BnThD6OgIGmgpen/LdiYAf9QteWffwy/LQ5cOIusjYctFPuaPze?=
 =?us-ascii?Q?k+otU/tDEMz44CaG9RYpiKrWvZb3kxLwjWaIFMuvEgvETyMBrSEvTIO+2jN2?=
 =?us-ascii?Q?QIap9w2aazWCjgyRd52J0diOzt+j05e1w70ziG+xS5jTfWrQ3Aob8U2Wtj3R?=
 =?us-ascii?Q?0Q01QI8G7GxtSfZ7271cB0xdJzR6OByyqT8hYpEdOfRP4j1FgMuzMysUhjqC?=
 =?us-ascii?Q?0FV17rLnQLtOLVB+yRJJDzhG9WF1gAtoWAcTXupphj0AIhGr2BVgLqHANB26?=
 =?us-ascii?Q?wnsr1xhOQ3lTDolQ2s75NzW2SGe2poJida0nQzg+f7tMNoBwkjfdslIo1mfM?=
 =?us-ascii?Q?ZXNzVP/hRShQ+9j/tfX0fvLWh6Q21GKAF5zVsvTagy0zLLXikU3rSHPbE0KN?=
 =?us-ascii?Q?ZfdAUX1jWsLIDbatW23NNoEY8phtVpYasn5z8hsiFFTbt53Gb0sqBzQ06UGQ?=
 =?us-ascii?Q?bB911ic4YcUpO3ZCQGGwdjYWkJ0FWfTJtFS4qLxwIhmPF2hcuImhfguSNcpQ?=
 =?us-ascii?Q?f7KlY8YfiKRUfNGTpzbACQMdanD8181xlGOBj19jdOvZt0kXbdGHSOpsocWo?=
 =?us-ascii?Q?fZ9Ny5eLX2DjP9gX1IWWZvo/ixBGuiUdatMdYJlSobvLvK1khNxxybuN9A9s?=
 =?us-ascii?Q?/SvwPVVl+ufp25sGr3IqZB/bP198M3Qs4JDUFJDekSUh7Tz2XfFsdqrwUOEF?=
 =?us-ascii?Q?2qx6R1I01ydQrXv8zevmkcrKS/NwxmTEgwhkAxBwIQO2arS9MO1N2G56lq3Q?=
 =?us-ascii?Q?97GB1OLVSVt3p98v0eHLmWnPCNYltnS7tKCi5EmpfvolliGca+mH9XExT0b8?=
 =?us-ascii?Q?Wu1gCYl/HSjModtR3eylFghmZeWCh0ocZeYTnUcqeW4xoA6ftJCfcle3n56L?=
 =?us-ascii?Q?u0GoyfsN51+v7KVgnXulOOMWT2oLNxICz0F0PZ7oxyxPsYRaZwjyTnA2puNx?=
 =?us-ascii?Q?o/vLv08Uk57lyP+V/JBeIHeYhL+RZV7yxaB7R+f/9LjHwQcVQ+K4n6UUn4S6?=
 =?us-ascii?Q?HgvgMofU0M0gSnu9+SDGSVDicP4cnCGc4wYZYLdDvfcfOSfB9zTsnUzJy5we?=
 =?us-ascii?Q?pBaWTVXAQVNbGIB4DqMob6s+dxQ3kQuK6CcrD5aAXuOtE3+xu2VL4cBkjDAD?=
 =?us-ascii?Q?VqGwWGg5GlxnFpwXKKjX6d3gbcwde7Qsb8DnsiOhQfJK453dLUv8/OfpMM0A?=
 =?us-ascii?Q?cgEKseq/pWTgmPQd+0hKRHWVidbSSeqPGjyl/qeG?=
Content-Type: multipart/mixed;
	boundary="_002_SL2P216MB233758C3649FAF0ACDCCB8898C872SL2P216MB2337KORP_"
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8cb6304-c938-4e50-9a10-08dcbc2589e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 05:54:19.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rC075xN7etjZIutcc7tD5dganjpKo2JuqYJqLp02Rk+zlKiZ3R5LD+HqkdYfzcyMRQayuGlmx/9dwtYAA8ZdNBV/QoIoDm8sMWRtWG1bFKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1517
Message-ID-Hash: ZQVJJZLLP2AUMKF6ZYIDUEXBA7H26ERZ
X-Message-ID-Hash: ZQVJJZLLP2AUMKF6ZYIDUEXBA7H26ERZ
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYDTZHKUFV33JJVO65FNSBZTNAQOBHOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_SL2P216MB233758C3649FAF0ACDCCB8898C872SL2P216MB2337KORP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for your kind assistance!

I will carefully review the information you provided and send it back to yo=
u.

I have responded to a few points; could you please review them?"

Thank you!

>=20
> > +		return false;
> > +	}
> > +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> > +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> > +	sma1307_reset(component);
>=20
> This is a very unusual thing to support - what's the motivation for it?
> If we were going to support it then we'd need to handle what happens to
> the controls, either generating events saying where they've changed or
> rsyncing existing values.

The 'sma1307_reset' function is responsible for configuring the amplifier t=
o operate properly.
Sometimes users may want to reset the mixer control to its initial state af=
ter having used it.
I have added a reset control for this purpose.
Will it be problematic to initialize the chip values and return it to a usa=
ble state?


> > +static int sma1307_register_read(struct snd_kcontrol *kcontrol,
> > +				 struct snd_ctl_elem_value *ucontrol) {
>=20
> > +	ret =3D sma1307_regmap_read(sma1307, reg, &val);
> > +	if (ret < 0)
> > +		return -EINVAL;
> > +
> > +	ucontrol->value.bytes.data[1] =3D val;
>=20
> We generally wouldn't offer controls like this, and since regmap has
> debugfs support we already have facilities for looking at the current
> device state.
> > +static int sma1307_register_write(struct snd_kcontrol *kcontrol,
> > +				  struct snd_ctl_elem_value *ucontrol) {
>=20
> Again, this seems better provided by the regmap debugging features.

Occasionally, regmap writes are restricted in debugfs, so I added it.
(Reading is still allowed, so a read function shouldn't be necessary.)


> > +	/* HEADER */
> > +	sma1307->set.header_size =3D SMA1307_SETTING_HEADER_SIZE;
> > +	sma1307->set.checksum =3D data[sma1307->set.header_size - 2];
> > +	sma1307->set.num_mode =3D data[sma1307->set.header_size - 1];
>=20
> We didn't verify that the firmware is big enough to contain the header (e=
g,
> if there's some filesystem corruption) or any of the other sizes or count=
s.
The file format is fixed.
The size isn't very large, but up to what extent is it acceptable?
The header size is predefined, and the header contains the file size value.


>=20
> > +	/* Register Initial Value Setting */
> > +	switch (sma1307->amp_set) {
> > +	case SMA1307_DEFAULT_SET:
> > +		sma1307_set_default(component);
> > +		break;
>=20
> Why aren't we just using the chip defaults here?

The values input to this function are the default values for the chip to op=
erate.
The chip won't function with just power applied; it requires specific value=
s to be provided to operate.


> > +	case SMA1307_BINARY_FILE_SET:
> > +		sma1307_setting_loaded(sma1307, setting_file);
> > +		if (sma1307->set.status) {
> > +			sma1307_set_binary(component);
> > +		} else {
> > +			sma1307->force_mute_status =3D true;
> > +			sma1307_set_default(component);
> > +		}
> > +		break;
>=20
> What's this for?  Usually any default setup would just be done through th=
e
> usual control interface.

Generally, the amplifier operates correctly with default settings.
Occasionally, when users want different output levels, we provide a binary =
file to adjust the settings.

Since the settings may vary depending on the speakers used and other extern=
al factors, and because these settings cannot be adjusted by the user, the =
purpose is to provide a configuration file upon request.



--_002_SL2P216MB233758C3649FAF0ACDCCB8898C872SL2P216MB2337KORP_
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: signature.asc
Content-Disposition: attachment; filename="signature.asc"; size=499;
	creation-date="Wed, 14 Aug 2024 05:54:18 GMT";
	modification-date="Wed, 14 Aug 2024 05:54:19 GMT"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBQUJDZ0FkRmlFRXJlWm9xbWRY
R0xXZjRwL3FKTmFMY2wxVWg5QUZBbWE3Y0FzQUNna1FKTmFMY2wxVQ0KaDlEeDJRZ0FoVnVmbHA2
UTZaMDRvYVNsb0xBcjIrUUJkM3ZWSkQ1QkNlK1AwQUxmU0ZuVng5Nk5FZHhIZFJjRA0KRzBuOUdU
bkw0bG51a1FGVjVGbTZCQXpsbm5TYjZ5TUlzUVFEOEJpT3RGei9WVVQzMDIzVUsrTXBhelpZeHhN
SQ0KU1NqMEMwSTQyUVBna2ZJdEgxUGpVMlBsV0hUVENpR1cvVFpTbGIyMlVoc3hMaWNOQS8zYk8r
YXN4MW9aR1pJTg0KYkdRbm5uYTNzVDFDdUNsYm9iV3ozRUoyb3ZBNlpLc0NnblZmaHcrOXc1NC9w
Y215SWtXYjVHU2JMY2RLbm90cw0KcTVET2E2c29ZbHplOVlrcUxSeWN3SndpMlhIY1FvYzI5NkEy
SzI1ZzNjOU5oZkVYYWxrZ2xPRUpMSThVNUN6Sw0KbHhaY1F0eGROM3JnSmpyRTVaZWd0VzNDRWNO
cUFRPT0NCj1UWng3DQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==

--_002_SL2P216MB233758C3649FAF0ACDCCB8898C872SL2P216MB2337KORP_--
