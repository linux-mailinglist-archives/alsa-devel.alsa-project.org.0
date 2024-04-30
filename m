Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3D8B7527
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 14:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50F682C;
	Tue, 30 Apr 2024 14:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50F682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478510;
	bh=2qcLEMK1Fn+N0abKR6SrQ01XTQjI1OvqZUs/FLQLSeI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DhYBMFMG2dBYaCmKON7Sjs5HrXhudYXcTYcbcZ9DiPD5ELmUAgLe5g3ulWge6vZLJ
	 DffS9+kJfSqC7UY127uU2h+qf85SzJZuip+qEuLF7SDN7J7FoEZFVFOL2XS7m7cKTQ
	 tNy2NNarA2zlOzUNXfMHoPUafqzBpUZ1T+103sWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC3F5F805A9; Tue, 30 Apr 2024 14:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19050F8057E;
	Tue, 30 Apr 2024 14:01:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4652F8028D; Tue, 30 Apr 2024 14:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41BCBF8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 14:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41BCBF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=S30pyaCb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=D4ut/b+eS62cUy
	c2wWIOIQ5QpP8PK3TWPgfE/RDJDnI=; b=S30pyaCbmwexde786Jy4Fc3AJ24k2V
	+NigbBApY1TKSe0WuS2Alkh4K9AtgY8/l00gCXqACqtmWBgd75QSy8ZjFox7v1Jh
	xjKccZKMGutjG/KN5YcRlzdd3EUIZz9ndG35GlNowpgF19ocEzGo8tzNX0j4g9RQ
	/25JaC+OfqitGiKG1tv2EaLy4DtrPIpzx7xkCUDBLVz7dxA2ymr3SO5fBnVlgObg
	2ZteiSMn+CtE30JNk6hoehaQUopfYrtYo2LcYrbWPEjKWs1+PgutmHKz4/rPeiAN
	jku8Pc4wvNza9mtMTYyQrcCHHOeWAv0Q3xLmGWn+bEiR3OQ1LQNs6Zmg==
Received: (qmail 2623430 invoked from network); 30 Apr 2024 14:01:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 14:01:02 +0200
X-UD-Smtp-Session: l3s3148p1@kdO5H08XjpZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Date: Tue, 30 Apr 2024 14:00:58 +0200
Message-ID: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 76LTYY7GBXJNRBBGVFJR2YO4QNU6GHWH
X-Message-ID-Hash: 76LTYY7GBXJNRBBGVFJR2YO4QNU6GHWH
X-MailFrom: wsa+renesas@sang-engineering.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76LTYY7GBXJNRBBGVFJR2YO4QNU6GHWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here
(some parts may still be WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (3):
  slimbus: messaging: use 'time_left' variable with
    wait_for_completion_timeout()
  slimbus: qcom-ctrl: use 'time_left' variable with
    wait_for_completion_timeout()
  slimbus: qcom-ngd-ctrl: use 'time_left' variable with
    wait_for_completion_timeout()

 drivers/slimbus/messaging.c     |  9 +++++----
 drivers/slimbus/qcom-ctrl.c     |  7 ++++---
 drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
 3 files changed, 25 insertions(+), 20 deletions(-)

-- 
2.43.0

