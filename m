Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E8D22E516
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 07:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74561696;
	Mon, 27 Jul 2020 07:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74561696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595826123;
	bh=heq+yA9r6yhV6BJ19e9uUiMBYTJYaJPHr5aJE7wPFf8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=no1nakpTO9DwHQowHeTn9VqZ5W57+L76WX3rYHa7j8QRiR7VgRYQNtc50iZ5aiBlf
	 nueWHZqBXBi6lS8gEHUTwp81zfoNYoetuodKtUMqFm8fBoXWE0vC8CGphGL6Z2fwzg
	 2U9EWpYUd/frZHPx9B8ZpXeudtt9WJZ69ZHgT0L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE565F80158;
	Mon, 27 Jul 2020 07:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA87F80171; Mon, 27 Jul 2020 07:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2120.outbound.protection.outlook.com [40.107.223.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E11EF800AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 07:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E11EF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="Pf96SI55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsvWSZXCtH4CIS/0PwVZb41VoNhX2vUwEY6S8whxbzSsMGErTV5YgaMZg8sPo4gOuOSUfcw4/7WcppOVur/OIQsszPi2YQ7aRqvk2MEk/DOVs4oN+9thyN6YX2NtowXHu1usWerljzuglPQyWbZ/FyrbeHsAzNSUavurHKUlOGS2Yy4Fv5fEBJBoHiL8OHURw48lm05sCXqn/ZbHFZxfoXii0/fOYHvumX02KT1fWuwHjqtw5RBd7502b2Umdpg7EG+ZVkTWNXC6Etz5J9tcqFvoSwr908WjfuLqWNbCcOX7otH3p4WKs3yZjZl9neqD8jEW6oySQLAfu7xPjhe0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQNHTtxIzShBvGtIlMKkz9O/8pQkqF0MvUCX51cxJLI=;
 b=UifOplsIkCY5z5ps5pz77mONkfNXFWaTH3CituWbTNTPHzFMrI52kUgXI7EuxB835Ga9ART/u4j6VVj/y6q0qnDtY9qcyR02Gi/wJkLJENm/Fri0IiTyXbFG1LOsfamNG1AsBPqCNd5S9AK3GBtmxPP9NKr8JrHbYjjzFJW1YgLOlsnsaOjGBHr2609lZaFodATsXnpl/QFdAC8qCN+i/+mSzDsxd6dtvKDgR2LlSLkk/cEXuawTbQ1yWqXXBlVRdq78NSCvXnlmagcMiTx2NefbvP9ZYH16ISI18AiWjXIQlpWK/npJ8IOVusMXqbpRKm/YNYVEZoZAApumnbpQCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQNHTtxIzShBvGtIlMKkz9O/8pQkqF0MvUCX51cxJLI=;
 b=Pf96SI55JgoRFujz/YhIu4eevynnpXmsSYUVgsLewr5zBMwl8mOFUbJ4b2fNh8H/DaqFb3jSUPpQVrrWhLPhJE5fAuVovDYSsH+FYnKQAH6gsjfHjEuv2nb+LOgzygqzXsuuQGJDJNAzAGfZVLWfA0nUewDKL7sT+VZxURUoUHY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1600.namprd11.prod.outlook.com (2603:10b6:301:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 05:00:03 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::d9e8:a3eb:4f08:e795%5]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 05:00:03 +0000
From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RESEND 1/3] ASoC: max98390: Fix dac event dapm mixer.
Date: Mon, 27 Jul 2020 13:59:32 +0900
Message-Id: <20200727045932.20877-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:100:2d::15) To MWHPR11MB2047.namprd11.prod.outlook.com
 (2603:10b6:300:2a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2001:2d8:ed2b:74dd:b4b1:36e4:d148:7e35)
 by SL2PR04CA0003.apcprd04.prod.outlook.com (2603:1096:100:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Mon, 27 Jul 2020 04:59:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2001:2d8:ed2b:74dd:b4b1:36e4:d148:7e35]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d0a5520-4826-4312-784f-08d831e9ebed
X-MS-TrafficTypeDiagnostic: MWHPR11MB1600:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR11MB160015B8D48804A38E59528992720@MWHPR11MB1600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iFRArY3ECcAcczKCSPuEU540SkDA6hYwE8gyyI8mPWrxcbZQHeAL01KBCK6uFHt+HlKHLH+uRx7cVZN6P9o+u9jtVOivdnwqFg+Qv/8gwjy+/FTQiBsQImnI4iNRBzjv7gXnGqrVwIxAhPK+xVBpCQ98+HiZy2Yy3GRzTpbkrP4/v/jOqavA/nVMgO4Hvrbgeor1+N9DeFb2GZFkNViM5ycz6oau+xwPQ7MTRQrH3GlAJ2XC3DaIVBEmofM/i9pe5eUkNip+ANdmsQwpY9Za7Y9G8/yn1bBJaMEaIRqkymK4ZRJRNbzQwJkf0+dfSYmdf+4RUs6eQj5UYXGK2pj1CKVmzKe5twWi+3kfCWmRzkomeVgEQBZBbDglEWm3o/rhUxG5aYF3k+taJWqx0BUtDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(66946007)(2906002)(6512007)(8676002)(66556008)(83380400001)(66476007)(7416002)(478600001)(6486002)(86362001)(186003)(16526019)(1076003)(69590400007)(6666004)(4326008)(4744005)(8936002)(36756003)(316002)(52116002)(2616005)(6506007)(5660300002)(921003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: aG4qphtL05KpNrX/D+Qqb32LjiI32OHcnuHPRVAnimtmwTVSBwtkLquRbAVg7wPVFTTS7cwg1omEAFlv8SNhBEGMXunSpZp6tWMwuC5gvizhrd1aDTbX719RONNBsmN/5jYLbLTUI7Fji4MtjjHpBVlsF1Pr88rm3e4Jqzl5qClFSjein8zH5QEPH5Yjp2OnHlHyay5FhP65ikyyxp4eN+P/ZrHl4nB1z1ADZTcur8EDntltAcPjGGn/jca+yzZMp2R4lV/8Rkg6fEd/hFqgsf7t6NAJoJ9n55t34rJP2AaPM7QbhoeKeDCJhZkNmmumJfInjSX+8ymbWMccvZ+MNVUKPYscKMTiTB0pXg1No9ytpHtYMBOPPcp8jfdSo9d6FrSbOubi3D8RJgah8O1MR8s7ix9WLtuA9pkazbyRYwMFf6hHsWdcNnaAy25tZlLG4psSRQ5WMIaBPWQfzHQXFFm78dgntmNUMsxJ3KXqwkhJ0kXbWFXzw8Ds+kqMt5WIB0a1Th9kFE54BrgTW7hSBXhShq4vrMK8pdAb1icbHfFk6aTQ5Z6yWtJY1jrX5/yz
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0a5520-4826-4312-784f-08d831e9ebed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2047.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 05:00:03.2472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhOmTndpuy0SJbYdQCn+OEW9M6Imu6ySFO7JBAh/mjd1LJhvM0G/QsxoSOidG/XwPT1UgFGAVGts9Nqvci/MP1cABrhX3YSbnkyh0LnR2ZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1600
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

 Global EN register guide to off before AMP_EN register
 when amp disable sequence.
  - remove AMP_EN control before max98390_dac_event call

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 sound/soc/codecs/max98390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 3e8094241645..44ffebac15ad 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -678,7 +678,7 @@ static const struct snd_kcontrol_new max98390_dai_controls =
 
 static const struct snd_soc_dapm_widget max98390_dapm_widgets[] = {
 	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
-		MAX98390_R203A_AMP_EN, 0, 0, max98390_dac_event,
+		SND_SOC_NOPM, 0, 0, max98390_dac_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,
 		&max98390_dai_controls),
-- 
2.17.1

