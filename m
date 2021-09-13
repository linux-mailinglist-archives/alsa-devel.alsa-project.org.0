Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E84099C4
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C167617BA;
	Mon, 13 Sep 2021 18:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C167617BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631551480;
	bh=Ol3w9he3LwwCt4LZ9fWGWS1i6g3jY5hLeW767u+7+7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aPaJHvIaAC4C806PL4+AAHVwaPU5Hfq5ILkR01RTiht4W4/dKkSLCpMGdlVQSbiFw
	 T9UG6KdvBY+nhfdAvbnxC08lctseE1hfWm+1HzMytGEL2b2zISLTXAg4dBTWwEU8yn
	 1tIdRUySECP6BCugb4FdfI3RwXbcuMjVrA8Dpfng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F256F804E7;
	Mon, 13 Sep 2021 18:43:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A593F804E6; Mon, 13 Sep 2021 18:43:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3BE8F80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3BE8F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="WGZVvxmn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvaC6YZNaamAJimenPyqyVikdRRhnlw6p6CnVclmeXi+TF31O5aB0dYn5O3N6PKnknQYskPfH7Z6u4iqIZ0Vheq/tjnHZVsU0H+8KjRtoj4j2rbdP962cv0LSFLb38oFPu9fqm9x4HgH/mE1yPJhauFMAIMNN0nP9T6+sXP+wsY8FCNJMsQFOvW6tgBCJgBaiUkJeaWh/iLGbhKlEFebUJbqh0knvTfa+eIDrcjtXlntOlJlg8vp5nj/3Wth+YLtFDiSTSekDWAzBmxrqeL9791ZatSFaCHBL3c9v8qnVNidpAUyBKYikpQIQ9aWvrxoyXrqwPBV99pCwE/Y+lD1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=cI405Nbt7VgD/lV/lHbqT8ZS+ilQsJxVbkbrGr9gaYOCiZAOYyHW0mWQ0lU1aigsXGgPfulLZGAXCw16pf1iACG2+whwQSMTHN9rG92nWCvgjvuKy+XZNImA8nmDTdLj+9EhuBhOprv/A8tWBDmNbynRIEopiYu4rw4nISX01W3KaJpNQ8UQnGJDFwFHHr9yNfKT8XxWlY/cGs/pTA9KUjlCW3otDNZuN4MFH/PEvW1Bt32SK98f6pGo5Upzons32e52c6vCVWmcGffy/7wO1iBNlYwdf1RqfXKRwHxwF42dRu9VxxblKQXDRXmgouqNIXAneIQD86EW+G1kI4uVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=WGZVvxmnJgnSLqhqc8ML9alBPXgQm8sQWMCa+K8oNe10cG54+gegRdjXGvP8U1N3RPtlLaMIgxxnRQqJ+nSdEEespOrIavSUh2Z8JgVSyxA7iuR6hQ5QMEu04kFS3XgW/sUAIm6FymB7k3n0T/xMKs5i/hGvRSxrzUHb91Y8fcAXV5ptBn+9UIyrR8MMjy6xgyXJxqfnjn3Tr9V9brVwFqQf59CZNk7FmOr8kZtdd9v2VYfHUS3Wy4YXfigUJ3pHHz+9nsUr77m/tlNcd02bavI4vjrxJCZ0kGsmbheTxy3Q8edLnA5EVc9Ww95EFl3AS+KxcDk21VnVfUj0pIpDZA==
Received: from DM6PR03CA0051.namprd03.prod.outlook.com (2603:10b6:5:100::28)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:42:49 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::3b) by DM6PR03CA0051.outlook.office365.com
 (2603:10b6:5:100::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:42:48 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 16:42:46 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:43 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
Date: Mon, 13 Sep 2021 22:12:09 +0530
Message-ID: <1631551342-25469-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 113a2fc6-5e0d-4475-cd3a-08d976d58546
X-MS-TrafficTypeDiagnostic: BN9PR12MB5226:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5226201C8B908FAE4A6F99A6A7D99@BN9PR12MB5226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YOl4AFnxzbkpBnUGQmZcH6zbPU6ZW+t9fKpIKG3ZEe+CnYNcOmtOq67iRCaTB1WtQTr77riB/fji0GJDvLVNruJiP9MhAK/bDrmq+r2D3ygBwtitF4vArVqBdcvDStK0FR6o8YttA4wfEpGYvXccBFK6laITcupk/iN8S0Lc4uuwtIFtinLADwrksIvpxhkBZ3Bb+ZzrDKz4ZKFr3oCGJE+kp5nd0mfF9yZTGdJZGu/Y6Xd+ZRLEC5xKjfyuwmVUWii8o29mhtJ76cC/7OD8ZPwM0+ByS3MOemAfFd/AkYlr+z/uZS6KZq9SLS04vWX3G7XWeavjc1bwKkk3zQqQIuIrCKoaxnFlsWzaBDGM5QRwYmJsOZn08LyHekWPtBGKzcQ8kCwQTZeheBL33YBpqi1xPcXWlnJvYwkiJzVWf7goaDrJ9F3MF9jxTUMGe5bx+8/iXD+vFDcViKwygeY2hNII4mDeEHdZoBYMrLeCt7ujqpKEFOWQ06UiHIll5iR2Hxf55y5hFT0H/i+0hqthJLbCtU4lS4wZiHwa/P82qUDrb9uFewoghs6bjdfZNJ26jXlQiNUMqtzjCsGYzsZn8GwMqf/+l92sHQ1Z4RdbSFM7BNHprU5rJYLqX6EbjCvyTWkpohEo2MslRhJnN+mSFKSj04jouYYeJAXyN+yBXlvITXysXRUwNk6ChkkkJvgvIehgLvgAqy7MzqPpmYrypxTZoG95mlzbvlBvNdfxPw8=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(54906003)(7696005)(6666004)(110136005)(336012)(4326008)(7636003)(86362001)(8676002)(478600001)(356005)(36860700001)(47076005)(316002)(36906005)(2616005)(426003)(36756003)(7416002)(82740400003)(82310400003)(5660300002)(8936002)(70586007)(107886003)(83380400001)(70206006)(921005)(2906002)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:42:48.3428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113a2fc6-5e0d-4475-cd3a-08d976d58546
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
 linux-arm-kernel@lists.infradead.org
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

In some cases, multiple FE components have the same BE component in their
respective DPCM paths. One such example would be a mixer component, which
can receive two or more inputs and sends a mixed output. In such cases,
to avoid reconfiguration of already active DAI (mixer output DAI in this
case), check the BE stream state to filter out the redundancy.

In summary, allow connection of BE if the respective current stream state
is either NEW or CLOSED.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 48f71bb..e30cb5a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1395,6 +1395,10 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
 			continue;
 
+		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
+			continue;
+
 		/* newly connected FE and BE */
 		err = dpcm_be_connect(fe, be, stream);
 		if (err < 0) {
-- 
2.7.4

