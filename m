Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3598525C18
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 09:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB3D31ADE;
	Fri, 13 May 2022 09:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB3D31ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652425757;
	bh=47ovhh0J6lX+Joni5ilnl7CQ0AcyDYUt5NbIjdX2GMQ=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJYkdv40Lh7dm0e/nN29GcWvr4FOq84G2zSbzvMdyC618/6i8NACdezLDDRmAm7bK
	 pwlmgzun+vKNih/awZsdh0yxfw8/kR3zWs37IljJmfy5MdbcZOblcd2iyJTyPP2kiT
	 r55YwGGbGH3OjtCGBDwZkZqnLJkJ62tv8aOWh21o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F6DF80083;
	Fri, 13 May 2022 09:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483B8F8028D; Fri, 13 May 2022 09:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64CDAF800BB
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 09:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64CDAF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="5L9Myy7L"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D6VFfn032607;
 Fri, 13 May 2022 03:08:15 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3g08ht61mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 03:08:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAdftfeBDHNYNn5htSI93hvSihNnR2Stn1he0Oy8FKd8sGGvanvtS5Ol80tzGPSV8JVVn/99+S0NdAGdjStKp08OPHItKMLm2O2fQSe+cc5/E6KL8xn+pBPwgbrOzMWG9b7hMQsxqrU0pNBz8m4VNKvwHjSK8IXPu1JkqDIc+GUIUDDHDB/O93fY0jKgaIJl0soOzL8gsCwUtNVinTfreP66VT8qzk+lH2dSUr6r5GX2UgXUUi8XOA1K3AuIcQrXhgbCP8K+L6IF8kfPv6g1brQ+NWu4+yVJSKvboIJ2EJI/1cU4w08CkM3kADd1uiOFyy9I+aj9EyrkJs3aGuwOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47ovhh0J6lX+Joni5ilnl7CQ0AcyDYUt5NbIjdX2GMQ=;
 b=VWs6iPgDdHLdk6mmv1c+Ik6f1mz3V893B90Kr9N0qjwECSSKhTymhYRMC8sRTpfnwFf4U2OjkYWcm/Umypyh9YwaHvvViuaVLr+cDhHUpFTWgTcUUwF7UBkjYuA/xQxh3nrxihrhGv7AU8rOJOaeLqwQf4CdLqesd670zBcNeHVpZL85OYh5XD7gr4YSYBDDXR7g6ehkZGGDigIOl8HmKvhjIzw9qJIzsUtuABf3bX5FSicbO2mXXMtQ5a3dXB5Oj7aR6l6KZEbRAiHqQ0Fj+7kgRXK4bOQSQUKUxUMHgTRpZShJOXfq2YbNHt6VcFg30fG7Y8XW3kFnPi2M4csdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47ovhh0J6lX+Joni5ilnl7CQ0AcyDYUt5NbIjdX2GMQ=;
 b=5L9Myy7L6NY7cb2AIzNFszJ3rvGeao+EHw0lGtcXahqbfzEsgANuv7tdqsdBqZnboYRtDNsfAkkXugBnq6XuyAecn8YLs/8gEVHvsUEm8RMCCvkVlF9t2ezk95XFouvhR/BYI5T4h5AjlMM1+VL9iU9wkurfd7gpzThHOzey1OE=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by CO1PR03MB5761.namprd03.prod.outlook.com (2603:10b6:303:91::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 07:08:13 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 07:08:13 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins drive
 strength
Thread-Topic: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Index: AQHYZjSIGr+IcH9UiUCrVadoUKQdUK0cY8mQ
Date: Fri, 13 May 2022 07:08:13 +0000
Message-ID: <PH0PR03MB678668768F86C5AEDE3146EE99CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
 <20220512191352.15602-2-dylan.laduranty@mesotic.com>
In-Reply-To: <20220512191352.15602-2-dylan.laduranty@mesotic.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctNzJkY2VlNDktZDI4Yi0xMWVjLThiZTYtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDcyZGNlZTRiLWQyOGItMTFlYy04YmU2LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iNjc0IiB0PSIxMzI5Njg5OTI5Mj?=
 =?iso-8859-1?Q?EyNzY5MjMiIGg9Ikw2MmdkZW1oS2lpWHhzUmlENXFnM2xLeUI3OD0iIGlk?=
 =?iso-8859-1?Q?PSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQU?=
 =?iso-8859-1?Q?VvQ0FBRDcwVFkxbUdiWUFZbFFINHdpeTRoOGlWQWZqQ0xMaUh3REFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFFQUFRQUJBQUFBVklFdm9RQUFBQUFBQUFBQUFBQUFBSjRB?=
 =?iso-8859-1?Q?QUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQm?=
 =?iso-8859-1?Q?xBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdr?=
 =?iso-8859-1?Q?QWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWk?=
 =?iso-8859-1?Q?FCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBB?=
 =?iso-8859-1?Q?SE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtBR2tBWHdC?=
 =?iso-8859-1?Q?ekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQWN3QmZBSF?=
 =?iso-8859-1?Q?FBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b729996-0b28-43aa-48a0-08da34af58b0
x-ms-traffictypediagnostic: CO1PR03MB5761:EE_
x-microsoft-antispam-prvs: <CO1PR03MB5761FFE2791D41BDFD35D57899CA9@CO1PR03MB5761.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rkc+MebogsasSrEcdFGTfbE1Kf2tJMCU3glmBHsJPiyAR8+c4IRvsKWvwv8zkjrZ7qGy0L52rQdWPWZ2OBBNQlLzQLDwAryZCdqivYullaekNB7RRbDgzOo+ZFcQ5Uo60DC0y17mDz5ALmT0NkQjclH3deOBCoc7YqzDM2rJzSSeeZqpYeDTFiGBqWhfOQ3PCU/+ISirzSbbuN/07OrissQ/Gp5uggMnWcvtDmdmncjCuTq5x1fjEKSWAbkGuOvGY/uBg2XCgPtNiTrFNdF/tDsmayY+KIH5bFMFxJLMksLWsifl4vuCUhBOmCrMsRrFEXo3l2789ooEZgWej8Itkf1FKcZIk1R73pAq8FNl/XNdzykzl6FR1Jf40stkg/3usRzerP/eKy+mcOU7i363fZMWY9BHHfdLOrOSSMxlHL48yn7gSswlqu/X/g7s1ZeSRgfKmt23nRuqGKxZLIVqoKwfV5vs5OJZtp69hAOrCWbb4AC5x8UFgFCjTmJysDFVnNg9qBCXYRQ62IWS4i2nyjj5HBLLP/L5vt4PZ0yWExkwbMJtd/5ZCjuV9ZUHb4epWwK8Z3lZLVqxm0OgLMzZAWz3ZP+9wBc34ZL0Po7mzAfQpRk1o8tLZfM0LdKbvP75B7cyrtN1OtY8J1Yg2IeDw8y66j80/fHrShUOxm5ep82k5Uyx6rs8NFfUugbphIJaHjlcwfB7Af4zOpI3QOP8LA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66446008)(53546011)(76116006)(64756008)(66476007)(86362001)(71200400001)(8676002)(186003)(6506007)(7696005)(508600001)(33656002)(26005)(5660300002)(4744005)(2906002)(9686003)(8936002)(52536014)(316002)(122000001)(110136005)(83380400001)(55016003)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EboHsXXnoTtGbAVjDvY0b3zVlXpGwN8e0PS8Ugf4oesznhmeDOVwL4oAL+?=
 =?iso-8859-1?Q?El2XNHYIzDDcON25qHs5wSnfE60tMtndghJ0A/8Vpp4o2PcLK8Ok56xctU?=
 =?iso-8859-1?Q?ypdg5wX1M4jSkjjCsWW+udEBPvnwHd/yuwBPamjoirruGS3daA3RhAuNoy?=
 =?iso-8859-1?Q?pQqSALXaqidXseGL4uqzjR0HHyBpcV86sv6Hx6uS6OIAuMG0ENo3L7EP/W?=
 =?iso-8859-1?Q?6nDcAzDSo2F0+2Gm/lIzTg38hscexRIObDkbu1OcI4gK5/gFeDEqEHmqER?=
 =?iso-8859-1?Q?QnW6ZUV2s6/LIqsRnep4ieULKejqSTn7vqHar3xQtB01V2sFd+S0K3MT6d?=
 =?iso-8859-1?Q?d2UoAQRykmDKrXVduTWCo6lOPlE4hZy0DHW6enCZHuO5GibV9vZpgADNuW?=
 =?iso-8859-1?Q?npBAadM1EjnHRVn/wMUEHK3en6giIy20SAAyGCrGRnpXeH2/585Gjb9emE?=
 =?iso-8859-1?Q?YRx7FJQqGDLCfux2/ON35Iia51kPs60nAE1Kc77A6eVQx+2/IUEZX20wH3?=
 =?iso-8859-1?Q?LLzagNFluglOhVjqJfTzBboUh5EtundIz2mwqIQYTTgqAfeQpKLUV/oTyp?=
 =?iso-8859-1?Q?egRoHv8ZLQR+ZJdpkpNvc32QzZeQU6TJZiTWcOkNipQETJQIXIjvtNmkA1?=
 =?iso-8859-1?Q?3kNOmdzwfx21HDV4DdmQg5EvZxsT38dYyQ5rqe8tWMFO6OjXXTHj3599CI?=
 =?iso-8859-1?Q?Z7vNXtuqX7037SEikM3JZWpX/Bb+6YtlQpr/RVkHt5OgDQ93fnKY3Cf4k1?=
 =?iso-8859-1?Q?1JNeyIfyS+yeuttT+WPzmzhWgVb0283OMzkQSkMxKk17vXKjCkaXflerE+?=
 =?iso-8859-1?Q?/sOv91rmrKYHWCTbu+FLga9D8RqK6PTgsRieLJ+fWYwdM0eedVpoIwmn85?=
 =?iso-8859-1?Q?7fIM7y94dKeeYbfhKU0zkhmdDbnJydjNZMm0BqUyNjxpIr7fjcgr17sf4q?=
 =?iso-8859-1?Q?85BE4EZHBIGEgqapIcLzZnZBfN4vTQZpXetDeeSIJGAyIIfYai3qUP+grY?=
 =?iso-8859-1?Q?QKKCgCMiSmhvWtMOqEsDo/NNlHk3dpkGxOi4vuEg/eN6VCyP4cBTKbvmQc?=
 =?iso-8859-1?Q?IpkKbu0ws7N3dsVGIClyBAkl5ZJKhYYzyVxTjwBhtqDZ8Mw+VkW/HUOKrY?=
 =?iso-8859-1?Q?tnvs2yQymLYf+EOthGxPrvkIubbeqG1mcMEUYdAjvzvgZe8dGfvb1QuKWu?=
 =?iso-8859-1?Q?85hB6B9IvEvern4BBqlEmijjx3RAWina87M92sHZmGNSTXYRK3jYwT7kTQ?=
 =?iso-8859-1?Q?Xy9V59g41PWYOTGRtqH+csKyno4x5yz25YUijGjcg7NUyFIRr2z27Qyx6P?=
 =?iso-8859-1?Q?uyeJ62PaHLpIIwW4drz+k5sHPi33Khssc7gVdPNHmICJv43OLvt/J+NcSh?=
 =?iso-8859-1?Q?R/cpw26K/hr669j0Q7x+q35BaKpzYOAbetrJpabjGB263mosKZEXMqGNlm?=
 =?iso-8859-1?Q?orEi+DTrBzNVGkMWx6BwqHA7dmpuvarasrak4lK5pdUyiUQaMy84ovGOGn?=
 =?iso-8859-1?Q?e3L6PJS9Qq05pRCEg0PLEcc3ZJZhsHTIGhgencS66MDyZHxn31/80PLnNJ?=
 =?iso-8859-1?Q?0KQGP3eAOetf88GQqcGDK54E0gwETCquyasHFh7LqQSc2x3hIf3WWPYcWF?=
 =?iso-8859-1?Q?p6kFqpUT6/3rSiZFIVlXrrwhs1zRGw0XLQCIVS3PBGXnt6a9umLnq0pNyF?=
 =?iso-8859-1?Q?RgqMzP7WqiZKL1h9qM52dnwQ0egaxpESwKh1I7koZAJrpqp0SLoYRcLQnu?=
 =?iso-8859-1?Q?we+QACLknzKePA8iaxZKj5oqfH3XOUi6sABcm5hI8q1kZG0OIl5C7p53UA?=
 =?iso-8859-1?Q?uw3LH9hNvA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b729996-0b28-43aa-48a0-08da34af58b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 07:08:13.8059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xu9FmCpt960ZWFUDrLk2blNpBM/oo2G8UlSXeYliS5Q1mmzcx5GhfK+5agDZPrn44XFeb8/LmqR2i8/TwMUNnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5761
X-Proofpoint-GUID: csc9AUUu5-C4NgyuXzhAQT7_-lisyW6o
X-Proofpoint-ORIG-GUID: csc9AUUu5-C4NgyuXzhAQT7_-lisyW6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 mlxlogscore=891
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130030
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
> From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> Sent: Thursday, May 12, 2022 9:14 PM
> To: alsa-devel@alsa-project.org
> Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> <dylan.laduranty@mesotic.com>
> Subject: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins
> drive strength
>=20
> [External]
>=20
> Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> ---
>=20

checkpatch will complain about not having a commit message.
With that fixed:

Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>

