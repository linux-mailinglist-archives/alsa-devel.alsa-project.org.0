Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4CFCB866
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 12:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16F12167F;
	Fri,  4 Oct 2019 12:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16F12167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570185382;
	bh=hOCBbjF8x0mxk7JEqORsHE9+UrMycAoow02SlxHuaoM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWBvseJSDjHj8vBbO8WcdLIeMknAo7zuwhUfZByBhZRWk2mAWdEcrB57lx1HzBEo2
	 L/XYz0TO3hfOrpOuBLFrV0OlGtiqjhuuMd/2wcbXOPnBtFIM4ihCqJhb4JEPblJvxD
	 Jn6/OD1c2HtTJWJrrRCo9TFqJ5UJC9DVUtk5sJJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 471FCF803F3;
	Fri,  4 Oct 2019 12:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D40F9F8036E; Mon, 30 Sep 2019 13:30:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680044.outbound.protection.outlook.com [40.107.68.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C9CF801A4
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 13:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C9CF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="TyOzhtLL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtMJLITfct0np3fb7z2CHeNf0jBu6PuYQWX6SjcWKdjUp3Pb58KodT0ND5XogKDokukSc4CQoN9QsuIhg2lCLCV33rmwzBgwpQ6/fK1inECDlF2jBdOx0fxvuYveALwciTWYQuRabyKD4hzJzs51Q0uZC4EuUKzRw9OHuhuJ0yDjmS8kTcuDZsdFwQsyymMaqUmG4UpT36cvccVZbDcNdHUpPYGeLJxotyl1T/6q389mpf9dv5uczB8gjzfFn6/fNT7B3BOb0B6Ubf/4SA3WBUooJhEJ2Hr6QM5lICp0pOn/KnkKodpfsyfRcPIPCnDVD94+BcRYbJm42EDJPKJUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbojN2lfElg6G3HJDuMfvgrgTiNtlII0EBDeJEZ5chk=;
 b=afrcuyMB1tdSR4IeYcX6a2oOzITBiPjy9sie89om2OQ6K7Zus767FEjOsax9XAHydI2DmOrCAUyRRWOaMxqtgDuL0KpAA+l3QbRh31cucjYhFYMsjvEqHvsVK44Ui1vJsFzc5Wj5hOB4s3avDgzn7tSght9a7mMXYIwV7gnNrUF6kisSPqRP2kEGSuiaQ3Ni7fXutMwtrAXkF5kb19E9RmxvbkzFwYWL27Fkzt+QZN2gVEAyKYr4bhhTtbU1SgtdXhfDxqg3N3QNC3C5BAD4+1IeAMFfVhmFw83RcWoes5gtA+uGaEAoRiJm18Xgqf+XNjlvOLRBlA3Hb75e8OlzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbojN2lfElg6G3HJDuMfvgrgTiNtlII0EBDeJEZ5chk=;
 b=TyOzhtLLqTY4sOucU3tBIFa/KedY/luuYF0vhYfMLRd0RQ1XyTiX+11pcfbAkW7nJhCjeiMw0uEH+Zw5ie/vWY4R40QrgITLyuRtBTPbOl05zvW+O2CKSk5+YF2uwhB+RTUFBzF5Ai6jmIt0/rl4rzxi3mR6HYScggIJX6mdGnA=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3610.namprd12.prod.outlook.com (20.178.199.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Mon, 30 Sep 2019 11:30:28 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 11:30:28 +0000
From: vishnu <vravulap@amd.com>
To: Mark Brown <broonie@kernel.org>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 4/5] ASoC: amd: added pmops for pci driver
Thread-Index: AQHVdGQibyt3z1lI7UG+S6l0oFutj6c+RpMAgAaL/wA=
Date: Mon, 30 Sep 2019 11:30:28 +0000
Message-ID: <87475117-31f9-ac80-58c6-7db384e805f4@amd.com>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1569539290-756-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20190926182448.GE2036@sirena.org.uk>
In-Reply-To: <20190926182448.GE2036@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fe9a260-faf0-48ae-25e2-08d745999803
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB361050C60A42F5D112C8F7ADE7820@DM6PR12MB3610.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(189003)(199004)(6116002)(31686004)(4326008)(8676002)(305945005)(6436002)(6506007)(102836004)(6512007)(36756003)(66066001)(386003)(31696002)(6246003)(76176011)(26005)(7736002)(14444005)(99286004)(256004)(6486002)(53546011)(186003)(5660300002)(229853002)(71200400001)(2616005)(25786009)(71190400001)(52116002)(4744005)(486006)(54906003)(66946007)(14454004)(66476007)(66446008)(476003)(66556008)(478600001)(110136005)(64756008)(11346002)(3846002)(8936002)(316002)(81156014)(6636002)(446003)(81166006)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3610;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O8E5K04iU3lRbfFLWObxYJ7/whbjkRpMClk7g7zZle3cb0RhzUxHNMCSYsQOtvtiLITmLeM1iyuQ8Ji4C1ibsHQ8+XPzFlAekSGlzIn9/XKBMKmR9iLaUUbjQgr1vre/GblqvP5t7ljKCiWoJuOtR0lGImZwwoc1JBz/jVne4fbIgrtIRC4X7OtKAwvEBHQwi4OgbWqd9l021aIRiyweGT5kgGBNZec6bEkJFw8rjf4MdxjhZILrk870dVAE78T9iyavHxF/13IIMy8um1IrQtbTc0IQU9Ym8RE6P3G8or11dTtsuhYi/amLB/opVqQA1unqjiXDzwLtGE9b9Mv7Zzr7MmahYzKsMMM0AR8Cg5Y/rjrZEPEgqV/TTdjX/WnBAECLQ7YXnsSeN2vTdD3KonW85QILh44LDV5ree+n9aI=
Content-ID: <FCA37D53D0062E4085B2E2CAC31F818D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe9a260-faf0-48ae-25e2-08d745999803
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 11:30:28.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nq46/cnMjrPlZhB85GX2dE7HWJWiMx9fCydTJKXwDgOOqJa2F8vat+mT1M4lEyPVyNZ2ujxinGZADDv0lVnQew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3610
X-Mailman-Approved-At: Fri, 04 Oct 2019 12:34:35 +0200
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH 4/5] ASoC: amd: added pmops for pci driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

Thanks for your suggestions.
Please ignore all the patches.I will address all the inputs shared by 
you and resend them.

Thanks,
Vishnu

On 26/09/19 11:54 PM, Mark Brown wrote:
> On Fri, Sep 27, 2019 at 04:37:38AM +0530, Ravulapati Vishnu vardhan rao wrote:
> 
>> +static int  snd_acp3x_suspend(struct device *dev)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int  snd_acp3x_resume(struct device *dev)
>> +{
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops acp3x_pm = {
>> +	.runtime_suspend = snd_acp3x_suspend,
>> +	.runtime_resume =  snd_acp3x_resume,
>> +	.resume	=	snd_acp3x_resume,
>> +
>> +};
> 
> These operations are empty so they should just be removed.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
