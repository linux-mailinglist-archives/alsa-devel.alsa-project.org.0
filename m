Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B301234A432
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 10:20:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56B39167E;
	Fri, 26 Mar 2021 10:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56B39167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616750449;
	bh=rr+W4loCV8q1qYV4riq34EeY36dwTZQgF4bPqX3XNMs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NLUgbamCMfA1dyaiBYE++4/gleNaum9Rib5FxtaA2BerS1lUVN3KapFNqMLZL/PQY
	 HTfKKU0XFab+ggX7NbRgPUEk6cuo/V8Kr/kr0AIAKvq9YlBt89Q8/M1k8xld9rFvck
	 SshfCjsoQ0exG/Otpjg2F0z8vPrt3FJ8/MPbfO4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A3CFF804E7;
	Fri, 26 Mar 2021 10:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE426F8016B; Fri, 26 Mar 2021 10:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 082ABF804AF
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 10:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082ABF804AF
IronPort-SDR: guQ8wwKQJWYw2Np9yE/vW8xcwG3+huVExkZ/Lg+CwtSYDKXDMrszCuj6gutiW+8ABHUCnzHLqQ
 6ayk4ql+uWAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276249477"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="276249477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:16:01 -0700
IronPort-SDR: M665LzqAs62gKIsLvNEs8YcCr5sZKpj6cYgCE7zVV7hbiTMlS0nPjsNdu2EoGfl36nx3n50csl
 nr3Xk9vBWaxQ==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="416463248"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 02:15:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH 11/11] soundwire: stream: remove useless bus
 initializations
Date: Fri, 26 Mar 2021 17:15:14 +0800
Message-Id: <20210326091514.20751-12-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
References: <20210326091514.20751-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There is no need to assign a pointer to NULL if it's only used in a
loop and assigned within that loop.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 6a682179cd05..9c064b672745 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1449,7 +1449,7 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 static void sdw_acquire_bus_lock(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 
 	/* Iterate for all Master(s) in Master list */
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
@@ -1471,7 +1471,7 @@ static void sdw_acquire_bus_lock(struct sdw_stream_runtime *stream)
 static void sdw_release_bus_lock(struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 
 	/* Iterate for all Master(s) in Master list */
 	list_for_each_entry_reverse(m_rt, &stream->master_list, stream_node) {
-- 
2.17.1

