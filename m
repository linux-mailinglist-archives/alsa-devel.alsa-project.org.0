Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FC495523
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 21:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20752D30;
	Thu, 20 Jan 2022 20:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20752D30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642708806;
	bh=+bMZlOcZF73Xs6L58a+zLgN4PUfNZpWzv3ezlxxU6K4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NuzfhWzMEYwT4wcgzf7VV+zw0SIIFlLUH2CvNphTa38bZyg66HbPc+vmNVYBzpXJY
	 ws1JFCe3HDD8eXr3g36XnCeJn5l449UfyzTmhEpInqXY6RDr/zvEhRPLsa2Z/prS/L
	 L8+AwhVERDgH+fmURmkVKJFe0JE9P5m02fLhaFsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C75F80134;
	Thu, 20 Jan 2022 20:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9584F8012E; Thu, 20 Jan 2022 20:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E466AF800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 20:58:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E466AF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="yiWLYFsb"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20KCcmFI002694;
 Thu, 20 Jan 2022 14:58:54 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2058.outbound.protection.outlook.com [104.47.61.58])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dprrpgswa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 14:58:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET29ja1EKnoeu2LF38dJU2L0j9Qns1L1z5dXBDBLY8oVjpCSavpKiTpxUGnBb/oZN5m/AuNzImextJ1dS+GyAv8wkCpdSJlaSJTyp1Ra2L9iguL5cd8u1fzL7jZ3rNxtrCl1JgsjGT7w2arz5xkmL+WpCeDGHNt/fdB0kCZ3cCtOPCXrQzIGTMTyB107RoArX/RWTe09urCUqcHv/uCwxfDBr6rdFc0PTLI1xex6ooysibWCpXOZIidLdrnX6pfDZ9b7rMteVKGqWTy+JZy98j40hvQXGUA7kNSy2bNfdVSWkT1l9NA58B5NCeTDEJ6AOwFuTAKDE47td9z4RpRiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OJupPaLSgGkicJA8GJyv5KdSAzwb1Svd5KYkx23h04=;
 b=CJbqSmLYjcSAmRihlyKJ6OxE9TgzpiaIVrlEdBaV9oTZn3qByh7dBQL+VUDa9gbNsdQuqSW+dfsqv/pCuE7GyQg7EWUVyD0QIdve/UDJGmQkogmUBalDlkJw1Z3T+hBckaq0fq1GjgmLHacyy7J1hqmmmPxtDgdL2PKOZhVkpnq24Axn2zqfDy43VqVaqiRR4F+c/k8tV+/TqPj0Wfi9cVRA5DpgLoXoIFbqkoeMwyC67iYPERp7hifqlvvonq6hifCcv2fkVLWu2UjXbMNvm3h4XiBN1WuhSbFimmKqLS4+A84wtKU/Ysr+cZqnVrq7R6E4HmIX+UP03jF79mn1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OJupPaLSgGkicJA8GJyv5KdSAzwb1Svd5KYkx23h04=;
 b=yiWLYFsbFZfxsGXgxid+kA8GyAdt5UVRdzkfrj8BCLLeUTQjN8TLVE89eBytJRVEDE2ywnQWienIUU60nIp/ox8kaJcekvhI8Nx7W+NtFFqucvUwgTeffWmnhUP5JUTR4BqlseQTEXczR+yI5XdLOnoScG7f9LVJTRGHnQm0AXs=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YQXPR01MB4497.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 19:58:52 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 19:58:52 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/6] ASoC: Xilinx fixes
Date: Thu, 20 Jan 2022 13:58:26 -0600
Message-Id: <20220120195832.1742271-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:610:76::29) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dec14b37-37c8-4509-f0a9-08d9dc4f4845
X-MS-TrafficTypeDiagnostic: YQXPR01MB4497:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB44978759797CF65C060E1A83EC5A9@YQXPR01MB4497.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2wcUqe1Qz+a0vXUCWRkQ3zDz1z5YRA4QreBSUfScYMVFLP8QjZLYCBbIAJOtKIYZQh+ctGiq/BiylxJUVaucsfsauq5tS/wEPIL8U6AQSVXg5dbPUQ3+JCWMDcY/UVNGm0migu5qTHEtpC/5Q6hQidvsvlnhTl9VCDW1JLNoBEzFe/a1XPUpgN7QqOWYR6iGsFDS/3/EnMs32PnFMnGyQP2RPm9qTOUY1UvkzQqz7X6lSaJvhxjPAhOTkBPhp6VWIWtteVKIkir8G6faxaLD5jy6xNRwQU/LUZUip9kB0oAgnI11Q8n5efTmKZ67/r5hbmMUKQJJ8lbYIr2g+8HfQLjedYWK1A/IzEB0ki9q6c/FxMEKQtM7wPxj0oj7kv1Rh0q2bfA49PizHwozeAhd1KMKPDvxPY5VNogXpE4Vw4yomuEZCLV98vtBBOmZFaRDiqzMSLiNL/XOeHUE4S483wHhkwKIjWEqgnYbWSEn0Hk7HIyPIAk0py5jFNskUvJxCTKl70mK3hsxwl0o68+Q+3Ylv5Eq4L8OrBe1yqUYaNDbSG9ZwQRsNlTUXZE2ycUAtzo7p6NyHx2aO1kW0pQsCti5/LBR49PIjkMR5FaSWi+EVbLitZ4aQ4Ho9BCx0wOZnS1/nrnxgI4R/vMyQnqekfue+6Y3QQL10HbnDUFGoOyudQLlhLcLWGrNfen3t4JPDA1+y+vVMY0CRt1Ym46Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(52116002)(316002)(6512007)(5660300002)(83380400001)(6506007)(38350700002)(38100700002)(6916009)(4326008)(36756003)(26005)(66556008)(107886003)(2616005)(6486002)(86362001)(7416002)(1076003)(508600001)(66946007)(6666004)(8676002)(8936002)(66476007)(44832011)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zzUnsClcMkErKjyZBolzaoIRoCTVAndfqCa+sgehw7giHZ4T72GJfXXaIkC9?=
 =?us-ascii?Q?DnYTEf3b+4M16ybjDv1cBDT0HK/UW036LZ5pTs0dnfxYMOV8rVdOZ0kCpkek?=
 =?us-ascii?Q?MpGu0dq4Y8a1eQDgGznBRtFDQHbI1Ad2SLtfPpifIn+brQbYsHkG2xUmMPZ9?=
 =?us-ascii?Q?UauG+3QV16y5OjEaG3i3DLuSKPIPhIFfHomCqZTw4uW/rijKasjrY12uXy/J?=
 =?us-ascii?Q?fbTWmq6n8J/L5kj6ZvWrQrhnXRDxujEh5gZ7sUD+4jdqesJwXVwPyzFjNmHu?=
 =?us-ascii?Q?jGv2XaAwiSJZve0HN0T21hEttkotHokMAtREMJ8RJ5K3WOeQ9SfFOOBd0fo0?=
 =?us-ascii?Q?/lkS4kDdt+ioMRDLgrYMYaaqxoGQ95md58V/UPQwWm60vsnYDrazgKyDkrCa?=
 =?us-ascii?Q?9RlhHLYo17hWvYTrr3A8EpFsZNychG84PyBzYOp0+bap7gH8sP/irv6U0p3d?=
 =?us-ascii?Q?V8GPnSyxOT4y6D1Q7L6ge6XagRnRBEkl5liwcH+5PnBaVgta5gvvUUSj/zaW?=
 =?us-ascii?Q?RGM5g841l2cXGfWnBIo0b3xWuGffM9w2AoGdvRLdjY1xerVGAJallhnsc9Wn?=
 =?us-ascii?Q?I9oFLq57bEUI0abEzBWcV2cY24oJQnzJ3rpQa2gREXLwxx9ouLH28sZieIf4?=
 =?us-ascii?Q?WkmF2X5yL1Lkb0VjAS3bTa/pIA2m8fRgP5be/+DPYKzlzGCKGDF9Fa294LEn?=
 =?us-ascii?Q?/qc5Py516sWWk6mSufZ4odPJ3ZuOa5HAmMKEZLkWn9CcqLEA13X4D3sQi/CL?=
 =?us-ascii?Q?hxnpWSnZmxGzYh7EdQOtMn3Sng5qX5zZQMr1pTuOfzpdTvHVbIA+d95jnsdv?=
 =?us-ascii?Q?tce9w3f6NalUHuPU7nCy1um8b+Ll+qO/jcRjyUDWUKZe4VnvLO78AExCqIHc?=
 =?us-ascii?Q?63VPOJOmZvqfZX8Wa/f/WtUYf7pRga76jnd8k1EVLoVQ6UTSCu+xA0m++/F5?=
 =?us-ascii?Q?brC4/atPOIjkiDVkUhqg7rm2ag2RicufAl3IGUGJL0LgeIUNA4EaLE6gtTkA?=
 =?us-ascii?Q?6JFIjXTqwVuwiSRT61QzCuqjH1EjGJe4NO2/QUsxlb7E8CjhU5UyvV14tGYA?=
 =?us-ascii?Q?YiD6PCIDOVxbcsvwuKADzmcjfV0bVhdUsl/YVVQkUXAjxfNR9+WN1Z8niTJF?=
 =?us-ascii?Q?KSrnTro0dJTL9Lw2/1rzCBU/6raEc6ZLUmQtH9/kJB7+dIhSYUBytiRx03ep?=
 =?us-ascii?Q?7pseB6sB6eVhB3yYIo/JCj6AZYU9T28qPUTOQ96I2Vbf8IwROKf9bwn7PAb2?=
 =?us-ascii?Q?f+1lI+ilebXgFh7MXLn1z++7fvuOfAu8P/nHeoEJKT2XtOjqz5GxglKGKhnY?=
 =?us-ascii?Q?CuvquzQaJp02hghZxD/8+eKykvvQwg9yEOpEB/jhfphWrtfdRr+KI4IyN1dp?=
 =?us-ascii?Q?ENEB0u+sh7nfN/GKhOriNiDMHExO6YFxTgNShSjdW3Q02Yr4Fphk8Y7pMKPb?=
 =?us-ascii?Q?XEeHPKhFnW1ZpSg9lUPAaZ9AD2uMF+2ROaEAGMI7HaT3IG4AdqKoxoFkaPRu?=
 =?us-ascii?Q?lswHma3uQx0wYZHPt+RLWLHda2Yn0b1oE7lKIBJQWEfXoW/HOFaPT3Kb8Fo+?=
 =?us-ascii?Q?qFgj+ZinWj0dF/6Q4J+zA4u/rRqomGrqjolDgV5CX+UtYlWkjG5iXC1yPa/z?=
 =?us-ascii?Q?1CJI/xj2TKf90CEhf9O3RBTm8t4e1aox2V2FA/mfHLhZS3/YfBlfyPnJWP4e?=
 =?us-ascii?Q?objMiRAlC4ajmN3Xf8HWa4Xhot8=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec14b37-37c8-4509-f0a9-08d9dc4f4845
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 19:58:52.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQIvv7BntR2367Qy2GSby3svxU4lQpCDK/9EVZd3PVV1f1YQI06/KIf7vQaRLAZoxx7OLqsWAkQ/2jsZAi6IrK6rt5XQDCD5Fnp5/1xjGvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB4497
X-Proofpoint-ORIG-GUID: KZ0l9N7lTX7ByxX1GBrYsGb0DXem0aEQ
X-Proofpoint-GUID: KZ0l9N7lTX7ByxX1GBrYsGb0DXem0aEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_08,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=689 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200100
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 michal.simek@xilinx.com, Robert Hancock <robert.hancock@calian.com>,
 broonie@kernel.org, maruthi.srinivas.bayyavarapu@xilinx.com
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

There are drivers in mainline for the Xilinx Audio Formatter and Xilinx
I2S IP cores. However, because of a few issues, these were only really
usable with Xilinx's xlnx_pl_snd_card top-level driver, which is not in
mainline (and not suitable for mainline).

The fixes in this patchset, for the simple-card layer as well as the 
Xilinx drivers, now allow these drivers to be properly used with
simple-card without any out-of-tree support code.

Changes since v2:
-drop patches already merged
-added constraint to simple-card to allow enforcing valid sample rates

Changes since v1:
-formatting fixes
-renamed last_sysclk variables to sysclk
-require exact match for clock divisor rather than rounding to nearest
-broke out driver data structure change in xlnx_i2s to separate patch
-added constraints for sample rate based on sysclk to xlnx_i2s
-switched to separate function for DAI parsing for platforms in simple_card

Robert Hancock (6):
  ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
  ASoC: xilinx: xlnx_i2s: create drvdata structure
  ASoC: xilinx: xlnx_i2s: Handle sysclk setting
  ASoC: simple-card-utils: Set sysclk on all components
  ASoC: dt-bindings: simple-card: document new system-clock-fixed flag
  ASoC: simple-card-utils: Add new system-clock-fixed flag

 .../bindings/sound/simple-card.yaml           |  11 ++
 include/sound/simple_card_utils.h             |   1 +
 sound/soc/generic/simple-card-utils.c         |  86 ++++++++--
 sound/soc/xilinx/xlnx_formatter_pcm.c         |  25 +++
 sound/soc/xilinx/xlnx_i2s.c                   | 147 +++++++++++++-----
 5 files changed, 223 insertions(+), 47 deletions(-)

-- 
2.31.1

