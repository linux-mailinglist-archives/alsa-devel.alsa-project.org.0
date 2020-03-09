Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325517E5E2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C92EF1690;
	Mon,  9 Mar 2020 18:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C92EF1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583775592;
	bh=+FJxFo9ltXndqrcPIqALfbu7BS+5PICJV8YS4N23L38=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TCIUd2vPo3GP0KNN8EWBRjcNjZNIP2gSKKCktRXhFhs7KUjAmLAxyvJnaN+7Y9HLy
	 7EEQ8u69ya3g/PYYf9p1kTKkiz6ypsj0tDshyZHcuAvd71wKsCKMDnELl8eTAiR/A3
	 GGf8Ha6xl9hZlQ7aLQl48ubdMipnZfgeEx2939/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD8C0F801EB;
	Mon,  9 Mar 2020 18:38:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFED2F801EB; Mon,  9 Mar 2020 18:38:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58ED7F80123
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58ED7F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lS9XfaG7"
Received: by mail-wr1-x441.google.com with SMTP id r15so7279009wrx.6
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 10:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrRaa2oLGASoVUcKPYHBNJIYaKUXkZG1vLWKS/FETTM=;
 b=lS9XfaG7i9K70Uz52uiZGAJLSYBH0BwEbvNfFeQPbZAYCDFVg/xbQB9QBhNNzCmUyu
 DSQtXZF5lXClDT+BykDCQ2AGOlo462xlHcjCAYxutGzmYVVxvY818q8mgVTL0c3xe9jd
 nHq2G1WLeBJcFdqMJGKQoqGRS+nlOJRam4fIRajkKbQSsWSgEsQ3fDmFNr1jza1SUgXK
 0jlAlAvCH3dDmuuOLqZ9nOw144R77rwiOEgB5X9fyhumtQT8mEqQwci9ICaPRF1IcE97
 j+No9luh0JXOFwjkH4uzLsGXk5GHgIcUbVZUmc9/uVIaPjq31qJzhZmQK0A8hB7wSBuB
 rz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrRaa2oLGASoVUcKPYHBNJIYaKUXkZG1vLWKS/FETTM=;
 b=M279MhmVLZPVJPdFlea1eDKQGG1PDjI44xFZ5SbkTW0B/m75941piXNPAqAcUKzZKW
 hjJae+SVyq89XcT0btjle3o+F2cs37bjvtDvGVKSkxaOo/e8HTTUfsVI7NRq7d3iZGAI
 dNFJJjoiJMd1rqAcXUi5mCzqhio8jIW6MuqDB4eetGUcXPhcFdHdQnJBn0lSrNmostOY
 WzP8R1k9pHhz1CSLa2jsA27FI3Vf5AdbWKKm1M7fJt/De2ZCwGc6herm/UFC0SKlIMfq
 Pnba5jDfo2MvueLOTmduIxd/sVO7kT9css4n8ppFS8ETTaPZIok9iPqu0qVeXWAiTNls
 oVAg==
X-Gm-Message-State: ANhLgQ2A+E62HMHY4x88y+Vgf/Cy9cec2BDOlAnTpa6VRtXxzXcVsqsy
 nan7ZyfJSVVN92CYekDSJl0lvw==
X-Google-Smtp-Source: ADFU+vvLfd/MwARBYr7I+uIlvy/rGZiD/jQkUZifoVZVosaPYiFgIKPRqE2d04DkNXkKUpUoZ7WeAQ==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr2144282wrt.360.1583775485460; 
 Mon, 09 Mar 2020 10:38:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id w81sm321838wmg.19.2020.03.09.10.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 10:38:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [RFC PATCH] soundwire: bus: Add flag to mark DPN_BlockCtrl1 as
 readonly
Date: Mon,  9 Mar 2020 17:37:55 +0000
Message-Id: <20200309173755.955-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
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

According to SoundWire Specification Version 1.2.
"A Data Port number X (in the range 0-14) which supports only one
value of WordLength may implement the WordLength field in the
DPX_BlockCtrl1 Register as Read-Only, returning the fixed value of
WordLength in response to reads."

As WSA881x interfaces in PDM mode making the only field "WordLength"
in DPX_BlockCtrl1" fixed and read-only. Behaviour of writing to this
register on WSA881x soundwire slave with Qualcomm Soundwire Controller
is throwing up an error. Not sure how other controllers deal with
writing to readonly registers, but this patch provides a way to avoid
writes to DPN_BlockCtrl1 register by providing a ro_blockctrl1_reg
flag in struct sdw_port_runtime.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

I will send patch for WSA881x to include this change once this patch
is accepted.

 drivers/soundwire/bus.h    |  2 ++
 drivers/soundwire/stream.c | 17 ++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 204204a26db8..791e8d14093e 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -79,6 +79,7 @@ int sdw_find_col_index(int col);
  * @num: Port number. For audio streams, valid port number ranges from
  * [1,14]
  * @ch_mask: Channel mask
+ * @ro_blockctrl1_reg: Read Only flag for DPN_BlockCtrl1 register
  * @transport_params: Transport parameters
  * @port_params: Port parameters
  * @port_node: List node for Master or Slave port_list
@@ -89,6 +90,7 @@ int sdw_find_col_index(int col);
 struct sdw_port_runtime {
 	int num;
 	int ch_mask;
+	bool ro_blockctrl1_reg;
 	struct sdw_transport_params transport_params;
 	struct sdw_port_params port_params;
 	struct list_head port_node;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 00348d1fc606..4491643aeb4a 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -167,13 +167,15 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 		return ret;
 	}
 
-	/* Program DPN_BlockCtrl1 register */
-	ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
-	if (ret < 0) {
-		dev_err(&s_rt->slave->dev,
-			"DPN_BlockCtrl1 register write failed for port %d\n",
-			t_params->port_num);
-		return ret;
+	if (!p_rt->ro_blockctrl1_reg) {
+		/* Program DPN_BlockCtrl1 register */
+		ret = sdw_write(s_rt->slave, addr2, (p_params->bps - 1));
+		if (ret < 0) {
+			dev_err(&s_rt->slave->dev,
+				"DPN_BlockCtrl1 register write failed for port %d\n",
+				t_params->port_num);
+			return ret;
+		}
 	}
 
 	/* Program DPN_SampleCtrl1 register */
@@ -1195,6 +1197,7 @@ static struct sdw_port_runtime
 
 	p_rt->ch_mask = port_config[port_index].ch_mask;
 	p_rt->num = port_config[port_index].num;
+	p_rt->ro_blockctrl1_reg = port_config[port_index].ro_blockctrl1_reg;
 
 	return p_rt;
 }
-- 
2.21.0

