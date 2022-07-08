Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F141456B53A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 11:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8014383D;
	Fri,  8 Jul 2022 11:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8014383D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657272061;
	bh=+XnC6mH2xU2puz85ApIytLF1JvPBN175Ekj2sfUrz/4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FOOoHuiRN2lq/dxS77V1UzNB01HedEkKoBeRRhSQsrn3SXidkMCJmyQYBTKJ11GG2
	 I5ONGnZT/xvQcGWThvpja7qnTDLh+/L41L5rbznueosC5OGBegZ9vWjAfSBiHQglXR
	 JkPxrv5JKZrMmNc9MLln8pv1G34Kp+KGsHkuHvHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99F6F80084;
	Fri,  8 Jul 2022 11:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75671F80167; Fri,  8 Jul 2022 11:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35376F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 11:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35376F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SHTU0z8s"
Received: by mail-wr1-x435.google.com with SMTP id d16so23361673wrv.10
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PptGorTxjueK0BkpVkd4NY/mKFPaLMQm6cTbjHqcrCE=;
 b=SHTU0z8s/x67zbarXNuW2mDWM561kcaRaygDJ4oSRjSCV/zaKc5TJOgOCQlLwBgdBf
 4sOUniqCTUuXD/7qNpEfcogaZljao5lviAo86VkoMi8Viag4HamiRVhuMSENoiJurKF7
 Hum7JIYIi3tW6qk9RvKYHtIG/HA3X6BVpfEGKXpkbYbq7HCqXXhXviSOWouZCyRG23rc
 LJKOg2Or9BSYPHf2Rl7X5udN8yEED8Q4eZBtgrUwAUkcio0Wc+9mfruLAivgIekd/D1c
 fLsw6HkFPY8vuhYrrso+xSK5FFrTTz71qE2kevQptWyNF3iiRSyw1VDUmQMo2R19XEBo
 QnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PptGorTxjueK0BkpVkd4NY/mKFPaLMQm6cTbjHqcrCE=;
 b=DxKKiBLmdOcVzgqLmbz7ZluLJ2CY+C+nRkZj1H2+MSQ8MXnKt1nvHMHbVRmngjhVgx
 GlYknNfCcr9KJ3BN3+f9Cw+s1qhvf49+fMAtFq3TEdumZF3iAaixTDlHjvkQlqMSvg1S
 C/2dZMvolS6egXxiugxM1DZubzhmRZ0MVEkSNW6Ezd7CdPoE6DUleNEagkrbmiuUrgSs
 XWurHo17oL4bx0Yk1P+3zNQ3+kfCbYRC0uEQnaf6un4Z90PgEEJuI1p7jKi861/7n2mt
 XvQYdKkDo/9RNK13uqfNNPPnR/+vYzJ3nHjgrdI5p0hjlyGT7tK178wEwlNLyAenXMhQ
 iQpg==
X-Gm-Message-State: AJIora8+JrrAwG07FpQOMr1d9C3g+X+Phf+zOrCxPRTlXeywbvJH5wQh
 vDFUrv8Zex1kWdlx8JtKnimkmQ==
X-Google-Smtp-Source: AGRyM1uWv/iV+kj/F3IZZvcq3KKQwo17/HCdoCPv6stWzqiggs21mnV4sgPoJvMFYTSDJUxj4Cs/Sg==
X-Received: by 2002:a5d:4d0b:0:b0:21d:819e:5765 with SMTP id
 z11-20020a5d4d0b000000b0021d819e5765mr2271137wrt.232.1657271990382; 
 Fri, 08 Jul 2022 02:19:50 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 ba15-20020a0560001c0f00b0021bae66362esm37943490wrb.58.2022.07.08.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 02:19:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: fix max auto-enumeration devices
Date: Fri,  8 Jul 2022 10:19:47 +0100
Message-Id: <20220708091947.5610-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 yung-chuan.liao@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>
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

Controller only supports up to max of 1-11 device ids via auto-enumeration,
and it has only those many registers.

In the existing code, we can protentially cross this boundary and read incorrect
registers.

Cc: stable@vger.kernel.org
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Thanks to Dan for reporting an overflow issue, which turned out to be
another issue, where we could read registers that do not belong to
auto-enumeration devid.
Either way this fixes both issues, one reported by Dan and other
incorrect register access.

Thanks,
Srini

 drivers/soundwire/qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9df970eeca45..dd1365a44458 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -119,6 +119,8 @@
 #define MAX_FIFO_RD_RETRY 3
 #define SWR_OVERFLOW_RETRY_COUNT 30
 #define SWRM_LINK_STATUS_RETRY_CNT 100
+/* devid 1 - 11 */
+#define SWRM_MAX_AUTO_ENUM_DEVICES	11
 
 enum {
 	MASTER_ID_WSA = 1,
@@ -479,7 +481,7 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 	int i;
 	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
 
-	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
+	for (i = 1; i <= SWRM_MAX_AUTO_ENUM_DEVICES; i++) {
 		/* do not continue if the status is Not Present  */
 		if (!ctrl->status[i])
 			continue;
-- 
2.25.1

