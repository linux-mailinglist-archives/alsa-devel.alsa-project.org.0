Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD895B68A5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 09:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4EA3172D;
	Tue, 13 Sep 2022 09:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4EA3172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663054016;
	bh=cFpHXrTEL/jeQFRGv73kJyJ+4AcsMtC7E2nA4pfImak=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4PY6NGsFbz+/StkIr0x9I596gfop11OXFpGf6UnhHiZhCvInigP9jRDuDaxusdDe
	 K+hKuo3s2+IPW+i/9lzrJFbSqIHcekSLeYnyxYfD2KFAmzY9Q/DxvKWfS+f1i3e7Br
	 r6QUUOhai+//wCCQUwbQd42Md/IdfqONgGxpfzto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3410DF80154;
	Tue, 13 Sep 2022 09:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED28F801EC; Tue, 13 Sep 2022 09:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2053.outbound.protection.outlook.com [40.107.117.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2E2EF8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 09:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2E2EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.com header.i=@nuvoton.com
 header.b="jYcENjKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPWiuNFwd717mQFaRSjcVzmIXTeB6JFEP96142FBsnkEd9YtMY1fUlCGEg7daTSeZPPtIKphpEarZhVvzvOXeQYhbs6i8gi8OP/eKjkkpt3CSTTgjg5W/IggrZ63UtGbXFEuMGi0Q5G8iexHx7E1XVMmVcx29LkXilg64A5xktY6A6zk4R4lcPOA4PBFGkVgRXltwEcGTCC5M7wghi/DtnVyhVt6K8K+3uiCOpSlPoMy8hAcuHvNntYwpe/WKAM0lB/zAtrj4xoE658P8LU4vi44EueXNVjmZlWto5OkCrlYmG1MsIq0n/XVLE+OLNA2RaIGuBf9TddfnT7nRvwc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjwrjmj41GvoDIWBB9V2CPDHJ6RA0XGdDzDm/8ZRfJE=;
 b=oARYTslg7dztCbx7tMd2YgpxmzVhpU4KeZxO38mU3d/To4O0odjoY/ftlCkyNcJ62YNzJ5YnCAreUBbIHZc8YHSTHhzKRb0aEMS6Mnfm6QGEluT9LzSAeJ8b2yD6/NgiX0Xr7t9bMI0HLuf/fjhgQ5rUbrBIfd+E05yjR2GuV1wR425FFsNATMIyN5DptOAaUtbIXTw+ctFIaleyGS6nTUjrJxHrfdKv3+w+x+a7ehfPYJBVk69aSPD5iaL1CfcRxE5gfUFNu0NPZbD25w7HI0r0tr7MhXGpleJ2ktgVF+hTIY9IRa9y2IKCDs7sMTlLvWXdGmAhzze1ByjCguitUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjwrjmj41GvoDIWBB9V2CPDHJ6RA0XGdDzDm/8ZRfJE=;
 b=jYcENjKBQ3nkRrSTkRFJoaH4HJmhoeZSnP5WnHyLF785Th5dx9rBd8AtuK0GZ5u2+r1bDSMQ5sEgiEQ0nPVygWQs5fl5D6VnPSq2UJgyelnlmkV2Smb3EWRTD2JYsJTVY4yTouTNMMHKQjzlo595rhV3R0Le82o1VRW2un6RUNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10)
 by HK0PR03MB4244.apcprd03.prod.outlook.com (2603:1096:203:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.12; Tue, 13 Sep
 2022 07:25:43 +0000
Received: from TY0PR03MB6982.apcprd03.prod.outlook.com
 ([fe80::e553:966f:5c1b:a79c]) by TY0PR03MB6982.apcprd03.prod.outlook.com
 ([fe80::e553:966f:5c1b:a79c%6]) with mapi id 15.20.5632.012; Tue, 13 Sep 2022
 07:25:42 +0000
Message-ID: <764fb482-743d-ade9-ea8d-8a05be297cf3@nuvoton.com>
Date: Tue, 13 Sep 2022 15:25:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: nau8825: Add ADCOUT IO drive
 strength control
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220912115427.710417-1-CTLIN0@nuvoton.com>
 <20220912115427.710417-2-CTLIN0@nuvoton.com> <Yx8gm2iIsr04r5Fm@sirena.org.uk>
From: AS50 CTLin0 <ctlin0@nuvoton.com>
In-Reply-To: <Yx8gm2iIsr04r5Fm@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To TY0PR03MB6982.apcprd03.prod.outlook.com
 (2603:1096:400:276::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB6982:EE_|HK0PR03MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: fea178d9-d309-4129-bb9d-08da95592a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFchgs9DR1slzquwqY8FG8pWdWbLBd41zNPPKMQSNEvj8AChnBETFYfZ8ctk2z2AK6Mi2Pwh0jjpH6jdxpN5G7tuQStIJ9z6g4bI+vDIJvgd5amWlfI13t/Vs/+IQwoPDeiGXHOYmz0KqRvKl3toYZj67AKfXUSOMMv9REs9mpFqNtXYt10cT78OjPICW+nPN4AfdjNiYyah/c8Lo4xrFXKrodDrsDcepirMuk8k01ERgQ9ssTOQfYq6GaUcQjHH3AsKWyik86d4A2FdTkDgJVC+q5MQRHmq29TAQMqumSgVmCL9Y+QDRtjphS1P5L00BTLSWx1sKmM0uSpEKS0Ns/2iDJUMMNxX7nwEr3espEMXqlJC7a0UaBJDW+cUYquDGMAfUXGdcLrcAYBKb2xL81lTLVcgAQIF7zx7XcUAuVeXFxAwmc+soSp8EhyObiC3KNnUkN+I4XqT3lBnjdejK8TfSa+q5QiJ4QeF5Cd08HwiTVq6buxqogWvDWj5mplr3S0tP8Xtb9UxCYth2Gbt0pT9PEqda0XfvMsCKLfSuAOj18O3V/II6+x+hD5C20CGg7BWdGOuNbIMW843zO1N5Kvl0TzEYk6zKNt2nbBqXYxL6yyvspFDgQ8OD93I1rSvCouvaXwjgA0mVXNEbEKY9mM4QO8PNpBgsCz/+D9KYFOwDwU9fXw8DpDVlWSBVJe9AriDxfReSAveztOKup0NEXbo1PKCiS1mCO+dd8CXtCa7WB29BDCjCCk1qDfWBr1/PtQpn/QLiZDAUWq8R/x2K+MiGAsg1HOP/lqdIT5GthBaKwaV/gBtPJkw96pPKYQwzF03fpUek3jZ0fteEN2xqWs2pFk/X6LiQNsTxstkBV9CtWtjQTw8XgcVIbzZEvqI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR03MB6982.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(66476007)(4326008)(6486002)(6506007)(38350700002)(2906002)(66556008)(8676002)(41300700001)(5660300002)(66946007)(2616005)(31686004)(6666004)(478600001)(316002)(186003)(8936002)(83380400001)(38100700002)(52116002)(86362001)(6916009)(6512007)(31696002)(26005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFkemRFalVRQ2NnYXJId1lRa3RCdWxtSGZ2aUFLWHRZaDRQZTZLb0NvaURS?=
 =?utf-8?B?UmpoSzZmM2dqWkxVNUQwYVgyMzJUdCtRTnNGbWZsRXpPNnQvek96MnM4VEJo?=
 =?utf-8?B?b25UaE5CK1FpaldIZGo3RG8zUEZqRmI1QlB6eDNwQTlVUU9STWZQcFlNbjIz?=
 =?utf-8?B?cVVjTkUyZ1Zaa0MxSUVDYnJudm1tVkZaakFNZ3hMaEtxWTV0UGZmNTdYc1pn?=
 =?utf-8?B?Q21ZVWxLd0RjRlJJeVl0Q1prc1J5Q2dBak5SOWFtc28zVWdmSzRYSnB6ZnJ6?=
 =?utf-8?B?WEdjWlc2c2xQUFl1N2ZOd2lhN2N6UEhXWG9BSEFoQkZhTmQyZjZxTHhUMU81?=
 =?utf-8?B?Z0lZOFczdXBaUnlxNnhodDJ2ZzdJMmxicHlTM3VhNEVjeGNDdUtWMUlHa21m?=
 =?utf-8?B?MjFTM3dpejk3Y2lEVHZqU1B6TmFHa0t1cTM3eGhyaWxPaVFhYkZNM2R1bTBD?=
 =?utf-8?B?cUhwdE1CZHpkMTd0YnZPUjNmY2hpazVsUm5qT0hHbGhqclZENlBjNE13NlRn?=
 =?utf-8?B?RzhEOW9hQ09KbmtrbHJyRmlJd0sxVW0yY0c1TmFCdktuSEJIVmtRMDY5cDhM?=
 =?utf-8?B?a3Z3cHUzYnBnb1U0S291c1JJUVpiZGRYM1U1Rno4VWh1ZXFEQ3ZxUXE4Z0hP?=
 =?utf-8?B?aXI4MFNxYTBjTS9LMVIzTFdyS1BwSlhkc0U2aHFmZytrcS94bExyWmFkdy9z?=
 =?utf-8?B?QkhRL1ZpRHhBWUdOWVpscVdab1l3TXFodGxEM2ZIWVBvWG1odlhTYVJlSnlM?=
 =?utf-8?B?N2ZmQVRVUTRKV2tJb2dNakFSZGgzVDVlS0VHZHluT3lLSHFzS0hzZzJDZm5L?=
 =?utf-8?B?TzZnUzRodzJqTjI3WnlWRkUxdFFycElYVnQ5TmtCUnlDeWlUS3NhRG9iM3lk?=
 =?utf-8?B?dUpVYkhsSGN0bitsSThJcTRoRzFEOWdlVjZiKzQvZWlPVFM0NlFnZ2RFRkRr?=
 =?utf-8?B?R0pDcFdmRGZLakpSZzNHQy94ZlRhTVVwd0JBV0txY3g2Vy9iVUtnY2VHeUNB?=
 =?utf-8?B?WitBekRQUHdKbXZtR1NLNG1SY2Fqa1dVbFJYcTliSmVNdXFtQVB4WXB6Y1lS?=
 =?utf-8?B?RU1qRTdoSCs2cG10SDQxTmxiRkNwRGpTa3V1cGxWVVZETk5xUFd4Y3NER1pT?=
 =?utf-8?B?MWhuWmdmMW9ZdWl3aWlaZDhUT1MyWGZoMUE1YVhrVG9QMDdHVG9wY3duSVlq?=
 =?utf-8?B?cG90UTREck9PTjUvTEJrYy9OSXpnZWt4NlpMTmZFaXJER1k0OGdUNFZvaWdx?=
 =?utf-8?B?d3JOM3RRTHJmS1FhaDcwQlJadkNoaStiNURVQmlqYy9lTHUyWGJydXZySDNh?=
 =?utf-8?B?cGJpRVo3bmNTTjRnNlpvVU8vUXUyNmVvUkZDU0RYekRtdU85MXRWQUtCVkY4?=
 =?utf-8?B?b2JhbDNtY2REb1NNMDFnZlhvblo4U212VTBTMmZsOHZXMGJHZnA5eDVpdTdL?=
 =?utf-8?B?WXo3R0g2M3lwampWSTZxOVljamVSazB5Zjg1RXJZdVVUeDRMVGtRT0p0YnVT?=
 =?utf-8?B?ZU9KS1FaaHE5OG55Q2xvMmdtZHlpdWRodDNoYVZBcUdjVFdVVEVUSG12SzZT?=
 =?utf-8?B?SFJvY00xUVV6dGZRMHdQeGpuOVMybnU0V2xCYUF4WVpCa0JQMTh6WXdyZXRY?=
 =?utf-8?B?ck9NaFBSVGt3c3REbGJNSTVSenRmZXZpUnRKREtBOXF6ZExYUmtxK0dlYUNG?=
 =?utf-8?B?M0RqOEZOeFhVc1Jld0habExKbkw3YVplRzQ5emV6bUxieDBhM3ExTGZzZm9l?=
 =?utf-8?B?cGhMZGorUmRZT25MM2lIS2NQSDEyUVlXM3g0ci91Z0VSa1RjZTh2aWNEc3Fq?=
 =?utf-8?B?dGtEUE11M0JvaWZaQUdTSWMvVi9LL2krOEl2SVdGYXp2eXJ3UFZ3WnFnTWk3?=
 =?utf-8?B?bFZERUE3MWo0b3pPZnJOL29hTGlzdnhTOFVRdHJjMWlVcUlvZkdKSW8rSy9V?=
 =?utf-8?B?ZE9rMGZ0QnQ5dll4VTByYkd1bklRRVVKeUlEcFF0L0ZyT1NkSTV0bVhxWmpm?=
 =?utf-8?B?eVQ2MVE3TGREdTRSMEVoTkw1Sk5YZzhhMTIwZ2h4YUdzd0NTdG1DbmRDak9w?=
 =?utf-8?B?a2pVTzlnWmw3am0ra1l4UVhPVmNCVTNXUWZWUTA0TW1JRHJTZWZ4eGdTbW1r?=
 =?utf-8?Q?3opCANiliUnf9fAiWaf4hCFYX?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4244
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On 2022/9/12 =E4=B8=8B=E5=8D=88 08:05, Mark Brown wrote:
> On Mon, Sep 12, 2022 at 07:54:29PM +0800, David Lin wrote:
>
>> +  - nuvoton,adcout-drive-str: make ADCOUT IO drive strength with strong=
er if set.
>> +
> This isn't the clearest property name or description TBH.  For a
> device specific setting like this it might be clearer to add a
> reference to the register bit so it's easier for people to tie
> the behaviour back to the actual device behaviour change.
> There's also probably something clearer than "stronger" that
> could be used here.
OK, maybe I should change property name to "adcout-drive-strong" and the
description to "make the drive strength of ADCOUT IO PIN strong if set.
Otherwise, the drive keeps normal strength.".
> Perhaps adding something like "strong" would be good - with the
> name I'd expected the property to be a numerical strength rather
> than a boolean.
 From our design, the register just have one bit for this feature, so
the strength just have normal or stronger. Therefore, I use boolean
property for it.
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
