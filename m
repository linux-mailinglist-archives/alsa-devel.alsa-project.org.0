Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C33639454
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF722183E;
	Sat, 26 Nov 2022 09:05:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF722183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450002;
	bh=AW9ZcOFKfjqnmTF++lVWl6E99NWC1y5autRSLJhvk10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=teGmRcLXmLE2FTc6kuBWVR0DjZsSQ5bcYPkvlpXHBIB9DeJtezS3yKWZRu94yp0EL
	 0h977uqL2r7LipD+hQjxhx/6tkdV7jSWqCUxbO3rSHKFMtx0gtXRmSd0jH/NHCQQaU
	 EMs7Uydf3iK5U7R4G3ZupcN3xnWrmttcLjSZE4f4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22041F805F9;
	Sat, 26 Nov 2022 08:59:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67BC4F8025D; Wed, 23 Nov 2022 13:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B50CF80149;
 Wed, 23 Nov 2022 13:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B50CF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qlaCka3O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX2d8jjAVESCnZYxw1cS30oJw8/VtUh+USmR5EIneVP04zT7PIpGzByQxzthHh+R3WJ3ZiYMrc2aIjGOJz7DEszW9R9ejX12P7OiWLyDwTUBQ5wGSsLJU5t6fX7vqksoU03cF4OYJr3PwT9EPYhvOBn2gMnlLP9rleWTRahwp43YIN2aXefuj4BBtGWxB6xG0//nN5xsOfvi1YKNYaKtTlUXsLhS6dNzQfH75fyyFOYOVHugXi8yhldERPsPm7UvZL+ymHQ1M0NfFbfaFgfwd+6qGBnW3LeCHvoyZRavfkzHmZUudmiGAkdaiLMcJHhsw+BrtVRTZ63nYiaU78MFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ejb8QJKQlT9PWx8UhIOs03cvecKzqPiNJNEMm0UUhA=;
 b=NGpzn9i9adU2gwXP1lVfe4S5VjlWHogSWrkujcyuguU9VC+5CCMH0+7ZmG+5WydDWuBJJxiORjWjxaVrHDCgdeGhvQFIqS44IYLObyYHt0Ov+OwHGRBaOedg3vXkneG7DTi7pBc7NllUham0Tq80wpxMH4oJ6b1EHFEpD/6Ama6qXZTLLjblrURq6j3s9cNCESDs6QOygDyaSA3FKM6GwydvpKHEzwmDtzkq+YrUWQoIugJFzXZK6usVMpaCCd5PTOKWG/n8Mv9Sp5PjjH3W3oNVC/oqXXeCJ3XzjChjuyXPe0+EZY3L0VhKSNXiRgD35geQGNj6zXDfIq5I52xubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ejb8QJKQlT9PWx8UhIOs03cvecKzqPiNJNEMm0UUhA=;
 b=qlaCka3OAINs22Sv+yPpiZE5YM6nMLv6t+Vzxa5oRugaBsicsLILnpq6u0MMb/FZiaP+cYe8W2mqIUQIW/Ce5ZmROguEvOp0IvCUpPLSu/BXlfH3xK+ySSurEgJHlVRsyMh3lhQbNrtRlvyBnNxx02K3EcM+/X4g2mRgRPjOQD1LBf452dT/r/dHb4FjFZi4CYbx5HRG1/AOxJnWhHdu7DgbcNWzQef01FgglcodvLgByHK6ZsK+92S4Z3ecIppTK5Xe+OqZyc95gIelmCdKBF0beF0eUP1DaR3QdEEPdiuUmeFjsQzPktwsfZb7Orsjv+LGc+K3UYx73hD4OyMBKA==
Received: from MW4PR03CA0308.namprd03.prod.outlook.com (2603:10b6:303:dd::13)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 12:19:28 +0000
Received: from CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::76) by MW4PR03CA0308.outlook.office365.com
 (2603:10b6:303:dd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17 via Frontend
 Transport; Wed, 23 Nov 2022 12:19:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT089.mail.protection.outlook.com (10.13.175.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 12:19:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 06:19:25 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 04:19:11 -0800
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 23 Nov 2022 06:19:05 -0600
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 1/4] ASoC: SOF: amd: Fix for reading position updates from
 stream box.
Date: Wed, 23 Nov 2022 17:49:08 +0530
Message-ID: <20221123121911.3446224-2-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
References: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT089:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: aecd2e85-7321-4aa6-950c-08dacd4cf767
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4G5xQ5rfqsWGtrCfH5dODKfX+j957wYewfxwZtHt8Ofzy70OkU9nKsxOcODm7k0GgjI1LID0em5a1yQC6GWX5ZY0tURCKQXhH4bwMyZi6EZOLJfIFemfLDgyDEo64GoSV4AvH0W3S90+YY+9fIsHFVcufN4gA2Ln3htyL0O/jF8Inaor9VbuZtUAFTTnhvA42Qt9vXLl7SWAqYF8MLJudh19iWTxoKj1yWV4p6fvoXO8ulbqfW+9xRXSl2DMqS1/KxNiah124oWO9Sk9vn+8enErDqo0Mc9cJq/jsuSbv7Dphwx9nPxn1ILk3rDiGjiXckFlSp3shcFItwKll/I0ajqzATc0nnGB7z+MI2Kh+/77dfZDgpuJNNMd1lP0RNzGufPyntuCYjCG3Aqd9inBrm02aly9pXu3UMHvHIJL+yq+h0kICb44eEX2NSTk08Jd/XTVTX6U52EvXfCKV2yvyITnWd9XXFf0LyYxOeQx0qJClZQZkTA+7KPi0ynWEvzrZ2zjguxUrSNUqLu+Mig5/tLzP108fS8oPPSDNpojLHucLRs0yF4BMqk+MTqqcqkX0VlgVzc2B3ALrkIpwsKLKMcHdPySWjTIu5Fa0FkcooBZNmb/Z8YnD69m2ruIsuDSzglBxcnDwHQxGxX/z+QV5wtiVRbWXeXow9KEHA8v9AGkfYDu4Zvuk67j1mAAsn4JskmbK6KcKYG3j28+qHUQA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(110136005)(2616005)(336012)(47076005)(1076003)(2906002)(26005)(498600001)(35950700001)(40460700003)(86362001)(40480700001)(81166007)(356005)(15650500001)(82740400003)(83380400001)(82310400005)(4326008)(5660300002)(70586007)(8936002)(7416002)(8676002)(70206006)(316002)(54906003)(76482006)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 12:19:27.6753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecd2e85-7321-4aa6-950c-08dacd4cf767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN
 FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

By default the position updates are read from dsp box when streambox
size is not defined.if the streambox size is defined to some value
then position updates can be read from the streambox.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/acp-common.c |  1 +
 sound/soc/sof/amd/acp-ipc.c    | 30 +++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h        |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 27b95187356e..150e042e4039 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -76,6 +76,7 @@ struct snd_sof_dsp_ops sof_acp_common_ops = {
 	/*IPC */
 	.send_msg		= acp_sof_ipc_send_msg,
 	.ipc_msg_data		= acp_sof_ipc_msg_data,
+	.set_stream_data_offset = acp_set_stream_data_offset,
 	.get_mailbox_offset	= acp_sof_ipc_get_mailbox_offset,
 	.get_window_offset      = acp_sof_ipc_get_window_offset,
 	.irq_thread		= acp_sof_ipc_irq_thread,
diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index dd030566e372..dd6e53c63407 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -192,13 +192,41 @@ int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *sub
 {
 	unsigned int offset = sdev->dsp_box.offset;
 
-	if (!substream || !sdev->stream_box.size)
+	if (!substream || !sdev->stream_box.size) {
 		acp_mailbox_read(sdev, offset, p, sz);
+	} else {
+		struct acp_dsp_stream *stream = substream->runtime->private_data;
+
+		if (!stream)
+			return -ESTRPIPE;
+
+		acp_mailbox_read(sdev, stream->posn_offset, p, sz);
+	}
 
 	return 0;
 }
 EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, SND_SOC_SOF_AMD_COMMON);
 
+int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset)
+{
+	struct acp_dsp_stream *stream = substream->runtime->private_data;
+
+	/* check for unaligned offset or overflow */
+	if (posn_offset > sdev->stream_box.size ||
+	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
+		return -EINVAL;
+
+	stream->posn_offset = sdev->stream_box.offset + posn_offset;
+
+	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
+		substream->stream, stream->posn_offset);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_set_stream_data_offset, SND_SOC_SOF_AMD_COMMON);
+
 int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index dd3c072d0172..1529c6d9bf9b 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -138,6 +138,7 @@ struct acp_dsp_stream {
 	int stream_tag;
 	int active;
 	unsigned int reg_offset;
+	size_t posn_offset;
 };
 
 struct sof_amd_acp_desc {
@@ -199,6 +200,9 @@ int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_ty
 irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context);
 int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			 void *p, size_t sz);
+int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       size_t posn_offset);
 int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev,
 			 struct snd_sof_ipc_msg *msg);
 int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
-- 
2.25.1

