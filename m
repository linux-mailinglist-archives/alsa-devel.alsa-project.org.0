Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08076793536
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 08:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E841A84C;
	Wed,  6 Sep 2023 08:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E841A84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693981266;
	bh=swYxHlFt7P40yv55e1xlc7LdyBhTY4XVAMwnIF5v6iQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iKaOEdTr074P7/u3H5PyWtN+7hGtSsaOpvnDroTs2SSKsvjc+ES0gNmjbdeYq4pQA
	 LX60/cXxHcaI4eb2Guof6FuNeDCNpQ8m8le8fPJ/vfX225MB65O1MCwTj4BxutM6w1
	 Z3wj9I71jytUVT1QW+rg/KJE5eZItQ9VfbRu4LkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD13AF80568; Wed,  6 Sep 2023 08:19:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1E6F8055A;
	Wed,  6 Sep 2023 08:19:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80724F80494; Tue,  5 Sep 2023 16:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6218AF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 16:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6218AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=catalina.com header.i=@catalina.com header.a=rsa-sha256
 header.s=selector2 header.b=AHpqGu+l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZX9WdhY/G2mbkOHRpnw3bflJk4rzFfH0RA5DN3IAI8xi+iFsGHHUCIRkQVurynmyIqvIr+GqWGin0jX+Vp2fH3NnRWztiIBoghpgOEdamvRTstRjKKU9CbJT5skBpIpZekkgkTFDhJ7ZURD+B1cqzptWzvybgEZAIikzw1FwaiONgNMsbRN1tA31DvSK4NUpyFn4OsnmnVDfGWM8ut3BiZJENBNQU8qjC4iZ/908hFw8Szn+9oXSQ59fbtyQDYiONVBWsqN6s8WyDj/9xUBB7SYWGZ+AumXXQwrdKp8hyXOnF6Ovh4/MwwPiSRJdgSV1CT7/vESYWZhQEDK/nls9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNd/Bfx4Geh1S9fHKo0vGw7iuS5xAO9V+TwabOAQbHg=;
 b=RLCXkWIVpB7GPLqSbklX+lqKBAazoEVttGtEw3Mgi2nz5UI1pGwWTUxakX6LzNIt/+3ronvHayUx+lW3wlvs5FpqPidM5irYm9z0nZqGtwuHwomz8prm3DFbj58C56kqL+R77p47QI5lw/XSe1SIEy8a2+Alv4Opnh2BHMEAet2QptVnw1xl9TIrqFVnxpMufkQVJ9Eu8zumt7F9w559rbqmRXue1oA16rDNPVFM6+rDgCY2qKmT99R/tNJt78EIHxN5rM/QuiP0SUEMtI4p8Bww8sx0xzvjMy25enFEXZGGYNhv+nL9ZYjMCgJ78yylewZaCGVJRPKc4sov0NXzIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=catalina.com; dmarc=pass action=none header.from=catalina.com;
 dkim=pass header.d=catalina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalina.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNd/Bfx4Geh1S9fHKo0vGw7iuS5xAO9V+TwabOAQbHg=;
 b=AHpqGu+l9vpgz6pOMT/Y8eo8qOh2rKN88ySEzq64C6T0DCzPOZ+So1jLvaAUVJdcKItgPl3TDkFcg1y/IzEdozcGllMJ51Yx9C19kubC2zgmiib/yI3RmBFS7UU3AjzyFXcFgBJ4X55i5j1INLfYjktIR+9qTGVviOi/9IIrnCnflMc+unbfmaWGEWI8ImJeIhSbLYKkl7zmD2AOZxxt28FSKwKFuuBNQ69t3XLmgj/CIBb09ETHWtrrGiMkJY9lUyue/N0hK+s8t/VIxZYPBiIxL85T8KVmwMvQ/62Hve8tbDxAB4mJuVAFqsrJxr8Xkdd9ByV49fGbKDHmskp8qw==
Received: from BN0PR02MB8045.namprd02.prod.outlook.com (2603:10b6:408:16d::23)
 by DM8PR02MB8039.namprd02.prod.outlook.com (2603:10b6:8:18::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:08:56 +0000
Received: from BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256]) by BN0PR02MB8045.namprd02.prod.outlook.com
 ([fe80::1c07:b772:24ea:f256%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:08:56 +0000
From: Terry Hummel <Terry.Hummel@catalina.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
CC: Dulani McLaurin <Dulani.McLaurin@catalina.com>
Subject: Re: Bug Report: Audio issues with CentOS7
Thread-Topic: Bug Report: Audio issues with CentOS7
Thread-Index: AQHZ3zuyVOwv+LHOWkuu6+CmLUIUyLAL1gOAgABkb/WAAAqSgIAAAIjL
Date: Tue, 5 Sep 2023 14:08:55 +0000
Message-ID: 
 <BN0PR02MB804509BCA42A091EE530A553FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
References: 
 <BN0PR02MB80455425D6077DEC556A4F83FAE9A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <20945414-c6c0-acf7-8340-9e7697b0e833@perex.cz>
 <BN0PR02MB8045C507932EEDF72FB62783FAE8A@BN0PR02MB8045.namprd02.prod.outlook.com>
 <62624a24-67a9-bebc-b704-ad3df2cf1da5@perex.cz>
In-Reply-To: <62624a24-67a9-bebc-b704-ad3df2cf1da5@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=catalina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR02MB8045:EE_|DM8PR02MB8039:EE_
x-ms-office365-filtering-correlation-id: 1c077db9-be34-4b69-00f9-08dbae19a47a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PjWsiHUVNvCd9XAp3Rj3ixZ/ZnVim+WH1vzjOhbIuNc+xBP3UPj+b8DbKFiPP7CgQFS7RlvBa/SgYCaAwsjHJVpU4tN5SAVP3wli6m5XBBGNsQ2xgSZPg2igJ1WRwPEuUnkfGq6W+pOGylziOfk84RzYOGHjXcutJKfh8Id2SPusnnlDgjIPy1wZY/2zZu6NCELyx4AyRj6llQ6l3TOfVi6f9W7fgDdCz1eY1ilpvyO4Sb1bWePrvvRQwMwJb0C+EGkDklrVnslGYnn84SJdUX5cUJnK87uT24S14G5hDEikqd1LzuQI8vKKFAYZuoBJzzS5Et/UOl3Q3QkC2F0TW6HODybxMP3h2CEBnNC7/Lv0E6jpRwgkSrMGDFh29zXntj6wUmmQY4EDUoI0spOtdmEzoJ3vGf/Je4VEvvVb+BVKgPGuBeWsKqYT8ldKauL3iG3QkIaWasbLWs7ryebPVtlbhu6KbZ/9pXA0lRmWMBqzDLMONZE2N24iteX4IOod01wxWb/QUJF05rGVk6PYkMdY2MSEa9c7n+O6cDJkzfnhP7zKznLpFNfG5+IHZCwqLkOHPW+Gt+3O43vwD0Aqpyw5AejTaQM4EYM6Z8YoZOtY3Hfa2gMVfhPHzEDZQkY1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR02MB8045.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(1800799009)(451199024)(186009)(41300700001)(122000001)(38070700005)(166002)(71200400001)(33656002)(86362001)(38100700002)(478600001)(83380400001)(966005)(107886003)(9686003)(53546011)(6506007)(7696005)(55016003)(26005)(76116006)(66946007)(66446008)(64756008)(2906002)(110136005)(316002)(66556008)(66476007)(8676002)(8936002)(5660300002)(4326008)(52536014)(19627405001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TFJgZVyI4tFSceJm3z46L69CBtKmAInznj2/OdF8/WzTBKtokklKJauVdpf0?=
 =?us-ascii?Q?N2ZUDQcuqkJFLahONTS3Cj0TGA+i0wStzQZX7v+4qPPLFPVmhgMUdNfAZ3Gz?=
 =?us-ascii?Q?iAhorDOV+kcKHeye4JruuLt3UZSHJkJ12DRYVMrd4qTc3ILvvQYQ00/JZaxJ?=
 =?us-ascii?Q?67G4+9N9Y/GuVefXkcbwH2QckQhDCItKG/G1K0qxWL31KLX2RdMhYb6w694o?=
 =?us-ascii?Q?qqp/OKcIzPmTnIHTBp2nEJola+If8sM1D83KxWAlULrnnXrR+uoY7wx+gjyT?=
 =?us-ascii?Q?z28tFtqP+lM8DUqn7+4tyanabclA2CZFjaUEdqUgWNEvWLbvi/fFrKONlZVC?=
 =?us-ascii?Q?asoKtsKZvdUID/6T/uIooenGJwtEbDpdLAhOUrVa6XOqxvs+GsIUrRyAhTAG?=
 =?us-ascii?Q?O32iZuCA6KB9nJBmiwAdqq3TPggzyKX5P9mVDD79N3FyClHP1GTezYGvP4jJ?=
 =?us-ascii?Q?9cTIfBvarBxgWo6rGKbi50+e7IuvcLsTpbHIzylj98u/Y/OqQZMFlqQgjBw3?=
 =?us-ascii?Q?2PEGPhHt4dVWgpQNca3uBa4kfH2kCKYyrBPkxRUKCLpDjAl8y8Isw7y0l5o0?=
 =?us-ascii?Q?7n/QTTzaUa4LYvkFME+2aMWhJaNptqbmD80HYytfVK0dJOw/C5K8ykaIYhTF?=
 =?us-ascii?Q?/ap4K0f6aZ4DlcGlySY99R2w3FCBNAaM+ZmM+seQ8BZvvNx4iygd3NQo6ARV?=
 =?us-ascii?Q?joFIsa/m2x5D34u/R42UKH48qgZB+MCSbxj+w8IO+LduuamxLySpMm/bxpG5?=
 =?us-ascii?Q?RNGOKv9vXos79Rd7nrqSo00M4XVzSrEVNNNwvCj8gyVYP4/Acrll0hw3Epxj?=
 =?us-ascii?Q?CBW7aQCjEg11MGKeFk5X0DukI6opJ8mFTOKUYkzMwwecAaKleOeiFKmYTYz1?=
 =?us-ascii?Q?GeqmqPHfOCxF1OrqL84adi9UZl6oucXxlNFWKaoL7niyAxoCmlQk/hr9mAbL?=
 =?us-ascii?Q?EUahatfhkCoLXCeym/+q+gMp7fnMp1Nm8VB5b65yawtragFN83/IqFioumMs?=
 =?us-ascii?Q?R9EZorhlhDlZIrhOSbEV9qixpRzWK0ksdoTq4EhrfC3nyuA2xSKH1LT/1Mxi?=
 =?us-ascii?Q?3yNzqdHkqLi8oi+nQw6X2d0J7PfiFX2NlnpgwcVML4K2h0zGTiCxeBSLzkYV?=
 =?us-ascii?Q?I0VyRYdGcCriBFxQyZa1FfA1vB8HMe6g6jlYQ2I3pGBFaKVNVPmw10q3xfr/?=
 =?us-ascii?Q?khJLv8hXLa9hlOgvR0GHmtu2oqURitR/Su+QfelxxwYRtCSx62TmmY8AE5iH?=
 =?us-ascii?Q?PlM8WDKFrZiWtGLL1IIpi0wzOuR6xweQ7gOwhPjD5f5VCuNaEgdtl5MLhqbd?=
 =?us-ascii?Q?usof3d4rAdFr5unEpMF78s2mmqwr+Fie5bTpvCgemhTW2HO1Sp9Uck+pyHPh?=
 =?us-ascii?Q?yQGxcV8cyukvqJY33LWyZ2sU7RL1SAZUwldK5DTn70snMS/u+YD1NATSNfx9?=
 =?us-ascii?Q?BFEhjfJwqJnOjWDNjlxcPFXkSkNMwFPr57d1JuPB7DgNKr9Gt1U2bIHkcFLp?=
 =?us-ascii?Q?e1hxAe+cst9zAnVvflgjtLd73Pn5CD1LI6ibLEFM5MT86Zaoe42JMinvKZLO?=
 =?us-ascii?Q?iTqOWtqXaugm+XBBsS0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: catalina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR02MB8045.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c077db9-be34-4b69-00f9-08dbae19a47a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 14:08:55.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2eddc39c-2996-4c2a-ab97-f767c39ea155
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xopFuQwgbNGhgsNvKX5uwtoaQcFTeeby0tuz+1fX9/zRvEBMKuESgUSXluEChXEF5V6IS+sb3EGC6kQug2oJcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8039
X-MailFrom: Terry.Hummel@catalina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZDYVHOGQSQBGFEWXDMB33TEEWKIZ6P2G
X-Message-ID-Hash: ZDYVHOGQSQBGFEWXDMB33TEEWKIZ6P2G
X-Mailman-Approved-At: Wed, 06 Sep 2023 06:19:29 +0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVEPL5JO3CVVEZ3VQHIXLEDQXRINLC4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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

