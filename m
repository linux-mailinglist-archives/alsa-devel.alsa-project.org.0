Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92477E43CF
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 08:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11ED91759;
	Fri, 25 Oct 2019 08:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11ED91759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571986511;
	bh=mSY8toxdxXntaoy5QYEh6Dj68seNo3bEY5zSXGECiec=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P9pJ4HFEB2Jjh8Srej1ZtgKzlLp1xIH0fgGtW8KqGNGJ/cgtjcuZ1NvkpmgxVQQ7z
	 SYp00NeQm8Hp9e2xrvMmzS2nD3CRGHABYy6ZeTAyXS4OM2m8CR1QpAWgv6ILXw7OnK
	 vQH2tLUmnqcyJqeaYSXqMLI0ZHW3ZkOd5gfLyVM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A40F80393;
	Fri, 25 Oct 2019 08:53:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F38F8036F; Fri, 25 Oct 2019 08:53:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49AE8F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 08:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49AE8F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KV11r/lN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcCUfSG9yHb180xM5kimbpkljq02z3kFtBgC957FR7to0HIZaHCS+ExSbEBUkf1joV9eWreKT366una/jx2Ae0NV1ngEjXJFvOAabPwdFT0NkeTWJHcT7KcYRAvKoiAEFH0yXGntklLQAQFhW9okXHrP1nQRSAbHGqGx97YS0rw2KetR63S62Zi+yObiAK5/Ttzy9/lu6x52VE/xnQrO59cvU754hWj2Xlh/sGLMH83fqN11BURSleVIiRDqzbdjyO1A3CY+fYaYCl8cn3EuFzO8sntm51NCBlfuITMEy8ExAtguzzyq2ZgBatqxwEyltrBbREQtRHzx9YrSo6aoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exd7Dfy1jMmglV5ISmvQmsGPPtMADuyx39KN+il5z2Q=;
 b=FBcj7UPtick9V2gDB1g3uGQpxzhydK+a00HffykD2lfLwhI956sIPCUAuDJU0ILtkKX8BTIC0Nb1JRFa7+cntYknxqgWQdPbNej4LJCUihHsNwSHiAjubCStQd4yUnM2vBO8mH+OqysmPFKfaa+pDDu7f8nXkj3rT5UQ7aIv5aouM+c7RzJOrrARAm3SL9A/c89gCbi6m5ChIezGW+y6vC81TTPcLtwO2RKUotSe5qUFprW+ha9MKFmW2un3kO/FmysNIsqG2g81Cpdduac9Z9mv4L5izUT/gcVGMe6fXL+SNyWOaxL03MwkTiDf97r7NBDlbEI5pq9QOe+TYSYZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exd7Dfy1jMmglV5ISmvQmsGPPtMADuyx39KN+il5z2Q=;
 b=KV11r/lNed+GSkMMNBE9ycMg4yIEbR4MHGL6TWZkBxhNwQ5wRwM4q6cG7NDBGmPs1+H/Q0h9LhVN4trpavkiIKQcesDGjkHIOk4egGO4UvojEbjjCtzfUmCn0iT8aPqwccYiFKdbqr3dy6WqdxYpT6iGhqF7pXjxW8asW9xEZxA=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB3548.namprd12.prod.outlook.com (20.179.106.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 06:53:16 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 06:53:16 +0000
From: vishnu <vravulap@amd.com>
To: Mark Brown <broonie@kernel.org>, "RAVULAPATI, VISHNU VARDHAN RAO"
 <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 3/7] ASoC: amd: Enabling I2S instance in DMA and DAI
Thread-Index: AQHVhZzAolqgi4GOGECgGk2ZKsfX36dptGGAgAFCkoA=
Date: Fri, 25 Oct 2019 06:53:16 +0000
Message-ID: <3aed0c75-80e7-cc9d-59f9-6ef29b665efc@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <20191024114015.GG5207@sirena.co.uk>
In-Reply-To: <20191024114015.GG5207@sirena.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0130.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d046e26f-bbd3-4c27-1541-08d7591802dd
x-ms-traffictypediagnostic: DM6PR12MB3548:|DM6PR12MB3548:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3548ED02084958C53BA3C973E7650@DM6PR12MB3548.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(14454004)(71200400001)(99286004)(446003)(486006)(8676002)(81166006)(7736002)(8936002)(54906003)(6116002)(81156014)(2616005)(256004)(3846002)(31696002)(476003)(5660300002)(66476007)(64756008)(66556008)(11346002)(66946007)(229853002)(110136005)(6636002)(6512007)(6486002)(6246003)(6436002)(71190400001)(305945005)(53546011)(6506007)(66446008)(186003)(478600001)(386003)(76176011)(31686004)(4326008)(36756003)(26005)(102836004)(25786009)(2906002)(66066001)(316002)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3548;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w6w53aMNZmCbJm9sfwZWjw777vTLBROWNjOmHeeZOlqgLUFtybuOY7BUqb8atrWz3STUmdBfhBju4Ozynlmc+KHSZtxp8DgObP4ukrgfjlgJcWX/OOjWJL+WkcJLjbOCXlm1IDmZ5PPNND4iopTNJqHUUyVRyNw7wAjA7ymXx2D+xaFa+hmjRlXSQtPzIwyKJ0dfEy78AED1AXJy6bDhWVV0RRoY2BidHnmPkHvZ0DHQRjB3r5sV2XDN84R5tigiqA0g0H736vbgbAsOFGt5Cs/dcsrylsmo2sn/x/3p98QYpeE8K6OzQkB5770rZ7XaIAHh3y9fSag5CxQ525d52p9/DYY9u1AT0r6gJAGhQ+ejc9NrWfDE7pBXGHJhjlp0geaCaJOo2AOFx9WHpZoXbJWmK1VIE3/3uLuIu/j+2vGv1bcdtoWDi//PwAYYUi69
Content-ID: <428DBF21486B6E489742864E5A1D9524@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d046e26f-bbd3-4c27-1541-08d7591802dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 06:53:16.0263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAHwRvm9PPZXl479KDGgSpiNCyV92OPRlnoHNGvEx5wICTgwAacX30xDXQ4wjpsiVaoJXX/uPyvrcnc4D7Zleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3548
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mehta,
 Sanju" <Sanju.Mehta@amd.com>, "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
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

Hi Mark,

My inline responses.

On 24/10/19 5:10 PM, Mark Brown wrote:
> On Sat, Oct 19, 2019 at 02:35:41AM +0530, Ravulapati Vishnu vardhan rao wrote:
> 
>> +		case I2S_BT_INSTANCE:
>> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
>> +			val = val | (rtd->xfer_resolution  << 3);
>> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
>> +		break;
> 
> For some reason the break; isn't indented with the rest of the block.
> I'm fairly sure I've mentioned this before...
Sorry for this but I am not able to find indentation.I have tested with 
scripts/checkpatch.pl. It shows no warnings.
> 
>> +		case I2S_SP_INSTANCE:
>> +		default:
>> +			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
>> +			val = val | (rtd->xfer_resolution  << 3);
>> +			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
>> +		}
> 
> Missing break; here - again it's normal kernel coding style to include
> it.I will create a separate patch for rectifying this.Thank you.
> 
>> +	struct snd_soc_pcm_runtime *prtd = substream->private_data;
>> +	struct snd_soc_card *card = prtd->card;
>> +	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
>> +
>> +	if (pinfo) {
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +			rtd->i2s_instance = pinfo->play_i2s_instance;
>> +		else
>> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
>> +	}
> 
> Looks like you need an error handling case here if pinfo is missing,
> i2s_instance needs to be set.  There are default cases but it's not
> clear that that's a good idea, the intent of the code is clearly that
> there's always platform data.
> 
Yes my intention is It should always have platformdata.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
