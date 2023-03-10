Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DF6B4F94
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 18:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3F2F18B4;
	Fri, 10 Mar 2023 18:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3F2F18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678470895;
	bh=A837IJAa4AlF/rKdR0UH2EZLSPCaPMwXVE3w07lfsHY=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=WdzHs9KsXoDJtunxl8ZwqCKTBrNEqwc6t15DB+/eURcnzKHyIxaSo+Q4gPSftGeIS
	 NbslDJgQve5vrpUS2trASiXLkl8a5RIKAywWxJQsC/nj1ZeeByLtZPu0kYPvGhDoMF
	 n4c08ZS5NRfG0/jLaONdbYhwkBTjk+9T9rTTH1eQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80785F80580;
	Fri, 10 Mar 2023 18:52:01 +0100 (CET)
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <Sanju.Mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
	<olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
	<khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
	<linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
	<robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <oss@buserror.net>,
	<windhl@126.com>, <yangyingliang@huawei.com>, <william.zhang@broadcom.com>,
	<kursad.oney@broadcom.com>, <jonas.gorski@gmail.com>,
	<anand.gore@broadcom.com>, <rafal@milecki.pl>
Subject: [PATCH V6 07/15] powerpc/83xx/mpc832x_rdb: Replace all
 spi->chip_select references with function call
Date: Fri, 10 Mar 2023 23:02:09 +0530
In-Reply-To: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Fri, 10 Mar 2023 17:51:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLGXGQ6YXCBMORT675BZLZX3YAP6QGO7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167847072054.26.14485346062822356907@mailman-core.alsa-project.org>
From: Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com,
 amit.kumar-mahapatra@amd.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B17F8042F; Fri, 10 Mar 2023 18:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C72F5F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 18:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72F5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=e1N5ghpG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQfbxHp5Vc2GSHRqjVVgaA5YOtmEFVin/bcEUztu7TpZADZ1VAE8SvCffMzlq6jRTZAZe4p6Og1a9IHCD6v0j8MEfXfpIBMzWlUi3azLZOiy7MFVbhB87Fz8g5rN9GdpLXHXjhu0pJrDToa3H/0BvabJDGSnDwiY+gkme3pa3xrqMGD4VgCkWhJEx8Ku8ZEY3yTp6VEfgXkjFteLclnIscch20LlL/vQ0neRSkthyAL6GfQeeRSqzDcK7Q7d1r9o9v9w9tbghzO+zftqXp8BJYYJEtUw/Cd0g96bJW7FOY1WOPPHJYjFDqUF+cIzo47K8nJQZ2aihlK6azf0BN2TXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M3Cb03rj/nbO1yn3yzEnhmtHVCZH2EXdqX8XhwSkZA=;
 b=TQbkxOYpDSH3e+rLYj1W6+l6TR6S1IVlMa4GwhkbY88HW7WERXR851TM/zeS8FIbDvPG/VFW1+rN5iZo1PA02fbu3EDGu/LvkD23MaiRSOutBgGJTg24mhFaMkv7IgTnB8ghbm0dDjZJkPdfDlh8yvnN4tNbZjbc1o/0i0zomg+/biYxY4W69kC52q0Fk5a/1e9a3T3T0XFUZzoCF+YLNbdAXDkUAT0vseuZao/41J+nSxnlznI8iT5mRNZtJ51WQJbcj4oZb7/qGkKQ7eBS8TUrQWrhQ91s2s07vIBD8sQzqMqnTbd83ZqD1g5gLRWERixw2oNmnx1XsM3hP4KW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M3Cb03rj/nbO1yn3yzEnhmtHVCZH2EXdqX8XhwSkZA=;
 b=e1N5ghpGgCsCs7ADFSMwGy7Ne2CZAKvHPUbUhHhcmjokhh61N0QhzPos9sgZNPS4R5ClMclwLTVriLvROuZVZS74ewOQgma3RtIHwjtm5w6VEZq/volWVhgeI/CnyLAJ6mF+T5pRerZAZXyT8er/56Zd9QxHqsAv+zo1RW+jYas=
Received: from BN9PR03CA0531.namprd03.prod.outlook.com (2603:10b6:408:131::26)
 by CYYPR12MB8964.namprd12.prod.outlook.com (2603:10b6:930:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 17:36:26 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::8c) by BN9PR03CA0531.outlook.office365.com
 (2603:10b6:408:131::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 17:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 17:36:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 11:36:23 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Mar 2023 11:35:56 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <Sanju.Mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
	<clg@kaod.org>, <kdasu.kdev@gmail.com>, <f.fainelli@gmail.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <eajames@linux.ibm.com>,
	<olteanv@gmail.com>, <han.xu@nxp.com>, <john.garry@huawei.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
	<khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
	<linus.walleij@linaro.org>, <daniel@zonque.org>, <haojian.zhuang@gmail.com>,
	<robert.jarzmik@free.fr>, <agross@kernel.org>, <bjorn.andersson@linaro.org>,
	<heiko@sntech.de>, <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <alex.aring@gmail.com>, <stefan@datenfreihafen.org>,
	<kvalo@kernel.org>, <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>, <oss@buserror.net>,
	<windhl@126.com>, <yangyingliang@huawei.com>, <william.zhang@broadcom.com>,
	<kursad.oney@broadcom.com>, <jonas.gorski@gmail.com>,
	<anand.gore@broadcom.com>, <rafal@milecki.pl>
Subject: [PATCH V6 07/15] powerpc/83xx/mpc832x_rdb: Replace all
 spi->chip_select references with function call
Date: Fri, 10 Mar 2023 23:02:09 +0530
Message-ID: <20230310173217.3429788-8-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|CYYPR12MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: f916c9be-3095-4d72-ad14-08db218df938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NApZi2qplQmy+/25v2NUv7zHdOppC3TdmZQq4vtW+ysec+sFp4YWJqP173YVMA2+7zzv3E4tn7ypTPdgyTqdKlKXXeyQFWwdMsDgppdEvKKlRsICahQ4Rc9efVzatfI5D4Lr5KN8JoyWDgmOvnP3QMUecyjtaQjMR40UbeX0+SDmQnb58p7KJh4eeWhxi0OziTcGq30pKwiTJvSTmdsZw+j7mpdesQHTleDqH5JHAj7PxxA0dpMd4+zC33Wmmm/Ia5RxTT2eAVOEQFWNA9O+yQpirYuzqIBK8CvnZDsJoOgBUJYJtZwvfi6KDu52vgTSgLvw5gZz3FqdDGaiTNHdUAc+EubbuyVJBIGGbmA+O4KZFQAweOllMbe/YaCHv5UbuxDiAsxsa15ZPSSMSb25zF+/s1tFzV/HTb1GUDgllSSTa7KZZyiUdVe3+j83kuK3EWER3ZXDswcIMr27NCpggxROwH62SkBHtXqYoWuFSsfeRd4pXPLqD+gaqLsiPOoa1bk8JxqKP+OxydpJ9PqI5gakZRb4Gn5Aj1UyWhz1aVuOrIbaTfRFAHpiaAT7xmzJaLJUgIBKC6aIynTdbLHQc6lH0LFWYI2EBb1WzRyI3y0GxWpJwbHSe+BsjXYrRyEN3kId2DstTQD1WdmCQcPvtrmnc6E3O3/hcfC5GjUQkUhge44/Z2MQXhKDOqC4N7LLQvarNM+BjT+1vxYb0HRql6SFRRznL1zHhMjaMGmA+GaG4CtIHWpZDOrh00o6lJ9tu2LLlET0kLe9QK3OrazfAK8CN+gDzNq2uLRLZbTTFTB3r32yjgHkt6r6OejLKN2uAH/K4Q6eauoz2EGMY3yK0ekuS8zDhFhzYHaEq4iGD7w=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(46966006)(36840700001)(40470700004)(426003)(47076005)(336012)(186003)(54906003)(110136005)(36756003)(40460700003)(316002)(1191002)(921005)(40480700001)(356005)(26005)(86362001)(478600001)(5660300002)(82740400003)(36860700001)(1076003)(6666004)(83380400001)(82310400005)(2616005)(81166007)(8936002)(7336002)(7416002)(7366002)(7276002)(7406005)(41300700001)(2906002)(70586007)(8676002)(70206006)(4326008)(2101003)(84006005)(83996005)(41080700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:36:25.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f916c9be-3095-4d72-ad14-08db218df938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OLGXGQ6YXCBMORT675BZLZX3YAP6QGO7
X-Message-ID-Hash: OLGXGQ6YXCBMORT675BZLZX3YAP6QGO7
X-Mailman-Approved-At: Fri, 10 Mar 2023 17:51:41 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com,
 amit.kumar-mahapatra@amd.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OLGXGQ6YXCBMORT675BZLZX3YAP6QGO7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
members of struct spi_device to be an array. But changing the type of these
members to array would break the spi driver functionality. To make the
transition smoother introduced four new APIs to get/set the
spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
spi->cs_gpiod references with get or set API calls.
While adding multi-cs support in further patches the chip_select & cs_gpiod
members of the spi_device structure would be converted to arrays & the
"idx" parameter of the APIs would be used as array index i.e.,
spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 arch/powerpc/platforms/83xx/mpc832x_rdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index caa96edf0e72..4ab1d48cd229 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -144,7 +144,7 @@ static int __init fsl_spi_init(struct spi_board_info *board_infos,
 
 static void mpc83xx_spi_cs_control(struct spi_device *spi, bool on)
 {
-	pr_debug("%s %d %d\n", __func__, spi->chip_select, on);
+	pr_debug("%s %d %d\n", __func__, spi_get_chipselect(spi, 0), on);
 	par_io_data_set(3, 13, on);
 }
 
-- 
2.25.1

