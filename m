Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD41442F0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE921667;
	Tue, 21 Jan 2020 18:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE921667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579626882;
	bh=764qqgxdFnTWYVkEmCQxeQR+7qM2GsY7mNViICoitD8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tb+1w4pjXz2vH+EpbnH4Hz8uB+GmvqDtm8jrw6Yq7qJlF3dX+HqPLO8EZJSLvHIrb
	 +swDleFKMdT8arnggUPcBEgQSUzB2LGmC1ZlteZGfL2utJ/9+zXttOXTzCoru7VWzW
	 Wufq8S8w4JClm3z1GNb3NDxGe+18nG0WDmenX8H0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 273ACF801ED;
	Tue, 21 Jan 2020 18:12:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9ED2F801D9; Tue, 21 Jan 2020 18:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06436F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06436F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="0aD2SSzx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Chp8lss5oOMDF6raOkr7uYIPB0dIabjb5UKAATcDg8TcM5B7V9SFyuonE1OWCbAgZ0TG7c1MDhRopBcXLkSBpxvyjElpT2hmKY4iGBIkJt1OAduxGoSe5AfSjQk3GZBv2/rzJCJUrW8hE/DZY6jQ71Ye0j5Z4vI7RmtveqDoSKrKd0XjKw1MxkkD7OvnnQHpim7jXuseSCfFAw0YnVk78RBA3aKkzOeFoyfBKweeO1fXnzU4XTtXQDwTDJG0BM6W47muGZVgLN6NyXKPwKjOPCy4M/AiqPuUKOLFn+5hX4rHf3XcMPbMVCpHjVmU+MxGhqwlsMtHxvdfeTVVSCjVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOU36tP50pe71Jbgk/JRKF/FARQCMHJ6ZMUqsy0Ji+U=;
 b=EGJIYGOwdEkh3qGtwPLDVTeTnBRKBrPPnUbQmS1aMzRdcFrKf9jZKUquW5mljXtAt/z35UVYa7sDl5EL0AvWcA2ZWEzU6o0uGgXUEeIjJS0bUBsXk+RbG95zTq25bTCLjxCer83ZoDwT5QS1y7uR12sIOY1nYAj6WpwkGQ8JIt8a6ZifVdFsZYlFraVEYFpGLOxNAFyGMMmmNpzjOKdHYwyOebUcph+Ny6VgZ2lDcStWrTI/hKaA6tkd+1UGxz2gbMckAr/P/lq0Lg3sA9hB7VEjCoMQcImYwRNVr+9LR9Pzv/mo0BivuglAhfYoXQhFGTSNBUK96xjdYwlsw4CbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOU36tP50pe71Jbgk/JRKF/FARQCMHJ6ZMUqsy0Ji+U=;
 b=0aD2SSzxtZrTypNI3zQ5JS4JqYwMOIEkddl9RZKLZs0HGwl/efMMc2HjSLuJ0MZUL0XaTtg6d7gUURqwv/gqjvyHpMhZE3KAnC8dSIlgrsv7cOlcLTd0jMplzZJoV+CQepcC8QYXAzlVsYRL7QUCLZkaf3uU0uLNzxzEnHDeqFA=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB4282.namprd12.prod.outlook.com (10.141.8.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Tue, 21 Jan 2020 17:12:42 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::b13a:2561:f1ed:c80f%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 17:12:42 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: amd: Fix for Subsequent Playback issue.
Thread-Index: AQHV0EfsVd5C9JnYNketUgdMPFpokaf1V7WAgAAAa9OAAAIIgIAAAGDU
Date: Tue, 21 Jan 2020 17:12:42 +0000
Message-ID: <DM6PR12MB386893EE3876B51B35A1787BE70D0@DM6PR12MB3868.namprd12.prod.outlook.com>
References: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200121165925.GH4656@sirena.org.uk>
 <DM6PR12MB3868B9744A40D41450155534E70D0@DM6PR12MB3868.namprd12.prod.outlook.com>,
 <20200121170811.GJ4656@sirena.org.uk>
In-Reply-To: <20200121170811.GJ4656@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-originating-ip: [27.59.140.138]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27fbe79c-6a7b-4e2d-a83f-08d79e952074
x-ms-traffictypediagnostic: DM6PR12MB4282:|DM6PR12MB4282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4282982B306B07B6A46C3D17E70D0@DM6PR12MB4282.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(199004)(52536014)(316002)(26005)(4326008)(55016002)(478600001)(2906002)(33656002)(9686003)(7696005)(86362001)(5660300002)(81166006)(81156014)(186003)(8936002)(54906003)(8676002)(53546011)(4744005)(6916009)(6506007)(66446008)(91956017)(71200400001)(66556008)(66476007)(64756008)(76116006)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4282;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t5pEx9t+JmEQGy7AG01Afdyon81Ga6kc6zwJqhGtBsXaz4iDLdcEl76tDL2z0DxdX6OjDOXFSQ3ZZmAFOw5T94SOfrzUgbGOsBaYFbwkMKmsPijRlxI5zIdujr7A0oA4+q2JqPnZqAIl4Rg/6ylIRVZ9EJrgsvaOpiON3QVwHyV68qlGGycPC43n5EYkQf1pdBvNug07wuFOHYJN8yqQDKj4uivyjlnxpIXXxRjk2Pj1gXJaz2H3YxI5cif6cO7HdLke67fPQlqFkfPrnARUpptPfOcluVSkIIllej2RMu3IzUnw+IHr7pM0a2600df5HB0fY8ufC/OhXf4zoTvXW/XTGzdoUgMBicJM5tT4G582ebMM97N1g4fU+/mCyWhNqnCx3t5qVMH1WdR56gfui89X9WAg9hh/7nQHUJC4QNgdMei6k44qXYP1F3TRi/gI
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fbe79c-6a7b-4e2d-a83f-08d79e952074
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 17:12:42.6207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HEE3/dF8YODmwKZMYFN/s+8G3wqUVwFer08g6ApRuq+oqilt9O+THbaQhoZrbSmUT2fIc5vQ+9wQPGcGqNxfsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback
	issue.
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



________________________________
From: Mark Brown <broonie@kernel.org>
Sent: Tuesday 21 January 2020, 10:38 PM
To: RAVULAPATI, VISHNU VARDHAN RAO
Cc: Deucher, Alexander; Liam Girdwood; Jaroslav Kysela; Takashi Iwai; Mukunda, Vijendar; Colin Ian King; YueHaibing; Kuninori Morimoto; moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...; open list
Subject: Re: [PATCH] ASoC: amd: Fix for Subsequent Playback issue.

On Tue, Jan 21, 2020 at 05:03:43PM +0000, RAVULAPATI, VISHNU VARDHAN RAO wrote:

> > +     kfree(rtd);

> This free looks like a separate change which seems good and useful but
> should be in a separate patch?

> No Mark,

> That is part of the fix. please let this be included in this patch.

In what way is it part of the fix?  This at least needs some sort of
explanation somewhere, the changelog at least if not the code.

When we play subsequently we hear last played sound for moment.kfree clears the structure.

Thanks,
Vishnu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
