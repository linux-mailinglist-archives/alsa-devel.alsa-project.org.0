Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CE1816F1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 12:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947B01661;
	Wed, 11 Mar 2020 12:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947B01661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583926686;
	bh=G3WmUAkxNovs+YpqRXwkc9PPSNdZlhhKZ642BMMxaQs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=meMs4+HoApEW/sT5b5HXd11NtAAPuW8QtnZ3LVFbvpTFM2KHPmzRcWZ/aFbitLy4h
	 l0zSmWFiZkaTfj4oFwQuGbmyFqZEaGQpaXu53ZkqpiIIbfCEMKFwu/iJ31R/2EoqH4
	 0h66ewKdoSveYj15ZohHZTy+29BAKX2dF1Fwopvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A70A5F801A3;
	Wed, 11 Mar 2020 12:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54C41F801F8; Wed, 11 Mar 2020 12:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF66F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 12:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF66F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kXQ0EZxj"
Received: by mail-wr1-x444.google.com with SMTP id 6so2158207wre.4
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGydLBv1yG6IqmA1HcLLSymIojwkdOWZ9F3nvVgVBJA=;
 b=kXQ0EZxjxLgnJQdW6QvzzlgWATLi+m5mPF47WL1MzqQDFw1EiWlnkdIz2pS9VOCc3T
 FDNd8RL3IcXK0Qeckd0aBJUweELOu6IbjOxdxDg+WZMByjrpme7fUed+9tK9TBW4rn9m
 BG/YpsOZanwjplJgTJbZzQbVq87G7lQ8mr8v/HOv41h4BSqMV1s1wkBYsaf5zdPDqbaU
 qioaRRbjEAXWbiUC8bJYgxPXadgqnNe1jLKu98xQxN8HZCfWDJr8lOhaVidMh9D0bcoA
 evF9I+vktMAWp51nt/4HWlIN3luFQEPc2HcdtfH009FF0O5DlbYODKVJ2NvH1yD2VpKp
 DM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EGydLBv1yG6IqmA1HcLLSymIojwkdOWZ9F3nvVgVBJA=;
 b=nkRsUm69qYuc8h7dXOsudLnmZfTwTQdl7fo+ZkwuWMmaPp1wtYXQVIcu1+ZCJR2zRJ
 zcMgaaJaNLP/op+q0vdA+3/xBHokjkQPMoJLWvvcThEIb3Lp+2JENezTNsukm1pKMMbg
 N6IkFd0s6DGrult54cXxa3r0kcyO+P08wagxm3QAm5w+4W5+SBp1Mg44076lt6F331ZE
 xqr/4o/x+WjxifbNc+P3fzAIYCYA4f5dAKf+IK974Ks/fkMl5bFJypO73JmghrejWsEB
 r0pnLzv34nMyTMgFEv7ASZeubL8w0hQGQi93ghOuIKb48SNhEMt32ZaBWDWWu7uXEOyJ
 Fzdw==
X-Gm-Message-State: ANhLgQ3HC1UgS/tEFZYad5SZc2gHSbfvin/ggDlNpJ3ImVIdx8j7Z56r
 FzQnkCnauPNW7XeEDrW8f63ifw==
X-Google-Smtp-Source: ADFU+vuMbN/M6IXL7D0YfyYOzkTFBH0srYm2N5bFT/tMeKkFzGIGsUvO/H40SDljefCGwEFTZmWzbg==
X-Received: by 2002:adf:e506:: with SMTP id j6mr3976144wrm.309.1583926579504; 
 Wed, 11 Mar 2020 04:36:19 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c8sm61650537wru.7.2020.03.11.04.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 04:36:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: stream: Add read_only_wordlength flag to port
 properties
Date: Wed, 11 Mar 2020 11:35:44 +0000
Message-Id: <20200311113545.23773-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
References: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
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
writes to DPN_BlockCtrl1 register by providing a read_only_wordlength
flag in struct sdw_dpn_prop

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/stream.c    | 16 +++++++++-------
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 178ae92b8cc1..7fb89a94d9c0 100644
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
+	if (!dpn_prop->read_only_wordlength) {
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
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b451bb622335..2dfe14ed3bb0 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -284,6 +284,7 @@ struct sdw_dpn_audio_mode {
  * @max_async_buffer: Number of samples that this port can buffer in
  * asynchronous modes
  * @block_pack_mode: Type of block port mode supported
+ * @read_only_wordlength: Read Only wordlength field in DPN_BlockCtrl1 register
  * @port_encoding: Payload Channel Sample encoding schemes supported
  * @audio_modes: Audio modes supported
  */
@@ -307,6 +308,7 @@ struct sdw_dpn_prop {
 	u32 modes;
 	u32 max_async_buffer;
 	bool block_pack_mode;
+	bool read_only_wordlength;
 	u32 port_encoding;
 	struct sdw_dpn_audio_mode *audio_modes;
 };
-- 
2.21.0

