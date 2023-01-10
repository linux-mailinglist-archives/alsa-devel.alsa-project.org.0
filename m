Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCD663AF0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F7317E40;
	Tue, 10 Jan 2023 09:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F7317E40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673339093;
	bh=W7Aw5HoRa4NO1Me4yMOT0HuXSGEKd7gncBZ2No5EhSs=;
	h=Date:From:Subject:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Be9B32plqFL7NJZ4iXL09R8txquE3XFB1h9eMgiDvYBhrUv5lmiGISTr4BvU0YAxp
	 vDD7cG+c9dQ/Y1IVxfrpA6oAIlEGl81I/W3vDYoW0BICKBlRFMaYrlkGNnakskyVod
	 TZlXwDuOYjRiMGXcM6e+TjWW8IHQRzcWns1ImX/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE42F804CA;
	Tue, 10 Jan 2023 09:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD698F804CA; Tue, 10 Jan 2023 09:24:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93DC7F804BD
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 09:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DC7F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=1D0SzwHw; 
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=1D0SzwHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWH1FwEl6B920TMBQVgKQxhNnJNAGX8bD6JlYAmbVIo=;
 b=1D0SzwHwbVWyt+rVkdRNHeTVhufk8TlYz1CuSMV/MDyZnyqpwe9f44scFxubdP1KAmoPC5MKIiyuxgbHlgqWCtqwm7rXBVcmfONoqDIaQW0tIkCEgA4hTyMxKuN5UpfJAelm9RO6klOsWY8f6EvyxM+XXaIgVjAOBAYHWohMQtA=
Received: from AS9PR06CA0484.eurprd06.prod.outlook.com (2603:10a6:20b:49b::10)
 by AS1PR08MB7636.eurprd08.prod.outlook.com (2603:10a6:20b:478::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:23:55 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::5d) by AS9PR06CA0484.outlook.office365.com
 (2603:10a6:20b:49b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:23:55 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Tue, 10 Jan 2023 08:23:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8754c4674e03bb30
X-CR-MTA-TID: 64aa7808
Received: from eff62df32ded.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F36BA62D-EBA5-41D8-A6F5-216F1239B093.1; 
 Tue, 10 Jan 2023 08:23:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eff62df32ded.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXWzLSw4wYjQPpTWmJkUzxeo9Uhu95BedpTydXbCJcefx6O9fBqHCH6/IhlT+bEk+IsinehYEO3GSEHra722+0QU5x4d4WbOKIjw1CgR5T+JjDY/W76ofqQpL2FpN2fMQJSc0sjh+rxwpl64Ke/QtDlMOnclwtWCas1qE388f6aevKXilOY6vR7Xc9FhfmWrTyxgYsOWBW9Sd4VLyeUgCVLZEhSi3a+lHXBIqiw4yAxa3WzcJkARpvmr/+WiA4Bu51aaPtbqg3wgeT+5v8EAbjYG24AJkE5yMgHzisEZwULtyVSAtKW9ND7gOEfpKjAVK/ZLj1SntC63vxM17PMAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWH1FwEl6B920TMBQVgKQxhNnJNAGX8bD6JlYAmbVIo=;
 b=jPqd89MUFdz3+pgowE6cd7bSTy7qqSR3m/qH3JS6/nzYnRMZWNv1ouXxy1h/wotklt/7g6s/g5qy50tJCIi5ME14qlPsBYUjjWTKR4S6CpqPf2kTvppaRcEHQC6S3gA2fwJKpgdLeDjC6w7U+YThuRjEikW+zSg5y7V3F7dg6D7iaj6ZZpTX/kFag7kmms+x5co4hcxV95MU/Mm2qAfYiYszqfaTI+pELRQbVrR6ixjv6ByjgyAIOZ7Y2BBx1LOG8lJGIwOspsJYADhNd5dESkgL/42Cmcn42NiQ9FHD37yosK8TyPe+6QVxXoNCF5Wq6EVTZ1sTCHjweNkIf2lv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWH1FwEl6B920TMBQVgKQxhNnJNAGX8bD6JlYAmbVIo=;
 b=1D0SzwHwbVWyt+rVkdRNHeTVhufk8TlYz1CuSMV/MDyZnyqpwe9f44scFxubdP1KAmoPC5MKIiyuxgbHlgqWCtqwm7rXBVcmfONoqDIaQW0tIkCEgA4hTyMxKuN5UpfJAelm9RO6klOsWY8f6EvyxM+XXaIgVjAOBAYHWohMQtA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8954.eurprd08.prod.outlook.com (2603:10a6:10:465::21)
 by DB4PR08MB7933.eurprd08.prod.outlook.com (2603:10a6:10:37b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:23:40 +0000
Received: from DU0PR08MB8954.eurprd08.prod.outlook.com
 ([fe80::f778:5177:a2d3:ace1]) by DU0PR08MB8954.eurprd08.prod.outlook.com
 ([fe80::f778:5177:a2d3:ace1%3]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 08:23:38 +0000
Message-ID: <f0ad7a4e-a8af-77d4-09e4-3717041677e7@arm.com>
Date: Tue, 10 Jan 2023 13:53:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Mohammad Faiz Abbas Rizvi <faiz.abbas@arm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card,plat
To: Rob Herring <robh@kernel.org>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
 <20230108163741.GA30997-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20230108163741.GA30997-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::22) To DU0PR08MB8954.eurprd08.prod.outlook.com
 (2603:10a6:10:465::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB8954:EE_|DB4PR08MB7933:EE_|AM7EUR03FT013:EE_|AS1PR08MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: 200229c0-a35b-47e3-be30-08daf2e4039b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: D7HhoVfmg2EDc8lEMMwZrT+mwlrYVXcp6dYp/H+Y9y8DlJj61+K9gjnHYfQUFYk24KHeCgDXOSckxiBt7QLAaBReYSBHu/+vswa2jy4aru+Gy2HR4jT5eLsv28ioKiBiuMyyUfbAz2TKmkUa9SysMM1LeDEZlzp0kCanP0DkSyvIO51zsI8bMBy+ybrWC1WpIXLtHL4FDf5Jw+s0UvOt1nuE2I6BcwhIaKEXnIGVBVzHBNmWwRUWhoXSYFBHALkXq4S4Omozo0+4XKch7JfjE8CXgWMWWphikOd8RYG2d8aNJWbSNpEWcipu1OeZnhTMV2ivkRsul92fUQej6O5URXT81MWULiX5E/YnxBTeeLUUGKgC1AqHsGd/bd7cPvo2d2wycQ3NCki/+CHytCwsFGu/OpTc1R7fGFB8nd6bqbLOspz/9xv9eI2hX2gFZSYsAilimVNTXjuzs+VDDHcaB2FsDw44Gd9mgUvNl2KnrBxhnPYZwRPDWFl18UVq5SUfe5Kgt5j2rPrT6oFX2qxjKH8Z/gTqf6xe6VOQlMi4LYbeIE2+Ivgan37d9Xcgb5tJLPxYaNNfrZONV/mo0xWcM15hduk0j0wggo17IRijkjoFUlakrwPnIoTC6PGbPPxZQFHJHH2Kk7KDk53aVdfG2DAsX8PV+hj4sQ4AC7zngOv8vKxvQr2pBDEgoeXGVdvWHJAyDitTF1Rd9ZOWvgRw85QzHo52NQEWygHfJIEKAvc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB8954.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(31686004)(36756003)(2906002)(31696002)(38100700002)(5660300002)(8936002)(41300700001)(83380400001)(86362001)(6916009)(6486002)(55236004)(6506007)(53546011)(2616005)(8676002)(186003)(26005)(66946007)(478600001)(66556008)(66476007)(316002)(4326008)(6512007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5f53d1f0-341a-407b-425b-08daf2e3f8d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1UBZz9d/OLQI9u6fnUAdpjCjSk+h+hixh+PT1mz9fnKXPFDfXhov+THyRg9iYzDjJ09lLYWJoKRaGIJMOXnoH4M1Fa9HPl6NHQJoCytFu/sbXrdUdwHfw22eId//PN6H5N7EhsuxH9H5L1CS5vIZVwqZ+6O7DFUrO6lIC+s/hsj57FojO24qTWiWABypXmYC5nsP6n3ncR0pqM8Wz+tSOqiqV2Dfh8xeZ6G0OiQbkFewWLsPPGPOEibe09YsUwq3bKx2TYENhxteX+DPTxyw6VtCMnsqIxQBtZD1Uq3D0R52aGQGTPC9j3dvi7MpojwEQp7bGGAi+qISsLNR1jhSIjuJJJ55LTGKulDBU1XbLGEiwq1GxP7ri2mrrGBRgjvFGVlwC+QX2JwE8vRuxdJNBel1+E+B8tfb9Oe+fUpmLigatngNcg1j+FlFbRwWnJl8gBmvyxyTLs+mYVfs2ODHNBlWQ04qWqEsBRd5QaJEyKVKAvAfjGBGR1K7wJfQujd+NpxhTVNmELAeW6L4wnzc29z6Iud0at2/fC9lLmKhECoTsYLaWcEiexfd9kQUURoiRCDUlvIkOqaPZeDGOst4CBEeIjv1vwlLl1dsEP/6aON6KEPKYW5AWeAJeoLxAHw8iauKJhUGq1jePAT+EjDb5H8bA13n9W6htjU6lCPDa1/Ipu9ujqIbYqHZbgBJlel4KE/rMWXkxN8d+IsfVJUqvTQiv2oTyE+gRHWXXuTWC3o=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(356005)(82740400003)(81166007)(36860700001)(31696002)(8676002)(4326008)(40460700003)(86362001)(41300700001)(70586007)(70206006)(316002)(6862004)(8936002)(40480700001)(5660300002)(2906002)(2616005)(336012)(83380400001)(6512007)(47076005)(6486002)(82310400005)(53546011)(186003)(478600001)(6666004)(26005)(6506007)(31686004)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:23:55.2725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 200229c0-a35b-47e3-be30-08daf2e4039b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7636
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Deepak.Pandey@arm.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Rob,

On 1/8/2023 10:07 PM, Rob Herring wrote:
> On Thu, Jan 05, 2023 at 09:33:46PM +0530, Faiz Abbas wrote:
>> The simple card driver has support for adding cpu, codec and platform
>> nodes with the simple-audio-card prefix. Add documentation for the plat
>> binding.
> Another node, is it still 'simple card'?

This behavior already exists in the driver. I am just documenting what alre=
ady exists.

>> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
>> ---
>>  .../bindings/sound/simple-card.yaml           | 23 +++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/=
Documentation/devicetree/bindings/sound/simple-card.yaml
>> index ed19899bc94b..fa67c76d4dbb 100644
>> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
>> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
>> @@ -205,6 +205,8 @@ patternProperties:
>>      $ref: "#/definitions/dai"
>>    "^simple-audio-card,codec(@[0-9a-f]+)?$":
>>      $ref: "#/definitions/dai"
>> +  "^simple-audio-card,plat(@[0-9a-f]+)?$":
> What does 'plat' mean?

plat means platform. I'll make that clear in the patch description in v2.


> Don't continue the 'simple-audio-card,' prefix.

The implementation already exists. Its just not documented here.


>> +    $ref: "#/definitions/dai"
>>
>>    "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
>>      description: |
>> @@ -285,6 +287,27 @@ examples:
>>          };
>>      };
>>
>> +#-------------------------------
>> +# single DAI link with platform
>> +#-------------------------------
> Really need another example for 1 simple node?

I'll remove the example if that makes it easier.

Thanks,

Faiz

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
