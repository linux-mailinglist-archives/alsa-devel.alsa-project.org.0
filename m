Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80893D4E3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D960DFA;
	Fri, 26 Jul 2024 16:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D960DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003228;
	bh=Wl+tDBuyQMsKe2NwpZXMc/8shVbTUViF+5tNnWhiufg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HDkNvzM6ARaZ8jMOzKgyHIeYyEu4GRmcqDQgp8cdlU2T9gnsWNhfNt3to2+Tlw3BD
	 n1julLb6NGsGoTPCMcseD3DhkgOfCTbGqiK4KfyXhQJLzsO73smzY/cb7zy7N5ed6f
	 sHm5Pif24N7EsNE6Fkw0zCdTlrelkUBStz5Chs0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0333F805DF; Fri, 26 Jul 2024 16:13:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA6FF805B6;
	Fri, 26 Jul 2024 16:13:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 628D9F80482; Fri, 26 Jul 2024 16:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F13E6F800AE
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13E6F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s42/3qmS
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2d582e31so15211371fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003063; x=1722607863;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Brvms8JhmsVbDZotcc6ApH8ZnBoz//VNsdwEXVDTRv8=;
        b=s42/3qmSQAdtPnJSbxEnqXJdsMN6u3vjKsn0xeFjFPaa0jl/+zpCffGjIkvhasfAy4
         rt0i6Fcf+/qEhaw3Kd4VEmJqd4x1v5TrmrEVwWWrhA3EjHmG1w3IcTPdPQkqhKfkBRAe
         siRiJJC5YWJVeoDuZBpiN9pohWDuoFqzcLK32wUIpIFC2efOlJOluTgg6GKh/f9R2p6V
         KzpVUDWHHgntnBU9Jqnhfmz0JHVWx7qnlaywJWZPCZqNRQ4qLYMyCFp15bFok0+ahHWB
         ayXk7SWR/gQHKzABDrSER1+I1XTnXyAM0VLueEUGqmZJVyniqGFpvz1pi2W/qT2FfjZj
         DwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003063; x=1722607863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Brvms8JhmsVbDZotcc6ApH8ZnBoz//VNsdwEXVDTRv8=;
        b=TCSSeU1kKIVcyZVn/yK7vn3LYcg9wsxIHpIyZtR12o00aPRab17nFqVHxaLopPsPZK
         tcfvXgeQwxx046yk7d0uO5I04B+bdrfV6Lj0YhEgxRB1w5ALGjxOtAunDi8vE6//sLzp
         im7l8gDm1Nvhb1hrEwykR41Ob2ldqB5ecVHQMV5ngSPzF8OOwhrMip+sOHu4L8YPzcSH
         CvmOiKH18f0qzVG7YdFpX/O7HH9I6HQkuO088QKb8LejDx8fkCAdfJwOOkDQq2MADere
         tcLlvLlCNPh/9htgH8IZADxaQ/w182vI6zypkZnC9I44ASy3cZv1Sjytkjrs1dXdOUsQ
         vvWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6YC/baBITpz8CUleKWM1f0qSKMoiZOcOoOPydyTTfNn+018EuEiiDkepCwqRWXPzfsDz4+FrJL0BiiehFfHjRzR0YjYxbbTgt+H0=
X-Gm-Message-State: AOJu0YymnT4CwRkc6+8vPm9u8JrSR8PTjX++TXBCV8CjryWFZnKMucll
	NlUnUWQLaBzfYhic2LO5SBO4TlX7sNmaHs6w5uDMb4fVJ/COlXjel2/+kMruvzM=
X-Google-Smtp-Source: 
 AGHT+IHoY8KGYJY7FAM0r57X/ZlrB/uyZh8XEYKyFteHSxqoB7xOthPewnXbTiP333EoAA8ogqWMIg==
X-Received: by 2002:a2e:7209:0:b0:2ef:564c:9b66 with SMTP id
 38308e7fff4ca-2f03dbe906bmr35474471fa.30.1722003062486;
        Fri, 26 Jul 2024 07:11:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:44 +0200
Subject: [PATCH 4/6] ASoC: codecs: wsa881x: Correct Soundwire ports mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-4-d4d7a8b56f05@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Wl+tDBuyQMsKe2NwpZXMc/8shVbTUViF+5tNnWhiufg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65rhZpKPZg3tmFrHEHfD9UhC5sv0LQAvnb3T
 NdSB7BEB1+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuawAKCRDBN2bmhouD
 15JFD/0ST4V7oPsF2QmExiXjWppFCmdT+Au0ltznI674n979jfy3w7dDoF/hrPIbQN4GGQDNbN9
 S3cVrNumBB3oxJlQhf8SD3JJSXK36Ex9XQqnlMPH81jl/OK2mbo9ohD1yl6uzKct/Ml02cEfQHI
 igpQwBFOpxgMg2QjGBjtZcE4iLyLiXlKbU53oTM2F9UEPpIUA9t4ibtjo1Q+kOH2ksZGut6U1+L
 0IbIqM680Uzoz1gryxUSmsV2anr5Q16aXrSTzWPm2BYSvY9zCR7NIgOS9ZQA9Zvd1TvOUTqo5eg
 ryRpbnWzJ8t8BLKWupkqB+Kb1BYtqHcq8SaCM61uHyHoacuNZPwEKuVMMbCZVucPqi4G4m3LrZy
 urGvc6TRVsX5kOacMTT6LGATUkVlBA16jZGGkPbMD8fYi/pgJmMnIr4/i7gBZLzdC3oJxYM3f1w
 qfhjXpy5vSzIb7mvtytSDckrttVaI24rKbjNG/uq3xChVzmPpGJrqkjqHaxv4+UQ2xuL2yWkoXB
 PbNY5pDT4v+hcStu0NPuHGRxqqvFRrE7LIPNpAdDP4dSBgqmHh0SaBp234mSXmiinjliKVGCGeK
 XjzSrDy1t10bol85r0IbmGUtrKRc1KSa/9B73nJIlze+Y6iTSUeQN9UhUJitOacfQIv1/HcwI76
 0g6reVierLFUesQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: HFCPQEZXW7Q5HY7FDGWC7ZZGQ3PDQ3DQ
X-Message-ID-Hash: HFCPQEZXW7Q5HY7FDGWC7ZZGQ3PDQ3DQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFCPQEZXW7Q5HY7FDGWC7ZZGQ3PDQ3DQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WSA881X_MAX_SWR_PORTS number of ports and the array
assigned to prop.sink_dpn_prop has 0..WSA881X_MAX_SWR_PORTS-1 elements.
On the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WSA881X_MAX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wsa881x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 0478599d0f35..fb9e92f08d98 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1152,7 +1152,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	wsa881x->sconfig.frame_rate = 48000;
 	wsa881x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa881x->sconfig.type = SDW_STREAM_PDM;
-	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
+	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS - 1, 0);
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	pdev->prop.clk_stop_mode1 = true;

-- 
2.43.0

