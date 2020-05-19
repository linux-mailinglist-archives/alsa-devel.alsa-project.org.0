Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6571D9571
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49691759;
	Tue, 19 May 2020 13:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49691759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888433;
	bh=yn0V7NDyWLWFLwouhTBw439EYk1v2fwOTijskwPvHaM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q8N+jJa9q9pEF4aVF8kNxRK7f7I6OHMIWMyWg4Y1WH62aZczoCZm+euAkCXV7Io0j
	 d/qbuUI66plLpkfJSf+VOXV/rGiaScmhye9hNQP0zvNDLKjUvuCyqoVWseHdgBatsQ
	 JxDVWQb6mOPkjhy/j2OQS51WFr+FfsBlk4Htl+ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 440D6F8027D;
	Tue, 19 May 2020 13:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55D1EF8025E; Tue, 19 May 2020 13:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05C43F80256
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05C43F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="h4C7hSki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhrcrPcG3/lSkbSTSsg6JhofP2B1Cn22AhZrzGIm8SgLVDBhXW9mLQpnkw+N0C9I/9A5VskmxTmuJDFw5d9dMxBjnRkFEw0q8BLTbnzvZtYyAznQkI925wWJ8z6ZMJKMbTes1B3fbXuvawtdBDo97SIjw3rK5ZVil+60eBJLl4wLqUMKn22ZRxfqylvUccVn6b8dSvrJG5VfEjI0xowO1CfeHJSQm1zQFqN0+0empd2DhbJLIZcpH8kwS8NOtV0e56XPCxzfnNalr/300tdiJvBvT9M4ossG+hpKMNvfth7Pzwop+g1emMFHj36k67LAI9ShZF7larA3P7PGRL1P5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNtaax8y8sh+ZlFjDtM2mmeb/mJglisrB/vmh2aierM=;
 b=D2bipiTvayS6obt/yiESyFRu6ldi5LHPbq+a94zdesHhhlMt1kH36Ub9RviRByZ1iST4wKLEMMeHn9jzDjmYTgXY47yxIH1D3qF4T+beFGR9EVdjJySCa2N8E0r8EpQId9HKOuvVdqPL9DalEbvRuWOO90TWAYWJU85fv9XzY+uM6UiFw11DDx3KvzbPkRYAtWsw3u0ns40BU7604zOM0fIm+PBREShaJTTiZLkuwFrCmuw6k/turXGMuwohCrqXWrLGgbb/q+hWPHk8lVRrm5vs/XKeTV/ls68S3T/92ThfodU+Mgv+yJHVE74pjfH1fRcayKek3d0fw7BqoxJxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNtaax8y8sh+ZlFjDtM2mmeb/mJglisrB/vmh2aierM=;
 b=h4C7hSkiBIPFAOry+D7tprkT6ZsfHgDC2XgGPrCIvoR3kWaDWXf5Lj3a24QoQvepU9LwucoK3tHb/0wzmJezl0rqH8i0zcXqg93c+haj1llrLOEB1mEpTPD+z72npnwPNefQR6+B54DQ+dw3v24o5CdjUpWoP8Hf4PEqGOG4xwA=
Received: from DM6PR12MB2633.namprd12.prod.outlook.com (2603:10b6:5:50::11) by
 DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Tue, 19 May 2020 11:39:19 +0000
Received: from DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b]) by DM6PR12MB2633.namprd12.prod.outlook.com
 ([fe80::ecbc:404f:23ae:616b%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 11:39:19 +0000
From: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v3 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Topic: [PATCH v3 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Thread-Index: AQHWLTg81U96HHJq6k+B4Uh5l4wykqivSDUAgAABejA=
Date: Tue, 19 May 2020 11:39:19 +0000
Message-ID: <DM6PR12MB2633CE31FB27B8305AC2CD6B97B90@DM6PR12MB2633.namprd12.prod.outlook.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-10-Vijendar.Mukunda@amd.com>
 <20200519113332.GF4611@sirena.org.uk>
In-Reply-To: <20200519113332.GF4611@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-19T11:39:17Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=9f0fa775-2adf-4d82-89f1-0000dd6a8e9a;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-19T11:39:17Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 1564c3a2-bd60-4d18-904d-000059a29a3b
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [124.123.31.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88270498-e9e1-4f03-42e6-08d7fbe944da
x-ms-traffictypediagnostic: DM6PR12MB4417:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4417DC1E118C1CDF070C973497B90@DM6PR12MB4417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WK/aFOYmbpZ5rnc/cLsMarSXT8oj/Vw56mBK8Bd3ksZBJlIQCNw1vpGFwJSvLBPqOjJvCRpULMNdP9krnM9gfhu2vJJP+FDnV7/r2I1o0CvNvOIfF+dKoz5ZzuUM04lTD13IU31v7VRFgy79AzURyF775LrxMZOOkAZVp3tRYu7/fHv2FpDBwsjpnIeNu1OeOZE8tSNFwEVd4q3EbgR8r0ZVEvPvx8G4+qP458bwNrIED80l77sYMIs/3qmox0xSGrTXm20hEiwATggQMtHkJeexNzcnwmdZGo2aBc560COr36SNU0gNezTNa11KiSMC/9L8s3fV7BwKfeM9O4Ly0zYtvg7SXEnzGhCvzRxSEYEce5GBGXFGfsoixp40KKYLo8cdZSmDcPGYmTbdttsXH/FNNUybrJSgm5od6cZu+ILqTFObGwBL+kRLqGklgi9A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2633.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(66946007)(66476007)(52536014)(66556008)(64756008)(66446008)(5660300002)(76116006)(6916009)(478600001)(33656002)(4744005)(86362001)(26005)(54906003)(8676002)(6506007)(55016002)(71200400001)(53546011)(8936002)(4326008)(9686003)(186003)(2906002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: K2YiMUTehPrcNBPabZxaB00t/H/myRWwQZ0sbqEP9DqHR5+kTrz0FeKQ27n92DcB0gwawP4C3B/O/m96YRmF4yQqJh/tshluUy69q6oychGJUqdTmU+nUBZeTmHw1XSDQ/wGguOTK/e/RE2UoedRQbwpXzwrIlnsViZTGcsXRLYxvrLcGDJ3OOOIgMOnGm7Gy7jcyvc2ZvkrVrNtPOnXUoczQRWe5r9o+UYtpoMenhTSWyyAGSS9DiI+omqkKSeX3Z1siKuaXYLkU0D7p1w1XCisLtssawLbff0Qa+Vo0KA36e46/tbemx30yMDlqZg+eTM/MuKrAmqkn8gE3fqX9fM6jmtkgWRrzFKhAHmqERwpTgvVaux+msJZERvQD0KlAzPbh8i8gWdx42MiKInaXAzZBze2GVBx+lRNDxZbct46PBa4z3KWaxyCmIkEZKDld+nkvPCbBsWPYYFsXJ+rU6EiI+GWm8qTJHAUKOKLJdTO6yheh116YBrt/eUpSYTi
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88270498-e9e1-4f03-42e6-08d7fbe944da
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 11:39:19.6211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qJTRjJCFxLui8jx8OnytruN/F4ENEeKt6yVqG8pyged+uPR4XUbBAvx/Y60cFqJQ9lEn7Yot10sE96RpJ/8Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
Cc: "tiwai@suse.de" <tiwai@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

[AMD Official Use Only - Internal Distribution Only]



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, May 19, 2020 5:04 PM
> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; Deucher, Alexander
> <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH v3 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
>=20
> On Tue, May 19, 2020 at 01:16:59AM +0800, Vijendar Mukunda wrote:
>=20
> > +	ret =3D rn_acp_deinit(adata->acp_base);
> > +	if (ret)
> > +		dev_err(dev, "ACP de-init failed\n");
> > +	else
> > +		dev_dbg(dev, "ACP de-initialized\n");
>=20
> We should return the error code if we fail to suspend.

Will fix it and update a fresh patch.
