Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AE55BCB3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 02:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308F21650;
	Tue, 28 Jun 2022 02:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308F21650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656376210;
	bh=GuSnRZkB+iiUaLbXD8L9n7WE8QeIdPxnGN/1uEqNehQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N0G2QWBdigR/3CWFkP+DagSOqR7xQ9aIfYKGKvX3/v43gMakiRe+h8G4nAGBL9Sx6
	 P5oNulfcaMas7NvKxGsPwrRhg0vV9dXMwhAghUTm3jhiTvNmuD9rBnjtmRKMGmgUlx
	 ZHJ4dn9L9BaIOEmF7V8dZ7jGv0zZYoSQSwayhY08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63082F804FA;
	Tue, 28 Jun 2022 02:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E596F804F1; Tue, 28 Jun 2022 02:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9AC0F80128
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 02:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9AC0F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OhdpsxGn"
Received: by mail-wm1-x32f.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso2044232wms.1
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 17:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loKOPYEWFVKgOL34le0TQOd8p13z6rW/uil4PBQiVZo=;
 b=OhdpsxGnp2/q17T55ktpvb/b6MmmJXnaW2TaL51pjQydoKSVKvjp5C/WkAHat5kkc4
 ogilw7mi9Je2FLlZZO1M8tw6LDovGZ2VHZRghSYs8liGrOFGL8ZkfXbZ5a9d/RKSWeqZ
 8o3UOcjM6Jjv8JqEZIR971EdJQ4mFvqU+txeOQ7iCiw9Zo6/fuaCEmtjy4+SGunADfF5
 AwlYhVQsHDhzqF27WZf3leCUgteQ9R1lnqTNy40DMpLXkEORtsrftXxXYn1NhhKBtnw0
 GLLQ/87HJmD8ABw/8LQGvpvNpG2XCWsgk7s1ZzecS7k6AXtFy9mXvLDOwn8Fik4NNxKy
 J9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=loKOPYEWFVKgOL34le0TQOd8p13z6rW/uil4PBQiVZo=;
 b=lD71mEI3GHeXASQK3oMrufHy1oBMKD8XBEx58YEuSBZ3sDQOq5ge5xd3oDnZNwgtqF
 7lPlSV4oKmiSYTsr1p1TaGLfuawBGPKGknEeM6IqXjLSolb24OBkR8/fTlzNqziUczgb
 75DnUQkGG7NJH/1k7vhi4/XFKedMW9NOLmNd5m2R/2FmVIBTu64+z9yRAT9dmcGeQd5e
 1EDXqvEBVE6u+HsLCbqwalBFm7pX45PerQ+48jnYPeTsO2DoJsCTbf4bkFr1prOXdzEd
 6wx8mulKDeg7y3Gh4PeCnk6phA344R4pXZRfsp2Ttx8xZTJFhi3qz14AiNXL/gwMvR/x
 /ikw==
X-Gm-Message-State: AJIora+8uThEGW+df8m3jiUqP5P70gF4fhAYoo+zsQnymDfu9KmybQY4
 HBzrPzj+kIrDVEbZoy+jVJak7w==
X-Google-Smtp-Source: AGRyM1trccyFgpOxm8KXrYfjR5QINHk1rCNh5iLz0EYzh8UxKqRWlYjP2MEwkDM3xR0Bez+UNxkvlA==
X-Received: by 2002:a1c:2902:0:b0:3a0:2a05:c639 with SMTP id
 p2-20020a1c2902000000b003a02a05c639mr18924451wmp.31.1656376142540; 
 Mon, 27 Jun 2022 17:29:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b0039c5cecf206sm15863560wms.4.2022.06.27.17.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 17:29:02 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	bjorn.andersson@linaro.org
Subject: [PATCH v4 0/2] Fix apq8016 compat string
Date: Tue, 28 Jun 2022 01:28:56 +0100
Message-Id: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bryan.odonoghue@linaro.org, krzk+dt@kernel.org
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

V4:
- Adds Bjorn's RB to first patch
- Adds missing people to To/Cc list

V3:
- Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn

V2:
- Adds Reviewed-by: - Srini
- Adds Fixes - Srini

V1:
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
 sound/soc/qcom/lpass-apq8016.c        | 1 +
 sound/soc/qcom/lpass-cpu.c            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.36.1

