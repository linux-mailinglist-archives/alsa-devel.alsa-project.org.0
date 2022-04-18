Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272E506B7F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7860A183B;
	Tue, 19 Apr 2022 13:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7860A183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369296;
	bh=uKGnXdpcDmk7JWBZk7+T5rECAs8ZMceI+tRGVfLq6XQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HCfhFpR2c4J7U8U+7ZbVmMFyzDnFmnWQOThxucxVLTF8vID3tXY6p9GgjYsTnKxnN
	 YNSS35SBI5u8OULbaOfJ2WedzeyML03EQBQqmJgMWDySHDGt+o/KtugK2yBxOwHvrc
	 4puZmZ35tJvXAg9bf8iQ++LyIPAxxZ3yPmvcPay4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B04F80528;
	Tue, 19 Apr 2022 13:52:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35026F800D8; Tue, 19 Apr 2022 01:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDDABF800D8
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 01:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDDABF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n/beXps5"
Received: by mail-wm1-x329.google.com with SMTP id x3so9562045wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 16:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2eS8dVsua4f7NZqwwIN43RTvkPV8UuibGewXew9r9c=;
 b=n/beXps5kGdnYp4k0CPcZPGOpRVwWmzgCseSSJvifvrk43ZGeiJEVxdZcC8wPniAgt
 TB26z4ahk8m8NHyhUX1YdTdhvzI81Ynn0XX/NzMatB31FKkWtWQOpyXoAzerM4/HKgj3
 BN1c+jQKh5pv3fk4/EiQeRbdH6mclmrn70oyLov0cFxwGSINBzvDz0dnRptIz1S4TqqZ
 Qlv7bc1c6FYtuaIMJdzsYNMVoJTojQvKhuxvOjMNPQODXCQwWNQWu2HZK+7MQMF0Ny2X
 pa7TiGA1DW4GJdFEcWH1bGOgs5hysLv9AG3yq/m6VMqWflN3HWGhj7qAxkSxgPJpknUK
 rpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2eS8dVsua4f7NZqwwIN43RTvkPV8UuibGewXew9r9c=;
 b=3lTAGWF3W9BPdA+qdsBNJg32APGcWUl819YxyAk2wtM3vdxKTbpWIC6qu4SeEsJGk/
 caJud/JJE468niHQY+PaIWaEh4xLjBH7K+AtHaGncQPIK1WY5QTE4ykrUshPa8jG0i8V
 lTOzEs1r3qGdS/vd/lCA9tgkFdkve4gGCu9Xt3RV6GVUxQKDqI1l48eDEPvSio0Vv1SK
 mDzQYLJpvz9BJf66iPiE9zys778ZfE8PbIC7+bYQQQ1T1hNBNkTnPIZksSqE1RDqbceV
 BGsdrQcrfDgV5fifECdidRHnXT7qRAXigiOW4WVf+aCv7DGWAJqBN75W+FDEEFvHW1R+
 yZ3w==
X-Gm-Message-State: AOAM530mESG+IV51hsjU7Wseq4Op66iSk44IlSFAxu7uxQcqrygImA7e
 aXJAxEvtgLxZDxqMtUHGm8kPTg==
X-Google-Smtp-Source: ABdhPJzRGfJnMqMhSrtoacpg2O0W/2btZytxeb9m2V4HTN3SDQCCBRmi2vG/aBKD02PYXZkGu6n25Q==
X-Received: by 2002:a05:600c:4e87:b0:38e:ada5:5c6f with SMTP id
 f7-20020a05600c4e8700b0038eada55c6fmr12835776wmq.21.1650323398675; 
 Mon, 18 Apr 2022 16:09:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d568e000000b00207ae498882sm11187567wrv.32.2022.04.18.16.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 16:09:57 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: srinivas.kandagatla@linaro.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org
Subject: [PATCH 0/2] Fix apq8016 compat string
Date: Tue, 19 Apr 2022 00:09:54 +0100
Message-Id: <20220418230956.3059563-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 bryan.odonoghue@linaro.org, devicetree@vger.kernel.org
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

Reusing the apq8016 on msm8939 I found running checkpatch that the compat
string for the LPASS was throwing a warning.

This is easily fixed by alinging the YAML, DTS and driver to the documented
compat string

-			compatible = "qcom,lpass-cpu-apq8016";
+			compatible = "qcom,apq8016-lpass-cpu";

Bryan O'Donoghue (2):
  ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
  arm64: dts: qcom: Fix apq8016 compat string to match yaml

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 sound/soc/qcom/lpass-apq8016.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1

