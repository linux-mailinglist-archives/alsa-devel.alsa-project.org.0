Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F932B736C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 02:00:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED73317A6;
	Wed, 18 Nov 2020 01:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED73317A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605661248;
	bh=LC6kOUxUqOz18BM+ukiBpXDPQ9uBrSgD99d7N/h95vA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jD+edigiJPcCOk3VJnrUyQ/HTXwu2ccZ8OoL9zcJi0F+JQ3jOv3kr3XvYEnJa00u6
	 nh/fTIMeY5sRTtOtk12S0cJNG2IPwjhjPvWGKnoklF+AJxan8PhDlaLjQXXQcsJWFS
	 x4aHzHVfan3e8c9pniBdyjnOp/faMMsNIHtJQN+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF6AF8010A;
	Wed, 18 Nov 2020 01:59:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E89F801F5; Wed, 18 Nov 2020 01:59:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D081CF8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 01:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D081CF8010A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="ugCJDASv"
Received: by mail-pf1-x444.google.com with SMTP id w14so325947pfd.7
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 16:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZiwxZqojFgPo5SsCHfj9x1Lcm6wX0ajQ1bLVVWx3jU=;
 b=ugCJDASvWGrjrU1UVd1kTuc8cB+gPeGsAKwTgHP8RzvZ0d6D/Pxx21h1wZ9Mp+0KsG
 +uWpI2aJ60/fEeEzI+J6ACWHKv2MbSBk8jalOWRY/q8erFFlS6t7zHdBkrLQqSxjJCzW
 +aOPdyQdKTLx3ry0J5m9p7c1Hb2If/PjwgPfdGCfbRJpREBw77df27MpbwuZWgjGYjIX
 I1WE5Aizi+Y5PSrmbANDMgyPT4JZAPKN65HApfP3EoAVN13k72QCGLAKFMyIgfW07Npf
 iAUfHAwR1boa5U8/DNAVA0dgBWGkdosCBjIdo4RjOrUovlQviOl2XLY+0xHLgRBf6Ffi
 RfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fZiwxZqojFgPo5SsCHfj9x1Lcm6wX0ajQ1bLVVWx3jU=;
 b=DoyW3LKRe92H7nfBkGwRfZZHD29LiOYSWvdWQWVTHvYIcJfSy96YP5xdevN8gveU4x
 VAWseE1BD9CMbsn8JZ3H8snGYLrtehjzMNmXS/cGKFVvp8FO3aYHQ0vJxlT/8827aG1N
 I4Oe+fp6WaCng606/DthDpr1q9J6TPOhSUncZs3EdBzBdvtrsCdaUTIU9PPkQJJeze0v
 T1k/5P9OlS9FfaAVHS5MzqshLIjN80eXMI1FV9MqYJRKF0PApvTv32g7dtA7xR+NWIci
 Y3D5yIUIWEm5cNXyoqWc4OcA2FztihHDkSbhB+9HTfwuurtbqtysCqg14UiuYhrxhpHk
 4DpQ==
X-Gm-Message-State: AOAM531rTSApSBGJernMMubQaO2lB6jHTUSphXt5/ep75s0AX0HuvOTB
 QabvI9xIhAndVaB0j4eHwbH1
X-Google-Smtp-Source: ABdhPJxdQinxTZFO5n5EZ6IWDpmbfN2LzGmaJN6gn2i345FWRsV2HD3cz7OaPvnK63UNxoAFSui30Q==
X-Received: by 2002:a05:6a00:78d:b029:18b:f46:5262 with SMTP id
 g13-20020a056a00078db029018b0f465262mr2266304pfu.74.1605661147582; 
 Tue, 17 Nov 2020 16:59:07 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 y10sm307159pjm.34.2020.11.17.16.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 16:59:07 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Fix 32 bit format for adau7002
Date: Wed, 18 Nov 2020 08:58:57 +0800
Message-Id: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

the microphone is attached to external codec(adau7002)
instead of rt5682.We need to always use 32 bit format on sc7180
to meet the clock requirement of adau7002:
The ADAU7002 requires a BCLK rate 
that is a minimum of 64× the LRCLK sample rate

xuyuqing (1):
  ASoC: qcom: sc7180: fix 32 bit format for adau7002

 sound/soc/qcom/sc7180.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

