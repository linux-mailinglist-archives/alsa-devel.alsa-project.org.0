Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565797C456E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 01:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD78829;
	Wed, 11 Oct 2023 01:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD78829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696980469;
	bh=vduwuL5QslHmxQbVV8DbGDxbqz6wfEERdb8rj1kisbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xx1a01dPXTby4/YXYYAxKCtkcadkvSNZNlMzxNHIH34hxFEDKqyFxJHWyVVFkLL15
	 1fh1sgmq32sdCz+sUpsjGg9VxgflhfHX60UW81dns/rNfOcrQIsDdf942Hx7GjvSk+
	 s4s+PM8xCwi1YkH7yDRfW1caRO3NSMiIWXTUO/nI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C01CF8015B; Wed, 11 Oct 2023 01:26:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E53F8027B;
	Wed, 11 Oct 2023 01:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC676F802BE; Wed, 11 Oct 2023 01:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34E1CF8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 01:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34E1CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ayTC578v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbgaDsEL2RTm8ZUaRRZCoN9cdNhTkoS1Fz+xd8fAE+HakXZhyt/24Hh8RsT0AqN3fR9OnOyOdGtn7AInfNEgTfuH2XycpOXnoMCg/pMOulZwHoeW6AhYV2ej5C6s4LFUfJWbzLQz5fCR+D/Bxw4ShxggVZr1EZ+N0xQ+dVotaszjqVjmLHfaH3RUeLTKTxSemmsaOj/el20aB3Mqx0zPZGYXP36luJxxDp6eK6DA4hSCpKOaTXEk6ddvHCyA/Hx0qP/4cWqzzEABgjzLSdEeT8d6ewU3IZcgj7ibYP10P9hR4TO/pI+tMJ2awUnUJL9l4+ZUpIq/aqbl6aqSKk6GTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rC0w+7HC7LaDqVX0aER8jRIzteEFa98cG2yDTdEYX7I=;
 b=F9TqkBTtT4MfyZlZGRbvJ1TYv8gwgy1fRAOK5L0xDIdC+JDQoa1fjk3FipfdoRIZZ2eR0ez1j37cKHGhaVI1k77r6OgFi8J7UEnm1lklsVUmxVcwm8IHirbumHs/kPUxub+3OmbTfxcSSa7CecLVMyHRuuKZdYLViQ9z/k4UncWG1O/FaZ+da0iSVPD9a1VCvRfovKeM6JAdiYcW/Q3yk9OjN66ZcCqKkWkk72JaiqGqNNXec9vS2YnPquKQLDUqV55UfAGHUZpmtHlHsDHjVxnDRYQJxCzVcqQ7a7UQE63D/yARd34BhwTLrYvf+3TSgU4cpMIwkUHUT/9IOCKghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rC0w+7HC7LaDqVX0aER8jRIzteEFa98cG2yDTdEYX7I=;
 b=ayTC578vBeVfVPwgINscRSdBkN35tYWZsHErwJfj7xwQDwt5dccBaMfnNT0s0RF2hEBwlKvD5pzGHM5vl7WmETNYF4vwngzSQk83StJOobTxA32nKaIJGsSFBekuEeUSa/AYm0iCcu6RPKM1AKw+HcRL39SGs/JyfKeC8H3TjOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5617.jpnprd01.prod.outlook.com (2603:1096:604:b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.40; Tue, 10 Oct
 2023 23:26:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.040; Tue, 10 Oct 2023
 23:26:36 +0000
Message-ID: <87sf6i12l0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	Bard Liao
 <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
In-Reply-To: <9482b3be-7ef9-4eee-8cc0-bd677aa807b3@linux.intel.com>
References: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
	<87a5sr8e7n.wl-kuninori.morimoto.gx@renesas.com>
	<9482b3be-7ef9-4eee-8cc0-bd677aa807b3@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 23:26:35 +0000
X-ClientProxiedBy: TYCP301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b6566e-052b-44bf-99d9-08dbc9e858ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zv2P2mEspKyCZzgeYHsUCADa7G5MFrRWA8vTfJopvcXB1tpq8g41VUzqlTE+72Jn68akjN4TaLVOwD+M5URFRnQa+oqCUmlYJUI8FMarWrenF/MWSwnnuNEkN8Rs/luutHNlQFySVrXpN7ZLNjfFFpNFA2aFM5UQNtSfsDuiW88b2PNnd3kv9SG36hsxG9jQ27oCuK0Vsd1rC4Ng1iQgQO2Ui++A3VczyWpXsnj8lXyRPDlKSDQ7Ck1vzxeaZB40gKQp6sIab4XSztj1hUeJbGGI9eHQQ5Gr8G+sPSrjbAl0p7RxrKLl4gKpG5fTrk6IMHewwWgNVSewlJTgWnuJDT1C039DZeo9JPISYRK3yJDC9l0wI1iMasbwL9gMUfxVjdGWgne+I2CVLUGFPzeFxY5DO7NRGziB7dvCn6aWzsVMGq9sN0mtodJ1WQ+XPngV33oCvVWo3NQG664D1nMN0tx0K1cib1JYbeuONVUmH+LLWhsU9oLTpYgkdpQEuo3VZYyyPfyjlOumKejlERUvqMBdnCrE05tqPsPP3t+uVHY/V5JZdROVOIojJUss1gwvv1ACGD5mST07I2fXGLDtzjT5zzC3un6GDxSZX72vBEiaxUiY/FtjGbdBT9ZzTGJyhEVNzRvMTPOyi6WWKfAfeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(52116002)(6512007)(6506007)(2616005)(478600001)(6486002)(2906002)(83380400001)(8676002)(5660300002)(66476007)(66556008)(66946007)(54906003)(26005)(8936002)(316002)(4326008)(41300700001)(6916009)(36756003)(86362001)(38100700002)(38350700002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tO4VNceYDUBg1ll5vKaTYjNGL8m7zP5nJ3VzdvFQ1ZfRspNM4AJUgRb0/Qm9?=
 =?us-ascii?Q?fXy36lfbRfUNgc/InQ/QamKy0s/x4RXwYRexTKwjm1VSk1NIxYrSVxuMd+Kq?=
 =?us-ascii?Q?/KgzK0Du+cRtuHWk8jhjKRARdbv7fL2rCBdR/43gjBWKyQ9dG7Q4AwAunkZu?=
 =?us-ascii?Q?CsnuM4XEMEMSj3fXe89qarf8X6BPgc7SVP75HW+b3w2MPoreR98YWyr45N2/?=
 =?us-ascii?Q?1NdnCNB1c1sEzm03LFjWsigGw+gzoSIqF9g7L2kF0SbvoDAsHAnfn/WL0PEw?=
 =?us-ascii?Q?vudSwmIuuY247Z8r7jVYG/g0a15Ir2FJtJ3LJB1skLdPxktQT33KfUOhq055?=
 =?us-ascii?Q?MpsRnEUzoRs8ZSya6MmKWd3LwzO6d+VUHnvnFr3r1JFEbJgAOqsH3pDWhIer?=
 =?us-ascii?Q?Hz+hiy29UocsUCyyGxSCHOuz+A45mnqho52gYJqsOxlchTdAAMzqn3GNdgNM?=
 =?us-ascii?Q?tu8p0h2zGIaFgxUcoON9hGFlMURdiNLw76zpBJttElAkAcqj5A8WbVPgVvOH?=
 =?us-ascii?Q?f68aD/98QU+uF57EwhgYbrYfAee0SXF+8817d+WHMotJyT+RCWNyhX+hmE0d?=
 =?us-ascii?Q?G6HYYu6CZk3plXZIV5qjb61rbXdGNbEhqXkjgVNZaHmsgbCka/grzfh0TgmC?=
 =?us-ascii?Q?lwHXzRZcKtxymITgZKXDcYIa9DqJpaO/eo0cCyCz3Nhrk91HWsjvcL1livQl?=
 =?us-ascii?Q?wfsc+7PQrwSThjwYc9swNTvGXN7uT3lluZCwMUKxEUvLjQHR4jAEMdGpVkxl?=
 =?us-ascii?Q?F7CDQCqsZq9DFXDJfV/LSMyZMClsZfoSg8PlwAsOf/4K7Vb0kG/hROH3Q6A+?=
 =?us-ascii?Q?ZuydZGKEURrW0RvUTtJXt3TCfBnQtRLzYRYJ9fV7tNm+f4Q1iMmqfSXcMM35?=
 =?us-ascii?Q?rGNgdV8LLoQ9amipnHBVjHq74IZkBeFWPodkIW6VznDilmdhUE2+wxOjoTif?=
 =?us-ascii?Q?YEz6dSXotMnLBPnVFLpdvn6jz5rIRAzOf2YqB4ne1ZHg4QgdsvZZFo15PF4m?=
 =?us-ascii?Q?NtbPc1hdNFfYcFi/UbUmbUCrOjX/+EZ11SwbHcRjPHyytRqKNeyjNuCkjhfv?=
 =?us-ascii?Q?n7N2TcACeBR2SSCb0DgGtpfwMsBb/HnAmBHZR3DSYlNt8M9dVx+ekQvklX9Z?=
 =?us-ascii?Q?w0msjvzXuMBAbR3LlrR9byhq070RBfaciYbvPszU3nR56LCdvrcYGTXKLYNS?=
 =?us-ascii?Q?H19Zw5f1PvuhIT1KR5qrQ/85Pd4W6tVbNPcuDfFp/j08DqMJJw6CyFH736gs?=
 =?us-ascii?Q?sSkjWeZnv7s1WryQ+xVozr7R8AfZqud6q5EjF0wUuzcqDoO1SshhPuX0bEOb?=
 =?us-ascii?Q?nS3sqqSXc6udIQ/g5oa81Oj0/5Pb3HphOG29EkrenrpKhhL3xGTVHxzgK4XP?=
 =?us-ascii?Q?Y9AD3rN83RoCTIGRw8vgEPmEo2hHBKqrvhYGCOBgPGCGrhlHGtFViTqH+Si7?=
 =?us-ascii?Q?z9uPZnI57YWeWhh8POhY4OY0isTTXS/JRcr4sY0OJiI69cUPUSu8dwhk/K0/?=
 =?us-ascii?Q?8ElEcqpY3d2QDS1gXl+5gW7s4GK5Z9yInIWAjRRheh/Nex2j9NB5JtiS3XQ3?=
 =?us-ascii?Q?axBatyKN4ZlX6OEOZ8gy6+UWvwJvdLHsG2ai1FWLVWzliiKwgL4F3bRKfj9x?=
 =?us-ascii?Q?wymRj5hicK2WcVjSV5RdKa0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94b6566e-052b-44bf-99d9-08dbc9e858ab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 23:26:36.1410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KiRwakvKl9T+Ixy/VutEEidUXqTDJkjh+xZFmUcGa0jdPead05KRHWGE0OMLlSavZh7wh2t2VZwbcIbLFWMfFoiB8FvYI52kZuM0tJ0+QdkEmw7+oS1DvFC8rN1aqjaW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5617
Message-ID-Hash: RTINQVNSH3X3V2HULRIYQSF4ZYJWMEAT
X-Message-ID-Hash: RTINQVNSH3X3V2HULRIYQSF4ZYJWMEAT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTINQVNSH3X3V2HULRIYQSF4ZYJWMEAT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your review !

> We can test the next version (comments in separate mail) but we don't
> have a configuration with more cpu dais than codec dais I am afraid, so
> the best we can contribute is a non-regression for the N < M case.

Yes, it is enough. Thanks a lot !

> > + * CPU_x <---> Codec0
> > + * CPU_y <-+-> Codec1
> > + *	   \-> Codec2
> > + *
> > + *	.ch_maps is from Codec
> 
> how would we know what the convention is? Is this based on the largest
> number of dais, so here num_codecs > num_cpus so we use a codec-centric
> convention? That would be worth explaining in clear text

These samles is good enough I thought,
but yes, adding clear text is better. Will do in v2.

> > + *	.num_cpus   = 2;
> > + *	.num_codecs = 3;
> > + *	.connected_node = [x, y, y];
> > + */
> > +struct snd_soc_dai_link_ch_map {
> > +	unsigned int connected_node;
> 
> connected_node is a scalar here and an array above. maybe split this
> patch between a rename and a functionality change?

The sample image is simplified to avoid complex image.
But let's use more actual image if there is no misunderstanding.

	CPU0 <---> Codec_x
	CPU1 <-+-> Codec_y
	CPU2 <-/

	.ch_maps is from CPU

	.num_cpus   = 3;
	.num_codecs = 2;
=>	.ch_map[] = {{connected_node = x,},
	             {connected_node = y,},
	             {connected_node = y,}};


> > +#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7
> 
> why 7?

No big reason, but I thought 7 is big enough as default.
We need to increase it if 7 was not enough for default.

	/* check default map size */
	if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
	    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
		dev_err(card->dev, "soc-core.c needs update default_connction_maps");
		return -EINVAL;
	}

> > +static struct snd_soc_dai_link_ch_map default_connction_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
> 
> typo: connection

Oops, thank you for pointing it.

> > +		for (j = 0; j < n; j++)
> > +			if (dai_link->ch_maps[j].connected_node >= max) {
> > +				dev_err(card->dev, "strange connected_node (%d) was added to ch_maps",
> 
> maybe elaborate on what "strange" might mean so that average users can
> figure this out?

Thanks. Will fix in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
