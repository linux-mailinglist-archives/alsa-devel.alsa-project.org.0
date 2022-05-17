Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D647529CD9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 10:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED7B83A;
	Tue, 17 May 2022 10:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED7B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652777077;
	bh=crTEeNfAZhBSmLjxUWiXOrdhC3u5br03/by+Qzy+sYU=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYkbLgxQs0rrMtEYKdsU3occFXkBofr/+g5Wu49tQTHKJsTtAs4SX8D4XF4qQdpcS
	 fZ65m9liCiA1jQZehG3Ksi6kSRmXlO42emaOmEfQ84RkwZmevTZG9Zw8sSJEhpv3MH
	 T+dvoP0RiJFdmcfVGwtBWoM3VJoS3V5e8pNjWQd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67954F80310;
	Tue, 17 May 2022 10:43:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B273F802DB; Tue, 17 May 2022 10:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9009CF800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 10:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9009CF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="3djBclmL"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H7WUPE011314;
 Tue, 17 May 2022 04:43:24 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3g2927s1kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 04:43:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2E7+JuuyeheYwYfGfHKhUwrGK24vySPS+ihSuPxr1grSgbU+FDi0zvlw5pFitvTdcRhDQ3MGYBZWDqVtIEPTaoBnc08u6KGflboLIc2FhmEBlVLI+exw2+x/mKUVqul9bV9bS0gnmLJXJNXfsCeEbvpTdyKfreKNp7KZZE9YW/85KKQ8hTtvD/1F6e9epxbw4A3fI7TvtTqNg+5TZImrR7OLA60CgBXGpB15tm+x4KTox+iTnoEM1A70abr0zV/8DI47eesxNE1YVg51PiGY/yGdftMwY1O5LgTgoJcNtzUY45xYrsWOKpwU8pA0zPrj7wtJbGpLtNuJhEGjHwllA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crTEeNfAZhBSmLjxUWiXOrdhC3u5br03/by+Qzy+sYU=;
 b=oFDs6R7KpjitfZqlIOj1R+qvgu1K4HesQf23fj9a+L3EbRVIRccDq6H1Udbvj2AfLDzdgF1HdP2MUQduoZD8HHedB3f5krRQn39QpcTOjqUJ6Tqs2LDmwgZKSTlJDAJr9zGBxVYm79D+Uw7tMVJQdrF1XKe7ielutToGxj4ef6/WH8klwI65seJOoXzHbBKSsJLVg/K5x/YLN1hJtceJQDrm6rtGGFTLafcNU/uyrb6EP9h3Wwq/4XNy8E3P4teHtosHzuumPmwq+c1ayH+b9JpL1Jxk6hq5Ada7CvcnigRHO80Jexs75GkPOEjlEIIjUP134V69mJk0A4ZIU3Z3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crTEeNfAZhBSmLjxUWiXOrdhC3u5br03/by+Qzy+sYU=;
 b=3djBclmLVvL4DXc8GhTQ+TOLFXvarxa+PCGXXDd7+if4VuyQxmVLnDbtGUUxmhCDsRljNdfeCCJWZ6Or0NnuPUi0wQ81+KeyRtdOBQotcyeGo1mk/y9l6KcGmXSLBiX7syFw6ZQHSrrDjDPSK5bOY3AC+gxVNi30KjIFeIUfyaw=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by SN6PR03MB4448.namprd03.prod.outlook.com (2603:10b6:805:f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 08:43:23 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5273.013; Tue, 17 May 2022
 08:43:22 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Topic: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Index: AQHYabHNRBOAjYCNzEuJk2EQ54Dtg60iuVXAgAAGygCAAABe0A==
Date: Tue, 17 May 2022 08:43:22 +0000
Message-ID: <PH0PR03MB678618705E95D8C032E5205899CE9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220517054809.8244-1-dylan.laduranty@mesotic.com>
 <20220517054809.8244-2-dylan.laduranty@mesotic.com>
 <PH0PR03MB6786A29EE38C9FDF74B4F02299CE9@PH0PR03MB6786.namprd03.prod.outlook.com>
 <1816957.tdWV9SEqCh@localhost.localdomain>
In-Reply-To: <1816957.tdWV9SEqCh@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctNjZkYmQzM2YtZDViZC0xMWVjLThiZTctZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDY2ZGJkMzQxLWQ1YmQtMTFlYy04YmU3LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMTczOCIgdD0iMTMyOTcyNTA2MD?=
 =?iso-8859-1?Q?AzMDU5MjQ3IiBoPSJlRHR1TUg0eGE1a1hsdFZ5WlZCUHAxdUwvSGs9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FFb0NBQUF2c2pRcHltbllBV2hkY3dMdzlIVCthRjF6QXZEMGRQNERBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBRUFBUUFCQUFBQVZJRXZvUUFBQUFBQUFBQUFBQUFBQUo0?=
 =?iso-8859-1?Q?QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0?=
 =?iso-8859-1?Q?JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFH?=
 =?iso-8859-1?Q?a0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQV?=
 =?iso-8859-1?Q?pBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0Iw?=
 =?iso-8859-1?Q?QUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3?=
 =?iso-8859-1?Q?QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQU?=
 =?iso-8859-1?Q?hRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03315cbc-a4fd-4962-a0ff-08da37e14d1f
x-ms-traffictypediagnostic: SN6PR03MB4448:EE_
x-microsoft-antispam-prvs: <SN6PR03MB444832EC7088CCBE5CAC34ED99CE9@SN6PR03MB4448.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cMcVbImY9Z+IwT+gkDSZJdkmHQSHNT52YpZBpQ6mzwhU8j8rjji0YlknfzEnthPp+1Ko9QKHQJCsQOlcX89O1mR4FX92TRUhemN0P9xTG77GxRMiPJvgJcwc5VuZCcsfsEFsnJio3ZLApUowoyfLGFz456WHYuS3CrCNoQf6vecIA3jdr6OyFU3EPhyTL3mRVY4Ij0VSGL8FPMATBn5M7fvdshAISsYlB0CA+WobzAcS66tKSfEmhdRHzK+MfB/hiSCJvDHmZo4OhF6rrR92F0AcLLOEw2LyDswo7rZYLb40RFN/PoVKYh+fJISwImC1mW0e4s/E/AmALb0t9cNqnRYJekoiHd6pCrrSXcuKEOuiCalr5Ln5+EK9Xl8Kb2eMyNjd3aV5Cc+JByDBBgNEA4v3wFhnXbCjRaAWFZebNsldjR4qfRfJutteEgN8qB5aCQpWgrA2gaM/p14atqNwHVbbiU+9iCgNOrPR+QzG5qzvZDI8gM3he9SYdgqQ7aT6Mw5Kxf+7199PVIOwsSRbt+XruVWlpz25YBLm4w7yefU4UT+kO2u+XjOpqV807X8cT8QCOYrYMA5nByvXeLvsS73UytftLFs8WPQFhvY++Voy1+FPrckUz5OnrXGn23yl2fz2Dk3+w7VTIN8FkN1L9YeY3aDglaiu8lwj/ATM8MejifIs9EWGGX3Q5G3qFWybJWS9Rad5427z4Kvs9UQNUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(8936002)(7696005)(33656002)(76116006)(66946007)(66476007)(2906002)(122000001)(38100700002)(38070700005)(186003)(64756008)(8676002)(66446008)(26005)(9686003)(110136005)(66556008)(316002)(6506007)(55016003)(53546011)(508600001)(71200400001)(83380400001)(86362001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?REcNgAZIDRivGWnRgZ4yfZ+vtusJSPlOQTYodF/7rOw9n2xIWG2dboRwOF?=
 =?iso-8859-1?Q?Scjqb8asAlBX5jkh1Bk4Wkr60IjpuNUQ6VTee5tE1KPvEeMz9YM7Z8v8zI?=
 =?iso-8859-1?Q?EnGt7jpe8LaYZn6SrMTnqopcLArNm8DafAPxH+meh5j0YFbG+mxCrTE1ke?=
 =?iso-8859-1?Q?96AbDVAinFpHvIHXH8NEW9mIrOmybK/HyESSSVqou91pZWGFDiNACCYiSe?=
 =?iso-8859-1?Q?exnqf37BImqgl9BiFFZKxQ4CIkvdRg2WXfWRu8TZdSvg1DOpsQD3sl9tms?=
 =?iso-8859-1?Q?4k8z1GqHyj26FQPvWFLMDpOCH3ufo9Cu3LX1j2TLqXx3tePZYmMzwRTxIb?=
 =?iso-8859-1?Q?wVm2ipwuOL4BMdFYD2vEZt8LgZ5AvRws9Apdn4WwUV8LvHfeatqtKNpV0t?=
 =?iso-8859-1?Q?CTJeXY/q3Q9kWoCeKKvq0YKok1lXgMlxKlgd261Mtz/QHje5+CvHEHoNkV?=
 =?iso-8859-1?Q?eBSAsc+c3CHyn6C31tkrP+g1l0I0wUpWbjsXC3oeO2L2LJ6aMk2k/k1Os3?=
 =?iso-8859-1?Q?diVJyoc0Hz5/r5LYKj1huCT7zbT1Zc1112LZ/QQfE5z/2ZW+nqEjfhkust?=
 =?iso-8859-1?Q?jRhyzYld33R20LY0+CzADFH8Usyvr0W4s+z+22m2ZqG9FVJzrRtIDHfH5R?=
 =?iso-8859-1?Q?Voe1tD+IDIj47e+7tyFV0D45H0ikfHUc8ZhlCFoCzVAQsoHLNvRZFVna+t?=
 =?iso-8859-1?Q?5pDuqEY71AmUsc7LmMQA+PnaI4zY7TvdqFZoSIVls6d/7p28vtuGvSPBY0?=
 =?iso-8859-1?Q?mjJF3gMPiF2JlwtEJYr2G7ShmyioEAQi+IwIFQF1kIrQ0n+HZON2AaWwiv?=
 =?iso-8859-1?Q?Fho6dsH85Mshb5kIFFM+PApHXZjNP2SWOxbWDlXZzQEPHMyR/nhH0waBO4?=
 =?iso-8859-1?Q?vIgP0qcNDmasmrO88Zz+Fhp78vLoUCYZWwTLK5YbTRgfgdBsydaihPK89d?=
 =?iso-8859-1?Q?EO+F2LYs/yPOBMr7aNlU8LSDKn+5xKBri5qcY2sReQEVVtSk8SnuQAebWj?=
 =?iso-8859-1?Q?0e2bcbUSKP5IcHqaNxzBlPhEsneHE9pgaygDG5EQS4z3/x6wiY1Iy2QfDj?=
 =?iso-8859-1?Q?WK5NwkuDNapwZl1MYybKg3xvkO3xk39CTXXnS2r7P+N9WUa7yIDVuvRP7z?=
 =?iso-8859-1?Q?QnVB1yCWdmDh9XraX4aV9UIUtOTU96hTqY0unK4npiA3arp+oa448zD0w3?=
 =?iso-8859-1?Q?+kI7JRCMa4PKF7P5St1FZ4LQnmI+NYrQ8QqJeB+Y/JoWj9ypjSQVJttW7m?=
 =?iso-8859-1?Q?imSTglvfJ//7EGpncrENgFrh2FDtemlKQVHFVW2BXK4offCwpzDYrE3Fp8?=
 =?iso-8859-1?Q?4miRS+fvR0Lw37Bax4RMfaIM9MS+Ts74ccHk9RWN5qYN2LeyuKM9UsRINg?=
 =?iso-8859-1?Q?0O+YJdN3Z/GikTGEwmCbj4SZ0gd6ZXfaF5FNMD3+pgjIl5LjsAAz0iFrAN?=
 =?iso-8859-1?Q?5A/hefMvF1U3DrWbsSrOPQVLNB2LCzAEZNEf6La06TNf9VXW0wirxS1nJQ?=
 =?iso-8859-1?Q?Fg3gAJOLowq4VzFEhnWrM//KAI3XCBOLoyJwsvE7dO83aAx9V1LfB1RfLe?=
 =?iso-8859-1?Q?47eXCuGEtX1m5Shql8K4jwskyC03lPahuzbONy2D5PBD1Pa0Qqz0mWbWD0?=
 =?iso-8859-1?Q?tVrfD3TYMlCyD018cy9CnUHFpFxg6ScQz51yBjd+Gu4OEy/LAKjZRk5DGm?=
 =?iso-8859-1?Q?EJuYadtBKjjeEPJml8ZNLIE5RhG/lj59VLhYjyGn6MrawFuxrhzd4zDvkL?=
 =?iso-8859-1?Q?HVk2gc6KQdd+HTz93xAB5zVwOFCd7N7jWjzL8ml6DYDwRkdRjSSiVfN1h+?=
 =?iso-8859-1?Q?UerxQMcBrQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03315cbc-a4fd-4962-a0ff-08da37e14d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 08:43:22.7278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDsyHp75ojRIAU5L8WfnxjNP0yh5GJNF3bcqg2TfILCSRdy4vsdoonas7c++lhJO4e07OLx3j9KeUtbswjOI9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4448
X-Proofpoint-ORIG-GUID: BrZv7uk8kcEo_xFsJ9k5W9DX8TI4ZLCs
X-Proofpoint-GUID: BrZv7uk8kcEo_xFsJ9k5W9DX8TI4ZLCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxlogscore=788 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205170053
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
> Sent: Tuesday, May 17, 2022 10:40 AM
> To: alsa-devel@alsa-project.org; Sa, Nuno <Nuno.Sa@analog.com>
> Subject: Re: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries
> for pins drive strength
>=20
> [External]
>=20
> Hi Nuno,
>=20
> > Hi Dylan,
> >
> > > -----Original Message-----
> > > From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > > Sent: Tuesday, May 17, 2022 7:48 AM
> > > To: alsa-devel@alsa-project.org
> > > Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> > > <dylan.laduranty@mesotic.com>
> > > Subject: [PATCH 2/2 v3] dt-bindings: ADAU7118: add new entries
> for
> > > pins drive strength
> > >
> > > [External]
> > >
> > > Update driver doc with new entries for managing pins drive
> strength.
> > > Add a table to describe possible values for each entry.
> > >
> > > Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > > ---
> >
> > Just a note for the future. In my previous review I said something
> > like:
> >
> > "
> > ... With that fixed:
> >
> > Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>
> > "
> >
> > Hence, you could/should have included my 'Reviewed-by' tag in v3.
> I apologize, this is my first contribution to Linux kernel so I am not
> comfortable with this yet. I'll resend this serie later today.
>=20
No need to apologize...

I don't think you need to re-send the patches as the maintainer can
apply the tags while applying the patches. So I would not send new
patches unless explicitly requested by the maintainer...

- Nuno S=E1=20

