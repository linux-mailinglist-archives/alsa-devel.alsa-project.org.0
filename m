Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9B454C0C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 18:34:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0981919;
	Wed, 17 Nov 2021 18:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0981919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637170473;
	bh=GyEkGELBoTodoCBvTYHAcvLr8feCwdWoLSLANlZwHMI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAF7YFmMic48J1peml4if2sStbCywpUoSlSeOotYMNnEtrGMoxPP2vCaXjK3PmRjk
	 VE78OwsF+mWbVXlaHoXX2bZh7rLVojKoxFM7/lJHpJj/AcZgO6WTOTwcoNp5RnP3Dm
	 2MsDsAHxVGiwgU6RY3L112KhXv5yKnQcE+Lx6EN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46CC3F8016C;
	Wed, 17 Nov 2021 18:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90221F8027D; Wed, 17 Nov 2021 18:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D78FF80134
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 18:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D78FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="DGZc7eAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXyTiDWl6jDImhk9fiP73NcAYx4m0uD8HKUfGOHS0NnWYP2X8DBtxAjtSOhCsO1YS9H0fkjj/lmXR7LkbfH9xPmVMoDh0SbVozMmeMscMohnF/EmvvL8h19vNTPlW5gamWf0Ktwq6Cs0+xn1l6hQgS1L+zE9AV8sQoxSU56fFLvi07vdWyMCfbiV7VbkPzzapmnp5eXELKp9naXcGy7hKrRqJ6+Z1RM4gVA9d23+9yPBz0/aOubyt0iGpvGFB9TbykxhWNq8yj921jz9N6liasYZj8AREOr8VmT+1f3OHxUjGsQvAN+Gs9WVK9h49sX7x4oRN4R3Q5arioy2iMTivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BskLdVInD9LmlsTw0QplaX+Eq+pNiNJCsdBUkeuPCKk=;
 b=cq4fekgNFmsvA2hP3Y6y6AUzxGRgEjQRUWQuwHb8DbPkGRmK7lXUB7+IykTGuv8Q5d04dxt6VzIBxG0aipbKenZ+mPAP7NMcB8w3oQjPrXkl0aYoL++arDlYX0C8hwGdrh1TRUuIMpZzSStSmhqsgom+czD0ZnS7qYr+szu68edioJd2erE75OMIEO1JBpFmKbsiQSTjeLEVuTAbp+SfAgcElXcvLIQryC7P+V1ZQ1CxSoiWQTHigQdcr9jrcLavH3klOz4uRUIe7DUH+xFFN2Mic9altPW+Q4OVfWDL9YpQsXxaGSloWgL9tA0rDM/o9MHEUgJqxggqnP+N+jjrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BskLdVInD9LmlsTw0QplaX+Eq+pNiNJCsdBUkeuPCKk=;
 b=DGZc7eAW7jR/jsueV8qJbZRjPhbCTpha+aOxMmKMih4EABgzxH8/InTB3BbbjijCSxhv3OwwnSe4Inh+GDSfc/QvZdtZHFFOeYKpAWD4iwU1r1v0BcIhwVymHmbI4MCnYGTzCvDkpP5d/08UzFGBA0v1cbgRG4wJKQ2HXfekzCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB6829.eurprd04.prod.outlook.com (2603:10a6:803:13b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 17:32:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 17:32:56 +0000
Subject: Re: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE
 DAI
To: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
 <YZU75B2JHbYHy40l@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
Date: Wed, 17 Nov 2021 19:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YZU75B2JHbYHy40l@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0148.eurprd05.prod.outlook.com
 (2603:10a6:207:3::26) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
Received: from [IPv6:2a02:2f08:5706:b700:22bb:b216:ffff:73e1]
 (2a02:2f08:5706:b700:22bb:b216:ffff:73e1) by
 AM3PR05CA0148.eurprd05.prod.outlook.com (2603:10a6:207:3::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 17:32:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4a83e5c-3240-4b37-e5b6-08d9a9f04abe
X-MS-TrafficTypeDiagnostic: VI1PR04MB6829:
X-Microsoft-Antispam-PRVS: <VI1PR04MB6829F7E9AC468F959A82CAD8F99A9@VI1PR04MB6829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjvLkBCOHmhlycjX17tx9Ko8+e7YP9QCywGEbej7/AqKaTnnxfw1bqC22b2q2MaGCTRaHYCEvMvNtyPHEvgEHVEksen/oiLIfz38KGQXPDA//ksxGkjTqCsQqMmkn3CneCgPHtXRoPjcNRXG7tE8Nk1y2xEY3+QdrCeCIzfPi+HI6i289+hqBwux7A8Ny4+NJQVxbzRJO9Q4XDtdSxY0ioiuObP3d3Qf0nMGsNDqDRAPfksw0QIMURylFMaRVOTa2CevvDnr7fySGoHPQO+vcGOuYXiJfkH6ecUc+8dCi35P7Q0eSN/hBWg444kTSJux+Ati53HZcrxELC1aRLOxDZI9eAtll8+nMyj6IIcNhhTRchv3GuNqWkm75THhlnIsV6jKHgPvVaN2W1aGevJtTj1bcAFdCZ7fXUXB4uYti4hDjcGw9Cw+b1+zJ1m6WaM1Y1HlwmtGpTKZOo8gHpzSBUkDP2C8B5aRirTeyllabnpRCSzdUqzKmAUBxY9BEn/xGJcC9T+fl/MpGtHNcqRA0QI0Y3bU/MqD4HH5LwVs+65qXdQxmv2XoHhlAlysWbfwweUPt8dxX4WTfO7oBz6/K2VLWgSwQt6LmqhYF29ni84cO7NVS15qwrd6Dzw5aEb1u2RamkHmf2VSClgKW+OTaiUaAtPtLhDfJtVMIj6JoVRyrYM6Xbgmd8QmgHhVG6v0eRcgJKPQNEl9BfkiAlMYdKSZce9Rr/UwDNWtdgUYn3Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(31696002)(7416002)(8936002)(110136005)(186003)(66946007)(54906003)(86362001)(83380400001)(8676002)(2906002)(6486002)(36756003)(4326008)(52116002)(53546011)(508600001)(2616005)(44832011)(316002)(38100700002)(6666004)(5660300002)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?/COlH7rRjMXjxDXndk+td7TN2Bo/pZncI0oQtrg37S6Zs2s3ehPCNiWF?=
 =?Windows-1252?Q?uawNuD7KkpWEJTu7KYi1x7ab8HOFD/04NGbGjWXYfA3cV1oMHQKL/8fm?=
 =?Windows-1252?Q?SeyEowT/fe3CKmRtda1stpnmPLajFWb5ZSkDia9WtieKgWtVXC1wp4vW?=
 =?Windows-1252?Q?tw7eLlFNGiqmcdOjlBpLnq0rxDlpoHrCYc66OMjcy+sFsmUzHFQeIadE?=
 =?Windows-1252?Q?bLcE1LaGKwxF9xK/S2ks7jcqgFmsFPWYSGaJUdixhS7uyUpbpwp4IGYJ?=
 =?Windows-1252?Q?arkOeqmib3bajmEZFlKDCs+YcSS4eteYkyjO3XKUQ9rU+rZtiaMaZluM?=
 =?Windows-1252?Q?R/911aA17CGcxOzVlmQCkLd3InqarsNalWVuCyeEY8Judfzs+H+vxwuV?=
 =?Windows-1252?Q?D3G9xe1QOZ/tWAtfMjLpy0GgvNLQ9D4e/W/BkPeXxg/XkBe5dvk5GtsX?=
 =?Windows-1252?Q?anXU+DyllZZg7l0Cx51WMSAxiuKWTghGgd+DlKB6XQ1i0zd61s7tzNdR?=
 =?Windows-1252?Q?uwcKUh/5MKu/iXdz6wBfZQua4vseceocxbefD2tOt3CqaKkJr9XETK91?=
 =?Windows-1252?Q?HNxI4WhWmM6XAWkfYp10VlOFYSEV17D4XxIXI5j+JELemSNUKrpH92FX?=
 =?Windows-1252?Q?LDRze2Whzai4BmZ9mtdUT8fHJMzKnfkxy8+dc7f/rLIGPymrsV52ubup?=
 =?Windows-1252?Q?cnJ9LQkGYvvB8r/k1JxatthT/j4TT9VaFO5UVLgwQ6cUYf0a3nA9Voli?=
 =?Windows-1252?Q?pT+wWkTriFAdpSP6NDPGohNDuxrFcywO5wv4LgpaTwahDJh1jYM8iWL2?=
 =?Windows-1252?Q?3vaCc9uAC/ScAd6mES64tyspcvfMIANDpIkAIDJJzpdNwcoubW+9Bodg?=
 =?Windows-1252?Q?G4mLrRvzdRqGgJGHCC2YHAMPbrgH2uzJXjMv+40n9qLBpyn3yjK+epdU?=
 =?Windows-1252?Q?Yuh/kW57LmrisKsnAyOyYIKag/ULr6EReRgqmTdtNYx4zduCYi8y2sUM?=
 =?Windows-1252?Q?id+LgICopzMV4ZLAivxjcWvTEAAYfbZVBzIvsvUtJLf3JWpbfZCwT9TW?=
 =?Windows-1252?Q?h4ImPg/OPe4Xmo0ycFYvuLctk3UR5dttAJjMg6s5D3+ZBYT7UJhb3mYY?=
 =?Windows-1252?Q?m/+ZTe6y47LhQID7lVGzyo5y3RUfmSS0Ik92IKi9RkHTkW9vgWlnYfFr?=
 =?Windows-1252?Q?pdHQnrIELxZcXJWbu7RFYrll73OdJtfbizKWobgC9Et5cJPkr5NwObeR?=
 =?Windows-1252?Q?s54n/tmfSCBwNWQZ6fofVMEpslfeiUtNaKgr+1YnYZBmKt/kQ0pWCk35?=
 =?Windows-1252?Q?C7J8DE9bdJ513LSVfR+LEYWZ+HxZ5mcClpM0OfE+tGkVzYgI+9hJQRrd?=
 =?Windows-1252?Q?ekitaNm64thFcWHJZdAxaWbEaPqUKZBHfqlUCgz7FuJmX6QH3a9Ys5UX?=
 =?Windows-1252?Q?MqkrXi8YjPe+hrTdebNxpaPadREC559kfOsA+6MromIeytbI5WO4Mg68?=
 =?Windows-1252?Q?XY/xuW0DkMRSRiXDUGQGh7z1EN9O1dngMQDS7U+1Ceuvv9x0DBmwGFS/?=
 =?Windows-1252?Q?WRfx3my7ybf2Q7dsCXaxqjdaHP2CVQT9xN4DPxGZDu++An6hpT61lsiD?=
 =?Windows-1252?Q?3x/cmbeBfJiqv3pKfKqDy+M/+cOGi/niCBoq08Ey+HSNoSIxcVRj++J0?=
 =?Windows-1252?Q?DLQNXWpmMN8h0UPI1mEljL3LiCuJ6T2CdXprnnfVc1BVTOolbGQmt9bM?=
 =?Windows-1252?Q?vms9W6MPLeuj4MggugMytrKw57h80AnJVqVv9y786jTvhHMx4W6ViXeH?=
 =?Windows-1252?Q?m/IPiOjyAPdisQ1wLjFf/LjqDX4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a83e5c-3240-4b37-e5b6-08d9a9f04abe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 17:32:56.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TlbgliCoj2OVwjXNsjcGMEmvxTUNr38miIOavckEq0LRt9lv9vlw9mT8GKVGlBR3YuZoaFGWO2ZPlJDypKz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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


On 11/17/21 7:29 PM, Mark Brown wrote:
> On Wed, Nov 17, 2021 at 11:37:29AM +0200, Daniel Baluta wrote:
>> From: YC Hung <yc.hung@mediatek.com>
>>
>> Add new sof dai and config to pass topology file configuration
>> to SOF firmware running on Mediatek platform DSP core.
>> Add mediatek audio front end(AFE) to the list of supported sof_dais
> This breaks an x86 allmodconfig build:
>
> /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c: In function 'mt8195_run':
> /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:207:2: error: implicit declaration of function 'sof_hifixdsp_boot_sequence' [-Werror=implicit-function-declaration]
>    207 |  sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> At top level:
> /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:201:12: error: 'mt8195_run' defined but not used [-Werror=unused-function]
>    201 | static int mt8195_run(struct snd_sof_dev *sdev)
>        |            ^~~~~~~~~~
> cc1: all warnings being treated as errors
>
> _boot_sequence is added in "ASoC: SOF: mediatek: Add fw loader and
> mt8195 dsp ops to load firmware" which is later in the series.
>
> mt8195_run should be either global, a static inline or not declared in
> the header at all.


YC,

Please send a fix for this on top of topic/sof-dev. I will take care of 
the squash and resend.



