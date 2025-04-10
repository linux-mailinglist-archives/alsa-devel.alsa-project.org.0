Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B88A840E0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Apr 2025 12:38:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A686A7DA;
	Thu, 10 Apr 2025 12:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A686A7DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744281481;
	bh=wSoydyQlm6G68USoMznwRosFCC6xPTjIE05opbWT8Pc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HATM9CBWkCRygHdCMUy2e157D0hPyR878LnYeqzwv1HuPiL/7+1SQaNvoWblbccbO
	 CqGKPVWAcEOKlGi4Ijc+otPAj65Uq8HN8S5p0vIk47gxj1V/Cv01vIc7cTxu1eIuIc
	 QM/h/3BjjpFs+RIqdPVK2H6yT/3oSx5Xhk3OBpxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81481F805B1; Thu, 10 Apr 2025 12:37:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67502F805BA;
	Thu, 10 Apr 2025 12:37:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85075F8014C; Thu, 10 Apr 2025 12:37:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB868F80124
	for <alsa-devel@alsa-project.org>; Thu, 10 Apr 2025 12:37:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB868F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YhT3h1jw
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so299285f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Apr 2025 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744281442; x=1744886242;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=YhT3h1jwRvTs9oDLW7kmt+o44vyHotsc95KsmmFKilys0CwHPK1BcArv7URs2wLVM0
         lY2BsY4K39gTZYyG/rEkZTsz/bT2XI7IrNL53JgJIPAVEn/moL/GBSwzIH+9E+y4Djw9
         nD3UqaKY84wCWrN9n8Oj0ozJ8ZuOXK7XN2mwPlVIWaAvn62NmIN/XPD63ApThbZMJi0i
         0LzHUzG0jGOZdKXft0R+3P9H1jFCRJk42YSuo14gRcbgOuTsxFDEZBVwNxuis2THIBTS
         DCtlwOF1P4AcmKsT17bhnxQkbbALO4o1wGWhwLf0/8e4YdaccMvOlEKeM7zFp6tMHsPh
         c+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281442; x=1744886242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9EVV1Ec7k3TH3dY1WUPdLQRnNApCBxvvZldU2uE6sg=;
        b=RGXYz7VqqoevmX0hxPRBV6oQPdchsKNmxu7Ii3QssDMC/4tlbu20NdcLnLJj0bgSa/
         FvuKkC1Vp123xHqRld10sf90pwfXvuwk9u8hGZnZXxoJ2whoheKp+VVh+NTYuh6/3ap6
         cm6LORIEGsjBwJSfo6qojYts/nRW0ZRRNyOc8Ov40gQ8OO9QYq3X4lQGq2pxzpmBNdEj
         FSjCvLdBWfyIWdNv4kV5oDB4vpwPR+ZL426fkfxeHLatSRIg/9jdzZ4JJuWkY5E9l1LK
         8Vp4/Pqqah7B3ANDzCsRBRz5k/ApR7cd6ztp98bb2vvNeGgGObt7tzncBDY1X7rzSKa6
         bITg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZwp9D1vHIc2ADseUdlvDkzicpod0JreB7DlgheiqHmtW/FszHZusODijM5XHrl81rVMJbUs46Bpb8@alsa-project.org
X-Gm-Message-State: AOJu0Yz7jdoarTPX5sxLJ23YR1fShXSQ0nykT38pg/c1f+ElCp0Q4UOg
	5k7Mih0TPAqGTFGqRkI9H9XnS817iwBWhJzl5YcbAEgkK4Sx62JkrgwkgGPL6SM=
X-Gm-Gg: ASbGnctbM2HliYgKdu3W4XCujk5jLMMFSD+Wrf6ZL/OsEpEvgaAd9pJNLnKgnp6UWyr
	jfLz4jCbV+Fyj9fKFlnkGlRkzaS0tf6fKG+fsEUoZ19Kr+RwjgJJ0cdj5ofqgF1tVYQ4eArreBK
	QWKe/cbWp9pm90XkMSqVKFVO1YNfoImOcGdbxyvVNaiz2Rr6ZPrsC+jq7QL7pJb8WuEYSLFRnoj
	4MaLSf1luYLQR93G8/jV8toGDdiCVVnU4SJg03wsJgc7apEgR1xlHJyGTNivrtveZMp0+C0AxRe
	673JTzzmPjkuvdNPHE8hqnKu/9PikkQQg9WN9A8FYpHTc7/LGN0/Ave35ETlPB4AzQ==
X-Google-Smtp-Source: 
 AGHT+IGkeEI4UgKz0JuWqCEhtgjSvbu9U+eFmkqEWX/tS80WE+jSM4C5CfOpaNBujEMwfFmabhy3kQ==
X-Received: by 2002:a05:6000:381:b0:39c:2665:2ce7 with SMTP id
 ffacd0b85a97d-39d8f4f3461mr1543583f8f.53.1744281442157;
        Thu, 10 Apr 2025 03:37:22 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893612dbsm4309388f8f.1.2025.04.10.03.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:37:21 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	srini@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] MAINTAINERS: update my email address
Date: Thu, 10 Apr 2025 11:37:11 +0100
Message-Id: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=421;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=8qFbEEYlqyqgMAwNvBba8Rd1eK7Pf1l8so2JmRuG/RA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn959YBmrwcaStKI6QyXZvaW289Ghy10STyn4dB
 cV7Njm3f4CJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ/efWAAKCRB6of1ZxzRV
 NzEeB/9AMFa6xheHkfhJH2rJy8dCoPZI3IaOUGU9NaN3c60Me5Et0Ax0iyOwHJ3It3vhc0o8poW
 hfD7usI/odUC1plQbFinU+pFZHv7NIEHgZ24cN7pW4GgncDug8fXZRvd4OrxsX3AWrqPGqAXq0y
 FArPY086qlPKJcqkvWcyb/m3dVGIXgdNAttvIuG5MIj4MuqOP+fb4xiPU+FMzaeuGE70CQOm1F7
 dy42y95kqNBkiMltXX0/TIsbhv0KtlN7qlE0vMZxO/8mwivwppxpt+J4RiyC0j46MD0nt/NCCzU
 DWia3qVa8/rNZpWgmwHxTR676iXu2gn9sTVWqVDdJAVeap7W
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DBZQE6FC5B63NURJU3ODZXRV6BPFN3M4
X-Message-ID-Hash: DBZQE6FC5B63NURJU3ODZXRV6BPFN3M4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBZQE6FC5B63NURJU3ODZXRV6BPFN3M4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
the @linaro.org. Linaro address will stop working in few days.

Mark or Greg, could you please pick these two patches?

Srinivas Kandagatla (2):
  MAINTAINERS: use kernel.org alias
  mailmap: Add entry for Srinivas Kandagatla

 .mailmap    | 2 ++
 MAINTAINERS | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.25.1

