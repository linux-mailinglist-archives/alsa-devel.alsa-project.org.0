Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C90682420
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 06:48:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9E8E83;
	Tue, 31 Jan 2023 06:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9E8E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675144137;
	bh=f86Hzy8iLhhDq0D20WOksdHshOHZ9lvOrNxxyPHljVk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UsHx+Sn36wwGdL6qJlmfj4IZj0auxYh+deO39Az13qX5qDQA0y40K5OmIQ+cG6fhP
	 3KCsbnS6kN4jm5QS1xEJ8e/cimyfncOuink0i25ry7b7MMXJmgDwCpHu4vYW1Nh5+t
	 GJIFrBWjFwvAoI9+sMJcpH80XUGGJzvHLqoP15Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E88F804DF;
	Tue, 31 Jan 2023 06:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DD00F804C2; Tue, 31 Jan 2023 06:47:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2042.outbound.protection.outlook.com [40.107.215.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 329F1F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 06:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 329F1F80155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRHegdNwvWs8IAgDDyqPNNViQADtIp+sP0iRbhnO6r/CKdNqwbU93Tx7+Jj2a3LYLpGD2iIx3esbVvl3qTenluvigaKv547RDPIilIRU8MbUUzcxuZOd05Lkqejd2XtkteEZeEOf/Y7fZFN4eKqHY03brN4tvYxkt86wks+KumXGwsUW3dMryJpWgXjA6p1C/c1+ZOaagZbbLxYU72e4xNjhsT4wVfQNK5ZtG3+8v6QN1jJnFYTGckjv/ToD0p7B/nhgyaKsbtPm9f2XUO1x4q1P8Yh5JROuX6/VNzIVmCeRDWPmIqY1Q5/D0Ri0K6DlX52dRN9PBz6wVcO0ARjfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W/0AfKEi0IFiC6OhySe1cvO7Nvtx82wMAIKgLmbLZg=;
 b=Fz//NRyub2vyOWRWU7TbxvMQcHV0ftpRytLGbc67BNABYD7JpRaoUcSWruhqlPBwqXxMQ2x9mOH/9aNH5OkplJmd2lV4Jgz13n4af13/vBsOYKZjzVjbr+qgJtUUL9RmbNGa/ZB1Uw9Sob7mdOGa6wa+zKm2YcKMP31ikOM8E7bYCPEpRMurdYM7FmF1cJNBvgMLg7Ec1Lfk4nAL4Lm6K5V4loh3fu0QdzFCKSU21AnzAV0Z8q20g5K8T9QfhbkzipaambIs9j6uf9E897ykledyivx+syAs668iZLa9RJZ5bd+pd7orPnqz2CLN8dLf259DS6neoYfk4mI8Bzy6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SLXP216MB0814.KORP216.PROD.OUTLOOK.COM (2603:1096:100:b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Tue, 31 Jan 2023 05:47:30 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 05:47:30 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] MAINTAINERS: add IRON DEVICE AUDIO CODEC DRIVERS
Date: Tue, 31 Jan 2023 05:45:27 +0000
Message-Id: <20230131054526.14653-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0080.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|SLXP216MB0814:EE_
X-MS-Office365-Filtering-Correlation-Id: a6608606-0316-4f2f-6710-08db034ea45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bd0UOn4KSJRELNmTkzxqjgxlZVP9PklHoZteyxl/fxM5Xk58ea6kNLebcHLimbqi7XFUNye7MPx5+0mYULKLzf2iTJYn13YGjo4PrVGyRffSInhnTQoz0Apu0PJ2BCIbIquk3tHHF5eF9kCg3QRCtkxmV2LJjQ9pgq6BKLasij5e+6af2ittOlvA6HsbdyZJaF+48Szt7Xa90IUd0VOz6Cdk4YaY3QcFqlzdcDNjxMuSVyps+NsxLXSgyOWFJoagdBzkDbiKVLTdkW++ljSwRCz8OYXjsAm1EdGBuj2Q6pPsv96AQ0x7mc2YuhUj+kgmD0Uf22YXV8pXs7Pj55zvKn/ksXQtlPjzblhQq903YLbj/wqFbtDqarMOw/BBaFledbtmessygNeFtdIZdvtpZayBvG2Au0WJaVk+D5cQ/4vGxXPhGamODgg5ilPwUM6ysPxXu6AibqSlQNS1bVbGwFUDk+M0eghjSixG9w5DTWImRHSEouspk8DKzc7KaZV+nRJ1jJ8ttdaiT1bma9U+BfAPALZ9CfNlSkvGeUy+6W2C2VDJFjScUzwv9N5eSn/ZPPUITRzT2IBI98pVJ1B6nRby/eMtEUmGpPIomQ9hxFvkQXJHyoFRPN0OBYKJEpBYaOv4TjQ0fd3HUJo/7gdlwfsSK38gkXRGy2zPloNxQgwnx/5SCNoVDSUvCvo5eszC+Xf5y90bgI9udzfs6CO6sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39830400003)(451199018)(4744005)(5660300002)(8936002)(41300700001)(44832011)(38100700002)(38350700002)(36756003)(86362001)(2906002)(110136005)(6486002)(2616005)(478600001)(186003)(26005)(6512007)(1076003)(52116002)(6506007)(316002)(8676002)(66556008)(4326008)(66946007)(66476007)(107886003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jzq/TydayOjmlL22FGUhpF971xbyW5Srwg6yu7vnYREYXESrdoV78wIWBvvU?=
 =?us-ascii?Q?HGuv8GM3OrDEzJzn5x2espZNjf2OsfAb8+DxmkIsH4jddrLXdf0+CKFcn7N7?=
 =?us-ascii?Q?UzpQ3aj3uBMhdgbB2v1bwYmvLZlS6TSArPTsgjVDUwjZgicdaVQCU3nXVbhA?=
 =?us-ascii?Q?iE26lPovLjSlL1J9JAwHlZuyAAFHY24X/7wQ74m1RttWE4nVWMfayOR+pvAT?=
 =?us-ascii?Q?ZMjDlWsgZtww5mAk/OeSDyjlpP1A5aO1eUtzReAGDIwrvT8TLRRyikNEO0mN?=
 =?us-ascii?Q?Xy0Gx7Gq0cNsVnVb1FaP9SVGb52X3dDko3WhMM2EJ/2nCM1KNLEiiV3AGMot?=
 =?us-ascii?Q?f8iFG+pZwUbti2uuS3oa2D/XgwGo1m/cCtbVnXuffCicFTPF37824GuCVZyX?=
 =?us-ascii?Q?kj61ClL1tp2+8bbvnwfSkpS2dKdfDYM1pLoDpcGMBUZrVYQkjsuayYhvMos1?=
 =?us-ascii?Q?7NBRwPpe19VICWKlUBNyWcoesxGDPXMZH9FQMEaWGOORVG+2rkK3/c/lTs89?=
 =?us-ascii?Q?3aYn7t58G9i+mMg09yJYp9TKHHr91Ded/k1yZFxm03PN+7SJH0RELUxziNZ8?=
 =?us-ascii?Q?d4jYjHyhRMnF+kzV+k0PVmjdjyVd4wHz/RMkNMqpzb10GqnpBLpLkJnP64rr?=
 =?us-ascii?Q?Cnw0NQGfS8lAdt1EWw97XQM96/AlrMA+0mKY/DxRyWuhupisEe/wU0R8Zpdg?=
 =?us-ascii?Q?r4MMLC10I3dFFSkhMi0jY8OYIPBXp4pQ81JLjjuYowzcyu1RNK1uEQmW+x2F?=
 =?us-ascii?Q?EkOIRl5Z45XPDMMbFWHis13/itkea/gIjJ+N0VgZDvljolmBshapz5T9eEX7?=
 =?us-ascii?Q?uEAqvxZj5pmH44dvWaQVWaPMuBiNHUX4k0i4Uf5sM3NBBFpZdJgOgFMbBijo?=
 =?us-ascii?Q?xTOY5Ur0Meonp/WAy4/zPlMivov91fPbqK82xWKiLamcEq3f7MakSa5hM/Vf?=
 =?us-ascii?Q?8HZhjGBF2BbWqKyydfA9L5qjkhuHDQQVe1M3amofyS5cs2qsn+zRjnIs51C6?=
 =?us-ascii?Q?2MJHRMnCToEZ7vXXkHh+zV6R3cP/npsd7E9Nhy1rMfCBoK7J2KZ00o3Uv4yp?=
 =?us-ascii?Q?erzaXaaArXBn5vFsy8Rb8xiYK4WCJDjSNipAHe+Rd5ExSJ4H15mNRmS9PEMg?=
 =?us-ascii?Q?CEkp5hAJGQCcnO17VFwXLrYhoCrcrLlrORYmQY29ex2EA7kXKpawRrj/YfPA?=
 =?us-ascii?Q?cDkGoFtofN1I67jj4HnuI6Yw8c0mlRErI4YNObDH/xm2hyMxVgBEBNxrCpoQ?=
 =?us-ascii?Q?VCAs4ukKaALygy24ogz4JyzMB8jGxmqnvTZnozh/9gOuWDt55HJlrEDu/oOz?=
 =?us-ascii?Q?lWPPLMHZUV7rMPeBlVuaQAkTRhQyh8vlj4L4gbBKg1oc5NAN4LBTBIWzgg7J?=
 =?us-ascii?Q?js0Di0fx10V2uIgts6ZLXrHDNXrJg9j74rgjgljjMm4haj7W6DJ/dqc9gbrQ?=
 =?us-ascii?Q?rQ3a00X89t9bAZ4hsTS8gcGl8Dy5wA3uIK2Wp8cW7T7vg4q1G93bT5vOoayI?=
 =?us-ascii?Q?vDf3VX1haUj319vRXMBLCeYnT8zvpsYiPY5FvddDzGQNl29/ziMml0AkNAIt?=
 =?us-ascii?Q?p6KBacj6uMUd01OtOMXGUrAzTNxBzy7CwwiB2tY1BlhkDALSYBCT9phlTy1s?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6608606-0316-4f2f-6710-08db034ea45a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 05:47:30.4340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHipYe19KPS3EuNfh/mlRGcN46MdPYKz61eIxBRy/rChVX/JDDm4kd1iNlmo3olQtKn8a6pn/mSyU4BbsvHH+t0qE2Wo+utWxNNY0ebah/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0814
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
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add Kiseok Jo as maintainer for Iron Device audio codec drivers.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f61eb221415b..e997f2482ffc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10920,6 +10920,13 @@ M:	David Sterba <dsterba@suse.com>
 S:	Odd Fixes
 F:	drivers/tty/ipwireless/
 
+IRON DEVICE AUDIO CODEC DRIVERS
+M:	Kiseok Jo <kiseok.jo@irondevice.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/irondevice,*
+F:	sound/soc/codecs/sma*
+
 IRQ DOMAINS (IRQ NUMBER MAPPING LIBRARY)
 M:	Marc Zyngier <maz@kernel.org>
 S:	Maintained
-- 
2.20.1

