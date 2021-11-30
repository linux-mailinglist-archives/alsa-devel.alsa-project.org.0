Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C1E463B02
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E73C22C6;
	Tue, 30 Nov 2021 17:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E73C22C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638288447;
	bh=dSLH0Tr+jiDPYsMflrW6NjCV0XVWegqMUDfAXC/s1EY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWybP4+FSFM5T9sPL8rQtxvoth9gn/DDW5nNQJ51GfqwYhyyjQAYrCkxor0Go4pdE
	 t+7QEmKRBZcbWS8uYD4kzYoFn113hrU9ipN7Nu14K8mXEKb2WOnTnmdoQFfQ73R9WB
	 +1OlMhU+TqMHXikFv5VSQJY5m0zzfXjSclBrBETg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D22F804FE;
	Tue, 30 Nov 2021 17:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77501F8032D; Tue, 30 Nov 2021 17:05:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B494F804AD
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:05:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B494F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DC3LRUkn"
Received: by mail-wm1-x332.google.com with SMTP id 133so17955176wme.0
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwiut7mFwVpOIkozl/7l8HWaVugd0GDlQFwZ0pbcpWc=;
 b=DC3LRUknToLtww9XliTaOCRIG9zbvS3PC1QegcsvRglKmY7uWF5UlMZDIPFsQkgCtH
 XNHlkiTBMAl1cqz+qKkWUWiTdTf9HDc2eYiVL7p9ViGDCqXzASbxn5dlvZNmcHwbV7pf
 2eLtPbNilBuHNPVAgK2SmyNk4FtW4w/ynJr/IbiRvx1G0nNqDcVev5hQc0WJ/z4nRj62
 uVmB8D8d4THEISnVdo7tbBqj1WCSYZWkyk3GjAtmEOmlXm8rEdLi+WK6p4JG/M4TU1eQ
 5Qj+a2nNreS3aF6+5vZYbT4JThzIWiqUQI69+DgVDatZx2fWfaPtKLl5dp2iQWcVSSge
 ULwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwiut7mFwVpOIkozl/7l8HWaVugd0GDlQFwZ0pbcpWc=;
 b=JilRWYitnEqdsn1u0bilcyhxb/P7d5RS6XyfIbJ/J7jFL6SdpwKlyLvqdU6TezrjTR
 ztnMas15uWTtRlDYaq91i9cPaytHYcvIi3P78hJNUNx/N3Mc84ntS3WLffublNHDXFWT
 10voJUI9ftNNftBdkAxWPMTdTOuEAERBI68Oh51Gx0JwPCRt5opWScrt7qyxBwVeyQsC
 4i0QGgaDF++58uWh6CHrA33Ipc8xbSFY65mj31CS+ypC3p/f9am7kS6s15vqosIJFHpw
 fUvWnKzmfVM2yANrEHhzV2ptC91kESXs8RGO+NNZgjt1/hPKIQ2KgLNGvudcsMzniqpG
 BUrA==
X-Gm-Message-State: AOAM532EzK2ZOgbnmzoQv39swX/uj2kG5eaMZ2dyTjdsV9tA3RStaLNn
 DqQLWxIIHiRheeamQ+4aU78L3w==
X-Google-Smtp-Source: ABdhPJxtW93MuDdgIrHLAiFiqQ3gvI5ucjAo1K99MBBW5zlCNu9ULHrL5CDQWbObdUNIoy6DfRriiw==
X-Received: by 2002:a05:600c:1f17:: with SMTP id
 bd23mr360470wmb.57.1638288320134; 
 Tue, 30 Nov 2021 08:05:20 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id g18sm16719409wrv.42.2021.11.30.08.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 08:05:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/4] ASoC: codecs: wsa881x: fix return values from kcontrol put
Date: Tue, 30 Nov 2021 16:05:07 +0000
Message-Id: <20211130160507.22180-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

wsa881x_set_port() and wsa881x_put_pa_gain() currently returns zero eventhough
it changes the value. Fix this, so that change notifications are sent
correctly.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 2da4a5fa7a18..564b78f3cdd0 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -772,7 +772,8 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 
 		usleep_range(1000, 1010);
 	}
-	return 0;
+
+	return 1;
 }
 
 static int wsa881x_get_port(struct snd_kcontrol *kcontrol,
@@ -816,15 +817,22 @@ static int wsa881x_set_port(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int portidx = mixer->reg;
 
-	if (ucontrol->value.integer.value[0])
+	if (ucontrol->value.integer.value[0]) {
+		if (data->port_enable[portidx])
+			return 0;
+
 		data->port_enable[portidx] = true;
-	else
+	} else {
+		if (!data->port_enable[portidx])
+			return 0;
+
 		data->port_enable[portidx] = false;
+	}
 
 	if (portidx == WSA881X_PORT_BOOST) /* Boost Switch */
 		wsa881x_boost_ctrl(comp, data->port_enable[portidx]);
 
-	return 0;
+	return 1;
 }
 
 static const char * const smart_boost_lvl_text[] = {
-- 
2.21.0

