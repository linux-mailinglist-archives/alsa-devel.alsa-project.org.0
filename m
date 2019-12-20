Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4CD127A62
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 12:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C511669;
	Fri, 20 Dec 2019 12:58:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C511669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576843174;
	bh=Z8JSo1Iv+sFEpVEbacU0XSTCpPrjNRD4AsEisVG84hQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kFEdZazyFHPbJCfiT8iz/7ddLs+V3P7P8OBxqiZuRLWsi1L7zKm2dJcTGfSUMAHo9
	 Y/phJFYgTKV6JApYYH96Ia5evzwZrVwedUsAl5cdWfWjIpJdTjuSUFwL8lNuqZTS6J
	 J8XhdDXClTHrQ0DmUUMuS8+8IE+gWRb0BUrwaWNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 672AAF8022C;
	Fri, 20 Dec 2019 12:57:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 302E6F8022C; Fri, 20 Dec 2019 12:57:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85106F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 12:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85106F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xmn/ESjo"
Received: by mail-wr1-x441.google.com with SMTP id c14so9140920wrn.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdjh6eJemJddUca0ftv0OmJI9kXLgxEMf9k9Qia7NBM=;
 b=xmn/ESjoJHdzlmpiAmR6wQtOMcgwE0PnXNDkOhjZIcbNUcAJ5lTvLvRExkHwKMFbjH
 +9yW+CybmIveP36Nxp7QhwVX4jkhwruBGVVat2So0ZrhpM0C1raLJzcM2gswL+VAzngt
 TtfB4MiF9gMXNTKDnv1Vr3YQEeswL9BgdQfXCnzqY8LIBjMvOWniUJC8wEziu6qBWI7X
 vW13ggURx/MW+yhUEi0syZ7QNzU378hU4izsSahIviAaaQqCqlpOkfb+Ld5A+SQ3Z3fO
 q398bXkEnyZgOx96/GxWn4x6UP8h3pD/Zcz1RC4RyTWlZBHM4piLvHF26Ow4nmVKczv2
 J09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdjh6eJemJddUca0ftv0OmJI9kXLgxEMf9k9Qia7NBM=;
 b=P6/EvRmhY1PR4Hbt06SQ+AJ57y/+HgoXtIeky0l+aQ0yT3fay83+J3dsF8PunURlmh
 OGIB87EZwheKajxKxxGIU1ZHTOngmKvk7Xz2gfDJsq3RIrM+YqagMnkVhqVAKq4zM9YR
 AjET9fprWAGMYPWrH4i4HTG1V892ZSAjx61yDua3kqBprjTvxSoMF/LFw/GbgsaPYW0z
 kY1/qT2aehlubnsLojIFgnLSFyXYwh20mz52/5XzLaf/DOLNjyQF2JhGQuqA0rUPxMKx
 OPF8rqY38vQftNm3eakLZ7nnPGK3mDm7WfSoVERBvrN/doMCWfHLETRUSUcj5sN4UJiM
 20YQ==
X-Gm-Message-State: APjAAAVlBTwrHDFmDoxETGIe7ik24UMnj0Uz+78SZkSK/P9waUwBLRS2
 DPNbv1x+LuKGYp7GxVY8Kae2kg==
X-Google-Smtp-Source: APXvYqxXw8EPLOBFnAGJgKTZ6PcEeRuhyHkAo7vQFADuKjMl2WoV+DGP7unSU1fbNW+PRCvgvcT/tg==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr15494299wrt.256.1576843064404; 
 Fri, 20 Dec 2019 03:57:44 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z124sm2644386wmc.20.2019.12.20.03.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 03:57:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Fri, 20 Dec 2019 11:56:27 +0000
Message-Id: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v10 0/2] ASoC: codecs: Add WSA881x Smart
	Speaker amplifier support
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

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 and Lenovo YOGA C630 Laptop based on SDM850 with WSA8815
speaker amplifiers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
        Add thermal sensor support in WSA881x.

Thanks,
srini

Changes since v9:
 - Program pa_gain settings in put function, rather than delaying it.

Srinivas Kandagatla (2):
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   68 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1182 +++++++++++++++++
 4 files changed, 1262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
