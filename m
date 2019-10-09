Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C880D0A50
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 10:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3C7165D;
	Wed,  9 Oct 2019 10:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3C7165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570611227;
	bh=KPqEp5KEpFY+BFD7PR9ZKJwZ9HiBiJtLlyFpTNTedjQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wbt0J+653eP5opEnE+dYHWFW9KMioJgiPOr7QA+CJC62s5ahPixJDXYYU07F+Mvhd
	 ZE+Xu5IAogRblSNAhpHZoulLd8+q7BkIOUnAtvha3uy2TDofhsnAuGTxgl9EY7WZ4O
	 cGRUO2OTglSbMBOMkrIhzdCsy8c56p3hJmSh77Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4EEAF800AE;
	Wed,  9 Oct 2019 10:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66532F802BE; Wed,  9 Oct 2019 10:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C802F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 10:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C802F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YgLRRZYu"
Received: by mail-wr1-x444.google.com with SMTP id q9so1757754wrm.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIXSgqPot/VtHtCYhdqESFswgKhZA/r+U2HQFD+JPgo=;
 b=YgLRRZYuoAZwYcthuxRPzBi/noASE7Z6NQeQ7wPn8AHqgTR+fv5F10cz4dKU2NoQPm
 7Fj65EDd4DgPh134OONDT8GVKQl2hxntl7NXFSprLnO+p6TmNePG8ONMtpWWdPBm4jSY
 Z7xE9r9SEYM74vEdRM8527c1BFS9G6Hc2kMIQi5aAPG2Cxl0kmB+Ke9ECuR4RgHA91F8
 BBoerfCgxKA9SqihRnDE7WNg0PvVDkyDeUjNoeHZr3NPr02DEjl608ylnIrs37R4em8M
 8KJYPecHqgo1x3qJSXalEBlzMeJ0GER0xRuqKpV+PYhEJ8PBs7zD7EruPCcTkz7girvK
 UUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kIXSgqPot/VtHtCYhdqESFswgKhZA/r+U2HQFD+JPgo=;
 b=UORaizDn/IdSycKxaOt2qn90M0xmIRvpP56j0TL4ERzNTIentTNltYBjSi11/M+mOa
 wopllRjJdT5f6+Aw2t4ufxch1snjTSYYP2zcJ8WVf7C4LC312yztLxDrM6Bk5/fYcSVj
 XRoz8LwwU18SRLJgffrd58zHJUb+lh1g/xGxRu7yJwEBYiTniG0eCWcYZU/YQYcm74TV
 GnNtnlhSzOtPWiU1OoY2xWHPRqPqz9S4JS13NzFLeENqgdz76OHtSbPen0DSb6wgm/mx
 ZA/Mym3LxcBbqZ2th5GriN81RsxEPwO46ornNulQ8vkSccLM60nPKRzkw0MPEN2DZyTH
 JFng==
X-Gm-Message-State: APjAAAVfDcfsuaXDNbk9I7Iz+hvVHKH3wvh4M2YTaNbyhIFsMTxwLKkq
 fIGdw/VzwqdKKF2rMw2uF9WxCg==
X-Google-Smtp-Source: APXvYqws1ottQYgV2u6n6BCavAvLpJrmB3BJnOxpCU3FGnq8IrsHlRBrn75l3yq5qrftbTvHq7ZAOQ==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr2052521wrv.141.1570611117411; 
 Wed, 09 Oct 2019 01:51:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b144sm2476291wmb.3.2019.10.09.01.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 01:51:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  9 Oct 2019 09:51:06 +0100
Message-Id: <20191009085108.4950-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v7 0/2] ASoC: codecs: Add WSA881x Smart Speaker
	amplifier support
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

Changes since v6:
	- Added reviewed-by tag from Pierre and Rob
	- Removed udelay argument as suggested by Pierre.
	- Added device id for WSA8815
	- rebased on sound-next

Srinivas Kandagatla (2):
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   62 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1113 +++++++++++++++++
 4 files changed, 1187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
