Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D920D6CEEEC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7323CA4C;
	Wed, 29 Mar 2023 18:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7323CA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106398;
	bh=INH4rDUuaPGMyyc7x+TVTpNYzfNLlDQlyUBq6F5oYBw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P460b3KmHoPTg8c+FX+Eo9qV+Pv1jrLM0hKZ9mKVgqadMo36aANHp+k6BmNRj2dDN
	 u1ZKeRaIGfiK2XTaz7GkTMTD8d7viDLQE83GGvtvw5b6nrZ+JmV5IwI3hnaLLq9Gm3
	 9HnYqpb40urccAwrbQZlsPeyptM93lboy/QKEVrg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C45B2F80529;
	Wed, 29 Mar 2023 18:12:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA40CF80272; Sun, 26 Mar 2023 14:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98730F80249
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 14:58:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98730F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nZpaa6gy
Received: by mail-pl1-x631.google.com with SMTP id ix20so6002164plb.3
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679835506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqYkWJkaO4sQG1+IkZaD7pCpxyjI18qQfmgn5wQQcKc=;
        b=nZpaa6gyehqtQLFxFkiTBb2f7dnSewWh+fRxYQdlcsNT1qSTpg4LdeyJsOn2TsZjj+
         leUPQG3nfr3FAIRu1xQRKuQ/YnuFIRlPB+U1cjxcQOMwm0SOBFLLloWBovhSGA6W1YlW
         l+bD0xSnBZQtFfKlxAjUJE0571HfhpB0IMCZ7EWO5cvSHhgUpt3NAjUd0W2mv3nlF5P/
         9+Vet/qUQAd++7x1ggxKfd/+FRkrERMKQ+zSXm4I0hqVZOPS0/dX2imiogSxIF2mZgM+
         K3GZ84ioKL7qFPLQcUHf+rjRiv7XqUf6kQ8G45u89d29FXHXCuyrzxoSKUKRHHArSRRU
         ErRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679835506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqYkWJkaO4sQG1+IkZaD7pCpxyjI18qQfmgn5wQQcKc=;
        b=xsyTjCWY/QtlRsmOCAvlu7zmEv+vlQi2p7A6duFgzpf0jjZW526UEp3RA1e1/PYoRX
         LeeCBXOnkMhaFeZtEeO+49L8IrUAtac7Kz/Oa9r5KXpPqA0Z7/jOWYcOiF9XqAQotcZ/
         QnXW3u/RaqvoyFA/06zA8C+CV3+x1HwvZ6YyrUu1ZhpNf88ISIzXxEu1iHBJAZ1d3RSp
         tCRPBax+53F0uo5IWs0+lVE473i+p1rLj5Zh29YbENePYIiayC7X4FIR/KJzk81PlOrP
         RIAt5mRSITObv/w7ax94WpKiYubIjtpmetn6uHaxOAQCfIJpsG8WXIDrGCZktUSnTVOf
         ggHQ==
X-Gm-Message-State: AAQBX9fQ5oryhkZmdDy3W8fD72YhJIshYLefzd6X60mfKwvNKuLn0Pzk
	7oQelXxEWaCAYH5q1V7K2pw=
X-Google-Smtp-Source: 
 AKy350YlWB8TR1kFc7Kd+zh62anGXPBz3sTBsxn8Plm8A4fgNv1bB72UCrkUdCgr7cr2K58/7Tt8pg==
X-Received: by 2002:a17:903:230b:b0:1a0:4fb2:6623 with SMTP id
 d11-20020a170903230b00b001a04fb26623mr10801275plh.40.1679835506433;
        Sun, 26 Mar 2023 05:58:26 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:1d70:a8f1:a55a:6f4a])
        by smtp.gmail.com with ESMTPSA id
 w4-20020a1709029a8400b0019a773419a6sm17300476plp.170.2023.03.26.05.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:58:26 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: ak4458: Convert to dtschema
Date: Sun, 26 Mar 2023 18:28:19 +0530
Message-Id: <20230326125819.18986-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4762f4a1-5e99-4e5a-72c0-9c4c61cdc856@linaro.org>
References: <4762f4a1-5e99-4e5a-72c0-9c4c61cdc856@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XHQNKBGTA7GOZJHIF6I5ES5ISVRUNUIA
X-Message-ID-Hash: XHQNKBGTA7GOZJHIF6I5ES5ISVRUNUIA
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:12:16 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHQNKBGTA7GOZJHIF6I5ES5ISVRUNUIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> allOf:
> - if:
>      properties:
>        compatible:
>          enum:
>            - ak4458.....
>  then:
>    properties:
>      dsd-path: false

Do we also require to add a descriptioon to explain the pins which will be selected based off on the value?
Or have you disabled it based on, that it is disabled for ak4458 codecs?

Thank you,

Saalim
