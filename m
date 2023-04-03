Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC886D7511
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8F1206;
	Wed,  5 Apr 2023 09:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8F1206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680678932;
	bh=jyhim17DbKVD5JSPrhqsajxFS6s8H9DsF37Jtb6iGUw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYz0dOg7JDqd/wSHQxt5sfp0bx+4ZXmR6IJmrxKuAnRdb4jCIDw5OOnooboVogl8X
	 vEbjv4Na+2W6X+ZwqJ5c0RG2lDsjGAIo6yt2uvnMO2Nb9pttI8u05Nr0vyMFMUSpuN
	 1s1+vxUUMFRek6LNnmVzBPwFUsWpcjT0FqFetCGY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0277CF80249;
	Wed,  5 Apr 2023 09:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09147F8024C; Mon,  3 Apr 2023 17:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E14FF80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E14FF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L4VxjwPU
Received: by mail-pj1-x1031.google.com with SMTP id j13so27647968pjd.1
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680537215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKTF0BmFIUa1JLXsVVVzhQGo7yEP1rvtiF0Y9gWPb8E=;
        b=L4VxjwPUo8WCU577qZCEQZ7pu6p8oNyJGyxXFOTQp5zmHJ40pDDjUEWoZvAFMWr3iX
         IXhsmBYVV4AdZ1cCtSkSWqJbLDs0AYskwC+ekhf21MUBcTOHuyPYrHcUXA2uXYDB5VLI
         trNo/Qfe4l+xU8uJgND9oZ3yEEMd2JspaHiZOhBGkcsi9V/KmMJ1CmtZMpBAIUkrq+iU
         BpkttpS2Olw6pBXHactkL2p/xlyok4F6o1qBgQSB1Ti89oxE60tG9NIKtO66/As7KtUU
         a/9x63J7LoTUlrOlRWk8UnWqN0ukskoztPWhRVb3NA+K1l5PphKlLWGGrGHrSrQIxCya
         UspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKTF0BmFIUa1JLXsVVVzhQGo7yEP1rvtiF0Y9gWPb8E=;
        b=6MnQAzgwZ3zq4jSpv+qvC2GAIedOOkQYk6UCUxoZ6c12C/Hr1WCnmtDqq1NVtbzeQs
         asC6Ulw//05wN2SZqC7Qits734YOQXVVrBkvkpNRZtQA+D3mRVrAqr5BV0Cfwuy2165X
         VhsNGvSKX6umghe2EH2WyFdkLtF+FOlUNiEhy1tgQdI1nGr7U2IO5O3cb+BMzdl6IQ/F
         LP4VxtoDgYUdePVe1ae0DIMKBmD85WqhkMEW29rWtHEVyCHF/1byWOLJwIXSI2k4qB36
         +bYGEP2wKDEnkAWoKr8sQL3jhVHD96YT1Na0AF5X+dOqmXAsJ3oojTW/EJ/amCGlTpR6
         u4dw==
X-Gm-Message-State: AAQBX9fnKnI8+cS1veB4qlX7d16O/xdFfqGJ6jIEfi9xjV+JcUbKw7rb
	KullYAdM60hiifW4fyQTvjo=
X-Google-Smtp-Source: 
 AKy350YjCnyh/uk3o/BCfLEHu1k2UKAWFfWt3QXQRhRponKchCMwhVMVZSp02642w72S69hcs1tUig==
X-Received: by 2002:a17:903:24d:b0:19e:ecaf:c4b4 with SMTP id
 j13-20020a170903024d00b0019eecafc4b4mr44639769plh.4.1680537215464;
        Mon, 03 Apr 2023 08:53:35 -0700 (PDT)
Received: from pavilion.. ([2409:40f2:100f:dc7:d959:f34f:79da:6535])
        by smtp.gmail.com with ESMTPSA id
 jj21-20020a170903049500b001a19196af48sm6777186plb.64.2023.04.03.08.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:53:35 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8510: Convert to dtschema
Date: Mon,  3 Apr 2023 21:23:25 +0530
Message-Id: <20230403155325.5797-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d6b4df41-02cb-b900-5e8b-8ad08d3d36f1@linaro.org>
References: <d6b4df41-02cb-b900-5e8b-8ad08d3d36f1@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R4FELIVBFCLXKMD5JSV7PU7EJ4Z67L5Z
X-Message-ID-Hash: R4FELIVBFCLXKMD5JSV7PU7EJ4Z67L5Z
X-Mailman-Approved-At: Wed, 05 Apr 2023 07:13:23 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4FELIVBFCLXKMD5JSV7PU7EJ4Z67L5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Changes from V1 -> V2:
    > Added cirrus opensource as the maintainer
    > Added missing $ref to dai-common.yaml
    > Dropped I2C and SPI description
    > Added sound-dai-cells property
    > Added 'compatible' as the required property
    > additionalProperties: false -> unevaluatedProperties: false after adding $ref
    > Added SPI example

Kind Regards,

Saalim
