Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4404C45DB
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:19:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FFBA1DE7;
	Fri, 25 Feb 2022 14:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FFBA1DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795178;
	bh=RWfxVmLpPHp9wqMIX7d9vRGMi+5Stx2lwTtryY6Omwk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CL2CWIVhULKXv4r6qEyHKHIKN+hzWcSQX2vTjJ3IBmzqY8cFRUY4ricPcglVNWu87
	 xsW5/RNQkA0XZztWHPTqTYRAw/F5IFTpogPJEOspj1eeLFli49IkAGABZ/AeLfTD7s
	 +W41b9w+jVxDHZXG3HTakboP7M+PpQG7vpWtvV+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36012F805DA;
	Fri, 25 Feb 2022 14:11:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A1D8F8030F; Thu, 24 Feb 2022 09:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84BECF800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 09:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84BECF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="MywFPsti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645691245; x=1677227245;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Paj+PVU8PyJGIYoAxp11AHhEJljU2nyKWuT2Y0DSDg8=;
 b=MywFPstirfUgopEUYoYlymAdPbsxoOpHTIFiVFbdfl4RFBN7WnjMQIQe
 K1CKJAM+vc+ZX0H0Qgevn2alxyVIyx9Kn1N++MaYXg2AfV54CiM0Y9spM
 NACaZP4ovlcLWdlzLHlywnlr0uaWq/E9yxvW5PXIV2t3psfKFLgPb2HUz w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Feb 2022 00:27:22 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 00:27:21 -0800
Received: from hu-rbankapu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 00:27:19 -0800
From: Raghu Bankapur <quic_rbankapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 0/1] ASoC: compress: propagate the error code from the
Date: Thu, 24 Feb 2022 13:56:53 +0530
Message-ID: <cover.1645689841.git.quic_rbankapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:19 +0100
Cc: Krishna Jha <quic_kkishorj@quicinc.com>,
 Raghu Bankapur <quic_rbankapu@quicinc.com>
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

Propagate the error code from the compress framework for the timestamp
query. This error code will be used by the client to handle the
error case scenarios gracefully.

This propgated error is used by direct client like Audio HAL through
IOCTL -SNDRV_COMPRESS_TSTAMP response, further this response is sent
to upper layer, based on this error audio related usecases related 
to render position and presentation are handled.

Raghu Bankapur (1):
  ASoC: compress: propagate the error code from the compress framework

 sound/core/compress_offload.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.17.1

