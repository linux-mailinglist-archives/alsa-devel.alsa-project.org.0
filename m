Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF4E72DDD7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 11:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3901F6C1;
	Tue, 13 Jun 2023 11:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3901F6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686648986;
	bh=1HgnjORGk3hplnrZ6kbb41NGmJ5xvOH3NCTRBz/Fev4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LhDYF57kRPdHSJfQUzqMpufZE7ZMsaQj2ODfUxojPAFsGU43jO2Gq3wBwjzCNskA0
	 29MHyQpMdiuzKfr2EzyexE/FBtKahkNg6Eu7rYb12hZ5kfT4hTwOKTx+qB/Pv6zyMR
	 hxeU3U301deX2FxRmSWeiF22gi0AFDOb9CB7rMrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB510F80246; Tue, 13 Jun 2023 11:35:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD77F80132;
	Tue, 13 Jun 2023 11:35:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBA70F80149; Tue, 13 Jun 2023 11:35:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C2FDF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 11:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2FDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=hUfGOfUQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhGMG3A8VKWgpHnrsGgMRaW1neKlOBqR1uSGSRadryW/QrogMWuVuJFtvRXbXaeAdIMn154nANFnkbayQ9BqtTpYEFhy825ZuphmMTs9Ntx4HgsPVbfwhkmRyGk4Tuf6IiCN+4/3qjmkr4L9GWHqo3QpGSpyC+DQO7JbsGAF4EWRWLB57m7DN+eLUu9nNo9gBf4ibh0VEKWP7EwjN0Pv0wqY058YsssnXqQr6aAfMU+/8503OSIe6znr5PWXfDu0rsBSl1nTpKSnH10iAC3PIXf9oogjYtlz/mzqx8hUe7QF7dMPQ9qqVCAkFzxjFd4vit6yda48JBAFWhoIpVbOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3Io9K83WgrGdpAvw7nNzrnGpVxSEopATy8d9VeVB/E=;
 b=lEgasJne52nQ1kGqO5Rh5t2Zr1Rj67TefQqsW1shV1Uk/bR54J2t3AlYqyZsa/7DM/UzOmlYFqBTTB8ikr2M8fn5QkRsXQ0cItj8aoujTfK+6QqzI50zockcZp6tekm9nLl8q2t5ejwjmCB3tzJ+CDmPnQCCtKjRMCpDPx1YpOrQNzSaGwOycQylYketCgruSJNWCHDY+D6bFjrCoVZ/l3tHzeiH/EGyB/4Np0b3/Eyp/XmSS8rpjTHVCfuclW1Nx5qoWnDU3H89p+A8ja70B6SaezPnn8McCFvWMLC6AlA8RbPwBQ+5i5frdMfwO4AhFwuDG7vEdJwBLzFklR/DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3Io9K83WgrGdpAvw7nNzrnGpVxSEopATy8d9VeVB/E=;
 b=hUfGOfUQyxze0T8aUPxA30NMSi/bkgDvltfJ1TSAX02AJMG41U1rxqHiyfk8Fm6PxK4BoRvGRLylLzSK4I4bZvhY7O51IIbxcRUFVpsY+EPun97rwqtiCw2udLbUpbehyN/dWV8IQ5ujr3nZcECjsk+1ebVrwA0zRx5YKgYVLHS6alu9kJgOrvwXpv5rZWRb7XspWFU1tu6Fl5MgTXOkEXkKvJcPPcVdLp8IXoB4/9B5eY//aNsdx9xocxMvsJ36ty/276HmPZCsXObl7XANwB0kVaRGovzdq9ktpyUQx/6FkCNwcQ/WW1/aoFMskOi1D9Oys9PVH4HASBb6PWjKbQ==
Received: from MW4PR04CA0320.namprd04.prod.outlook.com (2603:10b6:303:82::25)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 09:35:19 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::3d) by MW4PR04CA0320.outlook.office365.com
 (2603:10b6:303:82::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Tue, 13 Jun 2023 09:35:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 09:35:18 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 13 Jun 2023
 02:35:07 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Tue, 13 Jun
 2023 02:35:07 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Tue, 13 Jun 2023 02:35:05 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Sameer Pujar <spujar@nvidia.com>
CC: <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>, "Oswald
 Buddenhagen" <oswald.buddenhagen@gmx.de>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: tegra: Fix Master Volume Control
Date: Tue, 13 Jun 2023 10:34:53 +0100
Message-ID: <20230613093453.13927-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT047:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f53fe2-8a33-45c3-d50d-08db6bf18089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kTW7EBgEsZ684ctDnzybxqp9QA44Gphlp5MH1WZWgrPpHWcmMbSIN7Chh75zTQAKSYLnbDBY1A97X1dWUiEtrRV+NARk6ytmMIzJRhFoeJFTbBGSfYU8PWsr2FfIxHTuJu2qCo5fzRPnaCc6+utOi7q4OtNfEJnxtOsA0Pmj4swyoQj98IS1iiYcJpmABvB78Q25wLzl5HhfsmMG+xzC1JO3RK7iP81XyqlZD8gd21rkOT2K7pEyaixYSZWj7bn0LGCBGK8vvP4OUToA/Z/lmcyJs2KSFTyGRxX+mWpiiwEZRuvTkcP1W3CbpqhlseQ3M0NjiXGLCw7+yNH0iGJCj/iybnBO9ZKwlG6dD5WIroARpbSnZHah613tGLTjcg0XDDMRcczXfFz6dDJafBSPX8A1ovRqzRkQ8/k/3/WuGQ1qDiMNaV4rEEaIyKYE3EwISHY9Ohne6ebqt96i0mUrtWiTTlKH2XwWhMr9RlK3Y72rFus4hZi+yAD5aDH/jxc/3lrwLmf7+6dMEmsaQcB9VUNL/Xcdr+pDYvdmfGtM5Pg2EFpyN6iwgv5H/93RJECfEvNHr6Gs+TFR5ZZMctzFx4wGYjwE7LgfgSw7ydvh6lzpjPG/b5ar9KRJpgwhdSUFRDWVZToLF7KAe9U7OEK5lpfJEu8lR56/UNYrGl3TIXn+Nfdv4cOHOTE3EQK63F4FNDtcE7WC7WsoPw5e8kFNQ7dRBjZD+9bs165NEoaJDxQ=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(107886003)(36860700001)(7696005)(6666004)(47076005)(336012)(36756003)(426003)(2616005)(82310400005)(86362001)(7636003)(26005)(1076003)(356005)(82740400003)(186003)(40480700001)(54906003)(8676002)(110136005)(2906002)(8936002)(41300700001)(316002)(4744005)(5660300002)(4326008)(6636002)(70586007)(70206006)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:35:18.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29f53fe2-8a33-45c3-d50d-08db6bf18089
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975
Message-ID-Hash: VYHTT3GLVMMYKDRIYL24QPRPCSHR4WJ6
X-Message-ID-Hash: VYHTT3GLVMMYKDRIYL24QPRPCSHR4WJ6
X-MailFrom: jonathanh@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYHTT3GLVMMYKDRIYL24QPRPCSHR4WJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
the PCM wait_time calculations and in doing so reduced the calculated
wait_time. This exposed an issue with the Tegra Master Volume Control
(MVC) device where the reduced wait_time caused the MVC to fail. For now
fix this by setting the default wait_time for Tegra to be 500ms.

Fixes: 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/tegra_pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 468c8e77de21..0b69cebc9a33 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -117,6 +117,9 @@ int tegra_pcm_open(struct snd_soc_component *component,
 		return ret;
 	}
 
+	/* Set wait time to 500ms by default */
+	substream->wait_time = 500;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_open);
-- 
2.34.1

