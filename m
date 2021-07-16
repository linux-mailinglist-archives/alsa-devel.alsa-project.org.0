Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB493CB5FB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 12:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839FD1684;
	Fri, 16 Jul 2021 12:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839FD1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626431046;
	bh=u6pTqJtRQc+07hQpdT9SemJSmn2+X4cloH2FkYIkL9s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=huo5zdJhmILjGNNkJrD/vbzPRyWvSJVRyNzr0nScbQaffz2Y7M5ih8a7xwrBdYV9f
	 th0LjoWlaEAAqBujMveb4BADLa5/S08M/1QfKf7tgqGCvfOeMp3omL80ybTlspFXiz
	 gPTCQA2yc2VNuMjdye2yY+ALcbYZT5tjhmEDuYPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D741AF802E0;
	Fri, 16 Jul 2021 12:22:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 233A4F8025B; Fri, 16 Jul 2021 12:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2443F8013C
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 12:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2443F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AWkE/523"
Received: by mail-wm1-x32b.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so7878647wmi.2
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LPLjK0/F2QBKjF46wFtmvCRgoQO/Uosrsnmy5GRIu/8=;
 b=AWkE/523G18vB7RHC1qa30lulwYkMTm7IbLwlGpft2WNWQikypRT/cgwCl8b1IKHIA
 4gjTdpjLA0ITiCGPqEciGnQqSQAwVmGRVNU3Z12kbzJZXyuHDtLsz60Xp7zQniRHufWa
 9SnyevkCf/LB8umJnVbhbsXx9KMJyzZ8KLmIVV1fwMwvnWbpD7PCfThTIaRbUy3DHBk+
 NvdyY7/1K94Ju1x4AOJAh9SKIOokv+B8ONdmJu12NRhV2SE3rM4ld8f5e8+SGuNMhHR3
 jbsAaLdmOcqcK7BHjPp+ShUCb5q5AZ/dwH3mad8pe8TsVXHZ1lFEQSoPmVFZCvhJtQPn
 oDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LPLjK0/F2QBKjF46wFtmvCRgoQO/Uosrsnmy5GRIu/8=;
 b=QBRzWVpyHFwYuT3HVYjSvy8PvHK4tvBhgIkOSw9DHk1JmojX3969F181B3VuGZCOwS
 2Xi70+0DAEmaO+pEotPc0njKGhNpfP+goyAvDeTBdAi1AqtQ7rYUm+/1JoBh6E96bWt5
 kD6suWhgqZulJ+tM0y7PfR5Qp+4z5QLCmn4W0fXrhPg1z3LGKORKfqvVx4HOY04EPzkl
 BlL3R2qdvf0r3Bk/xymNlD2WSozhpoa8rBXA/Au2rXEHZWQcj/gRF3ECkhcN3b/kHarR
 Ao0+Ke11SDN0CaWPelBtLZUcQkBIGxqi8urT/D0VhEg6WPj8DiAgF3AU+uj3SIXKWShX
 E18A==
X-Gm-Message-State: AOAM532mvdE+QL4l3WnQaC15S7uoVzwpwchvinAJ8MnE2RRvhX3iUKum
 DIbBDA7L4gfJQ6rAItPmCA1jog==
X-Google-Smtp-Source: ABdhPJypvjrsZvABpnRr0qCx3Bp670YdaFauU8/HiRQm0vjzicd1v3nn5OFLoV7JZmT6HQYOSjU5eA==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr9666333wmq.72.1626430955528; 
 Fri, 16 Jul 2021 03:22:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g15sm7421796wmh.44.2021.07.16.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:22:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: srini@kernel.org
Subject: [PATCH 0/4] slimbus: ngd: fix runtime pm issues.
Date: Fri, 16 Jul 2021 11:21:19 +0100
Message-Id: <20210716102123.26861-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

This patchset fixes various runtime pm issues while testing pm runtime
on NGD slimbus controller.

During testing it was found that pm refcount was going negative and sometime
transactions are timeout after suspend resume.

These 4 patches fixes those issues and now NGD enters in supend state
and resumes properly without any data timeouts.

Thanks,
srini

Srinivas Kandagatla (4):
  slimbus: messaging: start transaction ids from 1 instead of zero
  slimbus: messaging: check for valid transaction id
  slimbus: ngd: set correct device for pm
  slimbus: ngd: reset dma setup during runtime pm

 drivers/slimbus/messaging.c     |  7 ++++---
 drivers/slimbus/qcom-ngd-ctrl.c | 22 +++++++++++++---------
 2 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.21.0

