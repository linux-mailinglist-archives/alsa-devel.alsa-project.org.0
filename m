Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5BB69982C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:59:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EC9EAB;
	Thu, 16 Feb 2023 15:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EC9EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559551;
	bh=o8rB5eZbTpCVBz91Gfc0gp1aGOmbkTiFCIMlCgm47JE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFu3Hocon88DRpSs83/KurWES1ITD4QEW2ZBYrVElLTvdHYQwcz7t4JFYnQcjIrvH
	 nuL4qqzb/JB3qRwXpfd6aFX6mRsNNg2BIG02a9AFPF25PFMmSJPIHFTiQrX5xoeTI4
	 tRF00ZSkxIlm+3vS90dSZf4cnLrYDdxfpi/aSPcY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 270B9F805C1;
	Thu, 16 Feb 2023 15:55:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CF24F800E4; Fri, 10 Feb 2023 20:40:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70223F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 20:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70223F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wFAh4BFJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyN1W3WnfXbQfidcLz0W3j3sKRTihRZvkJMGaQdYUz72hRR4EC3+Z5BWOO7K0iT7rHsu0aKjmk5l9YckN6gNKISspwmObRdUIVVPOzFAMNtODmRCPy4BkEvT9ImysMH+AYb3iK5dfADVv6MDpdXaBGbCn3OpnDQEU7IvXEcXhuN3ZSeuH2MGuiUP/pW2u6iP6761Qc9j9NTuV4i/5jUTYr7WK7tOY3Ah8gbGdl+FcEPBnUu1LEcMbzNyaNbhy7vSEkXDxrUNo0U1kXK95YceCzviY3TDhdy0OyF7vERtMoPO4u1ft3Uu27K2/HoAFpG8oHpbVIj1syjis1ndFQB+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=jQRMBFmcKQ+rqOUR6QWrSG+wzemlSRYbm3OIq/70QSwPkvZYeQhbkCUKsUg3h8+XxxgCqdZg2OGRXvipGLXy4LE8buyI5NH2pA15Oz2BgC/MwINil/GGW2ZRpgW7iRRpCbHM4BMj11fHcvWlnVJL46ZQnq90huh5FkPx9dRrJP1PaCZ+3NAbWm7fEUNCcxvntVhe2nD9IWQwqEFFdXQERZdRzZdASw8Kd4S97E3imhreIZ5nRE+STpeWNtVXrtGpU4s7ZeoeFUYHA2BTeVr6T9kTLIWfutT9zuGck8fui2EKIuRhxFaWD44EwHDZilBPybbvyMtqZx6OBURZj6+rFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxTTaX0RvNIuGzXe79JJPMl4YfA6n1vchK0hnLsPc6A=;
 b=wFAh4BFJ/+5hwTRzsLrx0fzCni4ojyVqyswfJir7WlZQLUQgvXbBUj54D2pk4HfTIhrbvNOKo73Kn3xi0agHR7NFE68Ai521u7nRlRdX4vRncdJxqSbOKyiLsnZw8MNAgA4hSnqRznNzqjm3SktNettTVG8fRVCy3g5UaOwaiB8=
Received: from MW4PR04CA0182.namprd04.prod.outlook.com (2603:10b6:303:86::7)
 by BN9PR12MB5384.namprd12.prod.outlook.com (2603:10b6:408:105::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 19:39:57 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::f4) by MW4PR04CA0182.outlook.office365.com
 (2603:10b6:303:86::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21 via Frontend
 Transport; Fri, 10 Feb 2023 19:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.21 via Frontend Transport; Fri, 10 Feb 2023 19:39:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:39:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Feb
 2023 13:39:55 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 10 Feb 2023 13:39:29 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
	<pratyush@kernel.org>, <sanju.mehta@amd.com>, <chin-ting_kuo@aspeedtech.com>,
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
	<windhl@126.com>, <yangyingliang@huawei.com>
Subject: [PATCH v4 06/15] platform/x86: serial-multi-instantiate: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
Date: Sat, 11 Feb 2023 01:06:37 +0530
Message-ID: <20230210193647.4159467-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|BN9PR12MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fd2b49-3ee2-4143-f9a7-08db0b9e9745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n7l8KcqAN/J9s5GuHmjCMwdj6HVerE6R4pptisYUH9G4FCfl7s8Bb/nTnmjOTbo92udGti/5bNJtN9RoPY+vO8IHKv+dmzYeVvvSd6iOnp58M2kz898T2MLSGS13AlkBNrF1Td6KX//XwlAoXGj50ARHB0vHkArg5GWiJZq/xxSpGCKgV4Al7RFggCrsSxnRPZRwLCBNR03jXEOCWyHqQFyQ6mamD2efUf+pzVl5NCDkU8BbmbgkGe5+Z4tQJZhXfsw2/9DfVhaHZzNIx/uhMVapDzvpNHVg+9reAH6yUrghTMDXw4oKSOyC5dtRR1Pt1DScVaMb2KX+4CDsheZBhPWUrZa1CCxlDqG0xpdr0LF11pOKTae6VAJ+o06hrgWGjbBHpYPGu6K75xAJ3zJHdAInP+gauJltT1qYuerYTjxw4IVFKlfcgKVxgD2OfS9eb2Y/3fZKfH3Fl2jFzA18wLoFjXCJOUSrjVv3dZcfLHFTQQM8nsSK1dqDaaPP+HbyR5O9C9hU9mqAbhIB6Pr6SRe02Wcl/rtucr6zL2cCgeBzEAw6IGFBlaQg3wYXAJL2ApBDh0U9+A6SHDcxMBjSb5iJp+BmyYaIY2+MqYjDvrtET+eB5XvBC5kj83C62iNyMgHAYRbHGB0Jc5ic+964Wxfxc0XB4gGRgqTwLU2lzbyb2juGwy9WDYUMZ0pdE6dUq5gbyk8I1wJsaE6WmHfpZAkWFKojZXX1urzmgyddiJ4POd0bcYHSpMq4pOWYeeLGC+O2/4KdvPcBIulb9JDPmAqfh2sffJEn+o17Xsp7VY5FWC5D/KXIBaB3swwGMTHvCt3Uwz1Bmp3V6xljrriedXgbxjWXi3c4q4hobhDXelA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(7416002)(7406005)(8936002)(7276002)(7336002)(7366002)(2906002)(2616005)(426003)(336012)(186003)(83380400001)(40460700003)(47076005)(1191002)(478600001)(316002)(54906003)(8676002)(4326008)(70206006)(70586007)(26005)(40480700001)(1076003)(6666004)(110136005)(41300700001)(5660300002)(921005)(82740400003)(36756003)(356005)(86362001)(82310400005)(36860700001)(81166007)(41080700001)(36900700001)(84006005)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 19:39:57.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1fd2b49-3ee2-4143-f9a7-08db0b9e9745
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5384
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QT5OFKHHUDS5UPKTZ74XQOCD7II3EBSI
X-Message-ID-Hash: QT5OFKHHUDS5UPKTZ74XQOCD7II3EBSI
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:55:17 +0000
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
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QT5OFKHHUDS5UPKTZ74XQOCD7II3EBSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
Reviewed-by: Michal Simek <michal.simek@amd.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 5362f1a7b77c..270a4700d25d 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -139,7 +139,8 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 			goto error;
 		}
 
-		dev_dbg(dev, "SPI device %s using chip select %u", name, spi_dev->chip_select);
+		dev_dbg(dev, "SPI device %s using chip select %u", name,
+			spi_get_chipselect(spi_dev, 0));
 
 		smi->spi_devs[i] = spi_dev;
 		smi->spi_num++;
-- 
2.25.1

