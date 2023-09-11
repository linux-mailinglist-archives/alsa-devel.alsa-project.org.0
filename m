Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 443FE79CCD5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 12:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9CEDF0;
	Tue, 12 Sep 2023 12:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9CEDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694513054;
	bh=9uOjdJ7QGxB+RTSOS0P8QMC64w+d0l4MXOzObnKR5xU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tqd2tYvez5d1MxRZ89BoSnQ8z/peZfmQapaB+teiZzbOl5YFNvMqL+ni3dTfyQc4p
	 bHVls8pbOQzLtMi36+JgldNmDMayijHFQw4VMNNsu1KGg3LtzlII+sZqvZifgXeSB/
	 DsfA0QaWF2wtkfUFpbvAjafCA73aviDeZIf3WW+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2CE0F80567; Tue, 12 Sep 2023 12:02:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 196F1F80564;
	Tue, 12 Sep 2023 12:02:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1686F80425; Mon, 11 Sep 2023 21:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9E13F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 21:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E13F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catalina.com header.i=@catalina.com header.a=rsa-sha256
 header.s=selector2 header.b=aqz4zDj0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnAZyYkkx+qRi6uIqjbWwS2K7voZ+RubLFONsh8Mwvmqe9f/iywOqekn26sdCWR5Ugm8iT4YV8s+X7Cub5S1JhwY9r9wQc8fwXqk57IkGZCRuYoU8I7Rykf8V9CgSVeDevFR1MjW/Hokp7qqr4bt6X+NBV2Dizq8VxZkSvLu8vDDkTq+dYfExecXNEsGB1G/IcjreSOOQg/2mBTGhhUBn2GNZH5Nq5N0GEuel7DFJ+9tbgyuorM5qi6fCH73b9m66BEbxs+DGN+tRDQdqOD6d9UrpwbMM3/gKNa5d63hiyggitsS0GPdLq71/ZAHAlmKgkXYWZwV6vFY4m/fTkSRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OITkjyvZkP+fe0DLe2ndmLxb+YH6krwXdV8s46q6JGI=;
 b=T1EnPMHl/W8w42cVGMhUGPo/yB1LYPpT8TdhnHtyEtVqDUWn/u15Rc9F+UO4yfHbfPJ0VdEmXMm201e13mQdrIh8+/j1FQTQWxs7JqT4wqdpYaowTUY4hTDTFzgdrsIMPUmKNgylCxQ8wpFgDFah6qogZzp08bF+xC3KhShxnQuKWvEsVDQZmQlmcH6HsLX4JcjI/UMj9Ri5kVLXaPICxEok70ynI4NwiyH9SNiXBXxGFfpLl7VHgQx3/HdmWw11oCAeDpGz9MB/fVE2glc5qJvPxJR4n1pVni3DhuknStgOHmbugWzHdLkZ+xOsF153lrUor886TfFk6fRwz0JX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=catalina.com; dmarc=pass action=none header.from=catalina.com;
 dkim=pass header.d=catalina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalina.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OITkjyvZkP+fe0DLe2ndmLxb+YH6krwXdV8s46q6JGI=;
 b=aqz4zDj0GWI3ySdPuD2PFLqNVdyKbzxcOR4fHDZ4AvT9bBI1hH98We0BQfdEeY5UT8U3/XN9gIkW8jTRdYhV5zQSPZP02fyvlqZZIZ0IuZw6AUFcAkqdZWmfvNsacQgrcIWSjxS76Fe/9d+hX4zxNxFMQAc3lcn0otzmz+NmxAyhiWxheLKm68CjigZYGi1koAyrYXUfqJ38vqOF+mJadAnBqLlaMEdR26Z9cHj/R9TwtCVsVDlVZLPerXFpnr3UlR7S5BQd/hgu7BDNKYukflP5ThS/wLqDDHd6o+R4/np7+//8As6YqW4yx5u+EEt8/mAVQmS72By+Fv3/xBkWUA==
Received: from BN0PR02MB8045.namprd02.prod.outlook.com (2603:10b6:408:16d::23)
 by IA1PR02MB9495.namprd02.prod.outlook.com (2603:10b6:208:3f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 19:28:21 +0000
Received: from BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256]) by BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 19:28:21 +0000
From: Terry Hummel <Terry.Hummel@catalina.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
CC: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7
Thread-Topic: Bug Report: Audio issues with CentOS7
Thread-Index: AQHZ3zuyVOwv+LHOWkuu6+CmLUIUyLAL1gOAgABkb/WAAAqSgIAAAIjLgAnHAsE=
Date: Mon, 11 Sep 2023 19:28:20 +0000
Message-ID: 
 <BN0PR02MB8045F24D2428321D1872C51EFAF2A@BN0PR02MB8045.namprd02.prod.outlook.com>
References: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <62624a24-67a9-bebc-b704-ad3df2cf1da5@perex.cz>
 <BN0PR02MB804509BCA42A091EE530A553FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
In-Reply-To: 
 <BN0PR02MB804509BCA42A091EE530A553FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=catalina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8045:EE_|IA1PR02MB9495:EE_
x-ms-office365-filtering-correlation-id: 4fe983a6-5a24-4311-3fd8-08dbb2fd422e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FAfdQOrb3GPfdzGZlU0f+7iNdElVv+J3YaHtph7QfXMALwRjj4xEpPqLWtM6tqEZmRJzbZwwjfLNEIU4atqRL5yFn+BPc90gWts4l1oErOAPGwsHfRDc3Y2SdGt9oI2kA9dHSPC5W0aTYOrk6Vv+fuaVlR3Kt8u8O5/FEwl1cP36193soSJHqvlA94VD/3SMQFw+ubs6c8kxNq/Bg/YYyIsHQuEso42zrb2BrZsrlC2fbfxkD8tKNfwd2IytJRdddxtmnkRvaXgrcUtAT84Fc6tpc6dFmVLoM9I1SWoyTRs4rjneImeuXY4sVP30dOTsopnoA8KXhou4ZL3hw3645vgiN3sNszG1OVIB/xR/5D5i/ZmxOpKD/75t/8gEhR1OfNlrHlP64fsF26JpF5XgVm2xeOepeY2ern77k3Gmd3njq9eDITgtt02hwEEOtDzqKxPIGQt9oZ3SpJOGB92NSvR8j2K7XOOMVOhfcyU/6e8mGTYHBOUe0eXBkfxfIV00yJM4E4Pn7sZJsVWn0Fk8q72a+C7f/Nc8sAiUaGLlXQc0e+ddNoqahsKRGgbwl2EANFUig2R49HbF7kl1nX2gzRlyAS8UzWQTXjZCl+T56Lw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8045.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(346002)(366004)(186009)(1800799009)(451199024)(8676002)(8936002)(4326008)(83380400001)(52536014)(9686003)(966005)(76116006)(71200400001)(1015004)(66556008)(66446008)(64756008)(66946007)(66476007)(41300700001)(26005)(316002)(7696005)(110136005)(6506007)(107886003)(53546011)(478600001)(2906002)(38070700005)(122000001)(55016003)(166002)(5660300002)(38100700002)(33656002)(86362001)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WVvwjr2kQA2R6dobTXOO52/a3Ha9pT/2XyDalIOiw8teZhDhy1JhUkUgIT2d?=
 =?us-ascii?Q?Z40J0d2UKmzyoYcBT1bsvsWIWtJChNZ/kS11fbOArONCn8/QteW/zIbSoeh+?=
 =?us-ascii?Q?UC6Ey/hekinf8xrd1JTTvwG9nrxb6XyqH0pancZIQ3JA9Rx0ZY8/XRcD0pJj?=
 =?us-ascii?Q?4Q3YZi/4N2eOGy/jSuj2kYy3jKw6vf1N31YrkuQL4HWHkSxOxhSbyZ69iP2n?=
 =?us-ascii?Q?h+bUmzMSJD608Le+vakMi4I842eRWPnGWLR5ibWieUR/Da0RIm1sDrHc5fDG?=
 =?us-ascii?Q?kGJPqSWzjpSdFfu13G4q2Bt4Ef373Djpq3kFOCSwzb831JQbg1JNEyCgEolc?=
 =?us-ascii?Q?OFgXqohJIcyIN7+iDAAsvs+Z06uU/VuL/I4ZeTHxfjPA57YgL0os4mbh81te?=
 =?us-ascii?Q?ebaWes6xj8CZOuRb/g0UIS81MxBm76h9pMq8sfUk/EOoOpZErDgoX+RmuTff?=
 =?us-ascii?Q?01cNC1hpCPKH01G2SgNdmhcR8PA2vxoo9SHt7YRLOhnMC5UhEkAddoy0Hsdp?=
 =?us-ascii?Q?Gfk6+mjxpRShxwqLZZtuOdD+Y6tjuZmnCh1ljXQLvdJw+zDgHij6lin41JHI?=
 =?us-ascii?Q?V0T5CMHZ6OqrkT0x0mIBf5i3sAFWjV7OuHSGQZ3sep+CgAXw4Utk34bZEh2o?=
 =?us-ascii?Q?l3MoHQ6C9FmpHRed+7EtW5/g2QuJIesSFiMsvydNDShPdRQG+Z7jgPeHTU9o?=
 =?us-ascii?Q?rYMz/w6kaJBTmvgqrb1vLIVNflf0Na5ZnwBA0YB/LZ+8uiEj3AlGMzCO7Ypk?=
 =?us-ascii?Q?7nLJydN1o6beg0eoTASe05FVliAJ/hAadt2dlQQVBrZuS9jFOtgnVchzrP75?=
 =?us-ascii?Q?zz+FtIEJomJW3knd5wG/9mLl9paoVkClx3Im17tA1myEXXfLELTbqmNOI+sA?=
 =?us-ascii?Q?3zoB1pdFPJ9JfTuRZn6s8eTbndamgAUOAfQtx2KojDJE8peDR/F1D1AziAKJ?=
 =?us-ascii?Q?63kmOsCnRC2+JM/QqJ+/3EFBb33d20nKwxljhpzEWP7wK91cMgsRCxjciWSX?=
 =?us-ascii?Q?lvc0kL+GmvwVIzLN6riyrAQFMiu4zXMPLN86V+d78VkZ/4OUFkr7cTrux9zZ?=
 =?us-ascii?Q?qVm8ECyTcGMd6NEN3RBG7EGh0bFjvJaRIZPOJIp1l2soH8mVv53lkU1hAekB?=
 =?us-ascii?Q?G96eTEL2Ebik5TAyhIvkuPozhxLjwqPhazHnIt3o0HgAodp2UeiBT4e5lmGj?=
 =?us-ascii?Q?3PMbROP3OJcFefu0if8QGZx/a5Ty4V6tWplo/u8X4AWt4v+x86kKvRmTS979?=
 =?us-ascii?Q?UG83HejTOcR+f9QzbN05d/6fuuhQ1Yd4bJgaKQDvsQEQDq9qD1fTCXzOC/JY?=
 =?us-ascii?Q?oPgV7hds3r9dlYfZRd1ysx8hdpMfjB18JuorlUpEONV9l4CdEMoggZXrSCxX?=
 =?us-ascii?Q?rt21ReZURj40kz0td41mvu+Jz0/j+sniqHZ0RB+cc55morUZvslmwpEZ8WWx?=
 =?us-ascii?Q?g6wypt4Gr4hQFYwwmNaSgWzCaCLaBI8ovXaWE/G91pBNR2ImBqgdCAkQawBD?=
 =?us-ascii?Q?SQCirRJMjcO7dY7J0W6v6ItjRd6KWwmlv2K2d9ulVZ+1WWBYtH77P0i16eJr?=
 =?us-ascii?Q?uuIEoBoSfANkMRTHrtWbu1kJo4quQOMky/X/s0wo?=
MIME-Version: 1.0
X-OriginatorOrg: catalina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8045.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fe983a6-5a24-4311-3fd8-08dbb2fd422e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 19:28:20.9277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2eddc39c-2996-4c2a-ab97-f767c39ea155
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 lrNs8jyOOw4IGksxUGdHvNCTUz337XqzNWLLMEHaaZNlSlIrk/xPjCPHbWqhVBfSP8/Ho95E73TBAfkG0n2HKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9495
X-MailFrom: Terry.Hummel@catalina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7QNFW6ICOQRO7HSFEX76LRJF5Y4H4BHB
X-Message-ID-Hash: 7QNFW6ICOQRO7HSFEX76LRJF5Y4H4BHB
X-Mailman-Approved-At: Tue, 12 Sep 2023 10:02:26 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJCO3OSPFG6ENMFYBSEUSKTD3MW7VN4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Jaroslav.

I didn't have success getting the speakers to work with alsa-mixer. So, I ran alsa-info.sh as you suggested. This is the URL where the text file is located:

URL: http://alsa-project.org/db/?f=e1111847b82553f2dbd6015a36334f74b4402024<http://www.alsa-project.org/db/?f=e1111847b82553f2dbd6015a36334f74b4402024>

Thanks,
Terry

________________________________
From: Terry Hummel <Terry.Hummel@catalina.com>
Sent: Tuesday, September 5, 2023 10:08 AM
To: Jaroslav Kysela <perex@perex.cz>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

Ok. I'll give that a try. The CentOS7 image we have on these systems is minimal and the alsamixer module is not installed.

I'll get it loaded and run the tests you mentioned.

Thank you,
Terry

________________________________
From: Jaroslav Kysela <perex@perex.cz>
Sent: Tuesday, September 5, 2023 10:03 AM
To: Terry Hummel <Terry.Hummel@catalina.com>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.org>
Cc: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7

[You don't often get email from perex@perex.cz. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.


On 05. 09. 23 15:51, Terry Hummel wrote:
> Hi Jaroslav. Thank you very much for your input.
>
> I created the alsa-beep.conf file in the /etc/modprobe.d/ folder and rebooted.
> When the system came up, I still couldn't get the speaker to make a sound via
> the beep command. I attached the .conf file just in case you wanted to confirm
> the contents.

Try to check mixer settings (Beep etc.) - e.g. `alsamixer -c 0` command.

If it does not help, run alsa-info.sh and show the URL with your dump.

                                                Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

