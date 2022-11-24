Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90438637A35
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 14:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2485A16F8;
	Thu, 24 Nov 2022 14:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2485A16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669297623;
	bh=S6KPVskaKVTYROnYRQQz3laSXnlqKTwxjUvzoyzTr1k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qr1ZJzrFVA57Eg2mfLTSE8CPwmBeg6q0pej2grg3IpzmC3fc1Fvht9zctLlNzQGyf
	 8QkNtKJ0z3lsU1lAfINFgCjBkdXBcxTYgc76izCsuTlP85PoG7XgmWGlET/aN8+1FC
	 vi/AIp8iAQhT+1PmaHXRdjqBblsFFUMJN0+xksw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B409BF8047D;
	Thu, 24 Nov 2022 14:46:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26390F8047D; Thu, 24 Nov 2022 14:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39CEFF8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 14:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39CEFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oBwKMkGF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7cYHh023037; Thu, 24 Nov 2022 07:45:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=57+ehutbpROj7wl3AtYb+dFSd1DaJ5oQytngLLo4Ycw=;
 b=oBwKMkGFKzD1etx9Q+s9F7ScR7NLiX5n9rnu6oaqy4erSdqnagUA739FJtiCaOAkTT/8
 aQme57K5CXuoPs1tmnr8P2/tMtFSDJRR0oGTJCPFluID8XpoUg1KfPXNFtKs904smFhz
 +1z3EKDWw4bZ2IuQaUD/9HfWzAbX5yV/+rNMpQEuGWbRQuoJ6DeH1E5wdfEvi1HQcdgc
 bD39H3UMJckIjyagr6ejKNNuxqTlmCLOPR8CqqnT4gio8ov6SyErTFFawurr+yQfHB6M
 Bh5MADGBfMn+QV3phuVYEyFgTsCszg/xZstHEi/u3HjRkZsN+IFCC5j12kY1KoW1YK1c gA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet664v-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 07:45:58 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 07:45:56 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Thu, 24 Nov 2022 07:45:56 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A5EA2BA;
 Thu, 24 Nov 2022 13:45:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 0/2] firmware: cs_dsp: Switch to using namespaced exports
Date: Thu, 24 Nov 2022 13:45:54 +0000
Message-ID: <20221124134556.3343784-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ucKswuTozDWhhd_I6aW6w-1Wu9AtQh6C
X-Proofpoint-GUID: ucKswuTozDWhhd_I6aW6w-1Wu9AtQh6C
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Use EXPORT_SYMBOL_NS_GPL() instead of EXPORT_SYMBOL_GPL() and patch the
three drivers that use cs_dsp to add the MODULE_IMPORT_NS().

To make the namespace more specific the KConfig symbol for cs_dsp is
changed from CS_DSP to FW_CS_DSP.

Richard Fitzgerald (2):
  firmware: cs_dsp: Rename KConfig symbol CS_DSP -> FW_CS_DSP
  firmware: cs_dsp: Make the exports namespaced

 drivers/firmware/cirrus/Kconfig  |  2 +-
 drivers/firmware/cirrus/Makefile |  2 +-
 drivers/firmware/cirrus/cs_dsp.c | 62 ++++++++++++++++----------------
 sound/pci/hda/Kconfig            |  2 +-
 sound/pci/hda/cs35l41_hda.c      |  1 +
 sound/pci/hda/hda_cs_dsp_ctl.c   |  1 +
 sound/soc/codecs/Kconfig         |  2 +-
 sound/soc/codecs/wm_adsp.c       |  1 +
 8 files changed, 38 insertions(+), 35 deletions(-)

-- 
2.30.2

