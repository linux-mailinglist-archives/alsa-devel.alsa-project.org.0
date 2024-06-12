Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6D905895
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0EEEC1;
	Wed, 12 Jun 2024 18:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0EEEC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209330;
	bh=6+UBEqHPuSCJQ5GPuzFYqeY5be1EJ+f74Fpf7byXhqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ur0OPG5IH/qCM5NzXHXcAbU29KgTthmDtg3ARt7oEiacdFTLsvXl11rvf+e9rTTkb
	 QhPKOrHyeOc1ZiVsTQHujydtBi/DFrZNUHUkw89B2rTWVeF/k7moV8HZrmgPXI/M8M
	 vVqb/ahaZdMHeb5iLAa2VEnmcOjiSD2OA2B1hPmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 013A0F89731; Wed, 12 Jun 2024 18:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9142F8972F;
	Wed, 12 Jun 2024 18:16:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF8DF808C5; Wed, 12 Jun 2024 18:16:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B143AF80794
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B143AF80794
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=p9qhmz9T
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52c82101407so103693e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208978; x=1718813778;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUSq90CkA/e5YtyJB3DxxxJXJzc5nG1xr3zOSJv9S5o=;
        b=p9qhmz9TfzkgbK4FI28VFeDVOK2kYhPKQsUNb9xT0Esd7UFbyr57T8q+0qwOdeUNVM
         j07aktNuoSm+7Ov6qrOqFJPOkvCaHN930jCIJhK3uHPNHx3hp9uyslb01/mac0zOjSst
         GC5BFCwt8VOYn0FuwTS31wRXv19q465P1LQE2MEyyg28JbsV2hIWeE7J0ofkaJkPCE3M
         mUuddh8Z6Cc2s6wptfXUgNCUGVfBZN73n1iCeJTVpayM3/91Vmm1ilEqLS1VwuoH3FSU
         oyYLCknsBezH3sFZakFfdKfrJ+gbn5w7SS3B8yAaeKiI7Vv2S7ti8c9/crB9IBXGp/i/
         abfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208978; x=1718813778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUSq90CkA/e5YtyJB3DxxxJXJzc5nG1xr3zOSJv9S5o=;
        b=dUYONUUCZ+fvJoxxWbgcxtHqQw4f0DUWGUFwpkcYIQ+Txp5y5jaBTmnGEcSi72fV4K
         OqGLbAJ5TFcTNtCb87hBPXVtEIdlixOdxahQxUWKbYk1B2VeNUDYsNoxeywVp2+Ickj0
         HXIVRhv6zPwxX1jyC8a6kW2uTz+o+xTdL8FGQ8Zw0XjcOS6q0j/cNbBUuc7yW5O+blek
         xYmko+R/NjdF1bWWSG4tvgfvBThGO9eMIGH1nmLLIDpT463uFKqNvdwYodxrr2ljUcot
         hvuHLMwrfDvmmAAXBTiA8CGrMFFtTPpGSROi5D0wcvBqg8Kbl/iRboFxeSDnP6Ou6yL8
         +MPQ==
X-Gm-Message-State: AOJu0YzPnyW2wcpZxvpD3uO9QeNedIgaGswvhReRPiuNVDX4HF747SKh
	8sV+V69N8FJjB2TSRvzu+Yyvpe/Jc4Pt2IUxtUapn2qWK0OByj/+006vRKdEizI=
X-Google-Smtp-Source: 
 AGHT+IFwbnYghzXFTnC+RPeeiOFea6oxzdRq4GTl+xpaiMotJwnH3mE3DEOAsY+KEGhGtB0mf+6f5Q==
X-Received: by 2002:a19:e00a:0:b0:52c:8811:42f7 with SMTP id
 2adb3069b0e04-52c9a3d2020mr1828169e87.19.1718208978302;
        Wed, 12 Jun 2024 09:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:36 +0200
Subject: [PATCH 23/23] ASoC: codecs: wcd939x: Drop unused num_ports field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-23-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6+UBEqHPuSCJQ5GPuzFYqeY5be1EJ+f74Fpf7byXhqo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmr/WnHs89ZC/yEkUavUltM0vHYHU6KbqX4W
 wEotKpQ6ieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqwAKCRDBN2bmhouD
 19KVEACbMMT3jPxwjV7Xo2ksLok+3WxWywwteg/LnIXFjkRxGoGONk15q24uYyDKKeTxUuPDpib
 XcwgtSHFW0e0q0mt2feP46Ce1INuVVah99aoK+HGWF79YJG/2UtzxzPCaTbewL7o4h+55j5TcuA
 vHM6nrwyyC+r7AJeOtKlOZy/tOy+YANRFZWu9UkXXRxx9pB2GtBYsTPaJ3HYwrGrjO+zJ9QITs4
 ccPF7qmrb5f7Gp2yZ8NU35FLjbaS0/UOSeyXCrXNF181JruQZ+wed0snTOALbZbdQ6IDQ9JD6GO
 rX0VMP0JW37eGVz/wcJRUYHOQ8zKCXQ9tgfANZn4JvwUhbFay/vJGEFhRhOC1tBt+k86B5Pbjzl
 SAB3Azk97OvL+I9xA/jLtun1WoHWXbFeSrhYFaUx1StgW0CATkzIdD6cL23hxrvZKhDTOADiDCo
 edn/0N6j5mAktUp3v2PV/lSD+qgj36GvPC6/P4Tj0TAVE+33cMLYxBD/ZNXcRnlyZK3eLztTnKS
 yHmDTb/is8fY8DEdcpmxpSEI0TqbM0masGNvaS26HcB91dO1ND8Ghs+gn81PjrTvvskQz5Gumld
 ALpx3MIKDaAHcU2lRawkwvJ9Y4AeWo8YnyzrkYIykhcicLO1BA+PR+XLarpL0oGplP0tQAVtWt1
 m/+jt/LnIuV+7Ig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: SPAFC7AYXCE37LGLTEBXFFIUCXF3J7PB
X-Message-ID-Hash: SPAFC7AYXCE37LGLTEBXFFIUCXF3J7PB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPAFC7AYXCE37LGLTEBXFFIUCXF3J7PB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver does not use few 'num_ports' in 'struct wcd939x_sdw_priv'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 0aa4d9d542c6..1571c2120cfc 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -912,7 +912,6 @@ struct wcd939x_sdw_priv {
 	const struct wcd939x_sdw_ch_info *ch_info;
 	bool port_enable[WCD939X_MAX_SWR_CH_IDS];
 	int active_ports;
-	int num_ports;
 	bool is_tx;
 	struct wcd939x_priv *wcd939x;
 	struct irq_domain *slave_irq;

-- 
2.43.0

