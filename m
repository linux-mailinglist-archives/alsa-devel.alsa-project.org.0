Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00264E4812
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B6017AD;
	Fri, 25 Oct 2019 12:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B6017AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571997812;
	bh=AH5vUi0gCYDOQnHWmouqiHnobXYFnmUdADgVMRibtQs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNZDN0aTD/7/Ez+wgWRuUoE1LJX3yezFdedCrXhMqhlywQqrG1zIQ8JDWoMSjYs8v
	 6dZlzhn/wTPvPL2+R6ukSVLwScBrF82EybryWWsf8yLjo+A0M1EfAJwP961hBu544i
	 d7dSVLgUvQ0pLQdrmXAP79hP8/Sr/TMNxGp4sqt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A88F803A6;
	Fri, 25 Oct 2019 12:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E55BF8036F; Fri, 25 Oct 2019 12:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820087.outbound.protection.outlook.com [40.107.82.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 260FFF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 260FFF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="v0x5JvxI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUVZeMlrMP8HN7lw3rLA4wryym2gUvCQHZ/oKKFSLDGvrskgD1VHBkRbvbchR2qXHoTNB3uLEM44/sSyXYYSQJ6+F9MblsXqDGjiIbedx8am6lw8Yjr5Gc6hylN79hmCeVvTWxnt8IWBuMJuZ8UvNYU4mO5u9/YYpX4JbPzK+3AtDGbeHY7BYEte2NHLhzcFDoCrL+PBIw+O2VeeCowCIUcCVfT2YZ/1XHVQX02qptN68X0mXL/YRTDGo+RLY4honrtj8eSX9Iafg0QtBFokQHkmfiHYyeVn03dDwEPHGxdD3MCZND5p7KlgtlcSoqe4HnVHxwj77lLJLX6TWwGf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kIFRxDZooZmBxlM/uKCVXYKKVoAVftKCAlPo+frV+k=;
 b=ACR2hNPMdupPARKznLyy2ClpDjTiZClnfo8jUihFcaw9Rl+INQogNfeKSk4BFyysQ5pA1JRw9ohQ5/GhwwhfKpzlrtanmYYreNQopoAwTwP98zTz7NF6MqMJt3GYzjozwHHTXCGKx47Svxzwjc0BQCxG6HlkZToKDNBnrNVXGbt8rh2ouiuH0/KiOXjuv2VBmTrVppP/19bduVRynxmHw2qsgfCmQ/rfQKYidELm2BN6yk/uZx82FKGWyEHwnc5f70XdnS3XfZvQwhux4FZu0TqlQM9WRmVqfZ+hK+veka14h8fceIyU27G2A0XdKdr6k8r4hD0kPnO2WBmRwKEbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kIFRxDZooZmBxlM/uKCVXYKKVoAVftKCAlPo+frV+k=;
 b=v0x5JvxIEBIIUws7EQhQeC69d///bBhaALB5BMUtiQaXB5BH6p4Rz+UZUSoN+F0KTl8TwhqnjNAfXnoTc94lRSvyEiUcJdcS6QidFhwNAXgqcoLLBRt8Jzhj65Ep2AlrUoUGUj4B+so6Y32tnFUAdRAqn3JSLaPWZJe33IeYlp8=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3433.namprd12.prod.outlook.com (20.178.198.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 10:01:37 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 10:01:37 +0000
From: vishnu <vravulap@amd.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH 3/7] ASoC: amd: Enabling I2S instance in DMA and DAI
Thread-Index: AQHVhZzAolqgi4GOGECgGk2ZKsfX36dptGGAgAGexoD//9ZTgIAAAh2A
Date: Fri, 25 Oct 2019 10:01:37 +0000
Message-ID: <b020e8fe-d5c1-3544-c2b4-79ff4af3f85e@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191024114015.GG5207@sirena.co.uk>
 <3aed0c75-80e7-cc9d-59f9-6ef29b665efc@amd.com>
 <20191025095537.GB4209@sirena.co.uk>
In-Reply-To: <20191025095537.GB4209@sirena.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR0101CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::28) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 643451a5-8e62-4a07-8ae5-08d7593252f4
x-ms-traffictypediagnostic: DM6PR12MB3433:|DM6PR12MB3433:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB343395E548C73C989EA3A510E7650@DM6PR12MB3433.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(199004)(189003)(4744005)(6246003)(25786009)(486006)(305945005)(31696002)(36756003)(81156014)(6512007)(8936002)(7736002)(14454004)(4326008)(478600001)(6486002)(186003)(2906002)(256004)(66066001)(316002)(54906003)(6916009)(3846002)(31686004)(6436002)(6116002)(64756008)(2616005)(66476007)(66946007)(476003)(5660300002)(11346002)(66446008)(52116002)(76176011)(8676002)(81166006)(446003)(26005)(71200400001)(386003)(71190400001)(102836004)(6506007)(53546011)(99286004)(229853002)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3433;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xaDkaE/fcGaBHJql/q02987q3VfmoPNXRBZ7nU3kIcW+Vhgq5d8oNKN/NpI1I5lzTvTNLgUVHPBuUiHJgx3GIsXJJNyPP8HKwpxSiPwC84xwaaOsqoYjIODPZYYVx961+yX/6dD8Mq41mRqa+2K7Vy/DVNYvxqh+rSN16w9J9BP2AmGUATTP7ulNgXjXrtzQP4+w4IFvm2hcmcRUOzpMRBWeULPvSz3ke66IPUxOL6Qm5ji/G+leWWJXfZnCNEd6kwloohHMShhagMr5cLI4whf/PyXpiA1M9jNdKXrpGRHAtIpewAw9nVm8lbw6kXehXQf9vslDVVLlsoGlUh9TVrg4YbTbOKuyWHJS43JhYTp6imsSfqA4HGoTaZKb71jam9ZpDQqVjgBFBW7yIoS3RX7P8Xr85PXgxbH9D4n+88+BFRWw7R0DZMdI05AYpHmL
Content-ID: <7DE42B7A60651A40BADD3E1F2FAD9C97@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643451a5-8e62-4a07-8ae5-08d7593252f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 10:01:37.4337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THG2jr1CpvOqTNeSUf8lB1KBVcrSPvB4IYDisWNj7foZtR4ChVZ5znL61I895phGUC39LXi4GIvaaK8Zq3gXOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3433
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mehta,
 Sanju" <Sanju.Mehta@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>, "RAVULAPATI,
 VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 3/7] ASoC: amd: Enabling I2S instance in
	DMA and DAI
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



On 25/10/19 3:25 PM, Mark Brown wrote:
> On Fri, Oct 25, 2019 at 06:53:16AM +0000, vishnu wrote:
>> On 24/10/19 5:10 PM, Mark Brown wrote:
>>> On Sat, Oct 19, 2019 at 02:35:41AM +0530, Ravulapati Vishnu vardhan rao wrote:
> 
>>>> +		case I2S_BT_INSTANCE:
>>>> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
>>>> +			val = val | (rtd->xfer_resolution  << 3);
>>>> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
>>>> +		break;
> 
>>> For some reason the break; isn't indented with the rest of the block.
>>> I'm fairly sure I've mentioned this before...
> 
>> Sorry for this but I am not able to find indentation.I have tested with
>> scripts/checkpatch.pl. It shows no warnings.
> 
> The break should be aligned with the rest of the block like I said, an
> extra tab in - you can see lots of examples of break statements in the
> kernel.
> 
Yes Got it.Thanks for your comments.I will create a separate patch for 
fixing this issue.

Regards,
Vishnu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
