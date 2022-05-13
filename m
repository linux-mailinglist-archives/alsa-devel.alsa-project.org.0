Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2309525C17
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 09:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B261AB0;
	Fri, 13 May 2022 09:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B261AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652425714;
	bh=JRuAKSZDK3moJDPasDXvjZDHQMlVXiSo6MN2O+wZpd0=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RB9lOtK2rnga9oNKx9FdHEdKF216vRxafS9b/jmMlgYUwYJ5lU0RzZx0qiV/IZ5kc
	 +QLSt9Kr90JYIfESF4wtc6a6rvBVE6ZPZywRjCfWIWfwgbmM+X6kG05qs7d06RugZc
	 IbP1rVp3mCnH0LIYYRfume9wOqcj5k1AgiVovRPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4CCF8025E;
	Fri, 13 May 2022 09:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 674E7F800BB; Fri, 13 May 2022 09:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CECCF800BB
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 09:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CECCF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="Gw0EtunC"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D6xbb0012633;
 Fri, 13 May 2022 03:07:24 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fwnp6datp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 03:07:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDj2zsmfcbLK+q73jvodZrQD54F8sP03pEZ7sMYifUqDeDbuvgopLSzcLEIgOwm8gCp6lzNZnimaQi2wXOiPA3XEsVp6CKmcieBzBSGeibYTmO1ibTj5oqiRwbaY/MX50F6anKzL17vFAzT+Uc4Qwj3ojWLJVu46m5UYmjHv2nFYAjiYKPuq+nD+lXAHhCs9fB5cWkDBcq8Ebe0Oo0liPnTbYOHZVp641TU5j7zl8r5txwbwa+QV39HVy5MUwgqufM1ceD788U01dg6IhgU8kYrztOaYDCZoXYcZ0RS/0uVEuPB1N0CxmF8hdRKYtb3r21w83A9myBqsSQOG5p7J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRuAKSZDK3moJDPasDXvjZDHQMlVXiSo6MN2O+wZpd0=;
 b=VRREXXPOIUOUGGCZ5oIpuMP0T7sdfGPojfAhWhEtwL9yoSyKMHNOSnZw1W1cgID6E2PSc/GGUu6OPO0nnV40yO7/psmTsGclntUWv3ig1LJJb0cd+htkE3DiYVyRATHbR3yqfjRDzJH5nV/J7nQ/dXIw47ZMVZS4sThKhnIIO4h9srBrfUUpw5mePO6yFNwVPYjNoA/Acfc2TRHyaNeF8h801foZ2UNEbPAWRrURpTvChTu/l1c/hBXn1EqYnkSqkhUiVwohWU5G1h0HE67G6JLSqnc/C8yZFPpGHeqPAMcJm9socG/sveMhcl8RJO89Zl+VFtKs2j/kZRPCpIyE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRuAKSZDK3moJDPasDXvjZDHQMlVXiSo6MN2O+wZpd0=;
 b=Gw0EtunCp9OMaqe5zKjoOvHqkVJJ/hhMrc4h9rLOWNv9AQe+5Xvfa9YCadX/aiRjNX+WY6k9U6Vz9S5OH1ok61T1AHoooR6tGgEXA4l8FofKr+l98d7sLcL9s7ps45sA8OYpsRAIfxKZ9lDny/ZmaavcED/lGgBGl66O0YCQEm0=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by CO1PR03MB5761.namprd03.prod.outlook.com (2603:10b6:303:91::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 07:07:21 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 07:07:21 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/2 v2] ASoC: ADAU7118: add bindings for managing pins
 drive strength
Thread-Topic: [PATCH 1/2 v2] ASoC: ADAU7118: add bindings for managing pins
 drive strength
Thread-Index: AQHYZjSDfBd40RbHDEKuI5bI0xedka0cYzaQ
Date: Fri, 13 May 2022 07:07:21 +0000
Message-ID: <PH0PR03MB678646958CDEA9B669F9003E99CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
In-Reply-To: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctNTM2NTJjMTYtZDI4Yi0xMWVjLThiZTYtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDUzNjUyYzE4LWQyOGItMTFlYy04YmU2LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iNzg1IiB0PSIxMzI5Njg5OTIzOT?=
 =?iso-8859-1?Q?MyNzQwOTgiIGg9ImRocmhuRFROMVA5eTRZYWVldyt2TTZCcFEyTT0iIGlk?=
 =?iso-8859-1?Q?PSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQU?=
 =?iso-8859-1?Q?VvQ0FBRHlJcjRWbUdiWUFlUVgwK2p4ekR3eDVCZlQ2UEhNUERFREFBQUFB?=
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
x-ms-office365-filtering-correlation-id: b44476b9-e455-43e6-09bb-08da34af398a
x-ms-traffictypediagnostic: CO1PR03MB5761:EE_
x-microsoft-antispam-prvs: <CO1PR03MB5761F40C49D026C099E6A6DA99CA9@CO1PR03MB5761.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0x46JE32TSRzb3cL+rPGcNpbqAV95Qq3VAQjVysVEETM6cyMIQb3vURAy104NBENq40//+/LBFsKvgL+aNz80GBQdZ5JJxIyYGtstDfhNckja8QIQQxZCdudwEA1bAEAw2nbMt4L1Db1agU2HsfHypZ0Ay8yLnjAuyGkvpTdclv6PVvwaPy4S5hFg5OuGEaKO1ftIAqfzpt2OtSalQYqpeq1GJbTusEzqulcy52wVfZ2mYir4ZyNPbcC0CP2dA1+Iam9N2raXxy66JuMY2lM1CnTvlUMNhM1O1egS8c7jpZtMN8wtpsOJx/CJCq7NHiigQlJLxdbPCaZyhZyLfPjxKnQkpknDiVLlgak7wCsuakVktXj6rH28QefmyyVvBMY3lC/gXpX1/ADXcb+YrgEdlEjaQlyc2+TPqaX97sWCJHys06v9HCYjPZIvmRdRBNF509YR2o87PIB/5OH4eoGJtYK8mrk/8+PYCj5NCGvQqo7tzMlNy4zgA/wmxM251HrIqZmU0lm0oi2IwhhxsWasTedJWeSbrL8KBnTaYNEhaL4MR9n7Nt+jMankcllOH1PB9ERYal+f4WnbKIop2LwNOgg+3CEXpTXTXBR+86cIJPXthaZZQEN2/kcPqegXLGctQ1TUFjo9IrQVnB3GhNnhqWVBt8T4FrwPc3vlnabuPGr67WtNOH5DDFHvmAasy/pXZOcQdRasQD8XTmD+O9dIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66446008)(53546011)(76116006)(64756008)(66476007)(86362001)(71200400001)(8676002)(186003)(6506007)(7696005)(508600001)(33656002)(26005)(5660300002)(4744005)(2906002)(9686003)(8936002)(52536014)(316002)(122000001)(110136005)(83380400001)(55016003)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wBn++cz8+pX0+7uvz2TNikANIrBQR8tYGOpYGclRMbPzsaVaWP9k88cmKN?=
 =?iso-8859-1?Q?9d0ZRyyliRgcIcS9g93wInpvEYY3lApCfORM0E+xwWm7vVYW6wpMjpk2zB?=
 =?iso-8859-1?Q?18/OP4Gm+93sTQ4aZz332U30cqURnlbiTTmTtfIsOaFa9EnBZ1OvFYZK9A?=
 =?iso-8859-1?Q?bZm9/YZ5kIlrpJ56SBzygtfaA8IL8+mY74VnGBVGN9Sd0Cnpp5hENvylqn?=
 =?iso-8859-1?Q?26Aea5T9/hthT5BnZTqS5l7Y2P6sTgC3lzxUQyEt0TNz3VIruso6irz8LO?=
 =?iso-8859-1?Q?GZKdenvwZAPeSO9wdkghR4SF/JPsjZ3zKrKNmHr438a6sZ/bncqZ+b5DLj?=
 =?iso-8859-1?Q?IlN+Haf5CDHBemQFSckwY76/cp63UBxTiza+w2jrIRU24h2D4Y0l23RAd7?=
 =?iso-8859-1?Q?ANJYBcZsph9V6XJQYTYcAU4YIpVRwqPUxDG+CV+1LfD0/9btVoLPf1Ofy5?=
 =?iso-8859-1?Q?SaOn63zZ867LhpWRqvnLufD8wsAdGMC9tGMDR43wb9zEbAOaLbMpxtaN+v?=
 =?iso-8859-1?Q?g359gMl66V5fVegM/GAAG4A2nwlK4hUD7mFv7mN52X/sCKm+aRspujFjLC?=
 =?iso-8859-1?Q?tM6XejshRyquPkp4wIQLWjB7p4D7sf0Mf90iovP2a1dzcQcPkVnS/CL3KK?=
 =?iso-8859-1?Q?GoKS7cXccHggxp+BqYKy08FQ1/gb9QDTFV7GXgu5Q+rEWOhQxgSlrtfmYg?=
 =?iso-8859-1?Q?ou02Fq3kOEMhZCmmbNXAHM07qgz+QZzOmgZjEpQCAsOXmlj6Yrnq7nasHT?=
 =?iso-8859-1?Q?r8EUx7Ox2EaRAZsPgmv8XvCykjdSEgwgZi7ZfMMhwGWWS0hvtq94ByvFHg?=
 =?iso-8859-1?Q?kqRnGkUvz3F7FQwOGfK+u+DN2rZafrWhhDdrY/6gGvL9FImeozoIMc3g/v?=
 =?iso-8859-1?Q?dQZ6QwMo6smrm6drbdeGCPeTtGTwyOKXy3sXAsViKWT524peFzwvwHOAdF?=
 =?iso-8859-1?Q?/SMWUz1aUE+sR9oFQDdsqgGUd+tycki4dEmEXg7s85mB6jIamnxH1cj4nF?=
 =?iso-8859-1?Q?NXhk4/219/L58rRIxxvU4ZnsWZnoFh19yP0Zc5xbjnnUTWwkSSwmu0bU6a?=
 =?iso-8859-1?Q?Eqhl+xyMZ2B1i2egdNurgeXhaVmN7+hdABBpgtjZGVYh07sC4vAWY8wcI1?=
 =?iso-8859-1?Q?El1Y/Fv7WufsBAxHl8W8G0KvTdc8WjF8e6GC3KfqMmBQUy4JZikX6lh3QA?=
 =?iso-8859-1?Q?GkV4Yz2rPP0JSJPhI4j7lscIfKI2iRXBQ/ROFwpoPa9ID+9KbnVucaT2fL?=
 =?iso-8859-1?Q?aJZPh7/LiXWr/OGIRs1OJpxnjoCGg4FpPbv7yVLUMOfGP7Z8YW0HQdR09F?=
 =?iso-8859-1?Q?eRTKdpLSZlV956HGOB7C9buamNbvipc7U42hoKr4zuBodOJTgQOnP3Rw1K?=
 =?iso-8859-1?Q?R3UYaZrgxCpj4Kka+CpHJkVe102XiyUC+K+/3jvF4ODAWQX4KPOAvt+RaW?=
 =?iso-8859-1?Q?4zc0+hqjjwIy1fs9etOt891uBN9mADhyZw9L75/IxBx3jZbdr0a6mXVMXN?=
 =?iso-8859-1?Q?dIMmD/o4j529zuGrCMuEz11/SjAecCExl/5qwIgwApIeKRhLVqWXh9k2dd?=
 =?iso-8859-1?Q?vytBOM4j4yUTTQs1bLpEYr6IiBh9V5ck4vkgXz3D7NOS4tnjQZX5oJSbk7?=
 =?iso-8859-1?Q?gMXhu70rej6ZXrv7wJN9DdYp6MZ24tGfJF5ZgKQLwvBPa6VBlFeDzAl9ej?=
 =?iso-8859-1?Q?B1PCWbOJEEAQOfVX1VBARHJu3MoqUsfm7TTX79CERFRKx155Nc3jx/loaI?=
 =?iso-8859-1?Q?H7KOd5FWIb2CoLQ+9uYAm62xzZRT2+COfetoasCPoM9ZJNlPdYD37JrHav?=
 =?iso-8859-1?Q?318Zmjj8Hg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44476b9-e455-43e6-09bb-08da34af398a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 07:07:21.5146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Wfdqa2EdSfmtvYjMCz/bynP8mcii+7w9zod4uNl9YqvJhc+JSQb6E2jHvJX4y8dqe7cOV4mXW3Mh/XrYhCbmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5761
X-Proofpoint-GUID: VA_OjfRIFkxa5uBxj0fuRvnLlg5n4Ose
X-Proofpoint-ORIG-GUID: VA_OjfRIFkxa5uBxj0fuRvnLlg5n4Ose
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=967
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205130030
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

> From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> Sent: Thursday, May 12, 2022 9:14 PM
> To: alsa-devel@alsa-project.org
> Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> <dylan.laduranty@mesotic.com>
> Subject: [PATCH 1/2 v2] ASoC: ADAU7118: add bindings for managing
> pins drive strength
>=20
> [External]
>=20
> This allows users to change SDATA and both PDM clocks pins drive
> strength during device probing according to their need.
>=20
> Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> ---

I think checkpatch will complain about the length of your commit
message. With that fixed:

Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>

