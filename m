Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F16541EDD03
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 08:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CEA167D;
	Thu,  4 Jun 2020 08:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CEA167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591251192;
	bh=RPeUip+J7ZG7QzwPHPKXwl/9/UfBKbvE//a+1r4Q+PM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsP0s+LabCIoLSs60fpHtsuGcS0mLtrTRAJk2jGdo1KtVLs3LExYwcPk/3ZNqMBpz
	 mEqS3tJAW4g0Xccv1KpSxDZavADC56MZu0Yvb2gtAZfj7J/ntPLBXU9RsKUY1zzklx
	 V4YGjc7WwOBtg9idMJHICCjKWfMJI4yPtHDSVJW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6987BF8029A;
	Thu,  4 Jun 2020 08:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E36F8013D; Wed,  3 Jun 2020 10:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4522EF8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 10:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4522EF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
 header.i=@xilinx.onmicrosoft.com header.b="atN0GZ+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKqHLPJfV92BcKD4TqEkzYddFLvVr6PUvkwVxWCDMynuAkeujrDPQp1UPu8PHmcl+JlSOurJAfuZXwBCHct481Tiq4JcBHknIM69IrrBDHtxWjPE6hGoXi6nc7Iww4j3CeoQspCK/QXvEE1T/TiKWnp29eIJVLdNhYzWMdBVwzbHM/s3NqDrGQJ3l7CYNQClml6EQ+Zx/sjA7/S+fbVXFO0x9LvQNM2l80yaBRrC+btaimq166jFUHhG3Vp9u34yQrUVJ75ehZQYMQ/5NjWWMwnO3lKkfxCeBwJYjz7aosfs+KKfgDzwI3tGdfzI2IIzAhtP7xTlO+g9jLvrAhSIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFp6PwT2CGy6QdjLu02TSmCqjoPU2PJNjHoVdHjyq0=;
 b=gUJyIve8L53L+hkDPEsF4wggE1MwyM+74QbQXds9C8wDwvSeSdzc8T0DglzZe/YNBdq1ZwZPaICUX1L4aN0H7Dv7uqA+WLdnzdDrzbOg88DTDYWx1I+Cpq5o26JJo3MKpfYszu1f+1QYFVdoj3hXMxiscvzbwsk/3SDaZGYZMY0Qvt/bHDD+VC19Y+wO6jFdmH4YG82KpbKFIos7XlZTLQqqqH/G84wUHrKsmP05q3y313hsqlpYzWwxxXt7ylGtHc6D78mvEAS2a0UbQD6nS4d8vz2fsGW2rSUNjDuJr6HFw3Gvnsj4JLCSSfVrct8APpBK5nqP5Mj2c0y3FxRpxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=csgroup.eu smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtFp6PwT2CGy6QdjLu02TSmCqjoPU2PJNjHoVdHjyq0=;
 b=atN0GZ+QkAjSj3RZRo0NxuRt8M6FAe6wUGTq+9ldnvX7NXPOKHXkgPyOcOwQ6LnpipKHto9YzKsMFsRW53F9Z7NYKrSUVRZgY8eSinMaxBBisKnz7OGpTvVqOcIrS0LwtQixm0K7Zp3UzWL+l5SXFk351EQIsYc7YadTTPqndI8=
Received: from MN2PR11CA0027.namprd11.prod.outlook.com (2603:10b6:208:23b::32)
 by BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 3 Jun
 2020 08:20:35 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:23b:cafe::74) by MN2PR11CA0027.outlook.office365.com
 (2603:10b6:208:23b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Wed, 3 Jun 2020 08:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Wed, 3 Jun 2020 08:20:34
 +0000
Received: from [149.199.38.66] (port=37825 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOcm-0005xa-CQ; Wed, 03 Jun 2020 01:19:48 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <michal.simek@xilinx.com>)
 id 1jgOdV-0000gq-NL; Wed, 03 Jun 2020 01:20:33 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0538KNoq025997; 
 Wed, 3 Jun 2020 01:20:23 -0700
Received: from [172.30.17.109] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <michals@xilinx.com>)
 id 1jgOdL-0000MD-2d; Wed, 03 Jun 2020 01:20:23 -0700
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Simek <michal.simek@xilinx.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Takashi Iwai <tiwai@suse.de>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
 <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <aeb6da47-2072-ea25-0c11-27a5c23f0e78@xilinx.com>
Date: Wed, 3 Jun 2020 10:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(39850400004)(396003)(346002)(376002)(46966005)(426003)(8936002)(336012)(186003)(31686004)(44832011)(82310400002)(6666004)(83380400001)(2616005)(81166007)(36756003)(82740400003)(26005)(110136005)(54906003)(47076004)(316002)(5660300002)(9786002)(966005)(70586007)(7366002)(7406005)(478600001)(7416002)(2906002)(66574014)(31696002)(8676002)(4326008)(356005)(70206006)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb09405-8068-4558-9486-08d80796fd33
X-MS-TrafficTypeDiagnostic: BYAPR02MB4886:
X-Microsoft-Antispam-PRVS: <BYAPR02MB48860603B24E66E20C40E584C6880@BYAPR02MB4886.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWwIkId2jRyeO7aQbPQq5eoWONbnWBZF0nhOOxmvtlOxaBhvSUwXcyyvNe1K2fgiwQbdwttHTlDt2243a/BBRil2Jeq7btiL9dJppKAhYMqZpZareH4ZvbJosuY4QC3u77e3j1tupO741NdEuWxOdpDtLpI8kukuw5+db/gqrKAhlMT8c9XG0vQjw0vR1AeGZkSWukoEJASfPGQ+WTG5jIr+Sb1aTEniKfeU7HLidndUVjIlVsCmb9iLfJhfzM/+3k0lM5UgbvTNXZL9raNU+B/qml9qKU3asUusXw9K5FosvOeKTs1UuCsN8N5dXUPrKuq5GHwMlWpLBqf0dfsMpt35rUB0IK5m0Zu/zPR+J2vwPxQYD76OJmkXrHnbVeXzGWMfehejYJU5n/zCs+TYGVjL78vCkxgI+DGvQf8276p4LyzoDhSe/GCA8oBqbD74qiTwT5EdJTIK3EcCPqb+A0UsD4mbC6aN87NNA+3bio+AlEasqJpTfvCxSU79Ym92
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 08:20:34.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb09405-8068-4558-9486-08d80796fd33
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4886
X-Mailman-Approved-At: Thu, 04 Jun 2020 08:09:48 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 sfr@canb.auug.org.au, Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
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

On 03. 06. 20 10:13, Christophe Leroy wrote:
> Hi,
> 
> Le 03/06/2020 à 10:10, Michal Simek a écrit :
>> Hi Michael,
>>
>> On 26. 05. 20 15:44, Michael Ellerman wrote:
>>> Michal Simek <monstr@monstr.eu> writes:
>>>> Hi Michael,
>>>>
>>>> On 01. 04. 20 13:30, Michal Simek wrote:
>>>>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>>>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>>>>> Michael Ellerman wrote:
>>>>>>>
>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> recently we wanted to update xilinx intc driver and we found
>>>>>>>>>> that function
>>>>>>>>>> which we wanted to remove is still wired by ancient Xilinx
>>>>>>>>>> PowerPC
>>>>>>>>>> platforms. Here is the thread about it.
>>>>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I have been talking about it internally and there is no
>>>>>>>>>> interest in these
>>>>>>>>>> platforms and it is also orphan for quite a long time. None is
>>>>>>>>>> really
>>>>>>>>>> running/testing these platforms regularly that's why I think
>>>>>>>>>> it makes sense
>>>>>>>>>> to remove them also with drivers which are specific to this
>>>>>>>>>> platform.
>>>>>>>>>>
>>>>>>>>>> U-Boot support was removed in 2017 without anybody complain
>>>>>>>>>> about it
>>>>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Based on current ppc/next.
>>>>>>>>>>
>>>>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>>>>
>>>>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>>>>
>>>>>>>>> I'm not going to take this series for v5.7, it was posted too
>>>>>>>>> close to
>>>>>>>>> the merge window, and doing so wouldn't give people much time
>>>>>>>>> to object,
>>>>>>>>> especially given people are distracted at the moment.
>>>>>>>>>
>>>>>>>>> I'm happy to take it for v5.8, assuming there's no major
>>>>>>>>> objections.
>>>>>>>>
>>>>>>>> Sure. Just to let you know Christophe Leroy included this patch
>>>>>>>> in his
>>>>>>>> series about ppc405 removal. It should be the same.
>>>>>>>>
>>>>>>>> If you don't want to take that alsa patch I can send it
>>>>>>>> separately and
>>>>>>>> this patch can be taken from his series. I don't really mind but
>>>>>>>> please
>>>>>>>> let me know what way you prefer.
>>>>>>>
>>>>>>> It's better to keep it all together, so I'm happy take the alsa
>>>>>>> patch as
>>>>>>> well, it's already been acked.
>>>>
>>>> Can you please take this series? I know that there is v5 from
>>>> Christophe
>>>> which has this 1/2 as 1/13. But I need this alsa patch too and I would
>>>> like to close this because it is around for almost 2 months and none
>>>> raised a concern about removing just these Xilinx platforms.
>>>
>>> Sorry I meant to reply to your last mail.
>>>
>>> I have Christophe's series in my testing branch, planning for it to be
>>> in v5.8.
>>>
>>> Even if the rest of his series doesn't make it for some reason, as you
>>> say the Xilinx removal is uncontroversial so I'll keep that in.
>>>
>>> I forgot about the sound patch, I'll pick that up as well.
>>
>> I took a look at your
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git repo
>> and I can't see any branch with my patches.
>> Also was checking linux-next and my patches are also not there.
>> That's why I am curious if this will be go v5.8 in MW.
> 
> I see them in
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git in
> next-test branch.

ah. My bad.

Thanks,
Michal

