Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC0636269
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 15:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1A21664;
	Wed, 23 Nov 2022 15:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1A21664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669215166;
	bh=EvkRHg25UEaVOEfcwh8BGip3jJoIEC+Vzd10MQwqg+4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZrSsTwHD/chhW2GupR2uESMPHYEhjzP0XPwn6HN0TS7t0Lp9JXnl5BDuWvnwDE3I
	 7qfIRpqTiZ23dvzbT98CZkMyglWxxhhJC10tgH1jwy4HZQOdaKhb+xPkYLIhptN3YK
	 zrigeF2wx8c23rPiVluSaUOA163t3ZhVgI+GERDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 429B4F80425;
	Wed, 23 Nov 2022 15:51:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BE80F80425; Wed, 23 Nov 2022 15:51:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D842F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 15:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D842F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="beXFQAd3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN7beZk029400; Wed, 23 Nov 2022 08:51:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=qe6yOLyzcAKHqVQpOkwHYqeGrPMUo74EcMOG9gZaWR0=;
 b=beXFQAd30FxgYmCmZE+Xiv/2RpV1GRtj2ZZgYnRtd0rYpWEk+gK0zux9x/i0nUoQfGQ+
 V2b37NGqI4tRQtNq+Zn+bI8S80/a+BZHVoL6hlcSM5zKLwrlcRnk6wOB9dpIJhGjjX7G
 lbxIAX/Srxkc6vGFPB2uDbvf43XXW2e/vDz7NbdIh+/16rIcneIn44/whbT4Iq8uTsVy
 6/8mmHZE1QtpMRWCo7sXxVfTxmSpi4m8857PIBdqgDBftez3LOVYoAoYecrDDWrL9ns3
 TRTQ2z5ssYW7/00QD30WfyQpsZxwWGggLxcJ7bzH1W3n85tLfaZiXS8XQyO0ozfMHWU/ cw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w04h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 08:51:42 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 08:51:40 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 23 Nov 2022 08:51:40 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3CDD02BA;
 Wed, 23 Nov 2022 14:51:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: wm_adsp: Report when a control write changes the
 value
Date: Wed, 23 Nov 2022 14:51:38 +0000
Message-ID: <20221123145140.2784030-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ipsUCo0gMhqHLEonVZx2W_usC8CPmOUz
X-Proofpoint-GUID: ipsUCo0gMhqHLEonVZx2W_usC8CPmOUz
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

Writing a firmware control should be returning 1 if the control value
changed, so these two patches add that.

Though this is an ALSA requirement it is also useful for non-ALSA clients
of cs_dsp to know if the control value changed, so the main handling is
implemented in cs_dsp. TLV controls are specifically an ALSA thing so they
are handled specially in wm_adsp.

Simon Trimmer (2):
  firmware: cs_dsp: cs_dsp_coeff_write_ctrl() should report changed
  ASoC: wm_adsp: Return whether changed when writing controls

 drivers/firmware/cirrus/cs_dsp.c | 17 ++++++++++++-----
 sound/soc/codecs/wm_adsp.c       | 26 +++++++++++++++++---------
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.30.2

