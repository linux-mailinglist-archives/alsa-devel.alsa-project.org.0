Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A53113B643
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 00:57:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC6F17E4;
	Wed, 15 Jan 2020 00:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC6F17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579046269;
	bh=PZ4FkHexXzrF4I2D3OrZ8r24iueQ7YpmrgBKSnkLfns=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifsqkFOAhVhibAroTzP6BIBy275NnEqiuRNaRQGB7PeYybLuxSsZvL0bGwFKqymLu
	 9qr88L+r96rrPqZH8hEuCtYXT8HEk49voZGQuaTii4mdoiB+1Z6/GfZWcSE/OoBg9S
	 RqAQTmsH8ZbotepK9E2ctmVS3hDrDkdwYlaqmhps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E49BF80292;
	Wed, 15 Jan 2020 00:53:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF00F80290; Wed, 15 Jan 2020 00:53:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296C3F8028C
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 00:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296C3F8028C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 15:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,320,1574150400"; d="scan'208";a="217923027"
Received: from emkilgox-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.0.151])
 by orsmga008.jf.intel.com with ESMTP; 14 Jan 2020 15:52:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 14 Jan 2020 17:52:27 -0600
Message-Id: <20200114235227.14502-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
References: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 5/5] soundwire: stream: don't program ports
	when a stream that has not been prepared
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

In the Intel QA multi-pipelines test case, there are two pipelines for
playback and capture on the same bus. The test fails with an error
when setting port params:

[  599.224812] rt711 sdw:0:25d:711:0: invalid dpn_prop direction 1 port_num 0
[  599.224815] sdw_program_slave_port_params failed -22
[  599.224819] intel-sdw sdw-master-0: Program transport params failed: -22
[  599.224822] intel-sdw sdw-master-0: Program params failed: -22
[  599.224828] sdw_enable_stream: SDW0 Pin2-Playback: done

This problem is root-caused to the programming of the capture stream
ports while it is not yet prepared, the calling sequence is:

(1) hw_params for playback. The playback stream provide the port
    information to Bus.
(2) stream_prepare for playback, Transport and port parameters
    are computed for playback.
(3) hw_params for capture. The capture stream provide the port
    information to Bus, but it has not been prepared so is not
    accounted for in the bandwidth allocation.
(4) stream_enable for playback. Program transport and port parameters
    for all masters and slaves. Since the transport and port parameters
    are not computed for capture stream, sdw_program_slave_port_params
    will generate a error when setting port params for capture.

in step (4), we should only program the ports for the stream that have
been prepared. A stream that is only in CONFIGURED state should be
ignored, its ports will be programmed when it becomes PREPARED.

Tested on Comet Lake.

GitHub issue: https://github.com/thesofproject/linux/issues/1637
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index da10f38298c0..00348d1fc606 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -603,13 +603,25 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
  * and Slave(s)
  *
  * @bus: SDW bus instance
+ * @prepare: true if sdw_program_params() is called by _prepare.
  */
-static int sdw_program_params(struct sdw_bus *bus)
+static int sdw_program_params(struct sdw_bus *bus, bool prepare)
 {
 	struct sdw_master_runtime *m_rt;
 	int ret = 0;
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+
+		/*
+		 * this loop walks through all master runtimes for a
+		 * bus, but the ports can only be configured while
+		 * explicitly preparing a stream or handling an
+		 * already-prepared stream otherwise.
+		 */
+		if (!prepare &&
+		    m_rt->stream->state == SDW_STREAM_CONFIGURED)
+			continue;
+
 		ret = sdw_program_port_params(m_rt);
 		if (ret < 0) {
 			dev_err(bus->dev,
@@ -1502,7 +1514,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 program_params:
 		/* Program params */
-		ret = sdw_program_params(bus);
+		ret = sdw_program_params(bus, true);
 		if (ret < 0) {
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			goto restore_params;
@@ -1602,7 +1614,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		bus = m_rt->bus;
 
 		/* Program params */
-		ret = sdw_program_params(bus);
+		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
@@ -1687,7 +1699,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 		struct sdw_bus *bus = m_rt->bus;
 
 		/* Program params */
-		ret = sdw_program_params(bus);
+		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
@@ -1769,7 +1781,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 			m_rt->ch_count * m_rt->stream->params.bps;
 
 		/* Program params */
-		ret = sdw_program_params(bus);
+		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
