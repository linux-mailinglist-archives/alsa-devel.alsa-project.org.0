Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0E85D550
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 11:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08EA83E;
	Wed, 21 Feb 2024 11:18:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08EA83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708510737;
	bh=trM2Kz8pPivdf6IGVzlH0ZCKq4rpLOnpoP0R6yUBqSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W/fq1VvSh2xQyHAyAYUMWBQtN7EQhIWJ+xWBNwFlQMXXZeP3ge9uwlJqoy7LSEnf0
	 a2W4RIw510exkO0I3cZdjQrmK6Iv4RfiKi6Yy5iL8Mi1syLa2V1EqF/Hy669oCWqNa
	 56YdFUf0X3XbxREYBJsILRer2vD0+YrlZe1lw9Z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B589CF80587; Wed, 21 Feb 2024 11:18:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFDB1F8059F;
	Wed, 21 Feb 2024 11:18:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B84AFF80496; Wed, 21 Feb 2024 11:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE3A9F8019B
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 11:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE3A9F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YeDoNjOY
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41275855dc4so3034805e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 21 Feb 2024 02:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708510694; x=1709115494;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn9WH08w7X3KaRpsc+O+6J3F2CObpMe10qvR2Y/8t6c=;
        b=YeDoNjOYfd6Vtg4cxj7R09TJpGehU0iGLgVUUhekonzrn1pPh3u7TXDsaAmred+cev
         aWNLjK3gPKoTTuQBErC1nK0lf4pMdC1yvemY7Obxqi64LYASwQrilnu3bISM08JnXrxG
         I8BA5M4lWj7yKt3fldNl0CDKFpJflO45t8DRTvFz2sqV3xY3LhjwePSMx325vmyKvzhU
         9IPdK6mOC7dgv0ttcfTcTJXoCYFAwtdRKlgEkvEa1CQ5QnokxQb+ec9KsWvbyUETXxqS
         QIEPJQFaF1yp99i6ePkeH9sf33B01dQMteEC2mPTDjFw7t/P9z1UAbJfLM7inSoIf2ls
         nC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708510694; x=1709115494;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn9WH08w7X3KaRpsc+O+6J3F2CObpMe10qvR2Y/8t6c=;
        b=KhuZFGOE7IlxYfFSOAB2XZiFrgLU1r63i9vspBLKIjWzQi+t1K7IoksEpvFyDJoJ5S
         NVOOb3lY7+xjB08x1/NYQhW9RQ95kGLi2Z/gytnCqg/Di//DEogcYu1o5ARLT1/tp1cO
         80VbtZoxSW6QE7oTMcwVbcVVePv5grF8/qy3YfIaeAeXmJ+TLv9B/cL1ru18n0fMP7nf
         gi2U2/qGynIrph3nN2vkyTSdtyzoc1i//8NbLjDHVJ/R/aGm2ggDu8dvbg8MzKVCrwuR
         w/o0SVGnOkqiLQP0aJ7ejr7v7Wb8D6ErS2JtBeyb261m+1+XlPVfUt3Aq/1piIxS1cGZ
         lnkQ==
X-Gm-Message-State: AOJu0YwqQgAtp63Q6E/j3CvPdtGR0C0anRLPMehZkRLm8obiaWpNtP2C
	e060Jef4feLqpp+paZCsRr0Jxb7RMFaTVpPxtnCgcfkLnc/mMhh4uj4A+2d5WWMWYUs7QnWhkmj
	p
X-Google-Smtp-Source: 
 AGHT+IHuTENwbRX88AmyJuMsriSXVqIUvDmx1GZlXQCUQh7dhnbVs5FGJ+kArHCimI5/Om88TN2ucg==
X-Received: by 2002:a05:600c:1e06:b0:412:78d3:18d9 with SMTP id
 ay6-20020a05600c1e0600b0041278d318d9mr255680wmb.38.1708510693780;
        Wed, 21 Feb 2024 02:18:13 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b0041262355aeasm1959554wml.16.2024.02.21.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 02:18:13 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240213-bus_cleanup-slimbus-v1-1-34f06d82de6e@marliere.net>
References: <20240213-bus_cleanup-slimbus-v1-1-34f06d82de6e@marliere.net>
Subject: Re: [PATCH] slimbus: core: make slimbus_bus const
Message-Id: <170851069308.25406.6494531304453736550.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 10:18:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: C5RHJ77MF55KNM4AI7BZRUFMTELXJ5C6
X-Message-ID-Hash: C5RHJ77MF55KNM4AI7BZRUFMTELXJ5C6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5RHJ77MF55KNM4AI7BZRUFMTELXJ5C6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 13 Feb 2024 11:40:35 -0300, Ricardo B. Marliere wrote:
> Since commit d492cc2573a0 ("driver core: device.h: make struct
> bus_type a const *"), the driver core can properly handle constant
> struct bus_type, move the slimbus_bus variable to be a constant
> structure as well, placing it into read-only memory which can not be
> modified at runtime.
> 
> 
> [...]

Applied, thanks!

[1/1] slimbus: core: make slimbus_bus const
      commit: bcb0dafbb3fff9f017d5d915a55831616a36ad75

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

