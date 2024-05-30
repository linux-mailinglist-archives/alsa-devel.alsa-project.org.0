Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242138D556B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 00:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E35C826;
	Fri, 31 May 2024 00:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E35C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717108316;
	bh=Vmc9pn0t8SHEFwwZusIt/Z5iY8NxjVNNbXrLDLzxEMc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tAEeJrDZtoR8I+InDFFcTpGnXvf7pYfXFE2u7LwqA0bxM/nYYmltjLdu6xbLvuno1
	 Fep+NxWJ0c6hxh3J7Ms5q5WhN3LBLmh06yBWGLCWbdGCmmBVx6RzmVdoq85S5Wfbmj
	 Q9VuZ6TooeU8ttzBkKY3nIPviYBUgkUhlwepfv7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B72B0F8059F; Fri, 31 May 2024 00:31:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19809F8059F;
	Fri, 31 May 2024 00:31:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EE6FF80149; Fri, 31 May 2024 00:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64438F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 00:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64438F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lGbXbSEQ
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52b80e5688aso1567590e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717108256; x=1717713056;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMW/bINKVwWreJG5Uda77hVx5iRhNpQJXY1J+m7Ti0E=;
        b=lGbXbSEQW6c4Iw0yfY0HQIJ9PVLOwhNzQKfnBAizBvfYd6qkgOewDBmI0zDidUowGU
         A9+3noiTz2QEsjJeqotQQIjNesENmhR8lxPs69Tpcb9M5kpqjqj/XlgjWzYW/b6N2BK8
         UhVNQWb9rTqPVHApuQMwM+HkZVl3z3zGOj1HTwT3xLBs0kZO0FaoORTguuDZFkAyYCiV
         4XywHSx3dVdIQCEYypfSavpWEywa5Yg2xCKhx87kwM+/LGkHhensYFGOlPFE0udt7ltR
         ++O6/v221E8b03/hkkdADut4vLs3JdxI+DurqnFJTACHSTI6OxmTbJbZIouYkQG2LSGV
         OBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717108256; x=1717713056;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMW/bINKVwWreJG5Uda77hVx5iRhNpQJXY1J+m7Ti0E=;
        b=ZOT/1pzsNaphTEUgDtzca6iz5Y2LOBHf0tUfaE7nBQga32aRUtPH1TUdIvfdn38lXg
         WV6o12Aq6ccbMbEKeEbqAz34Yq1J9cY647cKQc2688bPLAegmvVXMiEhqCXCwbYL82/A
         SLdY1WjaYucZQAwsYu95ZvcV+w+ju2KEeDuoTEkqbaLXnlvQThxC6po5JzjSCAzNNANK
         EFSVK4PsymXEYWKm0lW/vt5V2oQrU8zZtTMyW22RShMeW/BRz81ZjoyzWUXbBao29+Ww
         PKds7q9FdE2pemB+vT23SXryt7RXQf34lNasqeZzeWs9k45JDgrPhd1RVirVuOrNCPgk
         A9LA==
X-Gm-Message-State: AOJu0Yzm+Jj+c3XkXtCmjuChbu4RMrmEsQBgstVBvQBUaO3Wj+1mBRQ0
	/1T7eYJLf119dmHVk/PsSubr82xwfAAH2quU+P21YzUEY6ZVC0lHzkfiL7/BwLs=
X-Google-Smtp-Source: 
 AGHT+IEoN2o4Y46zxy4lS2UJh/JfIw1oILePCDHn/50LSD5Q9DvV6GbL0jWEDOCKY16zfYeOfeZuQw==
X-Received: by 2002:ac2:5f87:0:b0:51f:4d57:6812 with SMTP id
 2adb3069b0e04-52b8954e90amr19914e87.19.1717108255905;
        Thu, 30 May 2024 15:30:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d7ff1csm110917e87.209.2024.05.30.15.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 01:30:54 +0300
Subject: [PATCH] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB3+WGYC/x3MQQqEMAxA0atI1gZaHaF6FXFR0zgTsFYbEEG8u
 2WWb/H/DcpZWGGobsh8ikraCmxdAf389mWUUAyNaT6may16TYQHpYhEuPqoEWd2hm2/OAoOSrh
 nXuT6T8fpeV5KY2Q1ZAAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Vmc9pn0t8SHEFwwZusIt/Z5iY8NxjVNNbXrLDLzxEMc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWP4ez9KNp14N2H14dXAiyVl9QQoE8Qi0T5OPg
 gRwxOIB0v6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlj+HgAKCRCLPIo+Aiko
 1QR5B/9/j6tbi+R4HIX72dF5SfTYv399dMI0W+bS2+ea8GoJJ3MGdLgS40aoOfInh06qyy+lHU4
 N3y0OoAaSBhkpfDuHzrN3yAEzm83/TyK11il5FjTsNyrQyJtJjmoxqNHEndfOiXTiyNs+TLff5t
 tSg2wGb2wXsB5MakpyTfsSDt8IvoRScapqx/N7HyV3Qgl8gxVr7IZHc4oWY95t8NZAIJob1vw7h
 URGIF1+dqV0gN5z4qqQrgChhI1xPH/WGlPw0ZKS2x3G5QGcpzPFVoI/bmqY29+cmxX/RE1eGISq
 CU/yY0DG9j7gG7T+LRBVPcVFExOk+ZkJlx3LHppZ9JVwliR2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Message-ID-Hash: V63DLHB765VF2TNKLPV3JJGZZ3QKQLWQ
X-Message-ID-Hash: V63DLHB765VF2TNKLPV3JJGZZ3QKQLWQ
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V63DLHB765VF2TNKLPV3JJGZZ3QKQLWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Not having linux-arm-msm@ in cc for audio-related changes for Qualcomm
platforms means that interested parties can easily miss the patches. Add
corresponding L: entry so that linux-arm-msm ML gets CC'ed for audio
patches too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 523d84b2d613..b9bdd1f08005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18227,6 +18227,7 @@ QCOM AUDIO (ASoC) DRIVERS
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*

---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240531-asoc-qcom-cc-lamsm-be80e19f8cd8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

