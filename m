Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF785710DD7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 16:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC45C839;
	Thu, 25 May 2023 16:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC45C839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685023337;
	bh=HHEnCqDTVAiMHpx8oMxvWbopMv+wgvd+ZakTFFuAT2k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vLLVNfEdapoS3z/QcWTipnxyRe4WvugJFd1lPYxuKRZfELMoypDb1VzjuYvZikp6k
	 Io1TIYndTBb373RgEmJLujOAmA7dVFa5J7To3i/Dp5YJnSc3GHH6sDEQFpHaDDCfNS
	 1lkydSmc7yqsDYHXdj+z1yOolZCCuMsWco9Ahfy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CD8BF8057B; Thu, 25 May 2023 16:00:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B84F80578;
	Thu, 25 May 2023 16:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A1BAF80551; Thu, 25 May 2023 16:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5BECF8024E
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 16:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5BECF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KXx5GHEJ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34P8Mm6P016336;
	Thu, 25 May 2023 09:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=6wz2vaNUW7aZwUs1r4Wrw1zVQNO/7hVTjslreqKkGKE=;
 b=KXx5GHEJEI67PDyzhvihgN06vrxfDxinV/ILLli7yUj4tFC5YZ1UAzRCRz+KcGVaJZDv
 f1hNMLXayHEuok1FW+Fl4Dc/bbhUNW7C/CjLr8pJz/Z2vd58uulg5aGNafD0IdrsBRLT
 hLdj0X0XkMDGVxUZ6VfoQYWAUpLF2T6xQeFfafICdvRzX7N+4fHEop1eUIciNjnwZpG8
 SfrbZ0Ai24Nw6SKbTTme7H/QoXIoa/5j4oQ2p9dMkBAradaAMuxSHgJfxwsuiDXaDjCT
 UHRcZcxT5JKysfoVpif6CCenxHLHyiEsEPqxDT6fvEB9F8IOSSkMWIo5fA3PU4QHy8x/ fw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qsde8hsqk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 09:00:06 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 09:00:03 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 09:00:03 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.43])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8DE8815B4;
	Thu, 25 May 2023 14:00:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH RESEND v1 3/3] ALSA: hda/realtek: Delete cs35l41 component
 master during free
Date: Thu, 25 May 2023 14:59:55 +0100
Message-ID: <20230525135955.2108140-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
References: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nxDTKbOQ0DHagdHqVxAuRyG70FBAwcGv
X-Proofpoint-GUID: nxDTKbOQ0DHagdHqVxAuRyG70FBAwcGv
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YFTOXCHGHXY5N3PHKT5UBH3TIHR2HLOG
X-Message-ID-Hash: YFTOXCHGHXY5N3PHKT5UBH3TIHR2HLOG
X-MailFrom: prvs=0509245bd3=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFTOXCHGHXY5N3PHKT5UBH3TIHR2HLOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This ensures that the driver is properly cleaned up when freed.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7b5f194513c7b..e3774903918fe 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6757,6 +6757,8 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 		else
 			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
 		break;
+	case HDA_FIXUP_ACT_FREE:
+		component_master_del(dev, &comp_master_ops);
 	}
 }
 
-- 
2.34.1

