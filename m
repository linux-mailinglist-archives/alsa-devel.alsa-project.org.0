Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666785246D3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 09:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15D718F4;
	Thu, 12 May 2022 09:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15D718F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652340168;
	bh=A5q+je82qgb4IkC5SdiQqdNbTllpPHasd93NuiwrRtM=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hL5cED7M6hPdVKvHadKo5/6GPE52DVprJ4CMM+Syg3zjnsIrQYXPSPUJsOOsPzcvI
	 NBX2IbMIpnJgbTzXpdAsP+JehpATBzDGCZpxmi1v+1tA9i0mDxtqQtatIaAbu5yd0U
	 cKxFa0vQJ4Y44p+n7Ca2cpWddfI4/qyyaacjaLzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FF9F80249;
	Thu, 12 May 2022 09:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94EC0F8010B; Thu, 12 May 2022 09:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFBBF8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 09:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFBBF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="NBAjYnqQ"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C6pxBa016726;
 Thu, 12 May 2022 03:21:37 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fwnp65rcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 03:21:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh1tIIHVSXsJWYuwHWch0XHpdnFjoy1pd6/DK5yt9rKU5y45NS7KJ6XSn4mD4pSwZBOgmmXue/db1JzV5eRb10mIW9U7RMJKDasi7lGVcldFla3UZWi51Mk2hbL6hGmYKQK/WboW9oKL+04kzqCE/iTNxlsdF+bWvY9mZknJkTVXDSz6D7jOgUkt8AyBfioQDozaPiXk1fwzX7PycrrLEYN4R8pCyDbaJsCmeRljG1WgL9jx6bLDopYNzPFVWRUlPF5Kxgh67VPv9nLIHAVCaMMipnLY42NCEzpXGSu/l0WR+aNgbp6fbjQExnzvw17MKXZ2s0fQ9TT4YS/3A7GEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4jRSaWTw8VIzlN1COC8SQMqmuE6oW+B/Gh0xcCK+Mk=;
 b=O4YikED6QbgKfC/mwksFDkLdNRmkXhU9ryck2ya7ZeV77ZRNAJWkZYMWtMFXUs+jMtX2my8/ZfdO4bbcmODJudnrpP4oYPR8lN4kzHY4DcaXe4+f/ghIaQXIJ2qmkR+iN0BiZbESzJ7F/gN2WS1u9BvLHGlfmRUGA107MzEqX9fWuaI+4uI6HVKtcP0n5TRWaggjQliGWe8iIIyPwK6e1CFj73pCDkSAiZ6bTM2VRiJkr7xYjR1V1v7kxQvSBkA+E6FbaC9vhzee0VnqaOrlyMsQmeT+z+t/xtO5bSOPuTSXiggzhmZR1B6NfopbHIBZcbgokyRuBmYXlvboyFlJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4jRSaWTw8VIzlN1COC8SQMqmuE6oW+B/Gh0xcCK+Mk=;
 b=NBAjYnqQmZ3Z+vNwj3scTKSnaLkBQPP/fWEMIp6TolZ2rZWJWC/WP+RBDn2xPjqaZzbLJ4Uu8nSabh9I7Y9GHjj+YBygTahCMxLx/xXlnA5RLvx8Y0C1lfk2fuXYm/Vkx7LVfxHF4OU8U/otHk95ZWrufygVQ00Y19ZI/Pt5Ssg=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by BL1PR03MB6133.namprd03.prod.outlook.com (2603:10b6:208:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Thu, 12 May
 2022 07:21:35 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 07:21:34 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: ADAU7118: add bindings for managing pins drive
 strength
Thread-Topic: [PATCH] ASoC: ADAU7118: add bindings for managing pins drive
 strength
Thread-Index: AQHYZXaoDxmQ+Wfl60iXOd6B+mIn160a1gmw
Date: Thu, 12 May 2022 07:21:34 +0000
Message-ID: <PH0PR03MB678645389C28F7D6D7B97D0299CB9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220511203410.8723-1-dylan.laduranty@mesotic.com>
In-Reply-To: <20220511203410.8723-1-dylan.laduranty@mesotic.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctMjUwYjIwZTUtZDFjNC0xMWVjLThiZTYtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XDI1MGIyMGU3LWQxYzQtMTFlYy04YmU2LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMjIyNyIgdD0iMTMyOTY4MTM2OT?=
 =?iso-8859-1?Q?E3MjU1NDc0IiBoPSIyR3lNWHpmRVZIT2NrOWV3VG1CUXVzbEttbE09IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FFb0NBQUF5QldibjBHWFlBVlNibFFkWGRVMTVWSnVWQjFkMVRYa0RBQUFB?=
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
x-ms-office365-filtering-correlation-id: a7cb64e2-e7d9-4a78-2ba8-08da33e80bb5
x-ms-traffictypediagnostic: BL1PR03MB6133:EE_
x-microsoft-antispam-prvs: <BL1PR03MB613308982C1C33696CBC0B5799CB9@BL1PR03MB6133.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 13J86QliAZCfhs55HsyWAf48YZ9J+kxqLuE5J+0TOjwe/ZD3c3+1CMJACK9qNOCmQfDxpJ7I22NiufUxCx5PpyFmw0+uPw7oRTOD7+unZm38ZVTZ3Zi8f+J5g/M/kDcuzLcahqL6lJSO9EQAqYQar3KtlYYOf3qsjyiS1PBcWyfweJY5OA4X4YYQc3AXj9KsqaU1CrQDCAHXVIt8L0qAq54d+VmYgEXZmM5lcMsiuS8Nc8aD1NVJg9sgmeSFdOR+SACfVjMFKQjY+92NUQw6FCwZbaC/GQRmbg75Q2Em4OJxoPnZBGkIzbPXUhkgt8cEX+5ougp6SVdQaUM+WdbXte0raAFPTpzsxCDNYyk8OMkGktZ2e2swKVIf5izxChHm8rJDkzvcPHp1nFVAzgrbvvIROLUgLsLHNEtPtqhf9LMlCbbmpuHVHCLFCBABe62Yw2jg0/DAG40nya55freaAxOFmdnFZa53uz6HQf8X3m4R20Wr6S6XHYwnYYALb1kfe5WseUMqjPOoKYg9VjecOu9kIPxhTpb4adkRD/sqGWGwT+RJHl8jVusiZriSR9VxLb4DVgUKDNH9wm35OWZVv5NtLrLszJn8tRceTcDOF3oDoPpb0L1sukoB+UEWxCS1PFBtVoHpn81dRxcW0nz/3T1AjNXYUKddBke8UezQRlSIDhPU++3OWPDVDqV2yKmFiZgv6t0dCMFuxJrTbXyQkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(316002)(64756008)(76116006)(508600001)(66476007)(110136005)(55016003)(9686003)(66946007)(66556008)(2906002)(7696005)(186003)(8676002)(71200400001)(26005)(122000001)(33656002)(38100700002)(6506007)(52536014)(38070700005)(83380400001)(8936002)(53546011)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tB/e39aI19tCd4FYm3fPPY0bMBYY2pWUM92TIDO13fXloT9s4A2Wk5weFs?=
 =?iso-8859-1?Q?CDLHMtboAXtJDCFROFCcT+OooL2oL/UWBgYdJMIyHddXu6k/GHweJ1RXtl?=
 =?iso-8859-1?Q?1ULjtPkXEH4Dk3tob2BN+dmVe5DvlpTI9sfwFYvQgBJ4B4VOksd+HW75+y?=
 =?iso-8859-1?Q?JYkODxzCYOHLjC+//Xmyg7ydGsEo6h6vs2WNZcS/p4pG4YYzZY9qnSt1z1?=
 =?iso-8859-1?Q?KIjoZ6xT3FBBtseOXLQli4aclqXfj594zKSFEHOUC9x2sPgq1FCq5zFBuI?=
 =?iso-8859-1?Q?zFNLyfSvgeyll/7mmg1qvc/8uMx0Mb7IOkK9FiI92Ku9SWb9bqFda/Ayha?=
 =?iso-8859-1?Q?3KFGHhGL7rq+wMxu1J84AlKhUOiGiVWRiTIz9ZSt/AGHcQf02QpxHr52AT?=
 =?iso-8859-1?Q?2s+Z9VwcawhetlR+YjehG3LIkQ2K2mRiYSFcx/+KYh7ES7zbTzDr2EOAXP?=
 =?iso-8859-1?Q?pqKb2/3FH6MgGTDSwuouRmnLo9W+N8OhbBT7iCWpOv53RfKDaxnW5QhHQM?=
 =?iso-8859-1?Q?cESmePsTH4/JRa7Z16Vejp/OI5hlEizw+dsSrlAe+J/uI/4lhtxVvVkx1O?=
 =?iso-8859-1?Q?fRASYnivdYmbKlYSrXhwjUpwx0wS5848iaJuCos07WOnpG39HEO+3YhkGL?=
 =?iso-8859-1?Q?QMv2S3GpOJMFwlsLIv0t2aSBzQUZBFZjYAns5/ijJZ6kk++w9EETdR4DuK?=
 =?iso-8859-1?Q?QyeP++2kMUht9S4locxEc+MRpevOou8UDF1mfTxeTZiZoIY3fdq13Pr7w7?=
 =?iso-8859-1?Q?WKgbgxbhHmA+DWcEQQpje22fgWu6KPhQB56rTaNeMoRGMwHSxlZmOqEjzY?=
 =?iso-8859-1?Q?b1sixgpaPVk04HyktaoECtiXby2PIzwCi+bmlGEIbvk8/3rkCQNCcr9Zuz?=
 =?iso-8859-1?Q?NyQSLGlLIEiwvCdQpwkYwVepHJa1RIP279zsRqoMce8C/EEaYejmLXcMf8?=
 =?iso-8859-1?Q?ZgeaitPtlwIzQpIe6zeMAxaS3wbgP3AsUc57xypcp3i5/7Ga4IA50jiN9u?=
 =?iso-8859-1?Q?plEqSI84Ii3xpMzyWf3qAQ83tOTOeRnHhTz4qF6ePOsxYeDXOkfMxg6rrb?=
 =?iso-8859-1?Q?DxDW5fuHKVKd67sDIWvUll/oSQ23h4tUk8+AbdZr/H1t+80W3DUpsEdrGO?=
 =?iso-8859-1?Q?zZUxWHmI2jtgrbcrRkMtE9Bls6p+rfynfbrHRsZ/hAf3DWJKMg9nT7zcx5?=
 =?iso-8859-1?Q?3sac0u9YFgU1iTqQycasSoOAfAbYLIjd5zVEr1CqnVmv1C+aBTjDGTIZ1a?=
 =?iso-8859-1?Q?DEVNOjVgCqZD5IG/USa2l7qDDnVScG1brvDZkVSLZdX9VQVsd2k0xpYkPr?=
 =?iso-8859-1?Q?XxE6VD7v/zMdL51QkoIkCd4PWxBxJqwsGToOHHkkRdKLzzyfTPvBgjEwbi?=
 =?iso-8859-1?Q?nWaMWCoM4+QchXg1niyxRdP/kGEJEPkn53jar/LwgvPck9oa7mM34Qn+xq?=
 =?iso-8859-1?Q?2pOqmRShVwcqxQPjr27Q5/rM04HFbmUWKQ4fU0YZiEkQ8R9ttGg2kOtcL8?=
 =?iso-8859-1?Q?oE3V0vXA6lpkb4jfhA7PIzrrdyzcxEjmJzHoZ6S7yYMTFrkTs3iCLgI1Zc?=
 =?iso-8859-1?Q?DhnrFAjiu8rdvVqYAE3C4RwyIGLGjVQix1mvHrB6CkIuhz0kYBsylbgEoU?=
 =?iso-8859-1?Q?ppCcsjsJ8/oc1MniCtWLuBQ6EqBP7Grqj9lv8RpmJO3KuYnkZwytfEaDy7?=
 =?iso-8859-1?Q?U5Q+8Ef9/K3rZsk7XUWf0T8yscG9Si1ydls2UHtgJryRlXLHVF+TSigLLB?=
 =?iso-8859-1?Q?PjWlbC3Q15lObg/4nUGh91LHbb2RJgZffy5hEpIMFASdvyfJfT1nQFCMWl?=
 =?iso-8859-1?Q?4wozONU2WQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cb64e2-e7d9-4a78-2ba8-08da33e80bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 07:21:34.7729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGrh5i327R3HuiFuJYIrjrmGxgIyZcDyEkQZc4P1rtd5WlSdYiOKN7bM2J/O8y3KPw7HELQT2hyphQqGyUX+QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6133
X-Proofpoint-GUID: ny9wuE5D9xIoYdZMEEj7Zv9Zg1yhnKVq
X-Proofpoint-ORIG-GUID: ny9wuE5D9xIoYdZMEEj7Zv9Zg1yhnKVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205120033
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

Hi Dylan,

Thanks for your patch. It looks good to me. I just have a small
remark in the bindings. Also, I don't think that both bindinds and
driver code should be on the same patch. You separate this
into 2 patches...

> From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> Sent: Wednesday, May 11, 2022 10:34 PM
> To: alsa-devel@alsa-project.org
> Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> <dylan.laduranty@mesotic.com>
> Subject: [PATCH] ASoC: ADAU7118: add bindings for managing pins
> drive strength
>=20
>=20
> This allows users to change SDATA and both PDM clocks pins drive
> strength during device probing according to their need.
>=20
> Update yaml documentation accordingly.
>=20
> Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> ---
>  .../bindings/sound/adi,adau7118.yaml          | 24 +++++++
>  sound/soc/codecs/adau7118.c                   | 62 +++++++++++++++++--
>  2 files changed, 82 insertions(+), 4 deletions(-)
>=20
> diff --git
> a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> index fb78967ee17b..71e8a9ff2edf 100644
> --- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> +++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> @@ -51,6 +51,27 @@ properties:
>        maximum: 1
>      default: [0, 0, 1, 1]
>=20
> +  adi,pdm-clk0-ds:
> +    description: |
> +      This property set the drive strength of PDM CLK0 output pad.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [3, 2, 1, 0]
> +    default: 2
> +
> +  adi,pdm-clk1-ds:
> +    description: |
> +      This property set the drive strength of PDM CLK1 output pad.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [3, 2, 1, 0]
> +    default: 2
> +
> +  adi,sdata-ds:
> +    description: |
> +      This property set the drive strength of SDATA output pad.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [3, 2, 1, 0]
> +    default: 2

It would be nice to state here what's the meaning of 3,2,1,0...

- Nuno S=E1
