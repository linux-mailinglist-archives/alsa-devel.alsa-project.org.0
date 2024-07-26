Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1F93D4E1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D10EF85D;
	Fri, 26 Jul 2024 16:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D10EF85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003209;
	bh=dP7UEMsz7e5SQeBIvoJx2Y/Pic6CV31hwYtlba9OL/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G6pQQcoyvRJe+w4lZxFEqPsHoKeBZ7a4fOe3pwkxfwdlnXV1zx0A6biE2TKDFerw3
	 MbkM5kiP+PAj3Y05CASEM2OzUCi2z3tNuJOCmU2lky0K7Xd+SVIZSN3eJyeBIrxnhk
	 0yREhj92TKo2QUrptX81A2iwZ8A+09izTcPIAbQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C4CEF805AF; Fri, 26 Jul 2024 16:12:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D138F805B2;
	Fri, 26 Jul 2024 16:12:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35559F8057A; Fri, 26 Jul 2024 16:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54A09F8026D
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A09F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zJVciAV9
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427d8f1f363so16262225e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003061; x=1722607861;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq5Zwrj0wwcriRSju7UpectgcbI2N6emEEV2p6g72bY=;
        b=zJVciAV9xoFu4SLoVEprLr0m5f7CV36+yAlzUbIEOJAPeChLuaktNEOXhl8GIG0cUw
         ubxFHW4RtUvKOtxlipv+GChR1y2CL6WkF1wUgJf1v+CyQgJoJSLPIho0OkEQ9OhZYJNd
         yM7IKEXzYSQjxRrProHE5oBAUrJcpZq3s+l+NphF7kk4Txi0gzB15Trftn9ktbvWLdjC
         H6HUodg2fI+T7cypnfWFPK5pZPBPEF4M2NLl40QZ6HgxK8HXeGghtOzk9Q9BkM8wr+b7
         UBZB/MheMGdobKH0y9day1XL2EQaHsNrr2CUXD1sC7aniS44DLCO0s+1/e8k5X77vsw7
         l2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003061; x=1722607861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wq5Zwrj0wwcriRSju7UpectgcbI2N6emEEV2p6g72bY=;
        b=i1dg4S2VjTqoLQ/7zu7tshuzRHeIqyTQJzAMnJQOI4HQLCHNrDInDz6vFVolOzkX1k
         BLpCp1ouW6k2BK6DnjmQXY9WzKtOZxx/ehQi6V7jl29Ru/ZYGxgoIV0JiNdTum5w/25/
         n4Xj4KFIz3vZhj65y3wbjTpnjC+gtM/NeP1RPK+fm3ItVAEBPIK9F8/jVFDyKz/tfboU
         9kG6jjWgL76eJprs/56xlzJ82DpU+2BX0Bh1Opua6s8yXoq/ISmPivUIM0U4JTeNnm5k
         lyLtjFraq65wBHQuugxATN4HWxVN5cRGw6sp46BJ32TpSeIQEkJ/ZLqzRxR84QlqoXkT
         SSdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuQ+xBq03Dm+sKkg/TqxCHpiGxMUb27uHLnyAef/wM93ehp3LbCAdXBuJpDG8to8Rfm+H+2TTQBGJuHM3YwejQmQgwaD8JznsjDes=
X-Gm-Message-State: AOJu0Ywi2b3KCnSHO71N+JkuOgTV1vKXuP2kVvD9GsDD/H5FjHxUZAJX
	t+WbRDzvaZbg/sFuVcepw/+uyDnOxObisNX7F7lsb6O88OzMkAGj0/929qgT1X8=
X-Google-Smtp-Source: 
 AGHT+IEG7AI5NN6YZ75+21NHmNdxvxhxO5Szstl2Ms6b99fP/MAH4f9xbyIPABZDEYOTNcVmNiXk9Q==
X-Received: by 2002:a05:600c:3b87:b0:425:7974:2266 with SMTP id
 5b1f17b1804b1-42806bd9f52mr39504875e9.24.1722003060682;
        Fri, 26 Jul 2024 07:11:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:43 +0200
Subject: [PATCH 3/6] ASoC: codecs: wcd939x-sdw: Correct Soundwire ports
 mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-3-d4d7a8b56f05@linaro.org>
References: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dP7UEMsz7e5SQeBIvoJx2Y/Pic6CV31hwYtlba9OL/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65qRbZcLLRSFDbSoF0d0nw+PnV31kip12ewV
 IsrK0K2QvOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuagAKCRDBN2bmhouD
 15q/D/93LrXG6IqxDSqzRNmqwo2E/ibyo4QxN+fHgz4wRiqe0TlnGGeEQ+gxtN/TsToXPtd14uQ
 KsnEb7dGNIRHFGSGUnLB6k+n6OSaIPy/1L5YoiXcLbiWJJyBvzexvmE2kYckW7bBn820xkFNOqm
 iZk/vRMqxFoq33FNv5JpRqufH+Icg21of5p9NIuYgDT/C9SOUGiOl0kzRn7XMnZDMwW8c1/jkpq
 5gI7Hg7mzfdABuXkenHnQq7phecWnB+ip+MJfFhjQ4bDImdcvIy9PRY/1qi1brwy+ofE7mb+aIs
 YufA3koh/4r+90fO9XyRVTOYtEWhbsncegZ0Mc5UiOngqgCkMO/7OMh6BHNnJH71Q8qh08t3v7J
 aQJAR3DbMiwVYep3/GnS4VzdzPG92SwjznHisLCgMMwBF9vCZnzue1/N3dLip9I10C2O/cmRMas
 C4y5aP/lVKJjKVzuPANynpmAS0uR1uvOQdbJ3qo/HvHgfABrIiC/AeZjPqdnnGF9DaOTl+CZL65
 YhtnBlSv3xvc59opcNjQBWH2aZlMW+NNhj/Y51fqm+OhXsuvBIm+18fV+5hbMhouDABvpc5SBBq
 VUvYNShK+k6XncLytZh5zYSqGEnCa3TRqwYgNXjF1tu6SUg+DcmdbVUC65YT5Irn4klnHrZIt0R
 0Uu946k19b4UFAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 3AH47CKMBLIMGIDBW254KMNDGGVKHYBX
X-Message-ID-Hash: 3AH47CKMBLIMGIDBW254KMNDGGVKHYBX
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AH47CKMBLIMGIDBW254KMNDGGVKHYBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WCD939X_MAX_TX_SWR_PORTS (or WCD939X_MAX_RX_SWR_PORTS
for sink) number of ports and the array assigned to prop.src_dpn_prop
and prop.sink_dpn_prop has 0..WCD939X_MAX_TX_SWR_PORTS-1 elements.  On
the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WCD939X_MAX_TX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: be2af391cea0 ("ASoC: codecs: Add WCD939x Soundwire devices driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wcd939x-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 94b1e99a3ca0..fca95777a75a 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1453,12 +1453,12 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD939X_MAX_TX_SWR_PORTS, 0);
+		pdev->prop.source_ports = GENMASK(WCD939X_MAX_TX_SWR_PORTS - 1, 0);
 		pdev->prop.src_dpn_prop = wcd939x_tx_dpn_prop;
 		wcd->ch_info = &wcd939x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
 	} else {
-		pdev->prop.sink_ports = GENMASK(WCD939X_MAX_RX_SWR_PORTS, 0);
+		pdev->prop.sink_ports = GENMASK(WCD939X_MAX_RX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd939x_rx_dpn_prop;
 		wcd->ch_info = &wcd939x_sdw_rx_ch_info[0];
 	}

-- 
2.43.0

