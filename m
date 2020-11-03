Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B2B2A4D8C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 18:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5D616A3;
	Tue,  3 Nov 2020 18:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5D616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604426026;
	bh=w0ITrQExRlfmyJu8eB+8Il9/6h/3yVcQcJcy5uNwK4M=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHy6w9TW6AGV2CcQ3g+U76KuskCPpleEkZ68hG8eNBKOC/gL0UPEPPEY6eYpum2l7
	 LBLWLFo1CDeXBD89ECh9oGfIV+sW0mlecqyzT6NinG1Qbd5ZE+OYYqhqev2MQwAykU
	 oErV/o6FsSXDZTiz5ryt1alDPkoRC3I2ToYx4IwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9774AF80272;
	Tue,  3 Nov 2020 18:52:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F294F80171; Tue,  3 Nov 2020 18:52:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A85F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 18:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A85F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="dvPB+2dC"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.b="Rqcv/vR6"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3Hh7xG004584; Tue, 3 Nov 2020 12:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=y/X9RFV5i/XaGurzYdRt5Wf/nDmxED4hbLvceFlbAhY=;
 b=dvPB+2dCSRIaTu85TrQAUizEJIUhXP3I1gS84iqUhhVkmcQ2cXLdXoYBkxD91DDQ3Mwi
 QMTQEfmNDTXNNz7Q/5K6U3baJdRAthb97e29JvLDtZJPVr6OWgjEluTSmFw1foVDXUZU
 jalg4JA2x97knkaXDWD1q+d4sBDmp3+8Br7UwKERXQ1SQ7irDkV/1kGBL0yi/XgRCq9N
 jd4cjtCk5n0Efk1lfZKK+JZblRQyMaNnAmbLgS6xj5G5rSfbHTrZSQZx35HzX0aqwPpO
 8n8vNvt661XEoJRgd5lY44HqW1HlaG9VVR49M+BqUuAtX1oQGXMcLalcmy3kXWNQRId3 wQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 34h38gkk0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2020 12:52:00 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A3HjqCN131316; Tue, 3 Nov 2020 12:51:59 -0500
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0b-00154901.pphosted.com with ESMTP id 34k9bgatdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 12:51:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBgHs5Vni1A1ns4vt3aZr+Ga+kkY+xVUdOVi25nJX+xmqiT1ZT+vEF7mOSBdWot4eIyS2ee1wBu3o+p7wcGJ7++7mjJAVBWCTxtDKL3+s5tiPkM0JZ0kwsDkdDwFWax5q91YKcQ855eIKQGQeoGhqq4Sfo1lBUPQTggaheoVnGdkts0dq9Q9YBkmsdAfpUEc5vKZqNEFDMk0OwFkFroK9vq+tJQ4Dsnn/i0ETLjMKcOR3HUb9wUxeOGNOpeVURQ7NQGvC+TcxypYeGSKY5Z4tYzDx+ln2HP9K8ArHUdFXIN3fa9u4V0isispXTKwasa3Xgf0RL6dsqPKKGCUTdCLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/X9RFV5i/XaGurzYdRt5Wf/nDmxED4hbLvceFlbAhY=;
 b=S4qEVr0vUPkqpZEdoWsU4ASqPUG/Zq9BAMQTi5gQLyiblUEL4cuGsRt6DUDwiUdWrtYg3SpoNnzcEKsZ6zGkMhK87aHtsn5PgOdxachNJt55mAUwroelJmm5sCFcO4oBpZj21xn72L/hKWfoyhgzjoTh3VzU1RdOzSxz5Kqp88iCxprccK4SoTc1cWCOqiCc67TlgHplkK6wEPCYDtkszGOulsds4eUNNj5BgL/YbOKU4DrNAQYuAUL/UeahWEtd5Qc1Z+fLwLznFM/SHn66CDsSnYWIB0CXaLPKQ5ycQ9HNwBdP52hPeTLaC/EOMv3jQj7JaH9qq7lRTQrcVMFLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/X9RFV5i/XaGurzYdRt5Wf/nDmxED4hbLvceFlbAhY=;
 b=Rqcv/vR6d8fUYmzoMwN75eB3DNdz3od4IsfA8U+29fUqyyJm0eTBC+v4xgST48K3NndIlAuAaMbGk3DZIXxinrK9u2irUqNioejYHk/2Opmw/HkLiJL6Fg3eUXnhkwHV7215+j8j51yjmD/VwuftkSUgvIqJCakcV0mTKLOBXW0=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB0923.namprd19.prod.outlook.com (2603:10b6:3:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 17:51:57 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 17:51:57 +0000
From: "Limonciello, Mario" <Mario.Limonciello@dell.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, "Yuan, Perry" <Perry.Yuan@dell.com>
Subject: RE: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Topic: [PATCH] ASoC: rt715:add Mic Mute LED control support
Thread-Index: AQHWseEjYgOvfJhc/UebM8naQzkVCam2YlCAgAAyV4CAABsq0A==
Date: Tue, 3 Nov 2020 17:51:57 +0000
Message-ID: <DM6PR19MB2636291E083E1843B0E0035CFA110@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
In-Reply-To: <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-11-03T17:51:51.7023762Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=ba2e31ec-2f80-405d-b00a-337bb358e52d;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da416816-ab46-4b0d-c50e-08d880212884
x-ms-traffictypediagnostic: DM5PR19MB0923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR19MB092348F262602E9AD6004EFDFA110@DM5PR19MB0923.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MsgHMR5rxVW40BDXiVWUkHfbF6Dj2D2UE2+bcs006+2TBRQ689BOHzT/RDM/bkRbrAzSOH2bllnWN2dVh/JWyxjTa25Z9bwihUOwPqdpMBiPQCXAZJI4qe+YEfa9CvUGuSXwsum4Nl2EeR8nfoDd7AMLuwQR5Jyd1r1ognaeYXtfxj+oMW6SW2E4m15VAd1bmDyBYKJZwtX9zN8+UV6zDCXQ83YYffH/ldk6Nuad6oco4YpmQqUT5kDTCt4lchWHQpDmxCg7MoQrYx/uVscM0VW5PvMWMQrJ8BAN2/pYmtRoQGEclCofBijY2ZGPO/aNWiLEVUnoNRfoUhhcXkAThihKMwd9+f4YGIx8ffVeUZ80Vu5AoVaFjAXRluvTf16GB0us99Jfi6gPLD8NsW3R7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2636.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(53546011)(83380400001)(33656002)(55016002)(2906002)(6506007)(4326008)(478600001)(186003)(8676002)(7696005)(8936002)(71200400001)(66476007)(66556008)(6636002)(76116006)(66946007)(110136005)(9686003)(316002)(86362001)(26005)(786003)(5660300002)(966005)(64756008)(66446008)(52536014)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ojav0AAlpeoWezU9R0qIkkHMaUYFa68ue40t7mVFyaXQJs0jK/EP96Kxt9oq5BZSOyn4wze+FWtOunXGHY/yEflbdpYEepKgSFe7IKQ8aYRIhHkPBTXze29OQyxVWbl4Xzj6SS/PB++V2dnGkAe80AFfrcdIys5H6x/ft3AHVH+Ybjfv/OC0StKF3yFVrzhJmbto3OmJpgQjVr3M+NaiHxgUE2n6i6+wHh7Rxrh5Z9h5vUi7LAVHMp8Ol2Jqi/0hCBw5D4hJpEuBR9JNcA67CN89/c4qngK6HyGcqTo1Kxc9W2QeoOzYrtbVV2TuydA/xytGPSTfkrZh3TXof+Om56R42PdvSY/OxPd5BwAaslB5HpI55Qvi0Co66vmCjSDEFOXv5Av8vx2D1iqc8MqiCZNBDR7psNqpayy59GK2FyT0PxBqMtLHy2JQV7rhi7EYJyoh0q7ecUiXdey1ICWE8wbUJmeMxDnucItvXaYvI7I604C6hEVpd22LI2Xd6vaQ+oVxYDq0TO3w9qPJQZJud7ZS/frlnDUR2UK545dBoJwBuHxd1bHG4XWbuLkOxLpzrqWR307LiiYoyWaF9SGUv9F/EPpWl0pDl/PqpJtyOH2mofuPV9uzU8X61NbJq6Dll2L7mlEMDsI6GHwc71L8nA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da416816-ab46-4b0d-c50e-08d880212884
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 17:51:57.3461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WavswQe1Sx2rOkNO2qHeniHcXQk5jQKy7U2Aer+vjODESIfoF8t48KzJYznzphvv7EkaOZ6SEvnlxn4dJDN14f8OECKmSl++UZ3iXan4r/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB0923
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-03_08:2020-11-03,
 2020-11-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030120
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030120
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

> -----Original Message-----
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: Tuesday, November 3, 2020 10:13
> To: Mark Brown; Yuan, Perry
> Cc: oder_chiou@realtek.com; alsa-devel@alsa-project.org; lgirdwood@gmail.=
com;
> Limonciello, Mario; linux-kernel@vger.kernel.org; tiwai@suse.com
> Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Somehow this patch was filtered by alsa-devel servers?
>=20
> On 11/3/20 7:12 AM, Mark Brown wrote:
> > On Tue, Nov 03, 2020 at 04:58:59AM -0800, Perry Yuan wrote:
> >> From: perry_yuan <perry_yuan@dell.com>
> >>
> >> Some new Dell system is going to support audio internal micphone
> >> privacy setting from hardware level with micmute led state changing
> >>
> >> This patch allow to change micmute led state through this micphone
> >> led control interface like hda_generic provided.
> >
> > If this is useful it should be done at the subsystem level rather than
> > open coded in a specific CODEC driver, however I don't undersand why it
> > is.
> >
> >> +static int rt715_micmute_led_mode_put(struct snd_kcontrol *kcontrol,
> >> +      struct snd_ctl_elem_value *ucontrol)
> >> +{
> >> +    struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> >> +    struct rt715_priv *rt715 =3D snd_soc_component_get_drvdata(compon=
ent);
> >> +    int led_mode =3D ucontrol->value.integer.value[0];
> >> +
> >> +    rt715->micmute_led =3D led_mode;
> >> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
> >> +    ledtrig_audio_set(LED_AUDIO_MICMUTE,
> >> +               rt715->micmute_led ? LED_ON : LED_OFF);
> >> +#endif
> >> +  return 0;
> >> +}
> >
> > This is just adding a userspace API to set a LED via the standard LED
> > APIs.  Since the LED subsystem already has a perfectly good userspace
> > API why not use that?  There is no visible value in this being in the
> > sound subsystem.
>=20
> I also don't quite follow. This looks as inspired from HDaudio code, but
> with a lot of simplifications.
>=20
> If the intent was that when userspace decides to mute the LED is turned
> on, wouldn't it be enough to just track the state of a 'capture switch'
> responsible for mute, i.e. when the capture Switch is 'off' the LED is
> on. I don't see the point of having a new control, you would be adding
> more work for PulseAudio/UCM whereas connecting the capture switch to a
> led comes with zero work in userspace. See e.g. how the mute mic LED was
> handled in the SOF code handling DMICs, we didn't add a new control but
> turned the LED in the switch .put callback, see
>=20
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/control.c#L1=
8
>=20
> https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/control.c#L1=
53
>=20
> Actually thinking more about it, having two controls for 'mute LED' and
> 'capture switch' could lead to inconsistent states where the LED is on
> without mute being activated. we should really bolt the LED activation
> to the capture switch, that way the mute and LED states are aligned.
>=20

After giving it some thought I agree.  The UCM change that was opened
here https://github.com/alsa-project/alsa-ucm-conf/pull/60 wouldn't
be necessary at all if you just track capture switch directly like SOF does=
.

