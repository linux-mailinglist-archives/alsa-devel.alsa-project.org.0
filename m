Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD9906A6E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 12:50:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47D94E0D;
	Thu, 13 Jun 2024 12:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47D94E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718275824;
	bh=+l6WJNOuxbQP3zRP70rVUTm7ts1MNeRlz6RusiQ+0No=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uBtGoq6vB+HeIMnFbe7/X0IYgZ9RJ8qubaSA/NmMNQgZMPI7BOjkMzvwPGkRUptFI
	 zY2s8eRkxXq5K5obfRfC8u9wotbpYT33i9B/7vWOtBzXLOGYPtjIWH9VTV2EG5pECA
	 W6oTIRqquodaFCSfx0NXuMb7GoPXlEeOapkq8EOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E809F805C0; Thu, 13 Jun 2024 12:49:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5F8F805B4;
	Thu, 13 Jun 2024 12:49:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58651F80580; Thu, 13 Jun 2024 12:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96787F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 12:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96787F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I3oFcdoe
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57c73a3b3d7so763207a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718275781; x=1718880581;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UgbuPMjPxJhzEz9I4WN0wVps4ls2iJnyduYLx7mBuMk=;
        b=I3oFcdoeH2MBYosaiwk7ulynrhHMKBmnJnTWC6qfCPrj9aRhM6b3PeHHDxHDJEDC+z
         95YV46Ymon8aU64quXunMJWN9q3ymJhiM0gTU4CbcufBY3WtaBy1deVoGGXnCxqtMO7i
         2FcGHI8q72chdMcDT88u9fGEQSV5pcYwLzpC7sEmRVrvJr2QKT6Zcocq+lhFMraJksCB
         ZRyca//NnX/C6qX3aEIq+PluEEf2SYBT12UyyERcX84XblBkhcGUwd1DeWFg8haKAiD4
         QtGA4PdjdLyGA3wHmwfySloi/Xs6UmNImo92jc+R2YFMSMzNZczWJCagUsNNSR8j4eEB
         5Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718275781; x=1718880581;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgbuPMjPxJhzEz9I4WN0wVps4ls2iJnyduYLx7mBuMk=;
        b=UAtxjmWROusWzfqzk4YhmC+3N+wtwhXfmYxmlRdZ6vWrBO0hqMStRJQVcxrp+TTI7a
         YjDMR6kBymVLm5F//AmoCQU2wMvnSD9gfnUsKi4Ik6c8R5tJqjrGFLU7girDegnuMisX
         U/AHjUBMUgrN1yl9CiXb1msh0QfxW30skxLa4QUkSXud1cUuFirrl7+5lwJpHxnvAyPX
         xM15XAERrMCpyN8CJDA3cPAbPcQSQzNa/RmRFHFLiT5MDkUFoDqNl3pU5bx9DOGbil21
         0wwyJKEfaaOSojRNPVX3GNzxnDez4nTl3dRMUGQItJc6G+XnXoYNW4qh3P2+GGAF6sYo
         V9pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgUaTge0dy9O72dz0UkDxO+r1Rf/dPT2Wb8RHDuSuEEOd2FBcmABJEYRGex1ZsWxobsDLcmv/c2eKMP0IdvPM64VX2CeVAoecVmQA=
X-Gm-Message-State: AOJu0YywytpJIXmETlPvp5ePBmdAV6Hi/Dxc0O2THmpS/mm7OeTnjaU9
	loBtORVRsW5hm7WGi972GxvBzfUOymovgeqjqKGS33IrZiThP/o9vApExdU+KHw=
X-Google-Smtp-Source: 
 AGHT+IFHwP8nwev4WWa/7FwbekEhqhyDaz1iRXFB4BQJtqM6vA4I61TqsPRsq0r9s+LAnXChHJ1QBA==
X-Received: by 2002:a50:9b11:0:b0:57c:6021:f198 with SMTP id
 4fb4d7f45d1cf-57caaac819dmr2501275a12.36.1718275781030;
        Thu, 13 Jun 2024 03:49:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdf2bsm762618a12.17.2024.06.13.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:49:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 0/3] ASoC: codecs: lpass: add support for v2.5 rx macro
Date: Thu, 13 Jun 2024 11:49:30 +0100
Message-Id: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrOamYC/3WNQQ6CMBBFr2K6dkxbsQZX3sOwGMoATZCSGdJoC
 He3Ze/y/Z+XtykhDiTqcdoUUwoS4pyhOp+UH3EeCEKXWVltK+2MhWlBEfCxIw/J3qCi2mlsO+d
 Mr7LVohC0jLMfi/dGWYnLsTD14XOkXk3mMcga+XuUkynr/0gyoKHuy2nQXO/6OYUZOV4iD6rZ9
 /0H83fv6cgAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=+l6WJNOuxbQP3zRP70rVUTm7ts1MNeRlz6RusiQ+0No=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmas7Dqes4b90n0wAJkFEiLP+ISbj5qrO7qZFVy
 WCXQYnRsVqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmrOwwAKCRB6of1ZxzRV
 N+oaB/9yL3y1fzKJc2j4DPoJNV4R9zOBp/18qduXWCqt6vRhcOGh+48/XrxiM2vqlkq4ohqipIc
 2qWwoEFzQIe07WX+L4EVnd9CaphcacorM5ZsNQO9dXy+YsxqBNubEPQFbwq0JJovae4egl0bXi6
 oJ/fskYTyd6UjBEk8Qs5z7oetkxKVZEPWW0dd8YE+m+ONmHIpsT7PAw+tPnmQ0efhJeBpxSyr+x
 tHzzgOqNY1HkjjQWAL3FJNHr9L83zX6oYaox1S5OWJ0CgtonsefcWToEZzElbeLhufzHq8DbyIC
 mjoAEtUGTAHCpK7IzZz612M4Ambnl3xEeEACcntGTRXuApmk
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: JCX7VDF25Y7G5VBYLBHXKJ233VU3D4PV
X-Message-ID-Hash: JCX7VDF25Y7G5VBYLBHXKJ233VU3D4PV
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCX7VDF25Y7G5VBYLBHXKJ233VU3D4PV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds support to reading codec version and also adds
support for v2.5 codec version in rx macro. 

LPASS 2.5 and up versions have changes in some of the rx blocks which
are required to get headset functional correctly.

Tested this on SM8450, X13s and x1e80100 crd.

This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.

@Neil Armstrong  can you pl test it on sm8650

@Krzysztof Kozlowski can you pl test it on sm8550

Thanks,
Srini

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v3:
- moved dev_info to dev_dbg to print codec version.
- added explicit cases for codec version checks instead of using
range
- changed err handling.
- Link to v1: https://lore.kernel.org/r/20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org

---
Srinivas Kandagatla (3):
      ASoC: codecs: lpass-macro: add helpers to get codec version
      ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      ASoC: codec: lpass-rx-macro: add support for 2.5 codec version

 sound/soc/codecs/lpass-macro-common.c |  23 ++
 sound/soc/codecs/lpass-macro-common.h |  35 ++
 sound/soc/codecs/lpass-rx-macro.c     | 595 +++++++++++++++++++++++++---------
 sound/soc/codecs/lpass-va-macro.c     |  28 ++
 4 files changed, 528 insertions(+), 153 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240612-lpass-codec-v25-4e960abd661f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

