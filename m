Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A75E7603
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC5C1E2;
	Fri, 23 Sep 2022 10:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC5C1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922602;
	bh=B9T5ifR8l5F54DQp+KrPOLUQw8g9WRv6jY9a1u+hqgI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UVvMvZasEaLTE4QbGtqPyG0pAjJJoJbAKvfBFc9Rj/H45Jr1nZGOiAn8fxiiYZAt7
	 rxOetbaRk/OW8SNGXh6xv37Eb7zMbj1DuhxhjziHwU0afi6p3TYXaaapTvGaapn6YU
	 SHXeTndxMPjbjf70z5qw6rpqmSXcyNpun5suFkeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B031F80124;
	Fri, 23 Sep 2022 10:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A92D8F800F2; Tue, 20 Sep 2022 05:46:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-m11883.qiye.163.com (mail-m11883.qiye.163.com
 [115.236.118.83])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA4F4F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 05:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4F4F800F2
Received: from rockchip.. (unknown [58.22.7.114])
 by mail-m11883.qiye.163.com (Hmail) with ESMTPA id 075F184078F;
 Tue, 20 Sep 2022 11:45:47 +0800 (CST)
From: Jason Zhu <jason.zhu@rock-chips.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 0/1]
Date: Tue, 20 Sep 2022 11:45:44 +0800
Message-Id: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFJSktLSjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx8eVkxISkoZQh9NQh1DGlUTARMWGhIXJB
 QOD1lXWRgSC1lBWU5DVUlJVUxVSkpPWVdZFhoPEhUdFFlBWU9LSFVKSktITkhVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSI6Nzo6Tz0YGB1NURgfN1E6
 C00aCj5VSlVKTU1ITU9OTk9MTUhJVTMWGhIXVREaCBQVVQETDjsJFBgQVhgTEgsIVRgUFkVZV1kS
 C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUJJTTcG
X-HM-Tid: 0a8359007ac32eb8kusn075f184078f
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: sugar.zhang@rock-chips.com, Jason Zhu <jason.zhu@rock-chips.com>,
 alsa-devel@alsa-project.org
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

ASoC soc dai

Jason Zhu (1):
  ASoC: soc-dai: export some symbols

 sound/soc/soc-dai.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.34.1

