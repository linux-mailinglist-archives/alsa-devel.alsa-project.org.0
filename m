Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FBDA74EC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 22:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF41A166E;
	Tue,  3 Sep 2019 22:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF41A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567542942;
	bh=F7Drmxvt8ZWtQgiPoHRDB8rKk/rMG5gKn5g5g6SrjDI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmwUfe55LRvOCkDVN612q3kzK9NJXJZPZzpfdlIa2Q8HHTPhCt4M+OqqKx59qOZXw
	 Gaw1L7LuVLu4U4L8glSgr4cmci/WM1Jcg0+ButOyoxwVXAzXP0kNr0vvfa8lyHBixo
	 pycyFCgDX29S7KUURr+MFHYoTBvSd2qbEmhxwbec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC01F8045F;
	Tue,  3 Sep 2019 22:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2B81F8045F; Tue,  3 Sep 2019 22:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092071045.outbound.protection.outlook.com [40.92.71.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12DBAF80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 22:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12DBAF80392
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sxtmrce382C7Nzvz/x2if4akRMu8Aso5VbF7Lmhn+4AYYNVUB+y5tML4VFb03zFUNS5eMu3BekLXVux7G2Yhs5T4HtA4lYNHB6Y5H5QqvFBfPtFZdwGfX/olcMWd/cvb9qCHlYYCs2oqTLjvqo//q0/pKoyeHbLuyO4MVJgcQLzdeN4lXoPA6jYOw0Vtn0yZSkpyDREYGRgoxVScE9wBFgSLf+EZh1CNUqrJ1pdDtg+smR0MJbEYX2XsKzT4mE3ND7rxqQ49P1KeIg/4GLlNTFrDSZzz3YmwBsrAGyzwgfPSt1thHTz5kt0FhUJO++WUlz7uO/SjSykhPGTV9I13WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vgudMTu+DzBbrHIdo/PAUYeHSgztm9UT1pB9ZHTeaA=;
 b=imd2rhaBj+N493R4QZPOOLqdiLw0TmAoCRr2o2Y2vsMWATjZVUjldurPcas1Nmp/YLiG4ZTf8+OGDO2NrgH5N/7sUSv7PZUoy1XWYrtBiuJczTWh6X3VotHIRH9SqGuljAH5Mnh1O+pZy5BoKi4Xfm8U33Ftk2UnCY1pDOvTE8YMKNJvumThMeWW5v83Fbai50NIvSOzC3IWPlgm7DsybEtD9eFTuUK8Kb75MZ0wS2Eo4oqp/Supg1JWFCeQQ62120FQN2DjpiDQ7XwYR5FlYP5R7NdMI93MB5PpsY03XUbhx917K/gUvyZnslSb7g/arKornP4fQ+LWkU57SJuVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (10.152.20.53) by DB5EUR03HT241.eop-EUR03.prod.protection.outlook.com
 (10.152.21.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Tue, 3 Sep
 2019 20:33:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.52) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 20:33:48 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181%5]) with mapi id 15.20.2241.014; Tue, 3 Sep 2019
 20:33:46 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: =?Windows-1252?Q?Jernej_=8Akrabec?= <jernej.skrabec@siol.net>, Neil
 Armstrong <narmstrong@baylibre.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Thread-Topic: [PATCH] drm: bridge/dw_hdmi: add audio sample channel status
 setting
Thread-Index: AQHVYhuf7WuMEFP/bkanUBsGMqjnp6cZtq2AgACIEYCAAAI2AIAAKJWA
Date: Tue, 3 Sep 2019 20:33:46 +0000
Message-ID: <HE1PR06MB40112AD52DAF0E837F23B441ACB90@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20190903055103.134764-1-cychiang@chromium.org>
 <e1c3483c-baa6-c726-e547-fadf40d259f4@baylibre.com>
 <d8a80ba5-dd2b-f84d-bbfc-9dd5ccbc26e9@baylibre.com>
 <19353031.SdOy5F5fmg@jernej-laptop>
In-Reply-To: <19353031.SdOy5F5fmg@jernej-laptop>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR09CA0066.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::34) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:AF10315B530FE229F9A374172C0658089A8AA56BE7ABC6CA9449045236CA437D;
 UpperCasedChecksum:51ADB11BF299428844BA49B9481ED552C8BD419DED03D02B8B0DE302B2F8CE6B;
 SizeAsReceived:8834; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [bTm1tx/PMyEUqdpgzrcGqZvVyVOfVuS7]
x-microsoft-original-message-id: <a55d0984-a1a2-706f-8af5-c7922524c518@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:DB5EUR03HT241; 
x-ms-traffictypediagnostic: DB5EUR03HT241:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: 8TA9+BaXXYlc8dR3QA3CXw4ARIh3bav/y+Z7arww+94zALge8kokweb9M/i7F+aj8pgA653Rkv1hpOcM2PPUlPrGIIMIT9UoBwvgxVtBgDlQnAdArArMe6/m8lF1GFon9E7dQN3XxwrDUiRmO93DOz8vKSjns2ZSbBzBau4udq/VbM0Q6yjLXseo5lWLSCD8
x-ms-exchange-transport-forked: True
Content-ID: <5F902911163D124685C903F119FA8196@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eea3de-525e-45d6-e22f-08d730ae04f0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:33:46.4790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT241
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "zhengxing@rock-chips.com" <zhengxing@rock-chips.com>,
 "cain.cai@rock-chips.com" <cain.cai@rock-chips.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "eddie.cai@rock-chips.com" <eddie.cai@rock-chips.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Yakir Yang <ykk@rock-chips.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dgreid@chromium.org" <dgreid@chromium.org>,
 "kuankuan.y@gmail.com" <kuankuan.y@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] drm: bridge/dw_hdmi: add audio sample
 channel status setting
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-09-03 20:08, Jernej =8Akrabec wrote:
> Hi!
>
> Dne torek, 03. september 2019 ob 20:00:33 CEST je Neil Armstrong napisal(=
a):
>> Hi,
>>
>> Le 03/09/2019 =E0 11:53, Neil Armstrong a =E9crit :
>>> Hi,
>>>
>>> On 03/09/2019 07:51, Cheng-Yi Chiang wrote:
>>>> From: Yakir Yang <ykk@rock-chips.com>
>>>>
>>>> When transmitting IEC60985 linear PCM audio, we configure the
>>>> Audio Sample Channel Status information of all the channel
>>>> status bits in the IEC60958 frame.
>>>> Refer to 60958-3 page 10 for frequency, original frequency, and
>>>> wordlength setting.
>>>>
>>>> This fix the issue that audio does not come out on some monitors
>>>> (e.g. LG 22CV241)
>>>>
>>>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>>>> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
>>>> ---
>>>>
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++++
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h | 20 ++++++++
>>>>  2 files changed, 79 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
>>>> bd65d0479683..34d46e25d610 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>> @@ -582,6 +582,63 @@ static unsigned int hdmi_compute_n(unsigned int
>>>> freq, unsigned long pixel_clk)>> =

>>>>  	return n;
>>>>  =

>>>>  }
>>>>
>>>> +static void hdmi_set_schnl(struct dw_hdmi *hdmi)
>>>> +{
>>>> +	u8 aud_schnl_samplerate;
>>>> +	u8 aud_schnl_8;
>>>> +
>>>> +	/* These registers are on RK3288 using version 2.0a. */
>>>> +	if (hdmi->version !=3D 0x200a)
>>>> +		return;
>>> Are these limited to the 2.0a version *in* RK3288, or 2.0a version on a=
ll
>>> SoCs ?
>> After investigations, Amlogic sets these registers on their 2.0a version
>> aswell, and Jernej (added in Cc) reported me Allwinner sets them on their
>> < 2.0a and > 2.0a IPs versions.
>>
>> Can you check on the Rockchip IP versions in RK3399 ?
>>
>> For reference, the HDMI 1.4a IP version allwinner setups is:
>> https://github.com/Allwinner-Homlet/H3-BSP4.4-linux/blob/master/drivers/=
vide
>> o/fbdev/sunxi/disp2/hdmi/hdmi_bsp_sun8iw7.c#L531-L539 (registers a
>> "scrambled" but a custom bit can reset to the original mapping, 0x1066 .=
..
>> 0x106f)
> For easier reading, here is similar, but annotated version: http://ix.io/=
1Ub6
> Check function bsp_hdmi_audio().
>
> Unless there is a special reason, you can just remove that check.

Agree, this check should not be needed, AUDSCHNLS7 used to be configured in=
 my old
multi-channel patches that have seen lot of testing on Amlogic, Allwinner a=
nd Rockchip SoCs.

>
> Best regards,
> Jernej
>
>> Neil
>>
>>>> +
>>>> +	switch (hdmi->sample_rate) {
>>>> +	case 32000:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_32K;
>>>> +		break;
>>>> +	case 44100:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_44K1;
>>>> +		break;
>>>> +	case 48000:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_48K;
>>>> +		break;
>>>> +	case 88200:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_88K2;
>>>> +		break;
>>>> +	case 96000:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_96K;
>>>> +		break;
>>>> +	case 176400:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_176K4;
>>>> +		break;
>>>> +	case 192000:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_192K;
>>>> +		break;
>>>> +	case 768000:
>>>> +		aud_schnl_samplerate =3D HDMI_FC_AUDSCHNLS7_SMPRATE_768K;
>>>> +		break;
>>>> +	default:
>>>> +		dev_warn(hdmi->dev, "Unsupported audio sample rate (%u)\n",
>>>> +			 hdmi->sample_rate);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	/* set channel status register */
>>>> +	hdmi_modb(hdmi, aud_schnl_samplerate, HDMI_FC_AUDSCHNLS7_SMPRATE_MAS=
K,
>>>> +		  HDMI_FC_AUDSCHNLS7);
>>>> +
>>>> +	/*
>>>> +	 * Set original frequency to be the same as frequency.
>>>> +	 * Use one-complement value as stated in IEC60958-3 page 13.
>>>> +	 */
>>>> +	aud_schnl_8 =3D (~aud_schnl_samplerate) <<
>>>> +			HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_OFFSET;
>>>> +
>>>> +	/* This means word length is 16 bit. Refer to IEC60958-3 page 12. */
>>>> +	aud_schnl_8 |=3D 2 << HDMI_FC_AUDSCHNLS8_WORDLEGNTH_OFFSET;

This looks wrong, user can use 16 and 24 bit wide audio streams.

>>>> +
>>>> +	hdmi_writeb(hdmi, aud_schnl_8, HDMI_FC_AUDSCHNLS8);
>>>> +}
>>>> +
>>>>
>>>>  static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
>>>>  =

>>>>  	unsigned long pixel_clk, unsigned int sample_rate)
>>>>  =

>>>>  {
>>>>
>>>> @@ -620,6 +677,8 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi
>>>> *hdmi,>> =

>>>>  	hdmi->audio_cts =3D cts;
>>>>  	hdmi_set_cts_n(hdmi, cts, hdmi->audio_enable ? n : 0);
>>>>  	spin_unlock_irq(&hdmi->audio_lock);
>>>>
>>>> +
>>>> +	hdmi_set_schnl(hdmi);

I will suggest this function is called from or merged with dw_hdmi_set_samp=
le_rate().
Similar to how AUDSCONF and AUDICONF0 is configured from dw_hdmi_set_channe=
l_count().

Regards,
Jonas

>>>>
>>>>  }
>>>>  =

>>>>  static void hdmi_init_clk_regenerator(struct dw_hdmi *hdmi)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h index
>>>> 6988f12d89d9..619ebc1c8354 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
>>>> @@ -158,6 +158,17 @@
>>>>
>>>>  #define HDMI_FC_SPDDEVICEINF                    0x1062
>>>>  #define HDMI_FC_AUDSCONF                        0x1063
>>>>  #define HDMI_FC_AUDSSTAT                        0x1064
>>>>
>>>> +#define HDMI_FC_AUDSV                           0x1065
>>>> +#define HDMI_FC_AUDSU                           0x1066
>>>> +#define HDMI_FC_AUDSCHNLS0                      0x1067
>>>> +#define HDMI_FC_AUDSCHNLS1                      0x1068
>>>> +#define HDMI_FC_AUDSCHNLS2                      0x1069
>>>> +#define HDMI_FC_AUDSCHNLS3                      0x106a
>>>> +#define HDMI_FC_AUDSCHNLS4                      0x106b
>>>> +#define HDMI_FC_AUDSCHNLS5                      0x106c
>>>> +#define HDMI_FC_AUDSCHNLS6                      0x106d
>>>> +#define HDMI_FC_AUDSCHNLS7                      0x106e
>>>> +#define HDMI_FC_AUDSCHNLS8                      0x106f
>>>>
>>>>  #define HDMI_FC_DATACH0FILL                     0x1070
>>>>  #define HDMI_FC_DATACH1FILL                     0x1071
>>>>  #define HDMI_FC_DATACH2FILL                     0x1072
>>>>
>>>> @@ -706,6 +717,15 @@ enum {
>>>>
>>>>  /* HDMI_FC_AUDSCHNLS7 field values */
>>>>  =

>>>>  	HDMI_FC_AUDSCHNLS7_ACCURACY_OFFSET =3D 4,
>>>>  	HDMI_FC_AUDSCHNLS7_ACCURACY_MASK =3D 0x30,
>>>>
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_MASK =3D 0x0f,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_192K =3D 0xe,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_176K4 =3D 0xc,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_96K =3D 0xa,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_768K =3D 0x9,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_88K2 =3D 0x8,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_32K =3D 0x3,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_48K =3D 0x2,
>>>> +	HDMI_FC_AUDSCHNLS7_SMPRATE_44K1 =3D 0x0,
>>>>
>>>>  /* HDMI_FC_AUDSCHNLS8 field values */
>>>>  =

>>>>  	HDMI_FC_AUDSCHNLS8_ORIGSAMPFREQ_MASK =3D 0xf0,
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
