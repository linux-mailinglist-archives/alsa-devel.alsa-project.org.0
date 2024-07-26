Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80F93D4D3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:11:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6BDF50;
	Fri, 26 Jul 2024 16:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6BDF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003114;
	bh=cGgEjpzzxGI973pctJv1X1Xqrenmzkw5jm4bI9/CPUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mj8hJMTNG+748791r742LgTLHYNXIeASPSgi06PBq1V/WPQqHUngs2my4Ccnn0+e8
	 +QFdr9mL3mw/j+C3jsZbtKNm6XhgyIUQu8+PITyyOzqvCo1NEL6DrcZEOC2djBlHOI
	 JGh21E1Hqd7LfsZp8KETiKhZdztrM/Ysw/YGlBh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C4BDF805C5; Fri, 26 Jul 2024 16:11:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A985CF805C5;
	Fri, 26 Jul 2024 16:11:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31357F805AC; Fri, 26 Jul 2024 16:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 661FDF801F5
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 661FDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rv2tmP6Q
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-427d2c8c632so15552075e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003059; x=1722607859;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTGsbAfRUm3WZ5fb53jExCzdO/XEBE/ZTI+TszbFHcE=;
        b=rv2tmP6QiZMnh2bvphSZbeAnkgBcwkgM1PdYOwuXsy2oMFe+n8tLC5o2LpcgLQwJpM
         2NDPGmKGFfoKI3MOji9yJ1W+Pe47GnoR5qVFLfnsz9ecqj4C/XjkS+Wv9nMAA8/J1D7t
         p1ONGBWw2twrCee+1C3mapDc33AqH3hSGjG9Iq2GxPTMZGt+dBTbX/awu2/cnPGMqK2G
         NMVEwiDtTX3DlXSTi4ghr36aYJCaGOwz5G83BaSxI6sOZ/y0SmK4mwi+ec0eSwf+p+Ds
         gk9JPLOgAxPRjwlXm7PcVOFIwuVcpv/0VkWZwPBQWtHRRzmpQzzEN8ILa9aR1b0EmCsn
         vsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003059; x=1722607859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTGsbAfRUm3WZ5fb53jExCzdO/XEBE/ZTI+TszbFHcE=;
        b=r7Vfj5LdWKjVT9nGSX3eHEgcAV8OCwHe1cT9HM6Zy2m+5va2lk8RQL0gpKxLQHhDiW
         CXo0DHzAhB7C5xn9vyMDtdJYRDybwnqWfjrNIFjHPWF7k1k7xJdc7l0WbTb4zdm+aDJe
         RVp2NyoSWTg0HEMNmD8yKDviH+3l+6XZCQc1y5sXyy/2dcV9XAxyLrvUxBikYH5GqgYE
         jhHCWFc0QbO3zgdiewj37hQ3/FvHFX8O8zVDPRpDbib8R6BAfCjNMYlTON2DaVlW2VxM
         XGguvXahix7pLXYkSVGRs8253atleY12VHq4S8BCANZpFZiyD5FGvxHXBFV19S+X5gj3
         n1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuFZ10nAaC4RVl5Hr1zQnnVaeUEfjM0Cg0yebNW3Hcxqo35P/wtjm/eN0D5hLXZkH5ww6xgd391YfJpff9Cl+PXHUtwZuKufk/8s0=
X-Gm-Message-State: AOJu0YwZjlWQrRePvJLRX44YtSUK+EBRFapjKDrP15lX46WV0yMy+39Z
	L8fLHL99aJ5phjJjUrziEzxN2stMFChEjSAPHQDqFWepikgHbuvpH8R1Q+V2zOs=
X-Google-Smtp-Source: 
 AGHT+IFz/JUl+8u/JK2MqcXdpWEoos3z2kzWUCjz3VughnmpNQSqc2rMtp7GCgrM4Xlo9AdJw/qt2A==
X-Received: by 2002:a05:600c:5253:b0:426:6320:7ddf with SMTP id
 5b1f17b1804b1-42806bfe266mr35213265e9.35.1722003058921;
        Fri, 26 Jul 2024 07:10:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:10:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:42 +0200
Subject: [PATCH 2/6] ASoC: codecs: wcd938x-sdw: Correct Soundwire ports
 mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-2-d4d7a8b56f05@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cGgEjpzzxGI973pctJv1X1Xqrenmzkw5jm4bI9/CPUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65pRGgV5B1JytKHlbz6JcNxoIZORTr8B+r6k
 1jeQWWl6hWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuaQAKCRDBN2bmhouD
 15dOD/9vCxKIo8VXq63ApLgbGCqko0MTCPw7y8OqbfI6J7s/NmZYrKzQ/Giyked/yjhq88hfeDs
 /RgAzAEvfZDgX2gBzrp5kdyXpudEXxJje5tyKU+CVkRrV2VD7eX25Ffs4+ecdvv9sIK75G48OX7
 c//034fCz8FAPfACs1ME0OphEyX3rH7y74bMuDIZjUS02lt7wZ+EHZfEdf202e7Nj0WFg8RL+uj
 RIzDibfyrF6AKyzk8gg+taa42qLJwcw0CgjHCWzvk2bEEnJ8XZ1uYZnXIN3d1BaKDp+jte46aT8
 vPYiQKGciYt0habUV9R7GWkKnEEp9MMmZ7NO1UmOG17oALbMjZ6bFFLk4qjlDlZTIrKH2UiOx4s
 nh8nB+OvGcvHarLpE8zWQt25mN80ziz6ECGGKUHrOucr7A6v8KgdKRGecYqZGB8H7q9ymJrKPtw
 MBFt3alHXQSitx4eQxWePlb4k9XZdtBj2gvfzYjEcRrhQyLOfbVNWnQqIAgD6vBDm9bXgO8a3d4
 LFlkOKmtA7iQi6MZ262xykI/maLj+BD5R/27gnZQa+MLAOQyr51RAFSKjxUoQ506+3BMSOcnHKu
 hgLTmA0b01zEIxmHsqxSPr5Nz+N4Mbu9HIGTX5qOg+99eZFGhzh7MIgc5WUYJRDnXThdrv5JxoC
 F7LCmf/cGx29Emw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: NWF2LA7OX634HIDY7FW4WJHRHCTKNESX
X-Message-ID-Hash: NWF2LA7OX634HIDY7FW4WJHRHCTKNESX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWF2LA7OX634HIDY7FW4WJHRHCTKNESX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WCD938X_MAX_SWR_PORTS number of ports and the array
assigned to prop.src_dpn_prop and prop.sink_dpn_prop has
0..WCD938X_MAX_SWR_PORTS-1 elements.  On the other hand, GENMASK(high,
low) creates an inclusive mask between <high, low>, so we need the mask
from 0 up to WCD938X_MAX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: 16572522aece ("ASoC: codecs: wcd938x-sdw: add SoundWire driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wcd938x-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index c995bcc59ead..7da8a10bd0a9 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1252,12 +1252,12 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
+		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
 		wcd->ch_info = &wcd938x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
 	} else {
-		pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
+		pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd938x_dpn_prop;
 		wcd->ch_info = &wcd938x_sdw_rx_ch_info[0];
 	}

-- 
2.43.0

