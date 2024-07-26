Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43A93D4E4
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893F4E94;
	Fri, 26 Jul 2024 16:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893F4E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003249;
	bh=Vu+vQdTFKWsQq9i9w0o9ZFa+ZQrVAJEgITfkg5lDM4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KWzoi63mx21sQplhkGn4HSLwWzisBXYaqmNREG7MyQyj+YQFY35u9SwsTfTeoZvyd
	 kkipnA7Pod3/QixxGS8mG+bsPOUIdfP7tBWhbFsuWv8EHyHVT4uh7y0DkeHK8BqfkN
	 uEvLfcCwmF4D5pWjlWNLRJZYgO7LXJNSrK9zP2xU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B72CEF805FD; Fri, 26 Jul 2024 16:13:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17450F805FC;
	Fri, 26 Jul 2024 16:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 973DDF805B3; Fri, 26 Jul 2024 16:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B99CF80579
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B99CF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p2kc2g/c
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so8885565e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003064; x=1722607864;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnPQ2n6JhiYWWn9VeOeK/rEp99NPC+ELvUYPMv+J6Iw=;
        b=p2kc2g/cLcfUofTTANdXOZLRd8RxD6UpohdNlNdJWIt0BwnGk9YkC07KfReObqKLtN
         5grSsF12FpZ44fGw+12naSWgakTIQVyNSgIjeJ75mpV5KLkd/tlmtLkXquFMafQlKbM8
         SguhZ8uCPOu4Pkf+48pTtl3gtl7Y2Yghhm+EJI6uDphRD+6FSUFBq1x2alRIvKmedyX4
         H43zvpU3SO33IUAFMGdQXk508Idd74z8/ZeTdEncSDFCld8CCRpEX9JvPyj4zA+UjkaO
         3g0G7HNzirlOkx2sTCXGx8g5Om8w6w10y8VsqjLSvSqmmZg9mgTu/CYyKXjwBlRln0g3
         +UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003064; x=1722607864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnPQ2n6JhiYWWn9VeOeK/rEp99NPC+ELvUYPMv+J6Iw=;
        b=m0CtbaNvmo3kAQ32bJHr7VrACNR0bzL1eSjV8pHY/I0oyCw4gS+IkbkXsFmhDwLwnZ
         G1jZjBNl/k0nW6OUgD58P7+n+FDOawTMkVxA3OGWaDEvEHsHlSMmZ1ii61sGIqE3pT+s
         ofT4rQAgldt1pC0wyTn9hH6OXvvae+KY3AwMi1WXg3n6O4ioIfNOfZqsLzpMt3K7GTek
         1DLf75XWAU1jh8g4gDovTAXlFV79czwkVA6cb6QF7vhXUdNHVNr7GzZHXnn72BJE8nY9
         fuLtUu/cEJuK9Ys397DS7DxpVH716UfXBDaLjzgFRUuYdwhNrA9JLMNN134FVgJxEeUc
         mJhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2mbl+JR73i0HT1knyxbWJNNLAa0XWpoeJT1Njun5k8oD1EDQCnGHjvR3Rm4AB+z947TlNqr3PR4/UgD9FL8YbCX+l9RhkqT5Ohos=
X-Gm-Message-State: AOJu0YyM7rv+cScRBlHvpo4HS4gZQpYiQMjnyMUkjqXyPokq4cJKKsgr
	Cxx8QTP3ExsXshfCHGMTt34hADxRSGsLedicSj+DoLzLByrh5u3/KjezQyHNN0s=
X-Google-Smtp-Source: 
 AGHT+IFEX4rzg7NrNx6gbQi2pw9HHCL43584sSMR3P82rbrDcYIFr+PaqQ5QJ29wTGiIy5vcKmx21g==
X-Received: by 2002:a05:600c:4712:b0:426:58cb:8ca3 with SMTP id
 5b1f17b1804b1-428057104eamr39404725e9.21.1722003063990;
        Fri, 26 Jul 2024 07:11:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:45 +0200
Subject: [PATCH 5/6] ASoC: codecs: wsa883x: Correct Soundwire ports mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-5-d4d7a8b56f05@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Vu+vQdTFKWsQq9i9w0o9ZFa+ZQrVAJEgITfkg5lDM4Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65sdY4HV/1FoN5HkK5c6lQNXwdRdwBIMLNys
 QrDcxPsPziJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOubAAKCRDBN2bmhouD
 1zCID/4viT8zslptT+J+Wyj3J9niHRv30fzKO8dyhhocsvtCsFJ42+NDmGPkTmHOOub3SxgLP9p
 CVa180tqGAVdwWlFCbFSGFPYzMsITwNnSS60fIwtqBcEbCToxyMQf8OwPX+nSeyzUUiU6iYYzqU
 FWcLRTupCcUfpDXsMPS5BKsnQFpjrnem3hTIMFgofs+kPHsElcmNMaGzrgoMiyQ/kQSy2DFI95U
 JD2yXtUfnhAQbof1PmfMA8g0rl2Z1jin2Xj6GqYUHvjT1ULI6VUs+5DL8VI5fsx3cz1V47XSKok
 wtUly+RB3YL630VU4tfMS6acALC/0bOv64GLuXLgGcdftot+Bueb69WzVF7Y1CdAv8YpL4+7+tJ
 QWGM41WCQVRW24EvCoOWPDLybVAQPUqUG4NYsFY2uokPc5QeB/w/hAprlCgIggY/YMsYj699004
 X12s2MmtS7wnEiiV2o4X7qdb3LxvRXdHRw4Vh0kmlxSL1IHljB2JVRN0icjSa1NLBoeYtZsrycU
 NmiutNzyT0q7S4++eUxqmN+Xw/q5D7Wck+1cHxXWxtnI4Y8k+w02fykXMRsVWtqe58SU4MqZU9t
 xE8/kWlSaXC9a7CDDVpvLXaWXjaeJbp87KFkyy0tLZvi8HeVs8HrNAz6medqWhwmgRAXUUeX0Ws
 WxDpoYEDH8Zyauw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QZXD2OPT6VOHECRNZJPPAB34QD7W3KRI
X-Message-ID-Hash: QZXD2OPT6VOHECRNZJPPAB34QD7W3KRI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZXD2OPT6VOHECRNZJPPAB34QD7W3KRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WSA883X_MAX_SWR_PORTS number of ports and the array
assigned to prop.sink_dpn_prop has 0..WSA883X_MAX_SWR_PORTS-1 elements.
On the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WSA883X_MAX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index d0ab4e2290b6..3e4fdaa3f44f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1406,7 +1406,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 					WSA883X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
+	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS - 1, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;

-- 
2.43.0

