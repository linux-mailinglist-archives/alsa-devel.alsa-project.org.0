Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561A9343CB2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 10:27:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8CB15E0;
	Mon, 22 Mar 2021 10:26:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8CB15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616405231;
	bh=L3ysmrFTplfyWeUOTEeEzB/FlLNB1TOp9PrW29BHba0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZtu4jwnISnlObqQJ8FdJmlgJi6S4ZbR+33+hwAGoi3DImNCDUVHvHbH9tbvcZyFy
	 a9VnL3V0VS+yAZG1wNn1gSv2NuXPQRgUZ2XsCseDgJ88sSVsn1oMPP/KWAD4+i9Ovq
	 u9Ns7rf7uqRWeiWn1EVPAb7q7Z3yANqKy9yXj/SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE7DF801D5;
	Mon, 22 Mar 2021 10:25:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08629F8016B; Mon, 22 Mar 2021 10:25:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C39EBF8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 10:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C39EBF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com
 header.b="ExXdhL6Q"
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M9IIAM013460; Mon, 22 Mar 2021 05:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=XnIyJjJYinS7RTmri1/UR6PRUw9V+9To3VInJf6rF2M=;
 b=ExXdhL6QGI3VrahzhzX9WllgXQBHitbkelZGQu4bK/42d3SDqqpkPCtW2lgZ0X3AeJ8s
 xgI2kcZs4CAWnpAcrBzB7hJ4MamSQ7z/G1sVL9mFdQLvFkA9VsjiP0W4L5qpNhmLbVyF
 PDaCeIhjXEWjvaMQ6sp3m76OzaRDNjEDmyhL9SoxzNA7TRP1P7wXZqoLFq+EN9iMMncz
 wWquigSqUCjQtFDlUm06Plr4hDIbsZNwvbMl2aNtmEtRyWfWFqVKEZCYDspJYEyRTrtM
 vXk8J8ohyME/ruE6DDcilEAsSQAagc11Rl9opP1v65bpLYm07w6tbqIV0HWRwgbnVwLn xQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0a-00154904.pphosted.com with ESMTP id 37dcch4826-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 05:25:28 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12M7b8Tj056901; Mon, 22 Mar 2021 05:25:28 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0a-00154901.pphosted.com with ESMTP id 37dxq2kp1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Mar 2021 05:25:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyUrWhco2lg55N/kj/GfJg+QD8OJlB0mEc4HblmR73sqSv7nvZstWOYbfX5Qrmu3fJDUsQ6D2pHifO/6jyHM3aAytY29rWFfaopWYYVRtB/+WHWVrMlHeVOuY7WBXkEQTHVT4lwioyStVLf9/xtJXvOp60Y1JTIdyTD6bNkPOEd4rg4BVLuCsIpe6ZWB5yqaI3EwOQjIyG7DLyCARQlWA0qlTjL2/OlEstx9fbyJyB1sOZjOa7Jbhnt1qU12tCIyTzWfWdpcJNwXgr+kEfiWIefdRmSXVwaQQ4UvKYqiQ1CWK+MAqE5y9uLMdSgRO4/Ut0nE+vG4+X4v3xylbrnF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnIyJjJYinS7RTmri1/UR6PRUw9V+9To3VInJf6rF2M=;
 b=bwUqEYj2XqGWMal0EAdX6Ok2MijNy05+gE0oqrMyt+zi8Mf1sdJGe5zfIIASMxhZ3pqBrF4q0X2xQPV3cqZEDmhHLpKPQreHu6SaADzEN8UHUn+DEM+53POb5+ZiaUa3O1Nco4Qv1tkbToLDv9saSnnwtY3eOcgjSQmIPOvBQ/RFMVY4gaxuP/4nHrH6hNUxkPq7tCTrARkJslxEo03GOiW+2hE1OX6AWw9mH3dwVEouwDAgCjj/w61tDYurB517I0rFYHJrBlT8FH6L58yPYCj+6++Kd0QG9mxw0KSSpoGUt0D4x5ifs5GRf4d+BRhtcZiPPwRR17WS99hkbKVNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com (2603:10b6:a03:28a::6)
 by BY5PR19MB3571.namprd19.prod.outlook.com (2603:10b6:a03:1c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 09:25:25 +0000
Received: from SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a]) by SJ0PR19MB4528.namprd19.prod.outlook.com
 ([fe80::8863:ccf2:c6a:d43a%7]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 09:25:25 +0000
From: "Yuan, Perry" <Perry.Yuan@dell.com>
To: Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@dell.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>
Subject: RE: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Topic: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
Thread-Index: AQHXDn6s4PfzwhTth0aZP8v1kYirtKp6YrWAgBVxBJA=
Date: Mon, 22 Mar 2021 09:25:25 +0000
Message-ID: <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
In-Reply-To: <20210308172409.GF4656@sirena.org.uk>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [163.244.246.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f338e5b7-e415-454a-f125-08d8ed146cea
x-ms-traffictypediagnostic: BY5PR19MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR19MB3571281B1E5DCDEA17BA643384659@BY5PR19MB3571.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M7rZg0Uf1SK+gGQta/gxWRlNBxauRJhDKrYw2FBct/7/9a+ibAoYw/Z6UKiPpfv8boHH09Jyc3Qv6HvVizWRvN7HP161d1FPFUnU4+OTwJuvXCBPlfgJZcnxM/tqbsSsIHSxZpztrrUYCj0VOMBVOu5zNkFZ5OTRHYbdCaamJ82Z5qcafsr+m+X1DjRZAX5oGUjZd+yYoWDEDPQUoz4mJvvDkLUQhPljTkH343PTnb7TmRhAM6ErnpQZ/8Q4z+HSX28VFK77RxgyhBu+oUGSCvgSKHu51z4AmWfzYON92jQSM5sE2NA1bOiV2JejApKQu4B7wwKUYquM52xf2wRGDu4bM90S9Pz+2yojdQhQOAVgMGALzeX6P+mNXy6HMXNJ82qWZzG5UCxJ1mi+5sOicyujN1v7ZYIPRX8N9ojHDQDY83bzGKy9KwEEmRnhnBKicYsccE/YzQ6PYSVISAQv2O73ikUQPkwc3uq7H1p2QcyHD8sgN6nw8LNxmHAP1YeHsIe91caAoQ06flFrzRSuio7NkNBa/hpMjR4vOARolPIQnR5x7SqOyPMQkvJxnQ2sE4kEJAmlJrN3CXE4bXBibGrbv0vPHLoFu4Vwx9SYq4Gtmz0oWYqyMb40GnqnPzarFVJXqasKYlDKKREHVksy6tyU9nEcoSu2vOSv7ha7sykwmDg8C2Z5y2gjkrDhvyW6sQTPpRvwfm6LoePxcS5lMZV05jMM0TxPp7xs70J8MQ/8VUIdazPbaFow7E0irAwW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR19MB4528.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(71200400001)(83380400001)(86362001)(478600001)(7416002)(33656002)(110136005)(54906003)(52536014)(76116006)(9686003)(66946007)(55016002)(5660300002)(66476007)(66556008)(64756008)(66446008)(2906002)(966005)(7696005)(8676002)(8936002)(186003)(53546011)(6506007)(38100700001)(786003)(26005)(4326008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2F4OCekMjB+9LEsWe8O/8caxSn4fY0hsMVl6LsZ5G+MIY1XoM0t20ti1hu+X?=
 =?us-ascii?Q?DIuitwYuuo4lQ2KtBNcYEE+s0aN+CJQCAYfsqsTaukf5TLWeHNPeUln//iJK?=
 =?us-ascii?Q?2kzUECPv1sWzhqJOSGJuiCboyKvG74PPi6IgNqvG8zL2kQPC2y/IY6dphXDt?=
 =?us-ascii?Q?y+xfwPDJHkDZp1DhG/uCjOCtMrhllgAD6IQ9T/MWdlN6H1kDk7xgBlXmmG8o?=
 =?us-ascii?Q?UCgKBdwuexJFIkNbeahFSnUKoZQvwFAUjgLlrIu2GRtz5IaYL45kP6VHwN9v?=
 =?us-ascii?Q?kBLMTKoZPd2L3s8Omgk4O60YusZk7iYJ7M2vweG7K0K1ieDq5iWPt8bQuMpr?=
 =?us-ascii?Q?fQWEsQT7+A6PVUlAa85GGsryJ5NLMzpDophjpeSpjp4jyrQIxAZVHatScfIj?=
 =?us-ascii?Q?MFZJET+4Y3vZDrsJC+WvsaQxLcBUgvxRyFBKNEAu2ZsHAZPRK/0Da874qPfA?=
 =?us-ascii?Q?J8ePMxzomeThQCsF9ac7yNcfaWXph3zQ6JJx4mbQdZ+kkRDpjHjzS/sjGRcQ?=
 =?us-ascii?Q?YewumA69Btttz8oZG/5Clqdq3yNaaENAISKmjDJ0KwYj+ZyGCjfiI/OBU+uA?=
 =?us-ascii?Q?E4qLOf1n9wUSHppyOLyRYghTUbn9VaOtdZiVqVrfCik9P3YOtCMTx+M1tKmZ?=
 =?us-ascii?Q?nddYpX1Ly10pqgEUuNB+vsghsC2OFoe1+XerYFbEnzUsZ7rYEzl2/KQUiBS7?=
 =?us-ascii?Q?wp1bmtuCH5Tbpuh/K+AD0EMhOEtrGMiWQUcp3wemrSwL1p7+c4YSNk050gWj?=
 =?us-ascii?Q?g0p9sg/UmGFxiZY77aPmCcm2Auewe23WXNjkzs0IcV1V/PtZRiIWp0LkGpuy?=
 =?us-ascii?Q?/tjNv+4tM/o4DfQVzC7Y2Lw7cT395mVOOh6agVa0PpChmi1lwnZp+VOliSgI?=
 =?us-ascii?Q?LHIy8KLqLblpSQLEGA1yMU/PYyPhno5A7Ofk6mBifyKctYw0YtmBsmoRxVvF?=
 =?us-ascii?Q?cBElZyzQoEHyVZPrBmoWdW+b1xJAT9wP4AGkyVyxicLHnB1Pg7mCZVRov5IZ?=
 =?us-ascii?Q?uSp/6Afii1QuqE+7JqeKuqxd/QA7R+1pujq9ogfrlljyEaE4MeNKo/mcC5rA?=
 =?us-ascii?Q?rWVgYShITUOylmVMHS/sTaJdhKAdQ7UfnbSBYlxk6AqN5nsf1jvpeQfYY0Uz?=
 =?us-ascii?Q?dWYyLAs0MeZUoMTF/HZPMWusrE9pBrCd4enRoac8U2mBbxBIApbobL36g6Ke?=
 =?us-ascii?Q?EQNGhtZKhN3mLMu3TMLFp/dO8tfhWviY5FG46KAd+LY/uCnD9/QqKCYtiZ0o?=
 =?us-ascii?Q?dRgC3/4W0qhj+D9dCgSHTe3kLsNI1y8cus9jAOywuSFq+7Xay8TQk/q8cjOS?=
 =?us-ascii?Q?HnUn3vb+XQzGrJnoANLxbUiu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR19MB4528.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f338e5b7-e415-454a-f125-08d8ed146cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 09:25:25.4116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GABbFsEjAEBlEvLB1Qj1A9OuMo678LFY0Axav6FX7H+G0ImHVvUarQ929fPqFb3mtmCl/+bcxbN67btGqqOxRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3571
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-20_13:2021-03-19,
 2021-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=880 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103210026
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=993 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220072
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>
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

Hi Mark:

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, March 9, 2021 1:24 AM
> To: Yuan, Perry
> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
> supports
>=20
> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>=20
> > +	/* Micmute LED state changed by muted/unmute switch */
> > +	if (mc->invert) {
> > +		if (ucontrol->value.integer.value[0] || ucontrol-
> >value.integer.value[1]) {
> > +			micmute_led =3D LED_OFF;
> > +		} else {
> > +			micmute_led =3D LED_ON;
> > +		}
> > +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> > +	}
>=20
> These conditionals on inversion seem weird and counterintuitive.  If we'r=
e
> going with this approach it would probably be clearer to define a custom
> operation for the affected controls that wraps the standard one and adds =
the
> LED setting rather than keying off invert like this.

Currently the sof soundwire driver has no generic led control yet.
This patch can handle the led control needs for MIC mute LED, definitely th=
e patch is a short term solution.
There is a feature request discussion when we started to implement this sol=
ution.
https://github.com/thesofproject/linux/issues/2496#issuecomment-713892620

The workable way for now is that we put the LED mute control to the codec d=
river.
When there is new and full sound LED solution implemented, this part will b=
e also optimized.
The Hardware privacy feature needs this patch to handle the Mic mute led st=
ate change.
Before that full solution ready in kernel, could we take this as short term=
 solution?

Perry
