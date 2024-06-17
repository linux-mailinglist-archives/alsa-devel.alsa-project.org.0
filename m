Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F0D90AEA9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6B7A4A;
	Mon, 17 Jun 2024 15:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6B7A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629547;
	bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pEqY59oaLOS8zi+3CbYYF/MmNRF4+sxsHRxM2Id3npMqc9Ilt4GqIYJGzj+DNsxrN
	 XTsVfon/IWsbQQ35XfahWLKXPifIxdZORWDJ7jqquZMqV7YkXbXhnG9P8YpYntreOa
	 PPvZw2svqNHKlwgrZwkn8EoNbEPv5E0DbZ2rff+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D15A2F8061D; Mon, 17 Jun 2024 15:04:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7922F80620;
	Mon, 17 Jun 2024 15:04:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 694FAF805C0; Mon, 17 Jun 2024 15:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FAC0F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FAC0F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YhyrMHl7
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so3391850a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629416; x=1719234216;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=YhyrMHl7NuRW/WV2y5sg9M5cCa+T11OQjCMI9rXrp7pPjMRI2+CiEIYYm5hgYc7zR7
         J18QL0j2sGOCtJSymeEXhQfXMTcVbEF4AMxfuSFyxQmINMjwPN9ZJmEZEmfpyk6Caf0R
         U/oQj+Bvk45walYCv/RkKiJjDIqe3t83pMjKMlma7FwM8V7/XDyDYMe4HczBhgNAHXH+
         WrREF95SR11Eu7uGogO7+UVw/9m0YjRLQSIDyRq5GUNiqKPDcqfMWOC8LEnHnBQ0Z2qc
         Z/n2xiInOnwngKDyu9dnM5JKUqbLiBmx4JXRLJ1Ir0MdNnkiaXz+iSOztEfK1ewHO+PK
         nNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629416; x=1719234216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsy72X1hfcrIv1RUuI2dLQNfHKs4L1jXhq7QBcalSW0=;
        b=Rp2fpju7uiLxugqkILEw4Nks0SV5O9+uHOukY2FIyl0bPdeaXkMIHPYzPEXCpm2v7g
         1URYSlJHtasFwDn9KEkBZiVGCyjPcSikcqcIgnd98UVjpTBZKxMNS9u8AOQoKiAXRksJ
         aUSp+wvzyO0uCMu9oGgEUkgrtK3c/2DLQknQgl6iC4kAAA0sM1wP7mMTDKfM8mFbiNCZ
         Tv4holcyPJJiY2XCJshmWlpBn9HiTPOg/5moII43TBaI0boTZu1uaqfi8zAqTf7Lw8+h
         PRvkDgkgdlehg+DySaR9GWNxEzqm8cXPHue7Jz6pMPC60OaFeZFz0K/3eNHO3qosVQk8
         gihA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3yIo5k55dqWFrWh7aJ0AGalhfreqpUTHnr2W7t7qg6V2iMQuVydBXFzSr034XOSYZbcFGiW5jdhohd8hS6iOMPEodCZ5JRqyKkx8=
X-Gm-Message-State: AOJu0YxfkG5keJnCJ4Sy5bYJ11YKgQQZ//RcT6XEwA1UYfv2u1Y96nWX
	qJhSXvqtP/j7/o6wYvEIWLdg3Iybaow2IOdQW6YaobuKEkvvkWhW4Kl2ghEeFAY=
X-Google-Smtp-Source: 
 AGHT+IEI2XIgoT75h7Br+R9UPixD8KUgoWs/OqjcRXJjfTldGZCA0rliZmucMT0rRgFW1nfE8SfbEA==
X-Received: by 2002:a50:8752:0:b0:57a:2309:c1e1 with SMTP id
 4fb4d7f45d1cf-57cbd68ef64mr6670421a12.23.1718629416521;
        Mon, 17 Jun 2024 06:03:36 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Jun 2024 15:03:20 +0200
Subject: [PATCH 2/6] ASoC: Constify of_phandle_args in
 snd_soc_dai_link_component
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-2-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=847;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=omsR+8Ap/pgl+yJ8epRiXzyiO4DMItCTdftfE6hvy4I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQgtgcSzA+EJVFaCjgKa6XsvslogGH3FKDhC
 x0BhuH7NruJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0IAAKCRDBN2bmhouD
 1yXWD/4q/WLTFuKY8TnmWYhhWz7Agk+LgxO8M5bKRbWEfAq/vHP3RXcfUJqf/1pGw2mzaI0ma3A
 2SeA460FgsXpYCe8mtzVXyK7qom2vGauqQf6cr647nVRyswwjvmBvFJvbLG7gYIVqd7MR2LcaiD
 fT9Ij/FWEkgg/wx+dbkdfe3RBnUDBUovKVdmm0bCkaVVEcJ2xKEKHfgahiJsl5QfUKEZba8Py4m
 yq5h6sUqp0B9nHEeI3nqiXqrxfpEVwtLa36sLIaTiKxJr8fZD6IbJzdj0RLpfc5KjCUHUS10Gps
 W1DFDdVBgs4+cjPSFOFuWpdsjEqJPVUvdqUtfFVMN/BCKhAQh9tlzyfA1LEqUwMuoWbG2LtIb27
 nHBiek2zflKpj6HmIE/IUMiL+PU2mV84nXhC/na2XHsKBdgf4mw4H4jCIa6BgXhQRlF0S4Y7Itf
 A5G4krXG5u5oRiclhtF82cAVhHTfHWC/HIzxq/dSsEvTCxInYYJVNGbN/JUdCmZhP1M7k80k8j1
 d2+YBSxO6/Y91bX32KnysxmN+w3oWFByAMrZZt+SxY/e8yHeTNVouW9alwbGN/xXNQ+LS8bte9i
 23lUwC64C1+NkpIvn1+gzUGYGt5BWR9OoJZTiO1jqXU6r5B7c9qtxsLXCKgqL1Fok2Yg82EyV36
 ljUJn0yU1qclZiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: FY37UKUE5MG2BEKS2QUFGJKSSSIFAYIV
X-Message-ID-Hash: FY37UKUE5MG2BEKS2QUFGJKSSSIFAYIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FY37UKUE5MG2BEKS2QUFGJKSSSIFAYIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC core code does not modify contents of 'of_phandle_args' in 'struct
snd_soc_dai_link_component', so the pointer can be made as a pointer to
const.  This makes code safer, serves as clear annotation of core's
intentions and allows putting pointed structures in rodata (if ever
applicable).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/sound/soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee89..f02a51694ab4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -675,7 +675,7 @@ struct snd_soc_dai_link_component {
 	const char *name;
 	struct device_node *of_node;
 	const char *dai_name;
-	struct of_phandle_args *dai_args;
+	const struct of_phandle_args *dai_args;
 };
 
 /*

-- 
2.43.0

