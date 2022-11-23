Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B81636658
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23ADE16C2;
	Wed, 23 Nov 2022 17:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23ADE16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669222755;
	bh=FOk5rNKt7wnZ8c/tbM3aJm0WH/A8H29wTcoJodoXgJU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NIp6U+78k6CwGA1HQP4IsdRUk1oWxooFR6HdhAKUZXURgJfL3hxJCrWPPzZO1qFTS
	 OjGsuC7B2qq0HpWtpXgKS8uu2d8QG30LRnh17v2DX2xHmBkOtSYp87HbfYjuMG/uYy
	 hYSpys+FIrbrYhlaozKtGSeNAEwl0xwWxHFoP+9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB021F8049C;
	Wed, 23 Nov 2022 17:58:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01F45F8049C; Wed, 23 Nov 2022 17:58:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52D0BF80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D0BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ApFt1awo"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANFXqhG006843; Wed, 23 Nov 2022 10:58:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=6rkTGpmifl/SCSO2FYjDVcYnfqkoh88KIkFWSJRpPYM=;
 b=ApFt1awoIstLm/WRXRGZ0RJEMaMnBsl46RzOmgKV3vO9FzSKJsjtteMaaFZtZxZWsJx0
 jb4JycaQpOs74yfQF7DACSi26qQnvws0N6RvHPed5N05QOBkaFvfpHgk/9wc3fNZrsJf
 VaG2f97oWHZefLprmYBL02HEu5BaSrbTnuybBXPc9IPXv6nn9Da/0C61vNLR935gRcjF
 78bpwjOsnfQ3Ud9VtXV0hucJA2p2KHrwN8XtKsuVNS5gfuAZpdm6GDYgdon8t5mTlVhz
 BteCyap7l4EXOzqJBuZE8Kono7v2O/vbs2OOJLFVowg3wnNyoW5gOOFb+P9IYPMdV4Jj FA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6w535-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 10:58:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 23 Nov
 2022 10:58:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 23 Nov 2022 10:58:11 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5F3F12BA;
 Wed, 23 Nov 2022 16:58:11 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: wm_adsp: Report when a control write changes the
 value
Date: Wed, 23 Nov 2022 16:58:09 +0000
Message-ID: <20221123165811.3014472-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x8XpFbHj4BGwbdArUhYqFIJpwJ9Itmul
X-Proofpoint-GUID: x8XpFbHj4BGwbdArUhYqFIJpwJ9Itmul
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
 sound/soc/codecs/wm_adsp.c       | 27 ++++++++++++++++++---------
 2 files changed, 30 insertions(+), 14 deletions(-)

-- 
2.30.2

