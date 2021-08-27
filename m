Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CAA3F9727
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0394616E4;
	Fri, 27 Aug 2021 11:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0394616E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057204;
	bh=Ol3w9he3LwwCt4LZ9fWGWS1i6g3jY5hLeW767u+7+7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aByD9qMchT37O6tW8lO/xS+8/HKCpKmUnQOBd2KV86WEqIEDOdKKHYbAnDuGLFghv
	 BF7iXHSkTklqVhd/C5aGhSet8Y+uEmSTcJNlyjkqG7J5mECTpyIEB7MIpnpmkE1RRc
	 u189gQZFs5vZKDEGR+CI5n6F99Z1q1VfVGrhB6j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE1D3F804E5;
	Fri, 27 Aug 2021 11:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6AFDF800FD; Fri, 27 Aug 2021 11:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FB63F800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FB63F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="c8KD5QbO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfkHCyFWrVQrZuAHLZ2kOjx9u/s+aGr7/KEX9FPON15DRSzwn/fkSUPJnGtbskJYhYSfhk63eblohIF0wdwY729hdvQKEYlOosmIMV5cH3840KOVzAur1IiIqTuGx0TDYKhawWVShyTwZI4rlI6+QroyX26T4Pdi6Bz+/NKO8GDzG4oXRx3GNVxMqxYlWHVAvOhgpaNnrgdApLytLAHA08kXzh+KeQSfeR99nllIopX+jxLC3k/QWx+3mHxVIRpPWU7E2RILuWsEhiURSc0WXXSXz0MiyXeFP08gjQ5+k2yGT570WPLOjQLpiJEEe4gPXG6EtLURVzCv1ZTEHmM61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=PqBsE1Hdng6ugVIEz40jpeaE8KeJxsT0rKjgLqvi9/Ca7MD1z08Ki/zXDiwN94dDaxbh0szGCvgn1pBFD5cMsHpw5vsWvCDGewv5Ifbv+fNOCd0/Ti2pc8mYE+77jUQ1GL3P78b6SRvZHzQpquAI+JoAZQpqwzs9qX4iXGUDouNuUeTBulUkCJOPS9Oau5zf47iYtQZQl4HC3uvefO+Gg3Dwz57tDp5rUqTIqfis4HIU7lj2WjDiIMqXGY1niItWjiPwNcNkgA3V0nqdRhTj5z3KQxm2207cWllLFEcn+Z0XtNmd2StKKfsiR1S2+BT5vpbORFoj2gAGctjsnlkK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTbsDkuVYP2/LwOBrQPr7RlWjy5g8Fmm212SeVfETo=;
 b=c8KD5QbOa/lyrsGia2axLeaEINR40F7EIHhXZBvbXWZVYSF7o/7sZ6xF0t26ftQmgl1cmv0AFcwYWlTOO9a2gJ7kRiKuGHRCsrUTM+PmxbekujgMpCfhfK2geev6OnkmZGo0QNPG0Gc1Ew2ztQ5RyEBx3e1+frXxpIS/cAjd6Fd2VBOfwOVk5b/KJ0UWWU9EBGAuOPHTwzuHjOUthU4caOh8G6tLtPh13z6AfvjavoTgztV+PxRKQjrgxjrcN9nICDaqbkUr5r6o40o08xdjz+jfEPEdMANDGaC7UoAlWYBbZ5biT0SKfPOEFCqNCJEMyBgpwPyWGg2H3P6JPPMQrw==
Received: from DM6PR07CA0102.namprd07.prod.outlook.com (2603:10b6:5:337::35)
 by DM6PR12MB4635.namprd12.prod.outlook.com (2603:10b6:5:16b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 27 Aug
 2021 09:38:10 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::d8) by DM6PR07CA0102.outlook.office365.com
 (2603:10b6:5:337::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:08 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:07 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:03 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/13] ASoC: soc-pcm: Don't reconnect an already active BE
Date: Fri, 27 Aug 2021 15:03:47 +0530
Message-ID: <1630056839-6562-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe96020-f280-42c2-46c4-08d9693e6110
X-MS-TrafficTypeDiagnostic: DM6PR12MB4635:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4635E10E17370D024073E076A7C89@DM6PR12MB4635.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dihKgpca86wLb1lSb3VhG+CizXFCKD4tabpiDXHzXs7UT82YMpIDQNnoI2LirZr4ytp28iFlUsDiu//Y4+AkWstqUcY8/nr9ibOvTyxOVRBQ8iiOt3wQ6m5nsk4fh8N/28trDeBCW9ACCmigfS2IRBfMovXawIHHqN2Hh3zLIxAETDcN6lOsjAU+YFpZqdwHT7OQ1cFZpFYzEIolKDRNkGMJc9cGWaPUV0QjBvKekpP48uvZ9ABrN1BliJk2n0+YFUc0s4EX2/LIaSJTtiGHiHLoJQRsC6srV/CBTa7/gcksr25Y/t1vN7XsD8qukK1dhepal6rFaKrNHGYFmkOexMfd//pZr/hciAGc5pUh43EfYSlnwIrYxJlSL0wjJ3yyLEIKVkiaoDS/iZscYWDPT06ERBWkXCXPtKgqTGh1RLHvBZGEI1lnk33/pytdb0i6Z042hHm3IXu4EA+cyppJ8HCpJ+qkChjKiwEybaaK7FwObLhIl8QNcNisAvpJxSFeBRmm4u6rjasXnm9XEilzZe58NmqTYR7eTp53gYUxwFhzS2HgmmaaicJYThCj1AajqgJkEDEKnTnUJXyMdZ2oEqa3raEEvevdPhJKi/QlXoKsusNhSs7S588d3vRsbGSZ9tCKgS/wGmMPMRr8QI4Lbccvv5yVE5Z7+7guf44Gyw7OsiWaJHrcE8JXjxFyEkg9LpNEf38IodCtgUwr7eNyJrVfEs84feBifRZEdl80a2A=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(70586007)(26005)(107886003)(336012)(2616005)(70206006)(54906003)(4326008)(7416002)(7636003)(356005)(8936002)(82740400003)(8676002)(86362001)(426003)(36860700001)(921005)(36906005)(83380400001)(110136005)(82310400003)(316002)(7696005)(47076005)(478600001)(36756003)(6666004)(186003)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:08.5851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe96020-f280-42c2-46c4-08d9693e6110
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4635
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

