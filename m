Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8DD45553F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:11:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C36218E3;
	Thu, 18 Nov 2021 08:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C36218E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219501;
	bh=29UH+agiG+X5gC5QwxL1+UQGBRi57ixVPttfE4rnrvE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JaTExbvkQZhWLvM/urAvwNeU7IO0OWBaHzeTQiw5waNTBgRWDarz/6Li3plNbi1oz
	 shFuJ0NYQg5cGOb7QgS5G+3n8kXy61fk7Ru2dZ+qX5LUn4ZG0bl4m47iZAbXD6ncH8
	 zYmo1S62OzMhTB2snJbFq2BhsL+UaKmtfOQV+mZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1526AF8053A;
	Thu, 18 Nov 2021 08:08:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A023AF80535; Thu, 18 Nov 2021 08:08:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2063.outbound.protection.outlook.com [40.107.101.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F611F80511
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:08:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F611F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="S761Z5+E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfmF+5ZU+5SdQDi8mAs5DM/fzOXExlQ2tqjcczIpkib5EtCb7GqyfIKhIv+ifIGEurS2E2W890dPIXysxuHVv0Ne0aiId4V+lNr9mNZ3wzw8prlExI/jA4c4iKbRWguv7R0oxvOZdIgFO/cYvhSr35SbQQPBMrtLqQtnNbG4GW5B3X36Bj8KTqq74jS+JGIFAgk1DDa3yAE3tvnQ+ml8HT/bn0Ly3G25N6DwJCw0WlX2V9oIgs/frGK6SNNRodEUkZd6VPOyiqatiBca9MBsSeuv1pthTTuP8LCwXKYq7qumRPozB2M6+LrNGL4wUeoZXkhj4TtxFe3I4bIQmf0PbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=OUx++er7HMowhUrE9ZtHdKJz9GSPrgg/s2p65NVCtmqMJ9in/sMeZRLsK1RtCJuBY26sdi8Ute5wkTI9dDcqHNcL+P3ht5HMoWJCBq4YDTXUYLF01exWy5zcsVJpKaVJIgkuQWVHagikdtQfLgYlWozkN6/N7fl9dzw4vnY0fKWBERD+FBV5HxYZvzklgb/Z4CX52tpc6ZqeBtwhreN07/4M4rP+DP5ASXs2rCddJbINeGRUbzRSCtx30w8otHeWxCOqKK95wzUUyDdKVyfxJnZglV6wa6Runy+qCWL0xszvX+yGWOn9/eOJiEBTStiDz+IUM5RccLHOKs9K2D3y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seKJXWAwKPt0HlTyQtw9cWNRWo8z3o3zV5fHVffk/V0=;
 b=S761Z5+E6NQKkHjuK1f5thcn6NyKd2i+sbW+oaLtN0i9vwYmF/8LrrLV0wcqBjZ09tbN6J8kadUTd9asRHN0ahMqbXeFDawL40uahpC4IQ6ir7DSLoUyyxbtY4ELNwarmZQ3EuwMaDXItk7zz6WozKoKAwFnGY65zT+PmPc+4hFdmhjQj4qP2TKbSLBUO1bI7iiALgysgD+mYwinAva5V2gn9xA2US6dvUiDX9IplUHz+AY2CawNVgBRHqSeaC9j31UZdOd2oQe2iFe4SljugRbfVuQ/h8eSxEeiu7ovgy/jlqFCxFkm+pK1vye2PY8dKDqAz3stxjGc4Vhiy9BJ+g==
Received: from MW4PR04CA0162.namprd04.prod.outlook.com (2603:10b6:303:85::17)
 by DM4PR12MB5087.namprd12.prod.outlook.com (2603:10b6:5:38a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:59 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::98) by MW4PR04CA0162.outlook.office365.com
 (2603:10b6:303:85::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:57 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:56 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:54 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 11/16] ASoC: tegra: Fix kcontrol put callback in AHUB
Date: Thu, 18 Nov 2021 12:37:06 +0530
Message-ID: <1637219231-406-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e6bd86-f6bc-4a42-8127-08d9aa622661
X-MS-TrafficTypeDiagnostic: DM4PR12MB5087:
X-Microsoft-Antispam-PRVS: <DM4PR12MB508710CF7962947663F0FD9AA79B9@DM4PR12MB5087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68a2v4+RVlSZizGF5mtDMlGnj9HJNb49LDlOKhkHg4dWQ1tYmOLVC0ebfENRlIqoso9uJy4YXq+m1gUDJDs9YLugOME7GNAO272GOSWPqdHwdoDbkTpnWVdEh0YD8LBU6ePdF3Fcm8Zh8DfDq7xtAan97jT78yV+TQM6lJn2pnjaPzRBrllyF/jEdATdrabDJhAHQJZEPeE4ZN2oP0OBSD7BQxpVUYwOwVyr07ZHVx4StM5A96fBuPlgsFbybmR35v0ixEhcEugmCxJxpCWtgJbMu6d/nxuh2MQ03QlOK8yz/8+ZkMO6yFdbb9xekXrAgtsKuWAsdZLAC3u1rv7onbDR0nAU/78lYhx38PNOQonlS/ce3XhY5fqmXWATkxxS1L29c0DlgpqEtcedxqzhM8siDN6vXnLI7bLmtV9T1J+hAc1cwO150zllvJFAKh/iR/oGzrLKqc3bOjqCsZZM8H1x/a/dgqR7Gnpw24dQJu+4cpb8HXfvpfGnK/Qb7qTlGVl/7fOClI5BlXunUbZrDbUupr1hzzdbfQ/RZ11GrjD/tGC5WnutbuXSF9EOflhU1e+QrFVXt5e1346ZWNSgU7L+fA84MsWIYVYaKLoH6W0uuAI5kZK4uKCnPJ6wQ4kA2ZE30/uRGCCpn5gLv44DhCqgpI6MObhAiilj2FXoGmyr6IYBv0CJ7m1qLBLStz/c0XiKljV2OZNWM5GybCX4qQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(26005)(7636003)(5660300002)(356005)(508600001)(47076005)(336012)(186003)(2616005)(82310400003)(426003)(86362001)(2906002)(7696005)(70206006)(70586007)(54906003)(110136005)(36756003)(8936002)(36906005)(8676002)(316002)(83380400001)(107886003)(6666004)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:57.5947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e6bd86-f6bc-4a42-8127-08d9aa622661
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5087
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the AHUB driver accordingly.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_ahub.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index a1989ea..388b815 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -62,6 +62,7 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	unsigned int *item = uctl->value.enumerated.item;
 	unsigned int value = e->values[item[0]];
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
+	int change = 0;
 
 	if (item[0] >= e->items)
 		return -EINVAL;
@@ -86,12 +87,14 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 
 		/* Update widget power if state has changed */
 		if (snd_soc_component_test_bits(cmpnt, update[i].reg,
-						update[i].mask, update[i].val))
-			snd_soc_dapm_mux_update_power(dapm, kctl, item[0], e,
-						      &update[i]);
+						update[i].mask,
+						update[i].val))
+			change |= snd_soc_dapm_mux_update_power(dapm, kctl,
+								item[0], e,
+								&update[i]);
 	}
 
-	return 0;
+	return change;
 }
 
 static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
-- 
2.7.4

