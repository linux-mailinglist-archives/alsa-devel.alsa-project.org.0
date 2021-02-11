Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC1B318A78
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B00A16F5;
	Thu, 11 Feb 2021 13:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B00A16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613046562;
	bh=8i17EkeX+eeNUjsY3nejNlwG3DQyOWePeX5NQ0Ieb6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bSiYNOEu09hjCzXInOI9KNoD/atMgfDM0jZnNze0YR/hzCU+RHAmEQLJ2Gp5sQTYB
	 w+Gz78G3UOeMyVHgz/joieObQComKmU+wK/xB+rVj5POBNa7gc7F9k5ZPlcTNxy9rY
	 EPf2tU5D6/jhz7JVmgaKUiG74UTNg0Hcbl9ODgaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39217F8010D;
	Thu, 11 Feb 2021 13:27:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F46AF801EB; Thu, 11 Feb 2021 13:27:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DFB6F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 13:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DFB6F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I9mSBvY7"
Received: by mail-wr1-x42e.google.com with SMTP id 7so4033237wrz.0
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 04:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcVy2hhO5lDAWG0A6BnQz5rAwn+vZs+FFC39Fm9Ww1o=;
 b=I9mSBvY7RXW4LEA30FsIfm6l9OmFw8BV5mszH1j2qz7Q9xDosqu7Ej5vHgf5/p50LY
 GEKqChEshCwOyOIMrg4kB5WfZToSFT/9FO3fAVqaC3L2+/xhc1dg0u0N1f3X6Gd7THgf
 sNiz/p5X6IECP1oIx2XXnp1kdomULAyTocQw45yq3hrvVqL/fLBAVLMqyECTqYimOi0b
 xHFTJw7Nz2fjXEFs53IkNFyvljL3SvW4lCkBMazNJ0cZQwNGSCUaPFU+OKAjlwN9Zb6O
 QFvHs2D5adRijSqp8PIHki2rGMHyLyWyjQfDuTwLk2+wNAa+joqzE1h+criO1aF3BLR7
 KRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcVy2hhO5lDAWG0A6BnQz5rAwn+vZs+FFC39Fm9Ww1o=;
 b=jsKWsL/HgrwHbOttvrGVdx52O2WBPZ+ph6oOyA1q85PQFIJQMRkTIk4OucWUbD2Y5q
 fwq+c1FcktBAtEQ0pC8JqMUGQPhJ5GNp8eyNzOFPDUi+yyjWtQ5GkD/o8W/LTVJ7As2J
 HLG9QXpm4en0KyNFDdwl3O0W3YHNColktM2NlNYlvHXy8rnCXfYg4WpGe0iUv1AyvfBU
 DTtp7ngBnVtJq9H5aSUUqFcfYLH4Qhw6Wa0pSCUlxv3v3RH+stJvBilCV1cB7OkSsvCl
 QINYeKjAo3VsH40IBYzaJ1azdeet/0vm5pthLsZ5o95A+D10mBTpp/fe3b3x25rHWqtX
 XfPw==
X-Gm-Message-State: AOAM532qZ+xMlGtI0HCKTT8HzEZqsSzD8M+lFAes+VN4WFf8mLzMzBHz
 VwFa+hcARC648NF5EMkpxQYwIQ==
X-Google-Smtp-Source: ABdhPJy3KCGT43Q6w5VStd69GdPzuKwYkvZ0X9RuaIbErPiw89BI08DD7DOP6E9w6RMQnRe/8LxXyg==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr5447616wry.398.1613046464646; 
 Thu, 11 Feb 2021 04:27:44 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d20sm4026477wrc.12.2021.02.11.04.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 0/7] ASoC: codecs: add support for LPASS Codec TX and RX
 macros
Date: Thu, 11 Feb 2021 12:27:28 +0000
Message-Id: <20210211122735.5691-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patchset adds support for two Codec Macro blocks(TX and RX) available in
Qualcomm LPASS (Low Power Audio SubSystem).

There are WSA, VA, TX and RX Macros on LPASS IP, each of the Macro block
has specific connectivity like WSA Macros are intended to connect
to WSA Smart speaker codecs via SoundWire. VA Macro is intended for DMICs,
and TX/RX for Analog codecs via SoundWire like other WCD938x Codecs to provide
headphone/ear/lineout/amic/dmic etc ..

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

This patchset has been tested on support to SM8250 MTP Development Board.
This board has 2 WSA881X smart speakers with onboard DMIC connected to
internal LPASS codec via WSA  and VA macros respectively and WCD938x
TX and RX connected via Soundwire via TX and RX Macros reseptively.

Thanks,
srini

Changes since v4:
	- One more ktest fix for unused-but-set-variable warning 
	 and a fix for W=2 warning and removed unused macros
	- added bindings ack from Rob

Srinivas Kandagatla (7):
  ASoC: qcom: dt-bindings: add bindings for lpass rx macro codec
  ASoC: codecs: lpass-rx-macro: add support for lpass rx macro
  ASoC: codecs: lpass-rx-macro: add dapm widgets and route
  ASoC: codecs: lpass-rx-macro: add iir widgets
  ASoC: qcom: dt-bindings: add bindings for lpass tx macro codec
  ASoC: codecs: lpass-tx-macro: add support for lpass tx macro
  ASoC: codecs: lpass-tx-macro: add dapm widgets and route

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   62 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |   67 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-rx-macro.c             | 3599 +++++++++++++++++
 sound/soc/codecs/lpass-tx-macro.c             | 1862 +++++++++
 6 files changed, 5604 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c

-- 
2.21.0

