Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 364A05839DB
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 09:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290A7165D;
	Thu, 28 Jul 2022 09:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290A7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658994819;
	bh=6MaguXBEFvNlVAiOgFXkOMXXaLeGSdHWvejmYc4YYlA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDgitUbsZ/3LGqEJwTcg296AcOYdRH2Db5iqfmSWwpdc5TANmh4xBAFmiZJrGnS2X
	 p2ltxS7O/mZDDKyOLfsAotuzr3WPo1LwxMELbBoPZToP7F9E1fFtYOLV7r8fPlTUPI
	 36f1IEeOKPF9Rgn2wDXdMIvB64QDD5Q+lYxtSirg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F45DF80508;
	Thu, 28 Jul 2022 09:52:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99FABF804EC; Thu, 28 Jul 2022 09:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, HTML_MESSAGE, NO_DNS_FOR_FROM, PRX_BODY_135,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20709F8015B
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 09:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20709F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="vgXfhC7E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyy5Ryn/qMb/wyzdTQMvb9pZlzHNYgtnXUvYkymIChJEKBhm8BcAjEWk+Sd3DnELVLPLy7zg6DOVi8/Zrps3zW2RlfOLC3HXvuzI0YyXSJDJjy968b1c/fZ8e9S95uLK3E/WUipDlO6bV+WPsGuWs1rpfkKi78M2nat0IAtCae1LxsarR2ratWHDTkFBT1QV9gSxaUfTDK2h07VAAv9fmHwt9dAfkIr4HzIF2pxdmIwA8RJPfflKsF6hITXsH+8MHEv04pQ0i+yTKMARtveCo5LMyxzNBEoXrLfPzNRgFoW9O0bXxw2QW7okGyYGrLNc95SMZrP8loVcAAhoE+aAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7mHOZhSMiOpWaDawnM2YWKN8mn+A7jJKDVX7+kQZTA=;
 b=TEmezEZsCt6viWFoVn7J5D71ra28UVdiUSsMaz8MzjwPSijhN0cn6sRZb4be2BAAZEOfxihiW1UNCYpKscseMntFm4eCTGCN9Gl+z1AgAGKQ1mmeyACb7p78UHj+hVIkxlmrPCbLoUuqcH78oAhryDAj8N67TOnc9rvBMrr2J9iKsE1WeiITiiCG00EkFn7qdaLljrMEL9D19ppHkDRZdMlVUGEHrm/5Wl2HbqIwBjT9Le0xW4lGBkwd9D5X4v7wnxnUwgvhghrH35+mmzRydagxoovWtwcK6z0Pc38b+UYoTCyhaQmcGMWkxIuf/MTTLxslHEo94QMnwUtz1mR35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7mHOZhSMiOpWaDawnM2YWKN8mn+A7jJKDVX7+kQZTA=;
 b=vgXfhC7Ep5xQYcDgi0WKBz7U3qcEOPU6HFFH5hUPygFQnqqMIfLdtJF3rKxS6qMYMOD2rV8WeBO0b44nzJIxLQ/gq17c8qe2urTN05zeFjdu4T+KCDL0WDVzWsPlSg5h4Cu/e+JxCn6NBP1j6AODc3h3GtzE7XspSdOCUWTmsF8=
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by BN6PR12MB1218.namprd12.prod.outlook.com (2603:10b6:404:1b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 07:52:25 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::ed9a:b809:1f3c:1e7f%7]) with mapi id 15.20.5458.020; Thu, 28 Jul 2022
 07:52:25 +0000
From: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Thread-Topic: [PATCH v2] ASoC: amd: acp: Initialize list to store acp_stream
 during pcm_open
Thread-Index: AQHYnc/kZL9G9ChouEqXiQ3cJtdoh62KZb0AgAlJXwA=
Date: Thu, 28 Jul 2022 07:52:25 +0000
Message-ID: <PH7PR12MB5951A322E8613E1A782ACCF3E9969@PH7PR12MB5951.namprd12.prod.outlook.com>
References: <20220722133530.3314087-1-venkataprasad.potturu@amd.com>
 <87h739464x.wl-tiwai@suse.de>
In-Reply-To: <87h739464x.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-07-28T07:52:19Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=45b69eaf-d0e8-4ac1-b9d3-de4e67617dc6;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2022-07-28T07:52:19Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: a11fa710-c027-482d-9672-bb2746ea2206
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
x-ms-exchange-imapappendstamp: PH8PR12MB6889.namprd12.prod.outlook.com
 (15.20.5482.001)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01b480b4-723f-40fd-964b-08da706e1cb7
x-ms-traffictypediagnostic: BN6PR12MB1218:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T2hPvfzAhsvHmjwPAeT9PG7/DRFr5AoxAkRygac/w2tVo22k9TjW9A060x+WuAVOyv5lLzE6Wb+6v0aRcZ/ityGKzfSaIwli4D77D+bWMnyn/Vbkk+n/LzoqACiJG6MBdNA5C0yblBWjjQu2M21pv4PFS5TYMG289AaNe/ZKya5URoOcZ5rpBGkM6bb+nwM6+cd1UbQvfLF5KkogTIhAHhUbmfRw0jxLpbTCC9hN4R4LGxRBFrdoVylRcMGpKhSuhgBdFuPE10JBnXvLCoL3Xu8PPnhYIbWFLKUkwQ5wcCgI/8SYlgVgvl4JW/N528iHpMu2mJ3I8R0ZHCmkuDURBsBh5SUCfFgxYDJJCE9cQx1UPmFZWpVv+jobk9DN8o32c2zLH8WojQ5OHB6bAgY9t12dCWzG/BkAgfoGmxwcjELNEHKgHPgcJ9Ma21yQvvQNKHl6zrdtdgjZjvm4Ddtt4YcXsspVsPkFx10ZNbfHoQxMALigvgibRXv+qtlCSH6jMVxchFyt7xd30cMdRuvMzDXW33TJ7xdy2opjFddoeiV/Cf/YGWrUblovvAFqRQBodJY38B/QS3G7JBFi9dnCZcuGRGXs1B92Nsgn2eSiaNGWYBm54QWhsLUErMO/r9H7pyaeNJ97NZpjavH/tC1ofQiw8bLEyBin1n02c3uAqRU14O2rWjth8VuSLynZhE/h4R0yUsWTtTqfvRj+atdbdRzN0yeCmXIoQ325C8cTqRSY5eoq8iA88Bs3hRpB5UV4ds929fMtDxPBbzLPKqpOmqFwx4WXukozJ2KZpcoNoPgX81yto/+9fJ+/lZvvTbUk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(5660300002)(52536014)(478600001)(8936002)(86362001)(53546011)(26005)(41300700001)(9686003)(38100700002)(122000001)(2906002)(33656002)(7696005)(38070700005)(6506007)(83380400001)(186003)(55016003)(66446008)(66556008)(66476007)(4326008)(6916009)(54906003)(8676002)(316002)(64756008)(71200400001)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VWTqBoSPnnhuE2qmIATScvj0cU0Bt906Xh0XeExcg4iYH2Y7u+Vmqe028ZUF?=
 =?us-ascii?Q?Wn2LkaKob6caRBgdqhdMCUgnKB4LFdAdAcFXUI/QigtCD+OTavSGsdFuNg2k?=
 =?us-ascii?Q?gfN9euVt3vU/vbBW7C59ongoLz5xp5nwggwCif/rBMS4M1yZVfGXh+cC2S6c?=
 =?us-ascii?Q?DFxp3WYO/irjlx8zurAool9qbbELm7DPB4XRTK4BQ8MJERnaP7wJ2ob/svjF?=
 =?us-ascii?Q?bNJg+UikA5GYiilO7bfFxU7KIAR4H+SB8Y9es8Q1/3Fm0DQNTNjrNCV3w0kC?=
 =?us-ascii?Q?Dvx7Fqfk5sgskiDzf+3gd3OMSLS0V6UFliiaNEdDGJxV0YmHtly/6Q/PCX/z?=
 =?us-ascii?Q?21vnK+GGzov/4qkVXATFB5EU1w8eVJxGAeXb50DC9qBuVhJyGc+4yorGsaJ3?=
 =?us-ascii?Q?gHHDRgDAHDq/kDSjcFJsPC5n6MBeA6RtiXcqMOqdS3fOvuV8RiB1r+/APg85?=
 =?us-ascii?Q?wrePu+6kd5xR1gPoDWotbFnDdMlM2domNe1talYJKjQhbVCvwSYZ/iKhVX5A?=
 =?us-ascii?Q?06SfCJcjuu9csOcGaX734/TAJQm8Uyw4wQqfWxCp0lwyOvV3d187nyNB21Fx?=
 =?us-ascii?Q?7j+1PdeA0pD8GaHqyEtQMVGOsOWz6W5Yh6yO3QpX1iA0HL42+/K4y7rSk1Vq?=
 =?us-ascii?Q?pUOQs9ODoMfcuBd22y+CAAitYlFx6C2Kfni2WOdS0cQDvlZ1wgqH80DHr5he?=
 =?us-ascii?Q?udCDwULXXL7h0LwEOE5BGRGvYo8Ltp0jU2rtutKewR2tOyPtumzmBIt2VF4L?=
 =?us-ascii?Q?9+1x1cVKHKyuyFNZkFMR5dui+KKzVRHLRTGAW3/O68ne8zRZLehjP6QpjdWX?=
 =?us-ascii?Q?Az86/THXJoTnP6LX9i6ERRFt1tKhbinOIh0B++SDoOJ+k+MC6FPa+u9JFrgZ?=
 =?us-ascii?Q?NIfmE6ZIY/Q6OYfnxvfgtJPx/KzUbs4Qay7oE98t70ZS7BqBH8ZKvqAvfEx8?=
 =?us-ascii?Q?8TV++7yM3blAfFVTcXEQaFsRofV/Hb7iGQKVRdAQxdibooV+hIx6sM/c0Ljk?=
 =?us-ascii?Q?yjX9WA+9RZa5cOydSYrG3KFfww3ORKVWVyTVNW/l+/hVmgPkwqVV2pv4rmoP?=
 =?us-ascii?Q?KHm4PvgI2cX0Fa7o60omm60B91KqKTTbRYjDG3VjkyUSnpygYjo7uMHC7OSm?=
 =?us-ascii?Q?VDv7dgPqOFrAIb1nonORjdA04cVICDSrLu9gTeB+wLsnKdEw37mN8YQV9HE1?=
 =?us-ascii?Q?Y3fe1aEWMo/1BvLQ/bHIBpLCNuk9MqK+UU/8f3EX3j/kMjhbSt0Tu0TdGTtb?=
 =?us-ascii?Q?ODkvW3u+wAfQ9FktTUmL3RKBoDhqjTJpEhum68kSx0XkrEn9mB+FsvYCuuky?=
 =?us-ascii?Q?23T29v/UEmEEO+LMMr5YAR6heNPCtt8inFPtxxfVv8LO3J/wGEpdRk3/HqMe?=
 =?us-ascii?Q?iuBdEDEKlxLb/spw6LhBQWcparPfviowLwzb1gNJAZ1p4AhES5EctI93oT4f?=
 =?us-ascii?Q?CvQPXMRcUsnWl0r5ewFFd7pHqxMv2Cca3DGw6iQ20Ev0xfgsfo81uZFIm3oD?=
 =?us-ascii?Q?RFRI+892OjvE6BAmclYgQ+Vs+n9ozserYUAa/yuh9qCPtV+iHxYXzsGz0X09?=
 =?us-ascii?Q?AL7fhj2tTqCFP2AOcQ+5fRYGqOCgk1u7/ZBSBA64?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b480b4-723f-40fd-964b-08da706e1cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 07:52:25.6697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BkiKfkHe0PlibbOWu33NFibcVUlSEFco2I2s7Thngb+Zs65sJbiGT4j4CeEI0XOU30mRHj9kkc9FCSB8wttMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1218
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Reddy,
 V sujith kumar" <Vsujithkumar.Reddy@amd.com>
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

[AMD Official Use Only - General]



On 7/22/2022 7:11 PM, Takashi Iwai wrote:
Thanks for your time.

[CAUTION: External Email]



On Fri, 22 Jul 2022 15:35:22 +0200,

Venkata Prasad Potturu wrote:



From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com><mailto:AjitKumar.Pandey@=
amd.com>



We are currently allocating acp_stream during pcm_open and saving

it in static array corresponds to array index calculated based on

cpu dai->driver id. This approach will fail if we have single dai

linked to multiple pcm device as we will have same dai->driver id

or array index for multiple pcm open. Initialize new linked list

stream_list to store opened pcm stream info dynamically.



If an IRQ handler refers to the linked list, make sure that no list

change will happen concurrently during the IRQ handling.  It seems

that you have no protection for it yet.
Yes, linked list may changes concurrently during IRQ handling, we will use =
spin locks in the next version of patch.








thanks,



Takashi





Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com><mailto:AjitKuma=
r.Pandey@amd.com>

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com><mailt=
o:venkataprasad.potturu@amd.com>

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com><mailto:Vijendar.Mu=
kunda@amd.com>

---



Changes since v1:

    -- Fix compile error and remove unused variable.



 sound/soc/amd/acp/acp-platform.c | 33 ++++++++++++--------------------

 sound/soc/amd/acp/amd.h          |  3 ++-

 2 files changed, 14 insertions(+), 22 deletions(-)



diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platf=
orm.c

index 10730d33c3b0..20c0f75f7c97 100644

--- a/sound/soc/amd/acp/acp-platform.c

+++ b/sound/soc/amd/acp/acp-platform.c

@@ -94,7 +94,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)

      struct acp_resource *rsrc =3D adata->rsrc;

      struct acp_stream *stream;

      u16 i2s_flag =3D 0;

-     u32 ext_intr_stat, ext_intr_stat1, i;

+     u32 ext_intr_stat, ext_intr_stat1;



      if (!adata)

              return IRQ_NONE;

@@ -104,8 +104,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)



      ext_intr_stat =3D readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used=
));



-     for (i =3D 0; i < ACP_MAX_STREAM; i++) {

-             stream =3D adata->stream[i];

+     list_for_each_entry(stream, &adata->stream_list, list) {

              if (stream && (ext_intr_stat & stream->irq_bit)) {

                      writel(stream->irq_bit,

                             ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used)=
);

@@ -146,9 +145,8 @@ static void config_pte_for_stream(struct acp_dev_data *=
adata, struct acp_stream

      writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);

 }



-static void config_acp_dma(struct acp_dev_data *adata, int cpu_id, int siz=
e)

+static void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *=
stream, int size)

 {

-     struct acp_stream *stream =3D adata->stream[cpu_id];

      struct snd_pcm_substream *substream =3D stream->substream;

      struct acp_resource *rsrc =3D adata->rsrc;

      dma_addr_t addr =3D substream->dma_buffer.addr;

@@ -174,13 +172,10 @@ static void config_acp_dma(struct acp_dev_data *adata=
, int cpu_id, int size)



 static int acp_dma_open(struct snd_soc_component *component, struct snd_pc=
m_substream *substream)

 {

-     struct snd_soc_pcm_runtime *soc_runtime =3D asoc_substream_to_rtd(sub=
stream);

-     struct snd_soc_dai *cpu_dai =3D asoc_rtd_to_cpu(soc_runtime, 0);

      struct snd_pcm_runtime *runtime =3D substream->runtime;

      struct device *dev =3D component->dev;

      struct acp_dev_data *adata =3D dev_get_drvdata(dev);

      struct acp_stream *stream;

-     int stream_id =3D cpu_dai->driver->id * 2 + substream->stream;

      int ret;



      stream =3D kzalloc(sizeof(*stream), GFP_KERNEL);

@@ -188,7 +183,8 @@ static int acp_dma_open(struct snd_soc_component *compo=
nent, struct snd_pcm_subs

              return -ENOMEM;



      stream->substream =3D substream;

-     adata->stream[stream_id] =3D stream;

+

+     list_add_tail(&stream->list, &adata->stream_list);



      if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)

              runtime->hw =3D acp_pcm_hardware_playback;

@@ -212,16 +208,13 @@ static int acp_dma_hw_params(struct snd_soc_component=
 *component,

                           struct snd_pcm_substream *substream,

                           struct snd_pcm_hw_params *params)

 {

-     struct snd_soc_pcm_runtime *soc_runtime =3D asoc_substream_to_rtd(sub=
stream);

      struct acp_dev_data *adata =3D snd_soc_component_get_drvdata(componen=
t);

-     struct snd_soc_dai *cpu_dai =3D asoc_rtd_to_cpu(soc_runtime, 0);

      struct acp_stream *stream =3D substream->runtime->private_data;

-     int stream_id =3D cpu_dai->driver->id * 2 + substream->stream;

      u64 size =3D params_buffer_bytes(params);



      /* Configure ACP DMA block with params */

      config_pte_for_stream(adata, stream);

-     config_acp_dma(adata, stream_id, size);

+     config_acp_dma(adata, stream, size);



      return 0;

 }

@@ -261,16 +254,11 @@ static int acp_dma_new(struct snd_soc_component *comp=
onent,

 static int acp_dma_close(struct snd_soc_component *component,

                       struct snd_pcm_substream *substream)

 {

-     struct snd_soc_pcm_runtime *soc_runtime =3D asoc_substream_to_rtd(sub=
stream);

-     struct snd_soc_dai *cpu_dai =3D asoc_rtd_to_cpu(soc_runtime, 0);

-     struct device *dev =3D component->dev;

-     struct acp_dev_data *adata =3D dev_get_drvdata(dev);

-     struct acp_stream *stream;

-     int stream_id =3D cpu_dai->driver->id * 2 + substream->stream;

+     struct acp_stream *stream =3D substream->runtime->private_data;



-     stream =3D adata->stream[stream_id];

+     /* Remove entry from list */

+     list_del(&stream->list);

      kfree(stream);

-     adata->stream[stream_id] =3D NULL;



      return 0;

 }

@@ -305,6 +293,9 @@ int acp_platform_register(struct device *dev)

              dev_err(dev, "Fail to register acp i2s component\n");

              return status;

      }

+

+     INIT_LIST_HEAD(&adata->stream_list);

+

      return 0;

 }

 EXPORT_SYMBOL_NS_GPL(acp_platform_register, SND_SOC_ACP_COMMON);

diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h

index af9603724a68..148a9ab6206d 100644

--- a/sound/soc/amd/acp/amd.h

+++ b/sound/soc/amd/acp/amd.h

@@ -91,6 +91,7 @@ struct acp_chip_info {

 };



 struct acp_stream {

+     struct list_head list;

      struct snd_pcm_substream *substream;

      int irq_bit;

      int dai_id;

@@ -123,7 +124,7 @@ struct acp_dev_data {

      struct snd_soc_dai_driver *dai_driver;

      int num_dai;



-     struct acp_stream *stream[ACP_MAX_STREAM];

+     struct list_head stream_list;



      struct snd_soc_acpi_mach *machines;

      struct platform_device *mach_dev;

--

2.25.1


