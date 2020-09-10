Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1785C2643B5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FA01680;
	Thu, 10 Sep 2020 12:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FA01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733225;
	bh=Qv1OXvI61HsWfYvLJV7+BT4PdMuQBKPLXEc0O1FqDRY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B+ACuF4C/znAr6CjCoACvHL1c8WlcZzmgjXnZBvdqE5hVELfax6ZsYeB+TWjEzC6x
	 C1LweT8w+vu98Qsz9jdoBTjZSDcdzUFWvUC6cA2TcMWTu6WIOPfC4+XFz7F2ZqrPvd
	 1fg+XVsLslEDhbdueRREbzKP+U4aGAH35MegRUtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD8FF802DB;
	Thu, 10 Sep 2020 12:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F4DF800E9; Thu, 10 Sep 2020 12:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E42F800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E42F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CoqKYihr"
Received: by mail-wm1-x344.google.com with SMTP id c19so1549672wmd.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Yn9H//prDI3nzfubjnDYZsOWLfIwC4u9zL7Q5L5NuY=;
 b=CoqKYihr/LAknPrSQbIbvPU2gLR7FOIH7ggzqjsh9z15qaPyfyrhevRI2T+LSxmQdS
 /P944BCbCATI4ndCviuSg3z7h8gkBd8AfUpk756wQ+QVHhVwnUc377v33rnx4r+I0y7f
 yy653d0neKXvV6G2HNZkJj83sq3Msz98IJgqrW69nlqAok2crk4ny0zWgR/aqRekA1Jq
 XZNJDRralB2ssmWk3SdWzDwtmUwOmx0lIIqwgvNHyH9ex2vs/wkUa74vJAlCN3LgsRPk
 Ks9dVnyXV19La4pBynnDCb/3LbWV7O3S8cBbM9ztVpG9cWD+Zt3yh95JlWyP1YnOClAd
 2+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Yn9H//prDI3nzfubjnDYZsOWLfIwC4u9zL7Q5L5NuY=;
 b=Trxq1fpGAAvaMOe2MB9M0/rVZtZFWOcJIAq6h+Cli5N5Oz3BriaGphQfI1mimoHH0g
 cZ3Jz2MNYz9Q9o5Q/yAid/JpDwVgaxVcPn+9LRHrdSaHEZiMnBJfWemGjcomwTKEwRZa
 uaoHI1WIyWNXBWhjOy7G8dxwZ0b6BIgIfxZIhp6WFSDQkSPAqV4VV80bqnTgGTubJA6j
 Ixs+xaXVwdl5Jepu2jqQ0ZxXssfY3rJzUUGvZbxwKN5h3HflzHoF7yq3/CLpTC3+Jct8
 hdS184N6GtkzK44PBJt8YnBBHk12OlDeaQlX4CLn2rGBOPYnWCRCKOuDXJnq5BIkXY1W
 v5Cg==
X-Gm-Message-State: AOAM531JXT8JWGsgFn3HCLFp2zgxUHZ9kLKxYstUm4dKtHI/6jir7JuS
 qlo7kTH0T9r5iKZWE0WP5FK/Gw==
X-Google-Smtp-Source: ABdhPJxcPLylHepCovWDrGxeRaGOCbbA84z0OyPHZyCk3TmQmQLuLKvH4O+kUQQuUZyJGZRCB5Texw==
X-Received: by 2002:a05:600c:4103:: with SMTP id
 j3mr7653661wmi.130.1599733067588; 
 Thu, 10 Sep 2020 03:17:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/8] ASoC: q6dsp: Add support to Codec Ports.
Date: Thu, 10 Sep 2020 11:17:24 +0100
Message-Id: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
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

LPASS IP on SoCs like SM8250 has Digital Codec part integrated into it.
This ports are exposed in Q6DSP as Codec ports. This patchset adds
support to those q6afe ports along with q6routing and q6afe-dai.

This patchset has been tested along with other patches on
Qualcomm Robotics RB5 Platform with Soundwire and WSA8815 Codec.

Thanks,
srini

Srinivas Kandagatla (8):
  ASoC: q6dsp: q6afe: add support to Codec DMA ports
  ASoC: q6dsp: q6routing: add support to Codec DMA ports
  ASoC: q6dsp: q6afe: prepare afe_apr_send_pkt to take response opcode
  ASoC: q6dsp: q6afe: add global q6afe waitqueue
  ASoC: q6dsp: q6afe: add lpass hw voting support
  ASoC: q6dsp: q6afe: update q6afe_set_param to support global clocks
  ASoC: q6dsp: q6afe: add codec lpass clocks
  ASoC: q6dsp: q6afe-dai: add support to Codec DMA ports

 include/dt-bindings/sound/qcom,q6afe.h |  22 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c       | 229 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.c           | 308 +++++++++++++++++++++++--
 sound/soc/qcom/qdsp6/q6afe.h           |  33 ++-
 sound/soc/qcom/qdsp6/q6routing.c       | 121 +++++++++-
 5 files changed, 689 insertions(+), 24 deletions(-)

-- 
2.21.0

