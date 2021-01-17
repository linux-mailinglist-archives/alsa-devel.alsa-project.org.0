Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC02F9136
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 08:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B5B1724;
	Sun, 17 Jan 2021 08:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B5B1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610867704;
	bh=cPE05zM88uiHs+BuzoYZq+w4JtSPuhm34rtk2srotxM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=if2NDOsUboj4NfOgExtedp0C7jcJBZhzfyxBFThbrtszJZ7d8CUaTUUkn1qWDpb0X
	 GEvaB6+CNiZqBWIPf9/lQgIJt0M+ptMt5zzk2pTxaTPSLNdN2e2YzFRC++9D7jtT0d
	 UQw7ep5hoXumUm+TtNqpkrOds8QG13qbzyBX7VBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1791FF8026A;
	Sun, 17 Jan 2021 08:13:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF4AF80257; Sun, 17 Jan 2021 08:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D69F80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 08:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D69F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qdIyvgEp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F91B230FE;
 Sun, 17 Jan 2021 07:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610867594;
 bh=cPE05zM88uiHs+BuzoYZq+w4JtSPuhm34rtk2srotxM=;
 h=From:To:Cc:Subject:Date:From;
 b=qdIyvgEpINtMeD47DJQgtXAbfz655bH8pn7f3zVruY7x7M82LvMDzAobGrVaD8VMt
 54+IAv2FvuH4FJtd9hQ9vXNoPG5GmdSgeSqvKF0luo9LdKmEhYQBVDgQsZJy1Byz0x
 YiwTSv0e2JvbKY+si9pJ7SZNVtEZc6wAvqhiiHvUjHwb+GqM+TIrAJNIqpGmI85P/R
 OWfxPN8bd82dVsnZL6qHWSlZBzcKWLFgpAPLazq9ZBwauOsJv9sIimwewEzzuJlTqV
 CYsk9ATu8z+Or6oMRhGFGi4UgBkwxVUWsU/tNJtHRCCKQPLUswNDtU7UszaiTWKQKA
 /5KAiVtnlPOIQ==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] MAINTAINERS: soundwire: Add soundwire tree
Date: Sun, 17 Jan 2021 12:42:58 +0530
Message-Id: <20210117071258.2541484-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

Somehow the soundwire MAINTAINERS did not have the tree details, so add
it.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 546aa66428c9..10b234688f22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16654,6 +16654,7 @@ R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
 R:	Sanyog Kale <sanyog.r.kale@intel.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git
 F:	Documentation/driver-api/soundwire/
 F:	drivers/soundwire/
 F:	include/linux/soundwire/
-- 
2.26.2

