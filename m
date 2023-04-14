Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617D6E2468
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0134E7F;
	Fri, 14 Apr 2023 15:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0134E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681479593;
	bh=ENxDQxcaFX0uuLMXi2jl44uV/ErGc1mM5PRjlgHIcLk=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=ZXnhZbm1lQ4gI+hdqQnEzwfBzX+6iw/nWWKTnQfdl34tGKvQSgRnxSOJgNcW62KP4
	 Tass8dGzKO7x5OUlYLD+PDKSNZlq09zJQbZzT/rQLncDZ3zN+Ddwwk0lWD2qkBRTgP
	 HjiPKMtzby081LpJI1k67ikJ9vGNHBtnpJ3BDDio=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A719F804F2;
	Fri, 14 Apr 2023 15:38:14 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: cs35l56: Code improvements
Date: Fri, 14 Apr 2023 14:37:48 +0100
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDNBWCRJK5F7CVL3XSCVXRKJARR7XO4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168147949286.26.17554775039852456469@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F321BF8051F; Fri, 14 Apr 2023 15:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D2B3F8032B
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2B3F8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VfxbVc4D
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EDVEAM030487;
	Fri, 14 Apr 2023 08:37:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=AAlFGQAOpcc0LwsD9Spsit9e4j2SMFa9NMT3Q4ZJ9oE=;
 b=VfxbVc4DptepOS+DmwhmH6eLOgzxXWcSKSLwA4GIzXmh+J41Axwtj6u47AgyoXXD+KtN
 vJqx8LPWlhMaQ3iSHemmFhfbNbiGVwCNlmjyXfCvlMGb1UtglHdkL82lVTSwHUQC+fel
 gUADJmRq0tHVPME11DwsHdxBVJdU2+C/MOkrY275YIKCuS+avt/j0ZIsEU93yhaE1V6D
 kuCX/atRGnyY56Zg7QGqkjZ9x+Vxqwjx9MuxvrZjIyv+LOOJHtFcVHoYlDHQNuDP6oSH
 EYKO6ApVxVEPOdeG6q669yVo3qeRbv7clR/JLf0VbEaIsE6TGJRe+B0+6VZVIaP3wzvt YA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pu5p3sexy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 08:37:56 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 14 Apr
 2023 08:37:54 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Apr 2023 08:37:54 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E682311D3;
	Fri, 14 Apr 2023 13:37:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: cs35l56: Code improvements
Date: Fri, 14 Apr 2023 14:37:48 +0100
Message-ID: <20230414133753.653139-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 3PhiBjqEB1ZEDelYIFJzJYCmBME5LQUt
X-Proofpoint-GUID: 3PhiBjqEB1ZEDelYIFJzJYCmBME5LQUt
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YDNBWCRJK5F7CVL3XSCVXRKJARR7XO4Z
X-Message-ID-Hash: YDNBWCRJK5F7CVL3XSCVXRKJARR7XO4Z
X-MailFrom: prvs=94685c4d78=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDNBWCRJK5F7CVL3XSCVXRKJARR7XO4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Various code improvements. These remove redundant code and
clean up less-than-optimal original implementations.

Simon Trimmer (5):
  ASoC: cs35l56: Rework IRQ allocation
  ASoC: cs35l56: Allow a wider range for reset pulse width
  ASoC: cs35l56: Wait for init_complete in cs35l56_component_probe()
  ASoC: cs35l56: Remove redundant dsp_ready_completion
  ASoC: cs35l56: Don't return a value from cs35l56_remove()

 sound/soc/codecs/cs35l56-i2c.c |  3 +-
 sound/soc/codecs/cs35l56-sdw.c |  4 +-
 sound/soc/codecs/cs35l56-spi.c |  3 +-
 sound/soc/codecs/cs35l56.c     | 83 +++++++++++++---------------------
 sound/soc/codecs/cs35l56.h     |  5 +-
 5 files changed, 38 insertions(+), 60 deletions(-)

-- 
2.30.2

