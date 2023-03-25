Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0366CEEDB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26A75DF5;
	Wed, 29 Mar 2023 18:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26A75DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106178;
	bh=WA9n8a27gA8kTUJpSEshzCNiRNDsajmOjGwfhhvIo7w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V39LV7zfKfyyDmI77SvsqtIM+Csv3M1sB+ZnykgPtq1Vw9h5gnewgyrKia3LnT7Bi
	 S2cJL1a0OQ3TqxqTpZI0jIu1UyzViplmHpCpd03FddJbkvC+dxTWlIs3phKTYU/T5q
	 +QEpo5iBkO23A3e5DpkzZkPop57I0fGgYJUVCE90=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F07A8F805B3;
	Wed, 29 Mar 2023 18:06:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8FB0F802E8; Sat, 25 Mar 2023 17:36:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03865F80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 17:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03865F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R7vcO9N+
Received: by mail-pj1-x1031.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso7793404pjb.3
        for <alsa-devel@alsa-project.org>;
 Sat, 25 Mar 2023 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679762193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA9n8a27gA8kTUJpSEshzCNiRNDsajmOjGwfhhvIo7w=;
        b=R7vcO9N+gBpo9ysy7yqA67yGh+CR1pkyBnPo1ITdOV/rKZlrFnO8dDDdsQR2gaoRhT
         9EuqF+cRYaBY+2MnPgU3HEm6j5UWfsuI2sjgKDOL2roH0VGCbwthPAv3gpBp60Z1UiKA
         gOeJqDm7kEtXqCadHg3BBQleOZFnvu/Rj8HN5i2mfOAuPT6aR6ZK9g8JyogH5CowXbHG
         wSTnu1ywUp/7CLOG4JwQFjUWCzxbCzq+6SujK6N8CcfHNNDxQyo6IVFjhNZzUUn3Qgx+
         e6L1SgIb+6xaJ0AtDQ1vBW1Yo0KMHrB41pq29jYt9Z0QOlm/YJcGWP5q6dCY++GGpTY7
         Ttng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679762193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA9n8a27gA8kTUJpSEshzCNiRNDsajmOjGwfhhvIo7w=;
        b=CiVVFTEsSCXtCea6ay4GWL1XHiN5pGgQ2Dv1rWv4tRlPLcw+TMDOUw+gHt/FfKaoZU
         CA+MnSlu905DjRSr3Et9LuOdfAYpQyYyHJPcCN+tZD+2d6EUrztQp//Z9UBG6tfFwA17
         NXtpvW7hd21Vd6BPq8qzIpo4HB0BtOIKgt7bLvj+sA/Bn3vPqSrEF9uekSeDpasAqtot
         XmoXUfhfMiETJvN7/Ewk7Ztd8XXkhzSqPdu5/7jX6U6rjVCjHHuIJS04eJuMA0d8Uc8J
         vgpbGEz+yXlvk71mVDnPrclNQyG/uNvz0RNmseNTMkNr8s7/odAhV25+tRfW5G6L9H4Z
         mMqQ==
X-Gm-Message-State: AAQBX9carXXCU1l9iVIEuIgJgAk9h/jKRGQeUrVscP4mQP5tvbNtOHkN
	YPKUwLpQcrR90gmqi2+YLco=
X-Google-Smtp-Source: 
 AKy350ZHL7G2KFrTkI2HzyipXt3HsrixoT/aeQU76WAtDtWGPJbfyToTNxrcP+XsPqhU41eEzR4m9Q==
X-Received: by 2002:a17:903:41c8:b0:19a:9890:eac6 with SMTP id
 u8-20020a17090341c800b0019a9890eac6mr7538636ple.24.1679762193400;
        Sat, 25 Mar 2023 09:36:33 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:dbe7:6935:261d:5dd6])
        by smtp.gmail.com with ESMTPSA id
 ix18-20020a170902f81200b0019f1027f88bsm16178714plb.307.2023.03.25.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:36:33 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Sat, 25 Mar 2023 22:06:24 +0530
Message-Id: <20230325163624.6704-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <323401ed-3549-f45d-f9c7-c8f9f2d5c381@linaro.org>
References: <323401ed-3549-f45d-f9c7-c8f9f2d5c381@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QMVNDGQAYBLGYQF4NLR5LYAATKZCVQQV
X-Message-ID-Hash: QMVNDGQAYBLGYQF4NLR5LYAATKZCVQQV
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:06:15 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMVNDGQAYBLGYQF4NLR5LYAATKZCVQQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> Yes. That's what I also said in the beginning, but for some reason
> Saalim cut this part... and re-added subsystem maintainers.

The file was last updated a few years back and it was by Mark, so I added him as well, while the
original binding was written by Leon only, so I added him as well.

Regards,

Saalim
