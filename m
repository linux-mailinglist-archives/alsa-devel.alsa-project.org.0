Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F46CEF17
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675BE3E8;
	Wed, 29 Mar 2023 18:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675BE3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106676;
	bh=FVfqXcdff5sBvdoyudvkSG88Q0WNyPL7PXC0W5JT+Co=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W0TG0z+2wm5ZMAxdpQWwx4US8Bmrod2jB60wJPAEtgZo82H5/EmhJvDkQ5oUcvKau
	 yhmPX6F1QrXmbfCfZBaLKSQgFFwPhP9ehH9a8iPDPBvmiuxl0DZ0L7QIHk1LEUjQww
	 WQpmM397uleHk5rN1/CinoBBnSogBko3o+uDTA6Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8504F805AF;
	Wed, 29 Mar 2023 18:14:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A347F80272; Tue, 28 Mar 2023 11:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4A7FF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4A7FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LKOmLEjZ
Received: by mail-pj1-x102b.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso11823128pjb.2
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 02:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679994578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVfqXcdff5sBvdoyudvkSG88Q0WNyPL7PXC0W5JT+Co=;
        b=LKOmLEjZIV8d97qPCsmMqm7Epg1lJIHl+exvXBLuo3YVfxrURYCobgqzJNOUcet/W0
         qd2BkY+m3hkSrYPsOvvM4tEp78FB4/ylIUiIgv+ZAuDPTPO7QFa6oXZD6102kWJU555n
         ZNw4tLosmcq+A2zQBA+QJYDdsxK2ZmMGWcVP9BxDT+M+YlwbxpL14D04xMJmKuliIH5W
         G4a1Xpq2St4UPtuShaaKaYpIMxKSweA74ukkrHhp8Llx/QOFi9jbERcyK+3Ahm6GaThw
         RPNF0/diyk6HtrcbW9nJ9uT3svmhebYhwWQelZ3CPK/NnQaW4secdvhd22pPp1Zj4N5r
         uN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVfqXcdff5sBvdoyudvkSG88Q0WNyPL7PXC0W5JT+Co=;
        b=TabEPESzMJoEA4X0VsrbLqCo6J1y2wguTTEqU3Wx7Tmq7qxL6wZg6bYpVk/w+m2Csm
         Xvbvq37Ps+X5xwqiXoKRyfnWWk8QuV56BSc5lsy2wvtSaPuZRi0q8eTroII3iv3uchHv
         OSG6btlA2ThHE4EgrwtYplFPZw7iVrl+5AaWAOxaz15R+gYMiOn4mR1J6q00oJG6Xca4
         NHDl65d3CbTnZ3PfLiWC5sr8LP9HG9GRWguJNQ3fIg5dHuV+vPO7pRHAcuY3mZwQaOUk
         D2ZcZnVTb0oVvFPz4S+DYF/2kyXr4kOeF0zXv6s/7R1hjtmq/IN6onDTH0IXbEaj3lgt
         mBzA==
X-Gm-Message-State: AAQBX9c36k+VtwsKF4wODahAgNd+X89Q7PeS6Ba4ZQqO5MqMGeYH05Ns
	9pZx6087lG0i+bnxJX2BArw=
X-Google-Smtp-Source: 
 AKy350aCLmIqn5fOD3rMtd2U59Wt0WKO0kRHUFDjn/CxdhlzZx47warIbtGER/yadRtEtD+rGk3zXA==
X-Received: by 2002:a17:902:d4c6:b0:1a1:cc5a:b07 with SMTP id
 o6-20020a170902d4c600b001a1cc5a0b07mr17809434plg.37.1679994577807;
        Tue, 28 Mar 2023 02:09:37 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 jk17-20020a170903331100b0019e88453492sm20742412plb.4.2023.03.28.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:09:37 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Tue, 28 Mar 2023 14:39:32 +0530
Message-Id: <20230328090932.55409-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0824738d-d431-bb4a-16d8-e4e4064969c5@linaro.org>
References: <0824738d-d431-bb4a-16d8-e4e4064969c5@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YVZUPWCI5UDQFNGXTBLNEDZPSSMOEC3X
X-Message-ID-Hash: YVZUPWCI5UDQFNGXTBLNEDZPSSMOEC3X
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:32 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, leon@leon.nu, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, leon@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVZUPWCI5UDQFNGXTBLNEDZPSSMOEC3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> git format-patch -1 -5
> scripts/get_maintainer.pl v5-*
> and you will get a bit different results.

There was a new entry this time, while the rest of the output was same.
Leon Romanovsky <leon@kernel.org> (in file)

I added him as a CC here

Thank you,

Saalim
