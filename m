Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D376FE5A5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 22:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198791010;
	Wed, 10 May 2023 22:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198791010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683751929;
	bh=xKx/R8XJkJRLG03QGYpP8wHeGAmznaHWqdrhoCtth8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OS4XPCnLlBvn+U7GDc7BN1jYSjgwpui/KWQE6bnyk+LEAW3kM4gs0SCU6Wx+E2AAP
	 tnIfuL7W8hDtlLDugmmyf9hAfXprxuwtvdO8IHcaTWUksfp9BqX1zTFtp02sMZSjjz
	 YIBYaKOZk0WCZhCKCA28xbW2IXqe/6h+bL4EUayA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92813F8056F;
	Wed, 10 May 2023 22:49:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95352F8055C; Wed, 10 May 2023 22:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B6F4F80553
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 22:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B6F4F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TPLTH58+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B258C6408F;
	Wed, 10 May 2023 20:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B0DC433D2;
	Wed, 10 May 2023 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751784;
	bh=xKx/R8XJkJRLG03QGYpP8wHeGAmznaHWqdrhoCtth8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPLTH58+285C1f08ONFC70q1BoPYNh2hfGhcStE1RU6VUAjCTK9aRZpkJgIOHtTa/
	 AUk99c+0IZbiiPIxLrbjYlBSUF625D0XVgscqE2W7hoZR3fPYknSVs/Nel/u9dQBr9
	 GELP/bnlasccwZfGtBmuyqIu0TfHy+5/XCSk9qlXs7Vv3g4rP3OeuhRwe1wpvqfFD0
	 NFnUq0It5JxeC6Y+rrQBLhRz37ZCACJkPQmuhhLMasOk+6xLNv2RwjFRAEhIe5b61F
	 ioNLh9CIb1Y40duxuTa/dQibATfcEbH2KHDK480i2NtHIfFG7oc1RaV+6qQAhB7PRE
	 rpmtbvngFIFkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.2 5/9] soundwire: bus: Fix unbalanced
 pm_runtime_put() causing usage count underflow
Date: Wed, 10 May 2023 16:49:22 -0400
Message-Id: <20230510204926.104747-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510204926.104747-1-sashal@kernel.org>
References: <20230510204926.104747-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6ZLVZUSCO3TMTKY6VDY4QCNT5FSPLDOW
X-Message-ID-Hash: 6ZLVZUSCO3TMTKY6VDY4QCNT5FSPLDOW
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZLVZUSCO3TMTKY6VDY4QCNT5FSPLDOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

[ Upstream commit e9537962519e88969f5f69cd0571eb4f6984403c ]

This reverts commit
443a98e649b4 ("soundwire: bus: use pm_runtime_resume_and_get()")

Change calls to pm_runtime_resume_and_get() back to pm_runtime_get_sync().
This fixes a usage count underrun caused by doing a pm_runtime_put() even
though pm_runtime_resume_and_get() returned an error.

The three affected functions ignore -EACCES error from trying to get
pm_runtime, and carry on, including a put at the end of the function.
But pm_runtime_resume_and_get() does not increment the usage count if it
returns an error. So in the -EACCES case you must not call
pm_runtime_put().

The documentation for pm_runtime_get_sync() says:
 "Consider using pm_runtime_resume_and_get() ...  as this is likely to
 result in cleaner code."

In this case I don't think it results in cleaner code because the
pm_runtime_put() at the end of the function would have to be conditional on
the return value from pm_runtime_resume_and_get() at the top of the
function.

pm_runtime_get_sync() doesn't have this problem because it always
increments the count, so always needs a put. The code can just flow through
and do the pm_runtime_put() unconditionally.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20230406134640.8582-1-rf@opensource.cirrus.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/bus.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 76515c33e639e..4fd221d0cc818 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -571,9 +571,11 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
-	if (ret < 0 && ret != -EACCES)
+	ret = pm_runtime_get_sync(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
+	}
 
 	ret = sdw_nread_no_pm(slave, addr, count, val);
 
@@ -595,9 +597,11 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
-	if (ret < 0 && ret != -EACCES)
+	ret = pm_runtime_get_sync(&slave->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
+	}
 
 	ret = sdw_nwrite_no_pm(slave, addr, count, val);
 
@@ -1565,9 +1569,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
 
-	ret = pm_runtime_resume_and_get(&slave->dev);
+	ret = pm_runtime_get_sync(&slave->dev);
 	if (ret < 0 && ret != -EACCES) {
 		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
+		pm_runtime_put_noidle(&slave->dev);
 		return ret;
 	}
 
-- 
2.39.2

