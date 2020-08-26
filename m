Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D525375F
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 20:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 429FA1795;
	Wed, 26 Aug 2020 20:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 429FA1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598467177;
	bh=dz0P6Mgxt8rW/nrkZWafZcXA50hiUGZxp7RfRfk9+hg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJQAnDzlT3HTy4d1qEFC3XqOyGrFxnHxzl7lwpJ23TsEhCjwMWJKQ7+USa7Mh1Yh4
	 3VA9byL6BlH4bNFJZhgrj+RRncXsJYtBw0fTUBLZFJBHjzsf2uFJkmGMXy4O92AgxQ
	 cExJkG25ud2JSHFMiR/EwmxTF8F+0w7hkbnIgn/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CCCAF80143;
	Wed, 26 Aug 2020 20:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88558F801D9; Wed, 26 Aug 2020 20:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,RCVD_ILLEGAL_IP,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27EF0F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 20:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27EF0F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="kqBVNg1d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfLnDEmpdk8reotpQh2cXFAtCRoJo7dOhpbRr4c7XfCZ/INlfrEem2ppaG5Mmdi9LISy3zLQ1Gn1bhboIHKV89/ONpjXQuo3geq1dLd5IciV1tgPxQ6u3QRQgWcIZ5uye+ATMC3n3fPHON80u+SFWjDaJWAbKqw9jCtJuEXCUTxLIH757tHcY8elM/4ysPPeruPzmsoxJBPgE5H696Lwd+CTATVDE17zdGnlUPlPDHSfHVzSU26KDdrz54DVBnUwwbFffRh/+E9Utn9XlJvZjbqslFrK2dXW9IHMtyGxh+OuG9w7AFKIMOQzmCNd9dplYZeOdcTvw3CywSmlsq/jIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz0P6Mgxt8rW/nrkZWafZcXA50hiUGZxp7RfRfk9+hg=;
 b=Ia/w7xMd/GpXSRrl+JdY0O6SbvbTwyA5aUEThv1afj5sgCjk0UDvK+BQCQl/m6L+naMB0NA5vv8mn6Hyp4wXN6a4SYt4qv7RyE5ZZ1fwe/r6vXdR/9Bjjyeekcm17VpOCtleKz0JfdawahzDYhX17DJDOnRdbYZgY0X+fWGojUQWbyqxXyYqk8JNJVT5QF4DlaeluQBVd3YtDreqiL6d0mcDR+JUwrRRnnR2MQqNB16O+V99JqQ2eHED4ISgmwuCIR/U+kZg/xe4kCahozeXgyQOGeM+O8umiGDFqmstCZap4vQT5Vu4N4YO0W8pWBXIUAT1SUPjwZe02BgO0Juxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz0P6Mgxt8rW/nrkZWafZcXA50hiUGZxp7RfRfk9+hg=;
 b=kqBVNg1dGN2INNR3FQNNIFXQ1lyZyqkRduwI2R1zNs5KeVCChMOEYzKDJcRsB6y4RTjD/53Mk1u/76b763iRAdJ30MqMt9wxg9IEGZoYT5jbH5diNDMGZaHKmRrMDqpbcRl567U111zGTWbIxmbQY9bN3fecndj+zbO/RUf+3bA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com (2603:10b6:4:56::12)
 by DM5PR12MB1321.namprd12.prod.outlook.com (2603:10b6:3:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Wed, 26 Aug
 2020 18:37:39 +0000
Received: from DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c]) by DM5PR1201MB0188.namprd12.prod.outlook.com
 ([fe80::4df1:4ad8:38cd:128c%7]) with mapi id 15.20.3305.026; Wed, 26 Aug 2020
 18:37:38 +0000
Subject: Re: [PATCH] ASoC: AMD: Clean kernel log from deferred probe error
 messages
To: Mark Brown <broonie@kernel.org>, Akshu Agrawal <akshu.agrawal@amd.com>
References: <20200826111826.3168-1-akshu.agrawal@amd.com>
 <20200826112450.GF4965@sirena.org.uk>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <09daf99a-de96-f4a3-78fc-62e5871f5cf8@amd.com>
Date: Thu, 27 Aug 2020 00:07:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200826112450.GF4965@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BMXPR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::29) To DM5PR1201MB0188.namprd12.prod.outlook.com
 (2603:10b6:4:56::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 BMXPR01CA0065.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 18:37:34 +0000
X-Originating-IP: [165.204.159.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c4be7be-0346-4ec5-ee86-08d849ef1bd4
X-MS-TrafficTypeDiagnostic: DM5PR12MB1321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB132130DE05B9311B7351B792F8540@DM5PR12MB1321.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HTi0DhX0EGxc3EKL/gbBursMmglNDYl0i46OGW4tWv1HblYTkjywjTUkREjfFRbeok9XLJhgg1Eta7hsuxpB3GKjCSr/qqrpWkgHRWIhSF0m+YowD0qelzid3TANmJl+J/lWsJ91pM7A7V2EqCBh1twSP0Kj2jLbs+kxxeDUBuxAQkGYZb0Z0VewRFIAk6jZ6rayPczMtBteSuatKYJXEP1cFdolK4z4MjUM4/fRiySProg+dvJPyhW8cEom51HXAqBAyT5WVQjHJTUNStAjqYgwfFo5E7tEOzMLPuhH7+3C0rLhMnBbPZTWl0mcn4O/J9JRS5AL5SqonZzk/39F2eRGtTufKP36PwKrvQ9c5BFrL69WY9takaH8N6J3nbrk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0188.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(52116002)(2616005)(186003)(316002)(8676002)(956004)(16576012)(8936002)(66946007)(66476007)(83380400001)(110136005)(66556008)(4326008)(36756003)(15650500001)(6636002)(478600001)(53546011)(4744005)(5660300002)(6666004)(31696002)(26005)(2906002)(31686004)(54906003)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MDR6/CFklsjxTL5bYV00to/31yIrH0FgY1Tj3YkLGDgSQSuXks8im835VgS+fYnezWYpiF2gk//6be/2m2HgtYfoYm2naOB9gH+PoHegpCvXEj9NuyhrdgdSTovaVosadgAe2G4+VtFTCoF3OkbBTmYNmkyWIPNRAgIox+6SLIdISoW46qHTpm4Plg60n2ruWaHT26uiVgfZWPtsY0Je84a6hEET/WKYp6CEKQvkcGmjjUhKnCu0NH/+zDYGFhrCS+ensG582ludK3pYVGT1qj1wmFYemogUGfRljE51rpW1N3w1n+08gl/RPuPfsdH3AQziFdLOCqJhWTg5qgbieHfXUrAI3QjRH8tS2Hb+1qgGQyRl1LPbSW+Lloq9ZHAuYRbomc9j8BDZTxoyO8d5nSvdmdAh2ioOP+GKgbNK0KvOiP5jcCQAHt/kQtWK+ANyhdyKkVN/GEk83hnkoM5nZFZINNieYZWGYILmdWCz4zc5js7SZegqw2m+DTggox2oeEBNn1A8cB8O5qItoKLo69zFGn92V4qJJDdCnmj2ilk9yeVnEHjtDBx86W3XAM44+Z7Rb+GgxIa4V7ocsC37eDTgUxEptD2ivLWceOXIRnCAoMLQw9lmZTf/24oEIs6SdM/Mgmf3t/DvjzjFXbNR/g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4be7be-0346-4ec5-ee86-08d849ef1bd4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0188.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 18:37:38.8964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNmJj/+R/VNzyUdqfc4fYPu/t3m6ftPiuBeJA3VtQyaTncWWSiSjuCybxbByE4vRrIRnd/gpYXvfFcio/LiAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1321
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
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


On 8/26/2020 4:54 PM, Mark Brown wrote:
> On Wed, Aug 26, 2020 at 04:48:05PM +0530, Akshu Agrawal wrote:
>> While the driver waits for DAIs to be probed and retries probing,
>> avoid printing error messages.
> This means that if there is a problem with deferred probe no diagnostics
> will be available, there should be something at least at debug level.

Sure will add a message at debug level for deferred probe.

Thanks,
Akshu

