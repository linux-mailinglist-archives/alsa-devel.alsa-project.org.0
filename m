Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EB3C156E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 16:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1D615F2;
	Thu,  8 Jul 2021 16:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1D615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625755600;
	bh=/26rolrcxzad3J+vpok50rI/m+x44d+1VbeCdbHy2lA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ttX7xpIaYtgfvNqqapDHLzu2SVmu/u3fYQh464sbPYW6bd7io4llflAjWcbrJNlHD
	 Ow2nM879PToDCzc8psV9pGzrDG98OSUWJSejCJWyIfX4u6Pu+yJfD1Ji7XWmkHzJxN
	 oCbaAlaHQrC4UQgDZwzZ9jMXfTAM79pDN7lvTYN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E937BF80246;
	Thu,  8 Jul 2021 16:45:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76BAF80249; Thu,  8 Jul 2021 16:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D39F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 16:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D39F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Z2yW7c1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TncGuH9882yrF0bX8PWaAATkWPDLZ+eoO2hjjpYGvymAJpQCA7g6ZhPgMd83uvXPjXJjlGK+/9YWWBtHfUhPI3k8ybEJpobapOGAIZaAVYpK/q6Bgw0AREcR6v68IWrKyEUmTh3qdrBHT+2hNTuQqsOa7jfuu4QgXf19LWj1YUMbBc/DXOGLf6D9+UHTBfhOKpCvv/V9Fo0BMkM3f+JFwpNbG6OJjafLTmEFmqxROh9a9bllINVDI2CzPhHnVO+KLeDDduaaSLQgqs57NOwNotq2ONxjgAyKLqqG9/dsNJ9eMlFwAO0ugvCutdcK+6YqwHvxajW1ZBbbBdCyXaK39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IisNIfFcacSt9B+zA20THXqZqSrOTSEJlUOEvAHmTL4=;
 b=lHCmHX/Adc04hIjjohzWeCfiur8Z0hyMz5xz4t1CR1LQyKg3+XdY0G5J02jR8x6QQQZ5ooppt7nae3Bj31MTA9Veo0oWTvFBUh/autq7957xGgPtV7J0E6JwsFnTQ4ltoDoI/+N0qpe8vt/3ktpNjZkNlfnsmV/MRUrhnXqm9ooVb00LPQlyLgSXbqlExB271zUNHSm7e7/3xKzScOdsrWO4beZYq1mNly6Mhj1aVafTTJfCcb5CGwoBIYKugpXM7/nIVGfj2caa94ZTD4EQaQ2+7io3HNOIT5FqaQxx40RpBUbYHI3NzX/2Kvf/YrOyKLQgTzwvlMMilyN7FQMTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IisNIfFcacSt9B+zA20THXqZqSrOTSEJlUOEvAHmTL4=;
 b=Z2yW7c1wulBCmqJ2LN3VF09LAmNApQ73kM5vQSBkha0quw6/uJzXmwsfcVitWPXH+S74gC9WP4B2jSilkCXbbcSYJ9Lhhea5OzEAmTBJQ4x8Zy13GrfdWI56cv/+ovqjxlNHd+572lXd763qakEJ9bV980o2hUxoF9rTi3dBw5E=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13) by CY4PR1201MB2517.namprd12.prod.outlook.com
 (2603:10b6:903:da::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Thu, 8 Jul
 2021 14:45:01 +0000
Received: from CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb]) by CY4PR1201MB2550.namprd12.prod.outlook.com
 ([fe80::d53a:8bc9:23fa:46bb%7]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 14:45:01 +0000
Subject: Re: [PATCH 04/12] ASoC: amd: create acp5x platform devices
To: Mark Brown <broonie@kernel.org>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-5-vijendar.mukunda@amd.com>
 <20210707162206.GF4394@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <2361319f-805d-e3e8-d86c-e0ecd39233ea@amd.com>
Date: Thu, 8 Jul 2021 20:32:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707162206.GF4394@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36)
 To CY4PR1201MB2550.namprd12.prod.outlook.com
 (2603:10b6:903:ce::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 SGXP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 14:44:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9fbef85-885b-4235-adf4-08d9421ef6e5
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2517:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2517A109F47C6490980A9D0097199@CY4PR1201MB2517.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BhtD5xQ+3u19+aL10aJI4UIAun7J44yBoQ7vUhPT4AUhLp9zewvNv42DDvclAatTfGDHR8mCd1hL3clsdw+JbyRQBbjbG9PBq03XuvWvhtucjJlz6rxK+U2LGKOlGyMHtNTlfH7xvXv/HX7NHM+MZWJvu8EzaKaq4ocOV1qujnL5pwwqfMrr0ckc6LGyNP8M0Ty8wooQZz46neJ1TQ5Y2zhMQizMAu4VFHw0BgXPmGTJbQ0oNJ9NM0uKwNLGkyiNRC1yav4bN0LBIvZlU+EMxWT3uhGfxVZ5h5y8ozM9xVpfx5srP9MlMu1wcqUC9SDZSZmR2LrABwkahVzVO/jCC2efQedVC+YHnCqgi4WxJW7FvTLAV2bJ/zY5Oco40O2lp9SLWRJYjdZNekfGcAfR1gQ+vaP4/ASulKZ7k5VyHynNKfK75SupNgOQrhql70hm04LXxyrUcuP5C7Omnusbq7h2pF35/7DkEZDuq4al7URlqkuj0xVzkIhE3yJ/2rnzQmtNlB2pWa07OaRYurW/qZ2Hhu/3UIhPsG6wUOYvehXFlSyaZH725mkejh+vjmFZbfVQHsh4r0aAnBrIyti8XstiZhzLnHRy7MeXb4YCSt1F3M9J1I4Vdheo5p3n7gYkZhl9pD2itg2ftr9eQczayG1nx1SEP/nEJKy85PRIhxDkA5CLjI3D73CYri1kttjh/Fc3RBMqsoAO9BkStMv9GzT0cNaYNRUdS9DOlqcLkHGGU/hpM7RROl2Ul+RfCF17ab3uvVzyByXQ6Qs/xTwo+tRkm221fxXbHprLKA7FH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB2550.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(6666004)(66476007)(66556008)(36756003)(38100700002)(2616005)(956004)(26005)(66946007)(83380400001)(8936002)(4326008)(8676002)(186003)(2906002)(53546011)(316002)(54906003)(31686004)(16576012)(6916009)(86362001)(31696002)(5660300002)(478600001)(6486002)(42413003)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?MnquP61O2YiuUB1u5PLAYveUXHNa12VZybleCuEiuLmkVHJRQ3SoB9Ff?=
 =?Windows-1252?Q?XSl1Bmj+uzQGT81xUSnvnMoAiZRxdZ48GMgY8ASRZ8LnAYijLw7idwmS?=
 =?Windows-1252?Q?u2CexYyY8Su+hxDOPOo18pycWKUm1aFssfy7AT/72nxuynLx5L9yJQxJ?=
 =?Windows-1252?Q?KVq1HnZkY3V9UtRWDSGua+5MuGe6nEjd5KmQStCba0xJrAGvqJ2kSidk?=
 =?Windows-1252?Q?9dFYSH4m7uW3b2TKVCcZzb8jLiQEL1VbSB0LuzQI2RySs3qp+k+6Jdnw?=
 =?Windows-1252?Q?zFY1nod89oj4qy3GE9LvR2JunW/vL80CjN3dDVtsWMHkKh+w5/yMTdWS?=
 =?Windows-1252?Q?p5WrkKMiIEXRQnPs4+PWZ9BDniUIYV+dzzj7KFVz4UwCeXudia8QuAqH?=
 =?Windows-1252?Q?30PIYLeCysFzsUSZRNxN6gCU9rYsEgzwvoiiWJbBgtp08+nR4sRZBo4C?=
 =?Windows-1252?Q?DrpozkCOlfF8TefpPwmxxkRETo/PO8KD+LUjN8US2gb0WzSs/in3+OJk?=
 =?Windows-1252?Q?RFMRyMCjNex5a8BhdWauFRmOzpyewvuAblKe3ZrYAgJDM8UALwi5R6n2?=
 =?Windows-1252?Q?8wPu/22nmnr+dS36pXLiy7M/+/UPZi0SF7oib+Oh2vlk2xNeLS6V5epe?=
 =?Windows-1252?Q?2IkkCxcNc+F1vuR8F/QZ5GXYcn/huXwNHZxjIFLAsGwEOSNCT8NW61B9?=
 =?Windows-1252?Q?wsErOeMg66L8I+Hdyv/4UyiguuYIFYkxe6zRMg4qvPYjarNLXYzqQe/b?=
 =?Windows-1252?Q?Qi6Uhio2Dhl0ek0pMFzOM0zY+nk+LEzMl6v5cW/mD0XhTFJLQvY30ckR?=
 =?Windows-1252?Q?R7AoMxkkZfmNEKwb+pBly/lqwpantgMIktUroNv4BVY1cXSxCfAdoBsz?=
 =?Windows-1252?Q?aPSbp6m6LuQ+d5+ZZl4CAzXOnzDPpHPhTacaCRa36fcAr2GPRNT9bLaG?=
 =?Windows-1252?Q?1+FcMSWxuZnkCtelR7fPpYo0XN7neybWxO5wJC4oDr9xqp6SJm/jXZg1?=
 =?Windows-1252?Q?N+PDSalY6kL18tYHLXGqWgjMfJTpMhx4ebzqQhSawoH27V09UvGls2Lh?=
 =?Windows-1252?Q?ROgClcL60VISO2cQGg0P6U2Nn1PQBsd5bJ269KhI1jbudDR0UxPsoOw2?=
 =?Windows-1252?Q?ct6FLHnHkrh3qL1hdmWJwRgpqEGaB9qPs7sy+j28Lu29tjrUjaeE/GPo?=
 =?Windows-1252?Q?0kxiMRCmrJ6juaNURBMoY79UNWu32DEUGDVmax5p54akveJeV64k0E7l?=
 =?Windows-1252?Q?7wGpGRKr6kjsPPm38tX3037cuBpT6qpEuFyoYupdHDguPZskXB0drSY6?=
 =?Windows-1252?Q?KdcQ9J0Ejtx3VpVWOKkjcy1IvaBYLNAXr8BauqIFbb5B5///kxTRhOPc?=
 =?Windows-1252?Q?oWvrqqTHZ+ZanlGc49bL5TDPe/UFuZPNLArt5hBrNqAjMfmj39UTbb08?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fbef85-885b-4235-adf4-08d9421ef6e5
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB2550.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 14:45:01.1953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erppkhV5xpp6qCGFztUw6baKWZ2G5WHTo2lYSgGXNvwA3nHE2uSJ1g2+yhO2hpaJdKYQfZ9Z2Jg0UhV8XLUASA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2517
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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

On 7/7/21 9:52 PM, Mark Brown wrote:
> On Wed, Jul 07, 2021 at 11:26:15AM +0530, Vijendar Mukunda wrote:
> 
>> +#define I2S_MODE 0x00
>> +#define ACP5x_I2S_MODE 0x00
> 
> All the other constants are namespaced so why the plain I2S_MODE?

Already we have defined ACP5x_I2S_MODE to check whether ACP Audio mode
is set to I2S or not.
I2S_MODE macro to match one of the value of ACP_PIN_CONFIG which will be
programmed from BIOS based on Audio Configuration.
When few other audio modes added, will move ACP_PIN_CONFIG macro
definitions to enum.

> 
>> +	val = acp_readl(adata->acp5x_base + ACP_PIN_CONFIG);
>> +	switch (val) {
>> +	case I2S_MODE:
> 
> ...
> 
>> +		break;
>> +	default:
>> +		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
>> +	}
> 
> Given that anything other than I2S is basically unhandled should we
> perhaps print an error rather than just an info message
> 

As mentioned above, ACP IP also supports other audio configurations.
When other audio configuration is selected, ACP PCI driver should be
loaded. see - efb38304c(ASoC: amd: support other audio modes for raven)
