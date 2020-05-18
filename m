Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E09B1D7BCE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 16:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D781705;
	Mon, 18 May 2020 16:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D781705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589813445;
	bh=oKDTiPIhF9wm3IFcPSqPJOWSpAwt2oEZ0ueUlN7jsEk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ly8qQS5yeVezaUbkwX7hXScX70DFT96nbKfznjB3W0PG3pNACcU5nxqmL/zxN+r+p
	 6xRC8s03a7pqr9W7VqtOXReKykhBseQe4iUTFPi7JiLp67MeDmDORm/qch1+KETNlL
	 1pHAUOMTt9gIbQD57Faj0yHSa3sZPP2uBZKExjbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04938F800C9;
	Mon, 18 May 2020 16:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D66F801DA; Mon, 18 May 2020 16:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, MSGID_FROM_MTA_HEADER, RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DA4BF80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 16:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DA4BF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="eDl+VVQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMbbCyQDvXQgoFhcIaKOBdyztFJfu8+UGqquMopgZuUFjwILH1g9c6vWnVd2fslMVQSgzfbnEO+qvDQRN6iPy/LkwxWmQF43NCGvD37nOxXHj2elDEuq71+X3zMh6skypjZuLsX39LkWkmRqzdpIcy/YUF89nNnoDyBVpoJ5plshBy8Dt+Xj9iF15L4fYb3I7Vw0Yghd6PkiNxRIum3VMf+ErP8HfAkRCTHrcX4esm5C28DJcEWyhJ3ehG1OiWY639Lk3GOdcfugDmBHyGecOTXjTPel7tYi4ShOel88vDmvXGpb8qANFGWBMRYMnlIVeGLx4dg4uRMPJGqQ6UUdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIyrF4Ix7A2+pqI5xBP1xNunKtwi6L8Fb4DIVxbtvsk=;
 b=dAmzwniZQbgK4/WbDeF1Pdk/8eE+jTD/uyB6GALhUuGtxdobYoX06V3frWAlpeO7CKUQ1+btw95zZbL6ejpElEdHl3nLrrLnHQJlRwakezJa/qjPPgnwJ3mPC2TFHW8vuoQ8rFodkq5lKzvIkOOSK1/M2JWzvfsEx2602Br30pERNHcZxopORtATss0mkCwaW4wd4atdc1mg0V0qV9sTqzqzfYQDQw2lSzU4FL5CiU4imsdBA4ox86kiVpiQT1ZfVyEn46FLfjN/2/ok2AFZa/jOrYFzapvIQedLNe/VHHLY69vM7KaNEszKs8HK21wSWxtttCsnrO1VI3DLpmw6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIyrF4Ix7A2+pqI5xBP1xNunKtwi6L8Fb4DIVxbtvsk=;
 b=eDl+VVQS6K9oqrmNFQLpHEBOx9WHbwigfle7H8QpPIwLMWH8V9J0qDKtahUctEIl3zZHtYFB6GpLF0PsJCdZG/GqyOmZ5pmeMuwuEk/W/V8nHrdYUXdGoqg2BUunCHsrENahWlUxw/XfW5nXHc9DNW7WoUChxjexyG/e4XpM2vs=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2336.eurprd04.prod.outlook.com
 (2603:10a6:800:27::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 14:48:52 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9858:e485:aaa6:ecc8]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9858:e485:aaa6:ecc8%3]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 14:48:52 +0000
Subject: Re: imx8mm fsl_sai clock config failing
To: Aisheng Dong <aisheng.dong@nxp.com>,
 "tharvey@gateworks.com" <tharvey@gateworks.com>,
 Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>
References: <CAJ+vNU3ekA76nXE7UV+kxA1DtbSMiRCnhTOy6RwixOrj1AoJug@mail.gmail.com>
 <AM6PR04MB4966BF44BCECB83835CA0A4F80B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <83ca04ea-8c5a-6738-e2e1-bb3632a61eff@nxp.com>
Date: Mon, 18 May 2020 17:48:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <AM6PR04MB4966BF44BCECB83835CA0A4F80B80@AM6PR04MB4966.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44)
 To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:2f08:5709:2500:7444:187e:2b40:1ea9]
 (2a02:2f08:5709:2500:7444:187e:2b40:1ea9) by
 AM0PR03CA0067.eurprd03.prod.outlook.com (2603:10a6:208::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24 via Frontend Transport; Mon, 18 May 2020 14:48:49 +0000
X-Originating-IP: [2a02:2f08:5709:2500:7444:187e:2b40:1ea9]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d08a4997-0c56-4333-1fbe-08d7fb3a94bc
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB23362A8C23DD623260D54787F9B80@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4p2+dsqCGjjNZOKq4Bn+kPGiZfblcjpJZX4dAETb21JQt06H6wZukWd2Lr9YjbbrDB/gDjf/PdtmnJrwourZLkiy24U9gqmN91MGALkX4zf3agYiaUn6c05AvL/pmWfi5mZGBMQD79KwxSSFAU/Huc/g1aGGgJ88miSyfAZ0gkycFlcH6264CJoO71gg5Lt2/SOs6P0rb9uQAapZM8aOUpDMfr/mNQfl4gE2DL7XeTF1GkiQk6qIPwR2QXbLSDZj7FPtcSvB1U5FG3sQUW36R+6o6sHhEZD+nfA1jUfdj8qQ1nyCIonmwqOOqoPQ2LlJt/CXzWVny3DuhsPd4JhMbkt+kk87z02BZFcZU4c67DnNca8TEdLqC1vmkpwMVmEw35O2PaEaon7wCe2OTYJUFcpZJlSgjXXBJ1Dp4WJPnJLU4sqHESRMfw2BukDHvJWBfwBmkn9Pe/o2ZZ9VS2uHxcghRjEcWb08oegr363wRzrJ0ZBtlMHiBRPPsr6yYNaE8nc1w17vccLDcHSgrwjD7CHDg9iHQrh3V0QWtwk7XI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(5660300002)(186003)(86362001)(31696002)(16526019)(6486002)(44832011)(31686004)(7416002)(36756003)(4326008)(2616005)(6636002)(66946007)(66476007)(66556008)(478600001)(8936002)(110136005)(316002)(52116002)(8676002)(2906002)(921003)(32563001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FnHnDX58c+cwhLjO3E3fpqFu1hHTanUkwrdqypg1VTAXnK8+DDxsLcX5DhgkXdVyfF/8FkztW8vNCVjlAaUonbcR+XlUXM52oj17+ayCZ7AfsGncIkyBI5NIhE0+t1QUF9yEWHNJeT/fjWcChH+WkiE1wcARvAPk2zSKF5EWPqPlQIqc6Vy7P0hFkxUttvD4PW+56fypTpHQFk5VeO3WIV5t6AsJrAYbaSScX0dGyrA+UvuLXvC1UI4KNaV1UQfSRlNK4ompYT3pWOQnAfSWUsipJ0TCc2q/QDpp+1C3hJ1AKhZbqJ6phgy0vYCWkE6RL2HNLmMATgwYCasNOkxlG/aCre4OPPZb7GOdintwW25Sv+OGMKrjEPhnDHuhZrGp0D3rWqcOqHW+8Oc9XB0VDwaFI7KrASsLNFQxC6tb7xI6aG+nbFtLwjaB77b0HX3XfoV2SUQwysgjj1TeBFGM8zTfChVZrlIb8EHJ/YM0KpLOmmAvdEmovBMTrzgwxwx52XaOFC0eE5EnELtAZ7n5S5uH93IFEDzkPP65lBJRhQrWtOhjDbWkpw6CSGG8tXlM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08a4997-0c56-4333-1fbe-08d7fb3a94bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 14:48:52.1544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydePADjT1p+Zknt0Un7RGjYwkwULsAORSB4j3uhiQIFag196Uwc2CXRqfqGBmQ0UgI8DHChi2IfEX8m31FQ0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

Hi Tim,

<snip>


>> I'm trying to get imx8mm sai working with a tlv320aic3x codec on a new board
>> and am finding that the sai3 bus clock is getting derived from the wrong source
>> leading hw_params() to fail with 'fsl-sai
>> 30030000.sai: failed to derive required Tx rate: 3072000'
>>
>> In comparison to the imx8mm-evk I find it's clock gets configured as desired yet
>> I have the same device-tree configuration for sai3.

It is strange that setting sai3 works with wolfson codec but not yours.

It should either work for both or for none.

Anyhow, can you please try to create a more specific clock hierarchy

similar with the on for 8mq (see imx8mq-evk.dts).


&sai2 {
»       pinctrl-names = "default";
»       pinctrl-0 = <&pinctrl_sai2>;
»       assigned-clocks = <&clk IMX8MQ_AUDIO_PLL1_BYPASS>, <&clk 
IMX8MQ_CLK_SAI2>;
»       assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1>, <&clk 
IMX8MQ_AUDIO_PLL1_OUT>;
»       assigned-clock-rates = <0>, <24576000>;
»       status = "okay";
};
Note that even though the imx8mm-evk appears to configure its clock 
correctly I

>> still have not been able to play audio out the wm8524 and the system appears
>> to hang during playback as if BCLK/MCLK were not clocking.
>>
>> Perhaps there is something not supported yet upstream with regards to
>> IMX8MM SAI?
>>
>

I remember that wm8524 worked for me both with imx8mm/imx8mq. Can you sync

at commit


commit 13f3b9fdef6c7d9ad069ae617707e5a10a685074
Author: Daniel Baluta <daniel.baluta@nxp.com>
Date:   Tue Jun 4 20:32:57 2019 +0800

and give it a try.


Also, what SDMA firmware are you using? That might be a problem. I don't 
remember

if the default ROM firmware worked.


Sorry for the late reply. Somehow I missed your email. You can always 
find some of us

from NXP on linux-imx IRC channel on irc.freenode.net


thanks,

Daniel.

