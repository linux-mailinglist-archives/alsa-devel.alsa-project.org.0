Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A915CB3A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 10:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116101694;
	Tue,  2 Jul 2019 10:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116101694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562055141;
	bh=GUqKA9+WkmxxldFDtdNRkChU566ZVAdMkYT+w0Fefik=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fMQ3BYUIw/Gp8/OVxFYo4zUuMxKOz96KZ75Q+pmlOHLYjD8m07WM21FGMPJwbOumM
	 u0nZTx2wqa+MMFIthdQ0iNrjRfxZwkdSSOxsIe8NpvzRoGDjzoPLh9v5F0LL9MdBa4
	 W5yqP0/kMZ/82tg8LvEnXnZP1TEwg40Yma/sdIs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D60F800DF;
	Tue,  2 Jul 2019 10:10:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDFCF800D1; Tue,  2 Jul 2019 10:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 046A4F800C5
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 10:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 046A4F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VB52+/Pt"
Received: by mail-wr1-x441.google.com with SMTP id c27so8946417wrb.2
 for <alsa-devel@alsa-project.org>; Tue, 02 Jul 2019 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQvFLY/IGcdAwWsBuNGxABc1MrG/sBdj2yTY8HMsOyA=;
 b=VB52+/PtxfgbVZZLgrOZg7aQDmVQcdvsPsqYr3oTx1ihZODOXKCh0XGtTfTjN6YPhc
 wGwd4a9rEiv8UgHkrRl8F73a9G+tSOS4PYwZ/2le5JwMP9MnidD3xltf3mUYL2IwbdjQ
 SP193tXdQgo6qiEW/dniG/51JRX6hUzMSxwIeJBKbOjIF/DVDVUDa8g7WGUq+YCnZdpI
 og2BedTqjCE/2YCOtvZm5M7wl1HFJ/hTYtFTrBSD6SBTvBYEMay7CstxZNQIpZ6S/MUm
 +uY9Ow41PHc/3unM7fQCccPO7ZaWxaQtrZF5pTigPrxzU1ZHEDFL6q4ek47xXH+3+mfy
 NUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yQvFLY/IGcdAwWsBuNGxABc1MrG/sBdj2yTY8HMsOyA=;
 b=CugbVKUHV9TQfX35VnPZUwOXzkSxuodvPXPwM/Gn4Mjloi7kYFmVUy7Rr8Jnvarpfj
 j68TBByWVYhGjBmN4WYHoPeEBhlOcdyMKeOj1NYzpUX1INtCFxMESTXZU4cGJTLW5x9V
 VvWPbmaSu1eO1kZXt+JUz31rn4nal616a22kbqeU54EJxozV6IFk5cZ17yoftCDONPWV
 uITPqepYdlbiW4sfDnFKmBxvpbzuDQ1rwbUOLnre2zuAww+xa4+z7enL7Q816tjiJxzc
 vr+wRUUMqQjy1/A3LNqZ4bG1Y1/Z4Q6e2GjbZRYzvJPFNT8xqdAZeGtOH5xo6XGcHCd7
 UdUA==
X-Gm-Message-State: APjAAAVWtPWyQygLQiMwUmjOTB0cdn6QDO39Yt1t0MNo1EoMlmz7W/Q+
 pvUrDzILoY06YtiQjQJOnngwrw==
X-Google-Smtp-Source: APXvYqzzM1irAnKYi4Zg0DLLzyDAHFeASvIOtmDV2pI5kvdSaEcZuL1Ba2KGrecc573o0TBJYvzOAA==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr13266170wrv.128.1562055030738; 
 Tue, 02 Jul 2019 01:10:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id e4sm1608859wme.16.2019.07.02.01.10.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 01:10:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	broonie@kernel.org
Date: Tue,  2 Jul 2019 09:09:14 +0100
Message-Id: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 srini@kernel.org
Subject: [alsa-devel] [PATCH 0/6] ASoC: Add support to WCD9340/WCD9341 codec
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

This patchset adds support to Qualcomm WCD9340/WCD9341 Codec which
is a standalone Hi-Fi audio codec IC.
This codec supports both I2S/I2C and SLIMbus audio interfaces.
On slimbus interface it supports two data lanes; 16 Tx ports
and 8 Rx ports. It has Five DACs and seven dedicated interpolators,
Multibutton headset control (MBHC), Active noise cancellation,
Sidetone paths, MAD (mic activity detection) and codec processing engine.
It supports Class-H differential earpiece out and stereo single
ended headphones out.
This codec also has integrated SoundWire controller.
Patchset for this is already sent for review at
https://lwn.net/Articles/790651/
    
This patchset has been tested on SDM845 based DragonBoard DB845c with WSA881x
smart speaker amplifiers via soundwire and 4 DMICs.

Thanks,
srini

Srinivas Kandagatla (6):
  ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
  ASoC: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add basic controls
  ASoC: wcd934x: add playback dapm widgets
  ASoC: wcd934x: add capture dapm widgets
  ASoC: wcd934x: add audio routings

 .../bindings/sound/qcom,wcd934x.txt           |  188 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5979 +++++++++++++++++
 sound/soc/codecs/wcd934x.h                    |  426 ++
 5 files changed, 6605 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.txt
 create mode 100644 sound/soc/codecs/wcd934x.c
 create mode 100644 sound/soc/codecs/wcd934x.h

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
