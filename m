Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB72E2B6C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 13:10:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83ED5184E;
	Fri, 25 Dec 2020 13:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83ED5184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608897725;
	bh=TOBqz51/aV9sU/8oVilSLrbeWbLXAbJCT4XyebhaOMY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oKWn4mvXocwo0mqk0nDVObZ8z1gKjrxZpctslv3g/7yJ0NLg1XZ1NNa8C9ri6uzSu
	 LxsII9nNHMQ74ZZT7JWbHIdK4+PzHuc5Scg/OZG+k4djTY/sOTg1lXxpEtqZPf86r7
	 PBrorJMaFFmXedYX63H6eSAHlye05T0zvxfZP5/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F74F801D5;
	Fri, 25 Dec 2020 13:00:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75845F801D5; Fri, 25 Dec 2020 13:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750051.outbound.protection.outlook.com [40.107.75.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 560F0F80113
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 13:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 560F0F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="R0X3oH/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVkaGVjpyhfUepl1TrvBVW2SwUZewvQadoxVmuxImrnCGrqES6rtc5N4PwjQEDiebaoz5zlcjYdpkKIHDJSJdVPX7E2G3cLld1MzIXRJq8NJ7t5qowkWLidfQQMVEbOR0xdI14+KnO2sJrD7/N148/mmN0/WP185kTLnbt9m2pIRn421HnHWV0DCtviY5Axb4MBnVFU67W8AKo8xH3jWZ+raZ42h2GmHqE+8w4Wktji2P2MEeAzYRRSARVGk1rPDlQrv6FjnVubblgzkOxv4pKPB3QhTduUE82MvDe5ICigRvuKjDyLu3XymvlcIAhVR5XJGoJcR/96oaw/gV6Sj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPEejCcYrw2CV7aZOf+eq0wuxGeKT0s4qcgh5O8H908=;
 b=kXtD1LyLK9MPPEoA63sx9xCEitrqcdpnjDQo3x8j3WpQB2IsANeJ7nxWDK84HzQo5W45sqgqRdFSLngZ3i/0G48jgSnJ8I6v9DP8wkLFoZbn4RpZ8jEJr6bk/6+2og5cRc3lPGhGRgIDlR5vhX/mL/DTQQ/fGjATjRkNnCU3at7jsKNcBtK4uZYy5Y6h0hWWjjaha7MMjXEoaJyLNildhZ4IHu0pyXmyGhmFy0pP9zQ6LIFe+wI7T7dTu4LkONka5yCovJQTVHR1G29LlwO9JMNC0nWQyC8iEJhm9aNuw7xv5C6YfEbNekwnd9XySdOXxxQ6v4+sDP1O8LpPP5pDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPEejCcYrw2CV7aZOf+eq0wuxGeKT0s4qcgh5O8H908=;
 b=R0X3oH/3kE5GspGXnL4TVft7dffEVtPVwdgwCUGHHzA1J9DGqiBtOxQGCmf3aOqEtgEtlH9BIO+ioRn0C0+JnHtDcn5JQEqxz4p0iDeWwVTeSiApDrcMpyevhqKV6vvSZmzRJX6c08HHYPQc1AL9lwxQwYtPMCeMx1ZwitTlQLY=
Received: from BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.29; Fri, 25 Dec
 2020 12:00:10 +0000
Received: from BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::85f7:5dda:fd88:66ca]) by BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::85f7:5dda:fd88:66ca%7]) with mapi id 15.20.3700.028; Fri, 25 Dec 2020
 12:00:10 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: amd:Replacing MSI with Legacy IRQ model
Thread-Topic: [PATCH] ASoC: amd:Replacing MSI with Legacy IRQ model
Thread-Index: AQHW2FsA3CWx9R9NY06vjMrX9p78MKoDKQiAgASPs8E=
Date: Fri, 25 Dec 2020 12:00:10 +0000
Message-ID: <BY5PR12MB42927599598886F949586107E7DC0@BY5PR12MB4292.namprd12.prod.outlook.com>
References: <20201222115929.11222-1-Vishnuvardhanrao.Ravulapati@amd.com>,
 <s5hmty6dj0q.wl-tiwai@suse.de>
In-Reply-To: <s5hmty6dj0q.wl-tiwai@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-12-25T11:54:37.9816849Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Privileged
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
x-originating-ip: [106.208.5.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f1bddbb-a73c-415c-bc20-08d8a8cca150
x-ms-traffictypediagnostic: BY5PR12MB4307:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB43077E3E8F722F6D791F4A43E7DC0@BY5PR12MB4307.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TQFMBLE+WpewhDabWxBcNdC9++9PUzdQzgX2ZPoX1Cq1EsliSdHBU57xsBFrEcKV5C1Ynwqs0m73LO+y77DyQZ84pskFt4BuKUpcqiVseEZHANYJzzi8z2geuJMu5gvlT+KoCM5KiFOK9wdg3Iapv9hNdsE/uuP/pUPuq3SpHOM3HS1zJdbeL1DNF71qEYnAG7pl6d6Sq/Sy/ZW+/Vy+h12Leru+aeFZNCki59gdSwLyWRXZ1E3LN9Iu5EaxAfXJTMmv1zV+Wazm2pYDjoqigmdD9M5cznn1gE3z7Q6yhOuebORT1YmDybknFngU83ZFcMrgzTw7zf7GNjZIe6d5ueUtQc4ZoMfXKuim1ZrDPBlmMRkrIbkUXLibrbsQrNDS0g9Tf5zScZ3yYmanPLfZlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4292.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(6916009)(478600001)(9686003)(26005)(52536014)(55016002)(71200400001)(7696005)(33656002)(2906002)(66946007)(66446008)(91956017)(64756008)(66476007)(76116006)(66556008)(8936002)(86362001)(8676002)(6506007)(4326008)(186003)(316002)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wWiL7EjI2BSvcMjLZS3DCTfd23aMDf9wVcxUAz7y1MJTFDB20GwOthefwZM2?=
 =?us-ascii?Q?PqZWIbNiMXHEnUrxFQmejKdcXnp2aFloA2983t2r4zNdEovUxKDaPPgx3pqD?=
 =?us-ascii?Q?f/FS2KZ5Omhu2VtrotqUJSD/viya+eRIxUKyehE6mbEbyfSvVp1nUsPZEjUv?=
 =?us-ascii?Q?v5LBVtPQxFWT7prfvosdb8aha1l6M0ezy97aXPdS9zwawWFksS59KGPGggOT?=
 =?us-ascii?Q?YkxdBbZcH6lz/wZ9Qa+G6XFNzrw1wdIywGjbomujswubPe+Gm8CKVaqI6eEr?=
 =?us-ascii?Q?jqmkhDcklYNravXgB5wd6O5ckup/yKb8lPbBOoZbg6ey8GxZttpv/bS6ULKE?=
 =?us-ascii?Q?bLbNNed4VtmI+YlRfdfEwt9UUX/7YW8PjCBkyheuAZnHVVPRLW4FxsD26TfG?=
 =?us-ascii?Q?Enu4tC4anZfWhGiCsdo7gkcf8UACsy3LdyJv9yyE8anYRFfrkSnTuIwAaBqg?=
 =?us-ascii?Q?D5/RiHF6Gj5fC2bZo0+2/Fgroscaji0tDv1ui9sEyM0tu4kzHHQ0Vzm8bDxB?=
 =?us-ascii?Q?Hn80/pTzuf9mP8+WnwYXSCKBbQKvq9JFKKvNOF0sY6Ao7vOAEPDD1bKvOWpK?=
 =?us-ascii?Q?wlmp+OHJntuv6OoV1uenwjDVwPEPFnEtILepkeE0VL+l2eNOgThiKMKoeR2j?=
 =?us-ascii?Q?vrk7I85cyRCS1+Ki6AIbOE3avo8603sXPf2IxA7qPi8FcV4hn9u7IcrOmc5B?=
 =?us-ascii?Q?XiprLMBQEf8O994GMJEFOlQKZP+6Vc2pUISqFL3mPVqkNnsAFO5IEyNGFy3z?=
 =?us-ascii?Q?4zGHLsNlsHXF+wXlY4UEF/DdW0hpgnvTPCTrYXbjf4hPD+xPx3s6HlfzlfY1?=
 =?us-ascii?Q?FiUFUL2yGpJHA3svu7l0phI+w3vtDxjA8RXsq6ST8+9q0sY3LfB3jvRhd66x?=
 =?us-ascii?Q?xAIPfyzqSLTa2t8ZHqxaot7b3ZSfi8qca9hTfcKl8V5GANjEOeNPk9chd7/n?=
 =?us-ascii?Q?/woqG5v3qsJCCDrP4+vu8OsZxOzBrLRSKWp2bqSednFVeH//3cizhHRkrgaF?=
 =?us-ascii?Q?Gtad?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4292.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1bddbb-a73c-415c-bc20-08d8a8cca150
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2020 12:00:10.4290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7uZiHyppIrCumfW9oMK5SwxJ+jJMZILVZds3kLDVT0DISvkN1KDTQpyvpLJkil7+zWlsqHHZTkI1Utjd4VQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Agrawal, Akshu" <Akshu.Agrawal@amd.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda, 
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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



On Tue, 22 Dec 2020 12:59:18 +0100,
Ravulapati Vishnu vardhan rao wrote:
>
> When we try to play and capture simultaneously we see that
> interrupts are genrated but our handler is not being acknowledged,
> After investigating further more in detail on this issue we found
> that IRQ delivery via MSI from the ACP IP is unreliable and so sometimes
> interrupt generated will not be acknowledged so MSI model shouldn't be us=
ed
> and using legacy IRQs will resolve interrupt handling issue.
>
> This patch replaces MSI interrupt handling with legacy IRQ model.
>
> Issue can be reproduced easily by running below python script:
>
> import subprocess
> import time
> import threading
>
> def do2():
>   cmd =3D 'aplay -f dat -D hw:2,1 /dev/zero -d 1'
>     subprocess.call(cmd, stdin=3Dsubprocess.PIPE,
>                        stderr=3Dsubprocess.PIPE, shell=3DTrue)
>     print('Play Done')
>
> def run():
>        for i in range(1000):
>                do2()
>
> def do(i):
>     cmd =3D 'arecord -f dat -D hw:2,2 /dev/null -d 1'
>     subprocess.call(cmd, stdout=3Dsubprocess.PIPE,
>                        stderr=3Dsubprocess.PIPE, shell=3DTrue)
>     print(datetime.datetime.now(), i)
>
> t =3D threading.Thread(target=3Drun)
> t.start()
> for i in range(1000):
>        do(i)
>
> t.join()
>
> After applying this patch issue is resolved.
>
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati=
@amd.com>

>Is this specific to Raven, i.e. Renoir doesn't need >the same fix?
>If so, it should be mentioned in the patch >description.

We will send this fix as separate patch for Renoir.

Thanks,
Vishnu

