Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F06E606B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8C3E7B;
	Tue, 18 Apr 2023 13:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8C3E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818792;
	bh=ac4/gKT5b6/9noaaMeqV09+9MVanu6JqxbGBWbuNNtw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lE6JLsuAnS5o712U2oDu+W9OyvGCDi4apapnHXlZExeC/gMr5KFcuSfVHdp5MPys1
	 p9zIDpqC6a02DxxVESqx3HkK+X0lIf8EJBI4HJITE8Yyep/0MKi+5jLbzMSK4K/3ie
	 MvNVtjWrPRnS+orCd8pQKlOuWP7f9ontCFdOMmbo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8CBBF804FC;
	Tue, 18 Apr 2023 13:51:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE38F8032B; Sat, 15 Apr 2023 22:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF5D4F800E5
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 22:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5D4F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=pnICfcRM
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b7588006cso429554b3a.3
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Apr 2023 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681589581; x=1684181581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ac4/gKT5b6/9noaaMeqV09+9MVanu6JqxbGBWbuNNtw=;
        b=pnICfcRMC5zJW6zd7L5SIzJmxGA0+FF4/T5vl51mB4zb0osPEA2/WFwZfE5RS0yBh/
         GqA8se5FnzIbLPqtSA4LUi/hmtRI/nrqVdAJT+S4O7O6bK37IWv9ZBvgvse9C+YeVqEo
         l4QAaVgFhRY1/i86dM1I7lZzC16Eqg7rrynnarRsP+OGvjEALlcoN7iBoBhoZz2WK8lx
         5sYsguCOuUDIxrURqo1T7NOwh2eyAymmYVb0d/NiYgTN0l+QOiXaEYKLLqm/8pe8Y2zl
         vnm2T22MolSYytmyUn+Mm8td5hi6yMYBRXyY5TNeYI9Zl3b3VmS1PGoLNDgl7iOAX0GJ
         P+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681589581; x=1684181581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ac4/gKT5b6/9noaaMeqV09+9MVanu6JqxbGBWbuNNtw=;
        b=F+p6X6mdZHSU8q7HoBQIGyRfhNp2tGv6+jbd5kOoXMl3tUK4WqwijlzCybw0/ezXp8
         vXTBVMsXXQCRmQ8k2gicVCJGl0Ik6fEq5pNtILy1zNATzVBKio3rwLnJ6Sd+oOjkYoaY
         VN44Iz1tMjx9/lqUhNxIvTMIT+MoVu9/cNLQj9nmqBYJq+Hul/DxG3aPk4DdzR9GSA8r
         sIgjsHcwuRxAiEJ0qSwJtMpQ3aTAU5c4BqhX/e/m+BDseJAwaiiG/FX1IaGzle36kgQA
         msU4Sr/AOP0jrcH2N3TSEX6J3KenH/D9IFjWxfxg6an5PJWK2YSSF6Rv+Jox7PLi9DEH
         /tiw==
X-Gm-Message-State: AAQBX9e04CS07Z8s0U5hpsWyDjDxTG7h2/pW5vcjfl9BSsWKu7uXI/F7
	zMNQc7fJSh9urwRcdsqyPaU=
X-Google-Smtp-Source: 
 AKy350aTASezSjdDMkmYoTpUTGQAoa9iIV+w98sIMwNqUN9M6lufnA0E4sPt38Ew7iNabsq/kmWLxg==
X-Received: by 2002:a05:6a00:1a13:b0:63b:7954:9881 with SMTP id
 g19-20020a056a001a1300b0063b79549881mr6274176pfv.28.1681589580927;
        Sat, 15 Apr 2023 13:13:00 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:218d:82:ae97:7cb6:b12a:54f5])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a62fb18000000b0062de9ef6915sm4926228pfm.216.2023.04.15.13.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 13:12:59 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Date: Sat, 15 Apr 2023 20:12:46 +0000
Message-Id: <20230415201246.1200683-1-danascape@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <5d629ff3-c5ae-bd00-e70d-8c0d58365ce3@linaro.org>
References: <5d629ff3-c5ae-bd00-e70d-8c0d58365ce3@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UZZXVKVRAZOTLOPM2LC2WFTXPIMRH76P
X-Message-ID-Hash: UZZXVKVRAZOTLOPM2LC2WFTXPIMRH76P
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:51:29 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZZXVKVRAZOTLOPM2LC2WFTXPIMRH76P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> You choose unusual bindings to convert to DT schema. It is fine but
> honestly, less useful, with limited impact. This is an old, 12 year old
> binding without users. Maybe it would be even removed by now...
> I suggest converting ones which have a real impact - have users in DTS.
> Otherwise you will be putting quite a lot of effort for no real gains...
> because what is the difference between this binding being TXT and DT schema?

I am converting these bindings as part of my GSoC project where I need to convert
as many files as possible during the given tenure, I am slowly trying to read files
in other subsystems too and will push patches for other subsystems too.
Is it fine?

About the part where you suggested to convert the txt into a single YAML, shall I
continue working on them? As I can see Mark merged the previous 2 patches to linux-next

Kind Regards,

Saalim
