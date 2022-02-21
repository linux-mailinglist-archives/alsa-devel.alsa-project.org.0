Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4F4BD923
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 11:42:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81419168D;
	Mon, 21 Feb 2022 11:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81419168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645440171;
	bh=xPpJoqL+2/j8nyTF1ydQtLUM4P5alLm/sysvPwl5YvU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ix7lY66FCyT0CK5hGXZanXdu37xIZW94H7swLw9wJtFNuwcZmCWUtvPpbeRwGdk/d
	 l2jEASjiIM/6Mh7FDFPMiC4wxjJYl1Gpv1xlACIop4v/RLPl0yYB3UrBwrN/9Q9LAw
	 cfbMWo1kTPjJoZQHTehSVu/lTi1VYMKbewq6jB5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC71F80425;
	Mon, 21 Feb 2022 11:41:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E8D8F800FA; Mon, 21 Feb 2022 11:41:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1414DF800FA
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 11:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1414DF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="scTQgqOp"
Received: by mail-wr1-x42a.google.com with SMTP id k1so26245323wrd.8
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7izwyhUUirLGOcbvAKJ/ySoVgmZ6zFx6mt9CtP50ZlI=;
 b=scTQgqOpSpwrm9rIIYQvXQ9ri48Rb9VOE6Ov48Q7Wi/2AVOQRsZGHvJyISPd8tdmJj
 fu2dmeagLhwu8sYbPzjobQSw+amz2had4hNZE3QRNN8C2M5iQRmHs4/YPuv++ddKVz+4
 zIZMciYnCEdvNukga9CPtvxD8thHLgRf9vFYI65ZdNWpwq+SZnq+jAf+buBU9cD20Tak
 LzKl9Rpt9e4tksx5SXy0qRc5B3HLDHdbUllxB8P5s9caCLxqRQOczP3zDWI1b5b+f8SY
 9yuS4KUfBQFhsiCj+65dvGqBUcAWThiDZxLGgIWwJVHfSulJ0ZQVo1/hFF1F+rBR6CkA
 EEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7izwyhUUirLGOcbvAKJ/ySoVgmZ6zFx6mt9CtP50ZlI=;
 b=JFyEbxut+H1NNnnGNIg0g6ue9DYecWeje/s6tYQlOR5KQmTAsAZ8ZwKqpwwmrKiimF
 8eUnRRMVV96xBk45RT4m6JcsV3WQR8T/GzwlLRA0NMswqiNpsoJsLUf8YpL/1KjIIssB
 CMkceahGmEWNgWYiC74MjffNWSsLvDQXMi9IskuAfFpNa60Xq7rA4N+N7aIoO8A1+wct
 vy/8NNZLz6hpAl1d3IuVF67PuPQVPk0NTIHg+U141Dr5qJMlEBS1qHSgEE5ONfZaldzn
 auLJKuZYEcnqhdrP2ypyG3GZLA6YNmsH/gxsAPVpIaOLGjEyt2KJgzGHlmZerxQESxWq
 aLjA==
X-Gm-Message-State: AOAM530OWr1sDa14BzFCnL92YPT51edLLfVAuHE321P8d2YTREDnt1jT
 s+bxmfF/hOxn4A0Tfs2F/PR2PA==
X-Google-Smtp-Source: ABdhPJw28jTxSN/JYzVLnVzXnpvJGWhK5Wo2D27AVHnLLE47KPQvJxrpG/4l2yAZrLWAw6jmzoDwhA==
X-Received: by 2002:a5d:45c4:0:b0:1e4:a672:586b with SMTP id
 b4-20020a5d45c4000000b001e4a672586bmr14394858wrs.388.1645440098837; 
 Mon, 21 Feb 2022 02:41:38 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm7584817wmq.44.2022.02.21.02.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:41:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/3] soundwire: qcom: add pm runtime support
Date: Mon, 21 Feb 2022 10:41:24 +0000
Message-Id: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

This patchset adds pm runtime support to Qualcomm SounWire Controller using
SoundWire Clock Stop and Wake up using Headset events on supported instances and
a bus reset on instances that require full reset.


Tested it on SM8250 MTP and Dragon Board DB845c

--srini


Srinivas Kandagatla (3):
  soundwire: qcom: add runtime pm support
  dt-bindings: soundwire: qcom: document optional wake irq
  soundwire: qcom: add wake up interrupt support

 .../bindings/soundwire/qcom,sdw.txt           |   2 +-
 drivers/soundwire/qcom.c                      | 215 +++++++++++++++++-
 2 files changed, 215 insertions(+), 2 deletions(-)

-- 
2.21.0

