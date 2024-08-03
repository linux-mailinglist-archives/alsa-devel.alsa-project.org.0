Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACB946922
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 12:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF85247EF;
	Sat,  3 Aug 2024 12:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF85247EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722682096;
	bh=5AgJN5aHDblbftkEIFfXfOsOG4+a7awLLmKJqobEli0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YJWCu4vVC05Nb6qCBY3NZZbAsmUYHdOSmJZeINCQlDsrU9eIob6G4DQcZZ2rhnrZu
	 hXR2ZCdfjntWr331jGk/WB/k9QnWJ54Kf93FKnIJREZCK3HBO24AI9V9v53ZI0QgNY
	 SD0ioXyirNggywCeeVQpLeDrhFyyt0WLnBEQ710Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CC42F805FD; Sat,  3 Aug 2024 12:47:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F07A4F805FE;
	Sat,  3 Aug 2024 12:47:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D307FF8007E; Sat,  3 Aug 2024 12:44:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65619F8007E
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 12:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65619F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q7OseUAt
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5af326eddb2so6851624a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 03 Aug 2024 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722681706; x=1723286506;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8XLJ+HA0unzIKoKdtjXDUtkUVFRpH3N4K5zB2zQ6s4=;
        b=Q7OseUAtlWp6CSlXN3Mp/juxeyKDSUkJ+Uz2H61AVmj+/hek12ssn5+bQ5M51gj9NB
         WFRD4uPfvpYMgExMxECajrd4TYPBMOA0ZEPR4jExr+scZkMguD/iNVukMAQajRG6U6r8
         TJUnWYUm00v7oii0yzwZVvT/1h2kqt+PX9XjEd0v2ZzMoEdIiBqwVzXqnlErtXKnl+kM
         D3vmnmEpk9l2bFwI/ODakmDXwqsq4tJAmuDr1w7egsStuSFBkAmXYoqk82Zrgfs/8Med
         5giS9sFIglcwoGbWs/zZLnDj6DfsnA7Xz+LnjGQuvgIye/r6CP0ByQT557n+xhFnGmGn
         MI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722681706; x=1723286506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8XLJ+HA0unzIKoKdtjXDUtkUVFRpH3N4K5zB2zQ6s4=;
        b=OltdOCFJhvi1IjOM2mvuyF+oZg6MaUAGF3yMBp4aaBk804mkHpOSR0aiwn5Ubvmdlg
         LdKgLe6YiKcfXQYtNIvvXYbadtxASTtIpxBhu2htYTMCWL5GeSaoZJQ14CH/RbP7FKPb
         gr0KqQKlOxEs+tOJ1lwxoaJ0DKIl39BwObW1tL/ScJttGQhKgtuu3KUg7WH1O7bF3ySr
         FGoOe02cLYSay5KEiMDOpqBcUfA6q8RWLEi3HDriVr2ncymw+2QukxHgh7mjgfF6QM+Z
         zFgHzbePwpNUtA7zLYgWB+ErEjklA4f0H5CPFKt/qrtsexwBHwqFvSP+Ti2CkbIZFaVG
         Yb+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsyMU2iUmkIdfkhZypwQF02tuQ679r9QL2npSakCW2M2Nv6ZElNgOGAL7RUODakSwDn+zB479iI1w9/3I+rmP3ZAHVnnida2d1RTA=
X-Gm-Message-State: AOJu0YzjVe7NnII9fiW+OTMYwvWHnOdHb9LHVPX8EKxF+Wn6K3/UnR6h
	wqyv6ndlxVrTsIKgZgHc75Am5quBzHF9VbA7UUJxI6YJ2LamRz8QkN0xgzqUwfg=
X-Google-Smtp-Source: 
 AGHT+IHvt7AU+zU7xwu3ztuEExFnHw0l6EN0M9aJEJT/i5CZBMm1ydae3AJtvueqBZdlyT6zILCzIg==
X-Received: by 2002:a17:907:9689:b0:a7a:81ba:8eb3 with SMTP id
 a640c23a62f3a-a7dbe630868mr712622766b.27.1722681705810;
        Sat, 03 Aug 2024 03:41:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e7feecsm202086366b.176.2024.08.03.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 03:41:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 03 Aug 2024 13:41:40 +0300
Subject: [PATCH 1/2] ASoC: codecs: lpass-macro: fix version strings
 returned for 1.x codecs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240803-codec-version-v1-1-bc29baa5e417@linaro.org>
References: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
In-Reply-To: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5AgJN5aHDblbftkEIFfXfOsOG4+a7awLLmKJqobEli0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrglmLHOXtJFkuzvtwm4NKEq4/Mw0jlQEd65rl
 co+5GQLEJmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq4JZgAKCRCLPIo+Aiko
 1VFGCACvWH4yrjqDg8O8sGmAjvsoB7gb1LhWyK1QKUHycyeWlFzFIe+RQMGDqrWahB7sI+3kVCV
 o57BPiJmwj3QT9WRDwqaRt/N35ws7e8rmLeg33I2mVe2aimoKjenIQsiU31f82e9oxyfAxriF3z
 cgsdqXUiubsimZUB6bNQUtCWDWBdAW3kHD98O6eAV+fN/70yoCp13O+sLh2eIFwI85BQJHpBBLv
 MZCkKSIfQTFcPQNq4IqtffQt7+o++ReYgL39jsSq+mHzj7ACmXa5yG0OsCRrxVZY9/u8DmSqmnL
 na6rBtue7cMa1CdXkfliOOOhjaofxxnj2TiuNvFgW0bqyb2K
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Message-ID-Hash: 6H2KSKMWWSQM5O7SDOUBYVHRPM7H46G2
X-Message-ID-Hash: 6H2KSKMWWSQM5O7SDOUBYVHRPM7H46G2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H2KSKMWWSQM5O7SDOUBYVHRPM7H46G2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing cases to lpass_macro_get_codec_version_string() to let it
print the correct codec version for 1.x codec platforms.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 21cb30ab706d..fb4b96cb2b23 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -49,6 +49,12 @@ static inline void lpass_macro_pds_exit_action(void *pds)
 static inline const char *lpass_macro_get_codec_version_string(int version)
 {
 	switch (version) {
+	case LPASS_CODEC_VERSION_1_0:
+		return "v1.0";
+	case LPASS_CODEC_VERSION_1_1:
+		return "v1.1";
+	case LPASS_CODEC_VERSION_1_2:
+		return "v1.2";
 	case LPASS_CODEC_VERSION_2_0:
 		return "v2.0";
 	case LPASS_CODEC_VERSION_2_1:

-- 
2.39.2

