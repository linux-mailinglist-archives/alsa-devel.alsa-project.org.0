Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2515232BB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:15:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C8A18BF;
	Wed, 11 May 2022 14:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C8A18BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271359;
	bh=sKLSP2OqzvoJexN5vhbAfJZX1o4VhDPz7T6brdFfj8c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SLvxKpLFqIbDBuTSKkn2GYdxrcxP/QZ0TAIOvLZUne4nFB+aozBO/yJS9MtgmpnoI
	 Zzsh3ZFVo7ENArTO3uQiWGAO16KU+9xeVmLj61TjtrEpQVVf3DaRPDj2e82+9nE0mp
	 FW1VThVHYyUcsEqaMYLoefqXIxYEi6I2EtiJ24Ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 696ACF80116;
	Wed, 11 May 2022 14:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4EBF8011C; Tue, 10 May 2022 16:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F41AAF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 16:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41AAF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pvlrqisa"
Received: by mail-ej1-x632.google.com with SMTP id l18so33397635ejc.7
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+hsJzreaFfLVPyymmLrJkbyzmNJnJu0qYLtB9ahG6I=;
 b=Pvlrqisa1HswCwseRK15nENZEWQjoMc6spitn2A60Toeq2u4wyRG+3D8kZNYnnyuDY
 9B9drOlmdCDl44n0mlLh/ePzcVnHgzvsmA62fzw4U5HS0e3OpUiHr5zEOTf0wTBqLx2w
 npSUuQ19m0y2UrlY2sVD7f3VanQHN3FNAsHvhJmswelBFq0dnTJlrsZbePKQ2cdDwxKn
 FFs+aWCv83G8Vx7PImReftM1vgLqU6Hf0GElXyWqNRvaVy2Nw3uZU9EyNWrmLOsmfzA8
 U7NVEoxvhVTyYIegJb4iGIid9ZrGAmZGpm5Ubn4q+d+baPRupiqJotuFWPgCnzIpllWA
 ZQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+hsJzreaFfLVPyymmLrJkbyzmNJnJu0qYLtB9ahG6I=;
 b=Ki5fkHKaT1Vji7eX2dZO9aiWypwChSMubkI2A7lyEUkB8iHnA8OvyW5v+EMddrcFJ0
 B9FljiZyOtQEYXiDuGnzlrQtReJTtrgA5DJgDqCd4GGY2Ho17g9LagM5OlbAE7VtYLcN
 Lsq7flWjBQKIdVrSR3dlKo9eaEvlT5E+J9ePyHcgjU/lRL7NRl2O6Bd7nA47UGIKgtIP
 BH3jadOSGOYjk/aCtE8B7ip2+KW9rFwl8qCF1cLrSVCpPs2BkVo3OukF3u87DOvrrFDq
 gh4Z2RagXeOYKk/0RnK26q5LAGvKm1EDLhOlMRK8LV8Q8u/7SE8eB2zdQmt6mmafppsZ
 Jdwg==
X-Gm-Message-State: AOAM533T8bjW9JQfUpI+QXZfPFZXgXgOdA8yFskY9gN8jGjpwL1Rt5TE
 xm1/gdyPTCgyaU5EcXSNKXA=
X-Google-Smtp-Source: ABdhPJzbwex+ryg9LpRDhemVltmdQwfI6oaKvTEX7Dp179Go73CpJYXZYcOYN8rQYQA8rk/O4g1ujw==
X-Received: by 2002:a17:907:6d1f:b0:6fc:309f:8363 with SMTP id
 sa31-20020a1709076d1f00b006fc309f8363mr3370782ejc.655.1652193920050; 
 Tue, 10 May 2022 07:45:20 -0700 (PDT)
Received: from localhost.localdomain (89-38-99-188.hosted-by-worldstream.net.
 [89.38.99.188]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170906241000b006fb6d9d25bfsm829652eja.22.2022.05.10.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 07:45:19 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 0/2] Make qcom-ngd-ctrl not wait indefinitely for already
 booted ADSP
Date: Tue, 10 May 2022 18:42:17 +0400
Message-Id: <20220510144219.806391-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 May 2022 14:14:58 +0200
Cc: alsa-devel@alsa-project.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>
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

Commit a899d324863a3 ("slimbus: qcom-ngd-ctrl: add Sub System Restart support")
made qcom-ngd-ctrl wait for ADSP to become ready before starting to do its work.
Due to how the SSR notifications currently work though, if qcom-ngd-ctrl probes
after ADSP boots and becomes ready, it never receives a QCOM_SSR_AFTER_POWERUP
event notification and keeps waiting indefinitely, making SLIMbus never come up.

This series makes qcom_register_ssr_notifier call the notifier_call of the newly
registered notifier block with the last SSR event received from the remoteproc,
basically reporting the event that qcom-ngd-ctrl missed by registering late,
stopping it from waiting for an event that has already happened.

I'm not sure if this approach would have any unwanted consequences in other
drivers relying on SSR events however, hence I'm sending this as a RFC. This
can also be considered a bug report, so if anyone has a better fix then I'd
appreciate it getting applied instead of this one.

The second patch is a general fix that became necessary after the first patch,
and should likely be applied anyway.

Yassine Oudjana (2):
  remoteproc: qcom: Report last event on SSR notifier registration
  slimbus: qcom-ngd-ctrl: Initialize ngd_up_work before it can be
    scheduled

 drivers/remoteproc/qcom_common.c | 17 +++++++++++++----
 drivers/slimbus/qcom-ngd-ctrl.c  |  3 ++-
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.36.0

