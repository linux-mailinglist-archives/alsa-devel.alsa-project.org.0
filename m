Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D26CEF18
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E703E7F1;
	Wed, 29 Mar 2023 18:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E703E7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106697;
	bh=jjKR43VbxeR7vdHwFcvHmBUKzkYBjIRkKu1UHdiheSM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LDJQ5G9uFb57bU+iTwuQCOVXtw/UrZtY40bJvjk0dlMwjgnDQ4NLKmjVt9LapaGTK
	 p8slPapb63r1ex6VRb306MPRYbCevirClZ7ZnsT8KmFOBbN+tUeojx5GH3LMxMvCvR
	 /YPRIEPQkbNSZCXAPtrMXrFG0lcB4he6vmBVP4cY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EBBDF805B6;
	Wed, 29 Mar 2023 18:14:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C14F80272; Tue, 28 Mar 2023 11:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45309F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45309F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FW4A2VOt
Received: by mail-pj1-x1029.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so11855064pjb.0
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679994770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjKR43VbxeR7vdHwFcvHmBUKzkYBjIRkKu1UHdiheSM=;
        b=FW4A2VOtVLGB0GxGIpIY3w5FcfxKXpaKm9zZWes6oXETZ1Epy3EqFOapKSWtc03XRp
         Nbs4C3Fn9ASNoTnQo//kJC+fapwD1zhzxTvOkFmfqP4gO7DvH7fdcMxsKESPbdmxV2yF
         9Vn2EjISi/CPLefbLUUSJZJYYPagsd7YWxDkspmnXvRnnQmR+tSfHsnWELSapRPgY7fs
         qU8lk9lf6sjtSQ/08zjSk6+xQUBWf4KNVrB9Z01oNwAISIVxIoSVMkPIjBufOFozsmdr
         N+TRZXahoHMDMVv/iztmaXcyXfg6pQ4bA3J7chLrZIBTV/nYgaRp40xj2AUXDeOi53VR
         RhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjKR43VbxeR7vdHwFcvHmBUKzkYBjIRkKu1UHdiheSM=;
        b=hAcSctf+v3TKHUVljs/biZ34j5iBOYwu8N6P91EoPoBTBH5rHlKRXx0/qzjiAGzGpf
         iPs5xH/54jGIMbY/XpZ/5Yl6d/Kf++U21hGPJeH7Gg1Ay5dAmlzFw0dpLwM+kDFvDftC
         aYtZN7DBR19VVA9OwtD9bnHwkk8kz5kumAVKTjXzA4jljZrka/EClgToxdPFXNKzg3XG
         GIKVeUpwMro4Tm87nFabsrjmCQ97FF9Wdx3pDlHiEiQe69vpXkqYmpLpS5gDgboWq0al
         +BpJRVsV1fE7K5VHQZ8YUkJmPmXreiFbSncTGirOvIjoLMj7aRKvFdLEPbXhJpkHDTdq
         BbTA==
X-Gm-Message-State: AAQBX9erc297oJvWZINHadcwx4OFL7FO/CnYGuSFhifmg4+nvN4qdWqF
	ex3jR2EoBj35Av/tf54llpY=
X-Google-Smtp-Source: 
 AKy350ZnG1nPIqKzV4bdSTUU92pL8qU8Qm37Z9EZyLIrdFyr754Yefs+tuvZw9kridOxb3Ym7rpsNg==
X-Received: by 2002:a17:902:facd:b0:19e:e001:6a75 with SMTP id
 ld13-20020a170902facd00b0019ee0016a75mr14183248plb.6.1679994770593;
        Tue, 28 Mar 2023 02:12:50 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:db37:2c9f:dcb8:89a9])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b00198d7b52eefsm20531796plk.257.2023.03.28.02.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:12:50 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Tue, 28 Mar 2023 14:42:45 +0530
Message-Id: <20230328091245.55484-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <992c64c5-48f8-e267-283d-51a57f238433@linaro.org>
References: <992c64c5-48f8-e267-283d-51a57f238433@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KOHEZWDPBTR6DVCFUHZ3DXKFC5ZM7Y72
X-Message-ID-Hash: KOHEZWDPBTR6DVCFUHZ3DXKFC5ZM7Y72
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:32 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOHEZWDPBTR6DVCFUHZ3DXKFC5ZM7Y72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I apologise, I will keep this in mind from now on and will avoid it in future.
I will send the finaly patch, fixing the schema format.

Apologies,

Saalim
