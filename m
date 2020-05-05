Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19D1C5551
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 14:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4DC1741;
	Tue,  5 May 2020 14:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4DC1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588681216;
	bh=M9CZCXWmJshH4M3d5YFnncZOyMrtCgLtos5HqOBRtWY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnVoRAi9Xji14jYksjaFkeSMn6bFlb04L/8spGOGP4SmrfqB3Zhr8fM9kiihhd+sg
	 DvATJbXsrJ3s6fl5/YHKmdsCTyycj7pJIPTcKURSD+0kHx2o3qnQEZ2oyZx1als6NY
	 nPIVtHFmWMtwBIpre5ZyoGcKiiCoxny1hpbPvogI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C925F8015B;
	Tue,  5 May 2020 14:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ADFAF80171; Tue,  5 May 2020 14:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85A79F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 14:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85A79F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="3ybAOoGi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFVHKL8UYx2S3hdRMk8LduKkkpeoaWhXyV4WJAvpWFxBtahVe7a1VCyOrQH5GB3s5XHz5W35Hx4SpCvna9O9Ix6ktyCizv5214a2T/w8Glez6sIzPEPrjazoQvQVUi0mQsJ8GyrMfjM/1FR0PwQO/wy/T4hbiAyh4kqYqWK4Z9n16VcKBMMTCx1m9JCG/9xk/bUoJ+nXTXG+u5InuEw6OlLGBERHiazsqoCM0qq42QsTsd36n9s3VSdEL7jjxLQgRG4U4Q1tRpRUbQszmrzkvxMHO5h8ueagG94yiIqe5L2Be9l7ak/PUGVkdkVIpPDcpvfl4w6+Tau2sXHPqy05Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nREDopNaHWqL64OJJJx2mFFQJVBF7jzjb9j4DVyXiQ=;
 b=Sw20nY52KbD6oPdArtLv92WG/ahhkWgwRtpNnIPHtLLUan//7GcR5I7diGPUgYKzM31UonPP+Jz1pq+J/6kWowsHk+w7fs2nrc3PtPWdenkZ3XvvtVbOCSTQBkm0z89y/wQBcnrsBITXfRdXro0WMV64dVaaBZZg7X4dCH/IxZFwvJecIeZMDTZCQ5l3uWxYIKE73Mfh3OJI9yaZ/oDK3G4ztaiAKALJ/Q3uVTfyEs6e/9l9U842WEqoC9piOF+pf1sDPbfFYd4CGJVPp9sJVFKobJxz/CevXI9Do7rVyhB/E2YyUuSU0VcQAReNSfH3UK47lCXzxITGucA9o9xIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nREDopNaHWqL64OJJJx2mFFQJVBF7jzjb9j4DVyXiQ=;
 b=3ybAOoGisC/Gr+TGkpMfWlfLZ8rm+/XK7avvqAsk/Nsdtp9k5lKgE4WQ5RcpLtRDWLO9ejXpTg4GI1nxxq3gy6bn7OQ2VPZdRNnC2l0TmxsmUx0qu3QkoGuAUoZsLXrzwIRWnnMv8G5Ly5JPo2HvdY0o4OU2tOQGwiuUNOpnFsw=
Received: from CY4PR12MB1829.namprd12.prod.outlook.com (2603:10b6:903:11d::14)
 by CY4PR12MB1894.namprd12.prod.outlook.com (2603:10b6:903:128::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Tue, 5 May
 2020 12:18:45 +0000
Received: from CY4PR12MB1829.namprd12.prod.outlook.com
 ([fe80::19c9:13b7:be47:daf3]) by CY4PR12MB1829.namprd12.prod.outlook.com
 ([fe80::19c9:13b7:be47:daf3%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 12:18:45 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>, "Agrawal, Akshu" <Akshu.Agrawal@amd.com>
Subject: RE: [PATCH] ASoC: amd :High hw_level while simultaneous capture
Thread-Topic: [PATCH] ASoC: amd :High hw_level while simultaneous capture
Thread-Index: AQHWItIMWg9iRfPvy06tXk1BsqOHSKiZYUiAgAADqwA=
Date: Tue, 5 May 2020 12:18:45 +0000
Message-ID: <CY4PR12MB182949DC53DCCCDAC02112E7E7A70@CY4PR12MB1829.namprd12.prod.outlook.com>
References: <20200505114023.251409-1-akshu.agrawal@amd.com>
 <20200505115107.GD5377@sirena.org.uk>
In-Reply-To: <20200505115107.GD5377@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-05T12:16:55Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=15f1766d-3ec5-473c-ae96-00005c6d12df;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-05-05T12:16:55Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 2cac40f8-684a-426c-8c07-00006ff0d09d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 509a71bc-089b-4a36-5d57-08d7f0ee7524
x-ms-traffictypediagnostic: CY4PR12MB1894:|CY4PR12MB1894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB18942E3896C18A4FE080E50EE7A70@CY4PR12MB1894.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WdZH0i3oT84f0McX8EsxBAfQxaLZo2eu0caKN6lL3cby3jYvK/5mnRh8Arm1ajLcvMCIlHGKcahueCWtPOgdzYubjIUGK6p3kgFmzbszSvaktrnjd8FS+NoWFFAgZ2dAa8SaVk7ngwYDGPfeajQDxmqmCNMfO3s8x93M2SrkGh+zMRfzb7W5f8rNu4BFNRuVlE3xWnWmjvQu/+RNBcsX+7Y1KhWbDggiZR2MnHJZqlF2Y6lKbzMNAEOCKG2uCkvu0qZhnYz+sgXBM8f8EOTM6prfa/yBwquLL9YqvNnZnmXjVN1g49H9Qh/oNkB20SwhzcThvYx5JkI6vQTEC82fqz+gSZBtgbcrKUupS/WpZNbW/0bYjpX853mYAtQgAJobYIQKwYtFCJR3LXA3vcoPlwkBos89sAbT1Ccxw11iHN+BKj9ZVRrxXaUyTm78Ckg9TxiME1xwx4Z2ZnAbgVL/pjRsejDBym6UrvAVbOssKAlboyjRLvGP5Hf7CMOL2w0k0JJKP8N6PMOzE2qo8ikTYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1829.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(33430700001)(55016002)(6636002)(71200400001)(4326008)(478600001)(86362001)(33656002)(66446008)(66946007)(66556008)(9686003)(66476007)(64756008)(76116006)(7696005)(5660300002)(2906002)(110136005)(54906003)(53546011)(8676002)(6506007)(316002)(8936002)(26005)(52536014)(33440700001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yFqFJz5OvstrqYB5BQok9/54eu+CMdKEBLdrH45zFT9TzlaWNm/LMvob1G1faDr3PJVBoAB2JQgfEp5DgEF3wjoANS+3Bst/AoaZQ3Ox4DRSCPvqNOtWeG8DKFmczgiAruG72UPMrIFCGQ+Z94R61RUIJ8mIRIKQUl3mdZ2jeDxJF4Vuo4NJDsskbelgaT//8edGBAidkS1cMJzxFu3sTQT3ezubx8g2h3C1vd1ysaC1vqeskfyopGJB+q0KxJNMsDCwcy8yvp3swwEOEEjdmeJokndf77qPqgU1Jj0FvzGVQLG+42byQnhqh8lt+8xctKlnXX4ixUHEWEFptMPPo+RZBYgKkJNQtthpuBuGcEODOGcxnfCKdlh5QIHuCf5VO/iGpETw46JRtbvTZFH408i9PQppuKfnt/32P+F8JjsI1Fs5RTltzilkMfuwlrusKmO9UsM4dJY0EUQKztNl88QK3Excpc6MQhprcjnRzrc9gGMCqrN9Xt++W2GVJeKkbkCGTBpUE1wCQhkT4W3tWTWRN3257XyRBuy9A7kO/L4jXKguI9RRLMMH3R+HKPv8nTg4+0MM/Usn3wvE//CVJDxnKlE4FP4vB/hpZir6drqvRxAJCzFSmhMTlfsGS4TL0m0fXKvsNR6brLeq5P0AZRIxc+p7dXkpQfSypNljB1yVFbXuXjr/V3nplVWGL3ni7Pzk+iQ/4FWE6u4N9l4RyAZCETIog7cDSLZF0rOC9xLy5Obms2v5c54jd+jbF7OcJIswHBAu3c5qMlRBAIRWLSGGu/hNfz5SlG9nLJ7wBSxtDL0O79t5GGEOueCe2PXS
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509a71bc-089b-4a36-5d57-08d7f0ee7524
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 12:18:45.2455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZq96CCVLwzAYOJavwpo8yG+/LyF6whuQQ7A08RyvK7WmMPkiDPyY5aLIAUf7TSatcANsDOSV4+4VW/Hx1jBLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1894
Cc: "moderated list:SOUND -
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>,
 Colin Ian King <colin.king@canonical.com>
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



-----Original Message-----
From: Mark Brown <broonie@kernel.org>
Sent: Tuesday, May 5, 2020 5:21 PM
To: Agrawal, Akshu <Akshu.Agrawal@amd.com>
Cc: RAVULAPATI, VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>; L=
iam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; Takas=
hi Iwai <tiwai@suse.com>; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>; Col=
in Ian King <colin.king@canonical.com>; Kuninori Morimoto <kuninori.morimot=
o.gx@renesas.com>; moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER M=
ANAGEM... <alsa-devel@alsa-project.org>; open list <linux-kernel@vger.kerne=
l.org>
Subject: Re: [PATCH] ASoC: amd :High hw_level while simultaneous capture

On Tue, May 05, 2020 at 05:10:20PM +0530, Akshu Agrawal wrote:

> Simultaneous capture on dmic and headset mic is having issue with high=20
> hw_level being reported.

> Issue Can be reproduced by:
> arecord -D hw:2,0 -f dat -d 60 /tmp/test0 & arecord -D hw:2,2 -f dat=20
> -d 60 /tmp/test1 & cat /proc/asound/card2/pcm?c/sub0/status

What is a "high hw_level" and how does this patch address it?  As far as I =
can see this patch reorders some of the initialzation but it's not entirely=
 obvious what the issue was or how this fixes it.

Actual issue is :
When we open one capture stream on one instance lets say I2S_SP and then on=
ce again if we open other capture on other instance lets say I2S_BT while f=
irst capture is in progress and when we try to read the status of both runn=
ing instances by below command cat /proc/asound/card2/pcm?c/sub0/status
we observe that avail_max is being doubled on first opened capture(I2S_SP i=
n the example).

This is because our previous implementation was like when any instance is o=
pened it gets initialized in dma_open irrespective of on what instance it c=
alled open.
For example:
First I2S_SP called opened it initializes both SP/BT capture streams irresp=
ective of on which instance the stream opened.next time I2S_BT called opene=
d and it initializes both SP/BT this corrupts the behaviour .

So with this patch the stream gets initialized only on specific instance wh=
en ever it gets opened calls hw_params.

This rectifies the issue.

Thanks,
Vishnu
