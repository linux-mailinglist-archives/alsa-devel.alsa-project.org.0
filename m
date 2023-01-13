Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908966AFBD
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:50:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45AB1ACD5;
	Sun, 15 Jan 2023 08:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45AB1ACD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769003;
	bh=s6c7cwhcwWmGTasQhG8iGf+AHW/DX1awLgqmT01kcZo=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=drb6TSKAEVqXw2k1DqgsgAO69TcwTMDaPh/MRY56imTKsUJrBxSbPA36NHdeMiOgH
	 KSzuFbZ80FA1VRA5rKLYPXdTErK/dQ2hmYjunTRtikQj0nIKw1QdqDKBfWotGno9di
	 7xWbg3VWxxZlWsIrVKiIT7AALrSpN5yv0CLgZgSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0DBF801EB;
	Sun, 15 Jan 2023 08:48:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 025FFF80548; Fri, 13 Jan 2023 06:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01on2073.outbound.protection.outlook.com [40.107.239.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D18CFF8030F
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 06:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D18CFF8030F
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzFrbNJ7hBfVMfMug+SOAumy2NAbJXJwZZaUpEJnTgz8TShbQRamdOG8MPSxgnQ0dWUKjI8IJj9twXgBVxPLUb0rmD79RQOYip+BSDzxJpbax0oshsVZK5ZZ85xnQKNHdv6/K+r7rSV7h428faNdOYlgA0IaGbkAaz2vx2eNkdhiY2P5B5vk0OEzWfcm68XLvHQQQHy63fwQT4uUp3I2FoAow6894/CQzNSL1G2oHLddcIdJRV838o8M12YZr5NyaRQ+uDa2sUuKOc1/3c7E+FkNH6JGKbOrJPbuPDj7ZZ7Lm/wbQr6/mkDH5pJdMkR669U7+kIwiQUtI7v7FJyDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1vmbFi3uJ3P6X5K5hRFZa08ZJ37gDPe5lQelIg3pb4=;
 b=UKX5yKqraayAtxx6659TuGHStGrkIK331loktyCxiX1NTuZyiHP4kpKk6ehEe/9tuFhBmzlKD+2Z+xx3ia9520I6TGAyOD+913i5suEgCPsNkMxoTnqtcYQ/XSwD9DGtXxl+TR6LLpVEEr0qwW6GX7PV6OGzudS2hbLTXYVtvoTVVSoNp6MbbfHf2I5xigl8t5zbSprcEyTStVrfm1ObiuwkNLREhGKAJJumqXEwx9/NBHcS3y5/YcK9pC3KVxpxZ1/A6KufIwULibig5l+23BXgUWgJBmPzlfSj8U0qn7qiad8tXc/aGvcXya6eH5wtRVy7iNWX1NM3iSEIf/MzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:31::9)
 by PN3PR01MB6459.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:86::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Fri, 13 Jan
 2023 05:50:30 +0000
Received: from MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e762:50f5:c91e:7e61]) by MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e762:50f5:c91e:7e61%4]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 05:50:30 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Daniel Baluta <daniel.baluta@gmail.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
Thread-Topic: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
Thread-Index: AQHZJYqW0X9zj+hpQkK22Ny+RkFTBa6Y7JCAgAACEuaAAC3aAIACvW6s
Date: Fri, 13 Jan 2023 05:50:30 +0000
Message-ID: <MA0PR01MB7145B5094B0E3FB35764DE9FFFC29@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
References: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
 <MA0PR01MB71451A4A70DBD85680E90AE0FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZDowp=-Cqvy=hJzQDDN_+cEUS7Pj-GJ-0oAhqq=N2STWw@mail.gmail.com>
In-Reply-To: <CAEnQRZDowp=-Cqvy=hJzQDDN_+cEUS7Pj-GJ-0oAhqq=N2STWw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB7145:EE_|PN3PR01MB6459:EE_
x-ms-office365-filtering-correlation-id: 2724517c-7fc3-42e2-14b5-08daf52a1478
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FqlajtkW/OD20ZQ0SUmHPzpNP40adYCX1uLuL2rjflsA9Jt//bdnfMvixHh19cHg1BD7mFHXJZrK1x82SUYlrlUeKM7M9hCxQxhL9oGKii6gMrPdBtkvcBCInQVUQO4EW2Mdsogv7CgJnn/1taN1UdGrwXkW6tJi05jsrzIoPhKKP6uUVzswfNWdiD+b69VDwM0VIHkKG9a3fHRWHhgoOtnxQxmYeJMc9MhpADcfICt5+ouA3evb8UOTK59e/7tqU7U/lXWCpvM8Xx/jxnyr+Csn73Pl+ylb/m/YfJYZZGCpW6MDD62/xWuKfH2paj6X+EWWo6CKCmyH++HJJMiDGloBLvTW9TMxXCyjMM/xJY3U1tO5RENiogO7WU2VtOivlZSk2viaN1T5ToJFQSBMWuAIHThw0vxwU5spKIb8fGzvBsuP2Tk1XdRyWkeagQ2D/DRuHmL4iaKUGwGuKcIo/iKupkgFLRpmJT6z8MTOrwr4egRLlXztifIGgWTeniI5ptboF8GOckBFxb35zg2/RH/yOwQ72CfLZDMxzvNcx+GEPmIyHZ+Phz+ttw72Mx3poqSWKrmDJSWq8VA0kQGxi76CL6hwi+XT02ZaJcRpwWADrk3JTaQy2v1F4IhOPeXsHF7ls2vyg8CMvwDgge8eg8/1UdArUXJx1pLWTGJ/oULqPoZIfDjKqsc0nf93rN4fy6c08KyEyOeX9919kiVUpttxGcYHdkm0vspVv4accQE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39830400003)(396003)(366004)(346002)(136003)(451199015)(55236004)(53546011)(6506007)(122000001)(38100700002)(2906002)(38070700005)(7416002)(33656002)(9686003)(5660300002)(71200400001)(7696005)(186003)(26005)(478600001)(316002)(7406005)(44832011)(86362001)(52536014)(8936002)(83380400001)(55016003)(91956017)(66946007)(41300700001)(54906003)(66556008)(66476007)(64756008)(8676002)(4326008)(66446008)(110136005)(76116006)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?r6kQj5ooKApSso7HW5SdSx9LG+z1ytqttMplsjKCVaLCEunam5Pgdg4T++?=
 =?iso-8859-1?Q?u/qw2JSDF7d22OHPy3WuO3gO4rBuflLj79qgt0/QMMXDGiKum4EynRipaB?=
 =?iso-8859-1?Q?mQaURo2vcon8wn2d5HIrjE0dTsrHa0ugUMBU4NiPLep9aUzPhhzfj8jhur?=
 =?iso-8859-1?Q?1Bp+/7HkFIhvdkBOs5FOf4+Wcvs6YweaN8ibald+vqEG+1nV88eqVFWPiM?=
 =?iso-8859-1?Q?Xk1IvD8ijShv5ggnqelBFa+e7x7hkbPogj+Au/1VqV5CBNJXgrVzhW9jcE?=
 =?iso-8859-1?Q?yBQo+TMWwGQCnwvR4qsNFD9NvDpg6RK7rbzb9Cwrl3Cgj/So5+1hdeF+3H?=
 =?iso-8859-1?Q?BSj+dwjhhzbBeEFxFNO1TK4udH+NGFiEknxetQ6YCJfvi8eQN6NVzdxS2K?=
 =?iso-8859-1?Q?1xJvUJ6/jZmLBBTVuvN+0FE1S7aGvovUU3ZiwE8hDIUyx0/BdMDn/UoSKV?=
 =?iso-8859-1?Q?2Hrt1fE61NO7NG8H8oovzMEo9bpEYuMDVhGz7vcmNsE7bua0BsvMUZEDxE?=
 =?iso-8859-1?Q?HGnScxSalLp2z2RpU0QCoQvJhc3oc8I7PLb72Mm5xFx6pk3DCgGCr6CKzs?=
 =?iso-8859-1?Q?5ou4X8ghcUOv+fnCbwJ6lbcj12zHT0FjU/Mk75Ly46CvNNzAiyc5iNtvLi?=
 =?iso-8859-1?Q?+OcLYfwY9yVl5QFegz/iWV0G2FCwxNC9II3uWf83BFZWlYqDwtB12HdaQg?=
 =?iso-8859-1?Q?95V02HhrKxe+KF5CN5VFfjncVcoMcQuzZWTDUlyw6BtMFmr1QcKXLhaxLJ?=
 =?iso-8859-1?Q?pFvloUEOaQ0THhtaRPIFDhTFOM+/IZO96pTg5sp300BJPbtg280TcLcoSF?=
 =?iso-8859-1?Q?Xied6wyp3SB+rIqu++4L+b3l+L95vNpEL3QyhT5KKDR7DdL2lMYtkZua/s?=
 =?iso-8859-1?Q?9GpY3hd7cd6cpp4FrhpTBvtMtqe/JYK5C4dRIaGYmGbcvOi2W1j1wR2xFn?=
 =?iso-8859-1?Q?clZo0VCJ2uWPD39uincEjCJEpLNA6ahWU8l5dYH2c9c+vThvoKsXez2J9c?=
 =?iso-8859-1?Q?N6aTbafXyOtHTgtojIwBa8VV5jDKoKtcwyM/0D2aifawcUSmgCLBykL3rS?=
 =?iso-8859-1?Q?mQ/lO3JA9qDBGwWJIOXIjyLWmhOd08iosS48FgHfI5swW12m4Hhk75UAEX?=
 =?iso-8859-1?Q?aeZIIJ0gAWIUGC249YwMCfiQk/80lm8TskGT6KG4rpPFSep9ktKx2sULml?=
 =?iso-8859-1?Q?3EKGCQSGaTS3vASYsKukQZ9A6aBYl7qwdrd3bQtZwQoIUZ291dkPw9Z03D?=
 =?iso-8859-1?Q?snewCPEiAKJ4HZ4LM7nCf+36m0Pn//Jy0Eiuiazeq/rT4opY42DEghoOAX?=
 =?iso-8859-1?Q?trX8SOGj2vOMKU+2E/NtfxZACGdVyjrT5Fgr4teWdmvV5gxbF9qCuvc/PJ?=
 =?iso-8859-1?Q?8pOUqiCO0nSqeM5oK47opz7eEsWgMJ2uQCNvsu6ItaBohXc820urnCG5f3?=
 =?iso-8859-1?Q?8wYMGb2ut09gWpYcF3TQC/TGWTV66rvhtWl+yldTp/zy/9B2kaTXeXMvHH?=
 =?iso-8859-1?Q?knkj3bnCxqNIaEgPtBPK8+0f2kK3a7OVSE/Oo+QXmGpC/Hh7DiFVsVwKB9?=
 =?iso-8859-1?Q?wy+0rIbTHq3K1LS5v4jx9eO4FLPT07BBQUOT0rpc20fYkN2xSrC8MGpoje?=
 =?iso-8859-1?Q?33gFJJD610HhDV4+j/Ce6l5gfiHnVHE0Snwpn2UuxRpQx0QlstHIaBJGJN?=
 =?iso-8859-1?Q?3COeEOaPgbvaDP6CJ5Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2724517c-7fc3-42e2-14b5-08daf52a1478
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 05:50:30.6879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /jkxlovXPo3hf3j0FM+nBojFumqVGp15cFdJY2TUS+6xTOVX+ZLXqK68HmmRqoVJH+ot5TMqdYCS2zeJwwBCSYj6wG91QGNWhaBMi6bPeVH9yQkD8lRt/k+G2Za1wboo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6459
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "Markus.Niebel@ew.tq-group.com" <Markus.Niebel@ew.tq-group.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tommaso.merciai@amarulasolutions.com" <tommaso.merciai@amarulasolutions.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "ryan.lee.analog@gmail.com" <ryan.lee.analog@gmail.com>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From d2001cdbc2fda3345af307b4cf3d0f2e53d80c35 Mon Sep 17 00:00:00 2001=0A=
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=0A=
Date: Fri, 13 Jan 2023 11:01:22 +0530=0A=
Subject: [PATCH] Add dts to support MAX98090/91 with i.MX8MM-evk=0A=
=0A=
- Add sound-max98090 node to support external codec MAX98090/91=0A=
- Use i2c3 for i2c communicate with codec=0A=
- Use sai5 for i2s communication=0A=
=0A=
Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>=
=0A=
=0A=
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts b/arc=
h/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts=0A=
new file mode 100644=0A=
index 000000000000..d053c586514a=0A=
--- /dev/null=0A=
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk-max98090-91.dts=0A=
@@ -0,0 +1,65 @@=0A=
+#include "imx8mm-evk.dtsi"=0A=
+=0A=
+/ {=0A=
+	sound-max98090 {=0A=
+		compatible =3D "simple-audio-card";=0A=
+		simple-audio-card,name =3D "max98090-audio";=0A=
+		simple-audio-card,format =3D "i2s";=0A=
+		simple-audio-card,frame-master =3D <&cpudai>;=0A=
+		simple-audio-card,bitclock-master =3D <&cpudai>;=0A=
+		simple-audio-card,widgets =3D "Speakers", "Speakers";=0A=
+		simple-audio-card,routing =3D=0A=
+				"Speakers", "SPKR",=0A=
+				"Speakers", "SPKL",=0A=
+				"IN1", "MICBIAS",=0A=
+				"MIC1","IN1",=0A=
+				"MIC2","IN1";=0A=
+=0A=
+		cpudai: simple-audio-card,cpu {=0A=
+			sound-dai =3D <&sai5>;=0A=
+			dai-tdm-slot-num =3D <2>;=0A=
+			dai-tdm-slot-width =3D <32>;=0A=
+		};=0A=
+=0A=
+		simple-audio-card,codec {=0A=
+			sound-dai =3D <&max98090>;=0A=
+			clocks =3D <&clk IMX8MM_CLK_SAI5_ROOT>;=0A=
+		};=0A=
+	};=0A=
+}=0A=
+=0A=
+&i2c3 {=0A=
+	max98090: audio-codec@10 {=0A=
+		compatible =3D "maxim,max98090","maxim,max98091";=0A=
+		#sound-dai-ceddlls =3D <0>;=0A=
+		reg =3D <0x10>;=0A=
+		clocks =3D <&clk IMX8MM_CLK_SAI5_ROOT>;=0A=
+		clock-names =3D "mclk";=0A=
+	};=0A=
+}=0A=
+=0A=
+&sai5 {=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&pinctrl_sai5>;=0A=
+	assigned-clocks =3D <&clk IMX8MM_CLK_SAI5>;=0A=
+	assigned-clock-parents =3D <&clk IMX8MM_AUDIO_PLL1_OUT>;=0A=
+	assigned-clock-rates =3D <24576000>;=0A=
+	clocks =3D <&clk IMX8MM_CLK_SAI5_IPG>, <&clk IMX8MM_CLK_DUMMY>,=0A=
+		<&clk IMX8MM_CLK_SAI5_ROOT>, <&clk IMX8MM_CLK_DUMMY>,=0A=
+		<&clk IMX8MM_CLK_DUMMY>, <&clk IMX8MM_AUDIO_PLL1_OUT>,=0A=
+		<&clk IMX8MM_AUDIO_PLL2_OUT>;=0A=
+	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll1=
1k";=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&iomuxc {=0A=
+	pinctrl_sai5: sai5grp {=0A=
+		fsl,pins =3D <=0A=
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK        0xd6=0A=
+			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK     0xd6=0A=
+			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC     0xd6=0A=
+			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0    0xd6=0A=
+			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0    0xd6=0A=
+		>;=0A=
+	}=0A=
+}=0A=
-- =0A=
2.25.1=0A=
________________________________________=0A=
From: Daniel Baluta <daniel.baluta@gmail.com>=0A=
Sent: Wednesday, January 11, 2023 5:26 PM=0A=
To: Hardevsinh Palaniya; Daniel Baluta=0A=
Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; shawnguo@kernel.=
org; s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; lin=
ux-imx@nxp.com; lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz; ti=
wai@suse.com; peng.fan@nxp.com; m.felsch@pengutronix.de; shengjiu.wang@nxp.=
com; Markus.Niebel@ew.tq-group.com; hongxing.zhu@nxp.com; tommaso.merciai@a=
marulasolutions.com; jun.li@nxp.com; ckeepax@opensource.cirrus.com; rf@open=
source.cirrus.com; povik+lin@cutebit.org; pierre-louis.bossart@linux.intel.=
com; james.schulman@cirrus.com; flatmax@flatmax.com; srinivas.kandagatla@li=
naro.org; ryan.lee.analog@gmail.com; devicetree@vger.kernel.org; linux-arm-=
kernel@lists.infradead.org; linux-kernel@vger.kernel.org; alsa-devel@alsa-p=
roject.org=0A=
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk=0A=
=0A=
=0A=
 > I have added support for the external codec MAX98091 with I.MX8MM-EVK.=
=0A=
=0A=
Please fix your email client to start sending email in text format only.=0A=
=0A=
Now, going back to the matter at hand.=0A=
=0A=
I do think that for an external codec we should find a smarter way of enabl=
ing it.=0A=
=0A=
What would happen if you enable MAX codec in the dts but expander board is =
not plugged in?=0A=
=0A=
Maybe create a separate dts which includes imx8mm-evk.dtsi?=0A=
=0A=
=0A=
