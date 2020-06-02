Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417E1EC177
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 19:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF7D1663;
	Tue,  2 Jun 2020 19:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF7D1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591120731;
	bh=GWgb878NFSllOJNKmsPO0s023JKve7Z4dVm1+ONLykk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ee4eSIvbgYvBtMsxAinpYK2NsNzqKLharEiu6jWE3s9eJUwq6qjLm2/VlE+ItAmk/
	 raO0r6D0wf0UAEllQoxOQS0zpwt333QotPtPu/6hMFkvtsoOpli8Aa6WaUGQPWnauU
	 OLMTzTBheeoZEQMgqppW21AO9gmUYIkcuAw+A6Ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76963F80272;
	Tue,  2 Jun 2020 19:57:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 669B3F8026F; Tue,  2 Jun 2020 19:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D30BAF800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 19:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30BAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Mt7256ih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLmsr1VngJgCXJzVJeH+CDbI1/k12XNxP2B88LuWACxmA6nPG5jjZIYoz7PDU28jAYCpEuoIqpOP3CtMMh7xVenPV3iCm6Xt709T6UGnQ+nDSfRqsGn3Wazxy/RH4CCBs9cgbAQ5UKTuP6ViI18RXlSBfxXZ1WL46y+StZCx5KD31KN4RMuEkV9EUulbzOc0/Phhm69L76Du/A1YiUMATMf9VNwM9wGjzPCQMygXuVLUh4VrQ0sOrvJAQCTu9UN9t+7cMK1snqtljua0sWParm6Uy9AbnfokSVchb06Jb62ctrGbyR7ImIcaKDSYRAFmiFUz3kCxY9npUVGm0+XcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWgb878NFSllOJNKmsPO0s023JKve7Z4dVm1+ONLykk=;
 b=MRCLB044LVj4FNM3XLB02xD9lFylUAxa4kCdUtOOGqXT0MMb2HYybuhKkLsyQ6wgbW1xW8Q0ipIXvmZpyenq9g4XLNSzTR9ftBLuNFBqSUpEjeleL9LRbMd7978A+Vx90sRGyQFN7xh3j7U9ckes3dO2pu9iEWbPkV2g0dyYRbRRalS5Pf/23831Fa4kqgSgu9IE1a/w45GQKXR7iyzqwp1A2ec0R8jtmwHTsyAkssn2+UgTQsq3QyUoG4+1GknKMewtFrgW48nCqMfIucMWY3gom+0LyvArkRHUuUKdiSvFnkTFL9/6OqEsLSQPTiuaY9tr1YvGjQWV5f/dbokdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWgb878NFSllOJNKmsPO0s023JKve7Z4dVm1+ONLykk=;
 b=Mt7256ihuJQq4vUKBfzPVDgw7xkzZBOoQnh1kjbHryyfpDeo022rprGjyOZmLitdHRrpsBJR+SSIovXOVtcieoLsg0WQgrZBqzMJnZflNnL7fxpEuTFElFSnysOFZ3jio0tiBK6Sh9ELejRMX/nkLLCueAvGxWCpdcHlxdJDXqc=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17; Tue, 2 Jun 2020 17:57:00 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::f9c2:772:27f4:87e0%3]) with mapi id 15.20.3045.022; Tue, 2 Jun 2020
 17:57:00 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: "perex@perex.cz" <perex@perex.cz>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: alsa-project alsa-ucm : Audio endpoint is not switching  when
 external mic connected 
Thread-Topic: alsa-project alsa-ucm : Audio endpoint is not switching  when
 external mic connected 
Thread-Index: AdY5BvrRuljNhDc2Tba5/nd2mx0uCw==
Date: Tue, 2 Jun 2020 17:57:00 +0000
Message-ID: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Enabled=true;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SetDate=2020-06-02T17:50:09Z; 
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Method=Privileged;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_Name=Non-Business;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ActionId=13a01255-84d8-4f45-9492-0000e3951f7b;
 MSIP_Label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_ContentBits=0
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_enabled: true
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_setdate: 2020-06-02T17:56:57Z
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_method: Privileged
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_name: Non-Business
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_actionid: 45b0b2ee-0dae-4497-a866-000024105b7e
msip_label_f2ed062d-8486-4f50-a4f1-3cce0dd00d64_contentbits: 0
authentication-results: perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0468957-4ef9-45a4-f1be-08d8071e5977
x-ms-traffictypediagnostic: DM6PR12MB4074:
x-microsoft-antispam-prvs: <DM6PR12MB40746EF8E4A8777F35863D99978B0@DM6PR12MB4074.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNQDwk5Lzhy9zPPvY4mcnZyqtTOerAhILNSQqgX7PJ67zPzHCZ96k2ac4MVhzagGpW6WTzyvyQz6h4tVMChIBusZdZkogQRvASKipiEBkATeCAcKkYKv2TFNk8VYvbCaKc2R2tizvAmHU73+Ev7fwiiPYlUxxpjypx8vyDUUiV6aLZ5+lk9M3ejLY6LoqUlYewOidzyv14rzzyYpmJvns+lYn8UswSWsUfAA40hs5lTKNvzV9ktCvgHVhxPA7wiebdGdvMhSAvOncr3xON8CrLbrmfD44eDlYERHLCzyOmvDEb+rBSpNAARDy5XoJiIYtfnCGpe1NHO4Wzrt28RTLw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(9686003)(71200400001)(110136005)(86362001)(55016002)(186003)(2906002)(83380400001)(52536014)(4744005)(478600001)(76116006)(7696005)(4326008)(26005)(6506007)(4743002)(8676002)(33656002)(5660300002)(8936002)(316002)(64756008)(66556008)(66476007)(66946007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wm2Yuu0S3wOfD7kCrO+cQ76N9u/+B+/IOYtZpbiuEAlU8pX5Cz8rjNuEOGFdNi2gUIYX2u+UuuP9XoMlzTcT6B2lWUcjVxbBz+CRaPDrCSFQMCgEjE6ks7v1ulLQtbIDkJ+HFLa5I1hDyTPhjH1SEYBtMVv0oqq1+GiyaquIhhG4t3dsWUJ7KX/1p9jja4rYBrMMxkMxos+dEgiOs8oiuIkAmbMSc0yB18Gg/aphZalzdiE+fcWix+A3/dZ4p/sAGcBYvkqCsvNrY9DNG6lVdRLczme/6EkQskiiCiBfFG6DgcIi5yyue8/g1gkdNLVvBHPKHV5NzCFAdt1OJKzH+MRL1T/dPj5nb5LlL57S1BqdCNcdu9Bcu8RFlh6cDTeTAB/wryLGJk7CtLCBHwGbBLAhl3JqaqKm6Ieumg2NUwDDEXObUlbGVQEgscK+pIHU9I6S496SlV04dXlxdQhnHPbsVtafdxaN5w32DS+Lz8qlf2rvhmcKS6weMo3TR/bw
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0468957-4ef9-45a4-f1be-08d8071e5977
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 17:57:00.3092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+IATTphmHXPkiXgNTgeTlblM/PWnT7iuFGN40K+VJWe+KNI86eoRj0vl/GwZb8Z/ADQP8QnwPNYE8jm2x3qyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
Cc: Hui Wang <hui.wang@canonical.com>
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

We recently up streamed ACP PDM driver for Renoir APU.

Our ACP IP has an internal PDM Decoder block where DMIC is directly connect=
ed.
There are no KControls defined for PDM Driver.

Our platform supports on board DMIC and South bridge Azalia (HD Audio ) end=
point .
By default, DMIC endpoint is used as audio input device.
When Headset Mic jack connected, it's not switching to External Mic.

How does audio endpoint will switch in gnome when external mic is connected=
?
From our understanding, UCM conf file for HDA driver is also required for=20
configuring mixer controls for HD Audio capture device.
Similarly when External Mic is removed , it has to switch to internal dmic =
.

Need help in resolving this issue.

Thanks,
Vijendar


