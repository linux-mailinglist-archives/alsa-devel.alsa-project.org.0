Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEBA525D5F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 10:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE37C1AC0;
	Fri, 13 May 2022 10:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE37C1AC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652431003;
	bh=abziQYF4MITOBQBKzr5G5U0GmEQVPZNoK158esnqzB0=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogGVhQWH0l+uE5rLl7yaIazbxYgtGVwPQkYj/PORN8My5askASNYbF9b5v4UNpBkA
	 LOPVlqjlw4iv7C9bd/pp3phGfOczPkNHPI8xFpgIJXmwPNbC5aYEZoMbAMOrydxgVt
	 c6kWtYiRpCmP6C49eS0Mv8TKo8t35ezUcTjYPkdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B327F800BB;
	Fri, 13 May 2022 10:35:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5707F80236; Fri, 13 May 2022 10:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84401F800BB
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 10:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84401F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="lno7IMMI"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D7YuXb012638;
 Fri, 13 May 2022 04:35:31 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fwnp6dstj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 04:35:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hao54yglHPTdXbYwhB6FYGEvy/3eKK2eD653gYb/UaaJIi1qa3ubF6/t7gFhjnbDSWPEs91our8fZTsPkd7t4AJA+PKb+F/hA13C25PmdzjqNMjHPBKuBcIqLcGLDY8xEHVGYxhUClWC7cIy/dklFCejLex6HRT8+EiJAxHUfHIZbkYssUv7K0FeLr3KfmT7JImrE9lK7vRo8r3iAy/1Ov5mSEFFOUaPdqy+L8v1wrgVkuqkHlLtJTnXEgGFHbuOeLm3wAFVUnWiTXMm78nAxQrr2E0bASz+4i7JLBvJ12ZjFLMNzZ2e01m+hWuiXHYuYCZJXslnp4Cnxw6c9CZDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+9ExkGRZbJYrxNd7FH5a92BLrimy+FdPSlmvQ5zwb0=;
 b=V9a29IG+MG9O8aSWidzQ5Px1UXKNQLpKYzxfQREhQoDsbDhwahyKN2AGqv/vowVUqklP51JnsIUfT7Gcwk06A41Qi26AK9ZdAwo4+g4eFMj2gYSKzbXgeDtep4XttR3WVe1DUs5P8B8EhhIsGC/S+CxJtIWZSizOBc8ZHSDWDicncQsyPzX0KUDu/0XERycx1sFZXD1F48/g932eRLQv8HQAUVRYfxjFCzOrjIBp7+hSyr5pw0TCPRFeCAifk4rfQYecrxqVFvq7MrQJw3w0T3CV+q7uKzW6V+MKai5oAIhY+zXUXbQFIBI2dWWq8oNG/ZGO/Bim9rjQakvxD4e7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+9ExkGRZbJYrxNd7FH5a92BLrimy+FdPSlmvQ5zwb0=;
 b=lno7IMMIr4yrSxyXR5FF70tFAdsCpoQN/fzKBEGyccABucIReO+hBnj0BEScERAJxOd9Vvmssefw1oEeMvpFHCz8m6tUYWPVEdndCyZEVb6nhpHc0gQxjQveVMT6aqGgV9Ch0TWx4SJwt+erdg/PBJLvL9L7iv7A5CdgmknmLu8=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by BN8PR03MB4866.namprd03.prod.outlook.com (2603:10b6:408:9d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 13 May
 2022 08:35:28 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::d4d8:c051:a366:8003%9]) with mapi id 15.20.5250.013; Fri, 13 May 2022
 08:35:28 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: Dylan Laduranty <dylan.laduranty@mesotic.com>
Subject: RE: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins drive
 strength
Thread-Topic: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for pins
 drive strength
Thread-Index: AQHYZjSIGr+IcH9UiUCrVadoUKQdUK0cY8mQgAACCwCAABYXwA==
Date: Fri, 13 May 2022 08:35:28 +0000
Message-ID: <PH0PR03MB67865E1B945F9D0DCE5E3E3899CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220512191352.15602-1-dylan.laduranty@mesotic.com>
 <20220512191352.15602-2-dylan.laduranty@mesotic.com>
 <PH0PR03MB678668768F86C5AEDE3146EE99CA9@PH0PR03MB6786.namprd03.prod.outlook.com>
 <44674800.fMDQidcC6G@localhost.localdomain>
In-Reply-To: <44674800.fMDQidcC6G@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctYTI5NTQwMDEtZDI5Ny0xMWVjLThiZTYtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XGEyOTU0MDAzLWQyOTctMTFlYy04YmU2LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMTQ5MyIgdD0iMTMyOTY5MDQ1Mj?=
 =?iso-8859-1?Q?YxNTI2ODUxIiBoPSJEeWZIblJWYU44a3kwNmdOd2EvTm53TlFGMEE9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FFb0NBQUJEcCs5a3BHYllBWXltSjZ1QVN6ZE5qS1lucTRCTE4wMERBQUFB?=
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
x-ms-office365-filtering-correlation-id: 4ac6bc85-bcdf-4143-0bb3-08da34bb88a3
x-ms-traffictypediagnostic: BN8PR03MB4866:EE_
x-microsoft-antispam-prvs: <BN8PR03MB486639D33C5EB9AF2C77A90899CA9@BN8PR03MB4866.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hvNm4rEGb5tQ2UpPygFScOY9PNihjGn8EZrxv0i+jJqBsB68kQN03r+ml8s4lkmw2NOOJQ2oFfSkNZyR8RMpjg37N+mPhRTqd1q70HIV32IHpCXYkrPfG/5UDdShvb2c/DscKP+k0z3/BZbdQWW5X805ce9RqyveniAJMv3upQ2zW6vv+uPKYsKkYq5AbAkW9pBYk5WhwD9P8L5ioGh5FlutSFWeJX2V3W9JNLHnqmVok/Rd82SeGR7jil1LacM8EOyyTt8gryf7uVWvgN4Wcx8A/5HEYHAJASoD0a44xZikLHkJWgraJEi2b8oqzvrXvxeXrsJW6h20FEyA07OrRQ/P5wEm/ezJDfY991fWAdqmxV3VXrXpKl3ZiyRjUVh+EYWu7E7EIlp8hHuzGihSVzctZWkyr4K1F4SWw9ZAOs7bMXlbZ1ZOOkFi1RHiuGLBrLAO4ptm7HEACv9MNdKmVN712uyBojrDl1YcnHTudySkagJ2KGDw4vGkS3uIuoqyQ86woiE+tApPaXiIlZw401BogqHRXFT300ajiEZtf5JF/6ufuJs2qiJ0qA0ctypgttm5XUEk34cmL/cx6UMTn1pVxsdSPTVgkvP2PekUh5nakKNS3Y4cRKNh3vcKs8QY/hBHE35DDyr39Ay72DQYY8hvHEHv5iNn3QFnH8h0xudtyWqRmYDeF1fNhTXZ01o+NRqEHTcTNSGx8qIZKrswHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6786.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(33656002)(66556008)(66476007)(64756008)(76116006)(8676002)(66946007)(66446008)(55016003)(83380400001)(9686003)(26005)(86362001)(71200400001)(316002)(7696005)(6916009)(53546011)(6506007)(4326008)(186003)(52536014)(122000001)(8936002)(2906002)(5660300002)(38100700002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ve/dpNKGugBUi4mWooQIvoWnpEQDmp44C0U4cniqcJyieQpkwKsZFnl+ru?=
 =?iso-8859-1?Q?RNJIPnuq4oXMqWxRK1VmXMvOKL9Yrc1qQE8vSpScdUiA6kYMQS5JNWmRrk?=
 =?iso-8859-1?Q?3TtwTa3Ndtp8eb16TLV2ZpjI1256oc+vj38Zpt3pSBGI3nXlXY7cQRZeNx?=
 =?iso-8859-1?Q?JQDjW8bZR1Ub+g468WRoMg7CZ5vSjM6cSzUUAUf6+micyhz89bC2g1ggQ8?=
 =?iso-8859-1?Q?AO5tPBPxF5EGTIOHwx+lSyDxxWWBL2w/xarQUyGi/uTiHPGdSNRVILcs8O?=
 =?iso-8859-1?Q?vaHQDgh7wGUw8KB6EwFDOg1wKDNHtYdIyMTsyhMDoNb70cYcm9ZWk9CwJ7?=
 =?iso-8859-1?Q?GEXyjqITTA4IL/0oYkxQ7b9IsdXBUZk+T9gAsScLhRZZ3m5Vj2ixWNEDz/?=
 =?iso-8859-1?Q?Xsa5Y9Gv388iQqLu3aQdVLKNw9YhNlSp0be8Bv5EEIxA3NVNEC1u7qGtdj?=
 =?iso-8859-1?Q?pi4bEfSnGl+pihyyTtcbOaHrZXhj9lTuhI4N7sYG5aR9FwWN7pTszcsSS0?=
 =?iso-8859-1?Q?/lBgE6dl7lP9bp71uLNQ58CSBxBQpuxWuRATCyNo4Uf6COK/vqA0q8jrZI?=
 =?iso-8859-1?Q?OCRFloE6oMRfhK3gBMhDIXCnLPSzRbzFGJf5IuFlJvJHl2JYMggupZGu1V?=
 =?iso-8859-1?Q?e8qFCEBRZx0TusJjy7WcwZXHbhKbDVT1lt63IF/Z89nMW44AWBInYA1Gln?=
 =?iso-8859-1?Q?fFSunnCLHtN/aSFBgJ8sCUaIameyyzNsiMrCVWxdXRgpvV+fNYJCaplLzu?=
 =?iso-8859-1?Q?LBOJRd5H1PNbEgmvqByntLj12gFaWUtVoacl0CIiKdhaBkQusW7Yl1x2e1?=
 =?iso-8859-1?Q?z3K4+yX3nnFEsajEwuUIQ90vvCkUGwVhf3IsRhR/gU9FXrF70MJjCPj1DR?=
 =?iso-8859-1?Q?1LYvbPdZKNSbaN2Le0dNpudK/H7Q7pGyMXmHx+pTw+zPD8eixtvz+d0ear?=
 =?iso-8859-1?Q?R4Oz+oymtn1G/WHC3pYfBXY9/ZhJP+omsklUvrAw9HN9tOSx4Soa5LL0zx?=
 =?iso-8859-1?Q?98oVwjErbFxht2JaJES98nKhVF8b50FNtiuecLcn5bOAqwv58qr8KNeh05?=
 =?iso-8859-1?Q?oYc67DE7qA/Fld+OHRru2+6uVB2SAYLa7QLM0+FyHnz7VjII1MUk11zIK8?=
 =?iso-8859-1?Q?mEht/mKQLEYuEpuNLeUka21mUENi/zLz0HnQXgnTrsA6FsKm4JuZMTMW6x?=
 =?iso-8859-1?Q?ZOZjZVP3k6xyZzQwVIuCDMmoUFmj5X+BQYnild2H1qWPvIPuweHOtUaVza?=
 =?iso-8859-1?Q?SXSFCSz0yhEXXQEWYhXr82i9rRwQqwcOjloDi12GEWRHGEat4Joh/S9eFK?=
 =?iso-8859-1?Q?EirsEuQ+x+knQ2azmkTZlJfEM4P2u6bT0jnSBXHgyUCX7GF6ZOacYHxoSH?=
 =?iso-8859-1?Q?Rf8dh/hc4Di9eu3hFO/SBGlDcLt9z7TEjlS+kiEyDqYFtb4/8yPEaeQ0vl?=
 =?iso-8859-1?Q?/lgAv54177uSUUm5EoYOS9AxzvmMKoYahqlnRHaAbuU+BczUgcJqeg27hk?=
 =?iso-8859-1?Q?vbFsu1regpW5d1/zS6vu1q2PhrQV7UM+jsR2Ps4FBE/4uxKE7k53M3+Ve4?=
 =?iso-8859-1?Q?wa6Fju1JNw8BfMn4pPUWEz/m0eplqQWMAyZT4q8FhrUT2IYDp+4E3yZRpN?=
 =?iso-8859-1?Q?ficzFnmNz2vItwgSNzk9qKgo3dFTtjADpKz1T0rUC2g8/uY6j0Rqk9ifO2?=
 =?iso-8859-1?Q?tUxjM4xHxaPY5aSsPn8lEaRw7CNnQ21gtI+yE40LlcXnaPYMxknJOisTVU?=
 =?iso-8859-1?Q?bV9yTIsrowdsjc++kTalOlozAOjFcud5dLwQJf4I9fPyg+4x6oRCV1uM2W?=
 =?iso-8859-1?Q?qvZfOQDwmA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac6bc85-bcdf-4143-0bb3-08da34bb88a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2022 08:35:28.2105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3vc2SVqlWlrFy7DUDi7NgzHFg14vXWXCM2T5VzIzIo/UdFP3DCayHtrbWSlGok3lycTQjc1Ncf36ITllkSKcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4866
X-Proofpoint-GUID: DRAhzLcvaho0gNQ8joXmMmgohruHFNq9
X-Proofpoint-ORIG-GUID: DRAhzLcvaho0gNQ8joXmMmgohruHFNq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_04,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=917
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205130036
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
> Sent: Friday, May 13, 2022 9:15 AM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: alsa-devel@alsa-project.org
> Subject: Re: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for
> pins drive strength
>=20
> [External]
>=20
> Le vendredi 13 mai 2022, 09:08:13 CEST Sa, Nuno a =E9crit :
> > > -----Original Message-----
> > > From: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > > Sent: Thursday, May 12, 2022 9:14 PM
> > > To: alsa-devel@alsa-project.org
> > > Cc: Sa, Nuno <Nuno.Sa@analog.com>; Dylan Laduranty
> > > <dylan.laduranty@mesotic.com>
> > > Subject: [PATCH 2/2] dt-bindings: ADAU7118: add new entries for
> pins
> > > drive strength
> > >
> > > [External]
> > >
> > > Signed-off-by: Dylan Laduranty <dylan.laduranty@mesotic.com>
> > > ---
> >
> > checkpatch will complain about not having a commit message.
> > With that fixed:
>=20
> Oops sorry about that. Should I resend a V2 with a proper commit
> message for
> this patch (or both patches ?)  Or maybe prepare a V3 with more
> description
> (and a commit message for this one) ?

Well, I think you should have been marked these patches as v2 already :).
Anyways, I'm not sure but I would say you should send a v3 with the
changes in the messages and make sure to keep checkpatch happy.

- Nuno S=E1
