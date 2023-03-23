Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB76CEEB1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 653D174C;
	Wed, 29 Mar 2023 18:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 653D174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106017;
	bh=Yk7SEtB9O6XaM6uP+epD7ilSH+AGZvmgcFSg/qKerCI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NvrM6cuanpUugn2k+GsqOKnwi/E1Ng+RnSHITNEXmE/pBdlxtm0b0qSB3ZjLdB1xv
	 eOA72CK6+gtSZC1//ywrazibA0gY2Soouy/Lo1SUNKGrssi7+tbH1+Vch1uTlaTbhF
	 ZNAjrVMDp5K/3m7iNCjwko6AwBuqHVC/w7Arbp8w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29A61F8053B;
	Wed, 29 Mar 2023 18:05:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1AB2F802E8; Thu, 23 Mar 2023 18:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 149EAF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 18:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 149EAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NmeHd9TY
Received: by mail-pl1-x62c.google.com with SMTP id o2so15527077plg.4
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679591478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yk7SEtB9O6XaM6uP+epD7ilSH+AGZvmgcFSg/qKerCI=;
        b=NmeHd9TY+roYM/Oz03gAgRhQpqw9mDk2J/rCkAUwkIPRvr6pA590KPpv/gJ/tcsf0r
         zO5zOAa+CT7U9/5gEnfw5rNV3kXYt796M8eTNCYSXYRk3MJqFjKo4YZHQmd/hSrOg54W
         JEpmfTUn1d5eKmXJN1oyaOcsFi0aJroF3kIvVdxAeE6kX2jRAoTOA5+w6f5tuk8yCiLb
         sLxgleQcvk1IDzNcHI+48fMVnzHyXyUyTaGstu+aWw4L8q+sxiMuq6jtJZasI6vY4HO+
         Owvzyj9x23lsTM8X9uJ+9pET/S2y2HfhZokU5sU3/DhSJSUc2sSHveidQcMcTLiGcAUa
         wLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679591478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yk7SEtB9O6XaM6uP+epD7ilSH+AGZvmgcFSg/qKerCI=;
        b=iJfQcQpsO5VJMCsplVTAk3A3rXMkUHNI7oP5XZt+a8eL+jpAgxrPUnSEit4QnXq40C
         O83B5wPSeVGKhy5KwX2jSU0Rb0foAH1KtDi0uw2q75ghw1CO/ls4jwBlK5+F2+UuuMgO
         I+PHQi8jz2++JISNcW5wvT1t1vrPnp1f4zjMbShsSvevl2IohxDa+3UK7IjlWFY6o6Pa
         EjBhFGmsN+yoMNOLiimkX9tXNCI1yiYhIcOmKvgGN5+FpoMLZaFV5xh+/ZijI/qUeyMN
         Lan57CNdbcdwI9FydEoPV0ZcPhqo6W59jF6YjhKblGLmYY5rWCoAGyPX9cpaZx5jB1E5
         w13g==
X-Gm-Message-State: AO0yUKVZXyodaiQs6VHT+RbSWdgWK1QmOysiJVHMhe8/lOoNma3eUnst
	8YVZBC6RxjK/xUnDc9cR3o0=
X-Google-Smtp-Source: 
 AK7set9zYXnWHCU6xqJjbpiCYnTLpN1sKQOZhAruDh4oyjqc2OCxFzrs+aD7PF4vpswXjJtR2sHA2Q==
X-Received: by 2002:a17:902:d1cd:b0:19f:27fd:7cb5 with SMTP id
 g13-20020a170902d1cd00b0019f27fd7cb5mr5396016plb.10.1679591478507;
        Thu, 23 Mar 2023 10:11:18 -0700 (PDT)
Received: from pavilion.. ([2402:e280:2146:a9a:96dd:65b4:8354:3919])
        by smtp.gmail.com with ESMTPSA id
 b4-20020a170902a9c400b0019f3da8c2a4sm12557102plr.69.2023.03.23.10.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:11:18 -0700 (PDT)
From: Saalim Quadri <danascape@gmail.com>
To: krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: alc5632: Convert to dtschema
Date: Thu, 23 Mar 2023 22:41:11 +0530
Message-Id: <20230323171111.17393-1-danascape@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
References: <1a2e0f7a-771f-5590-fc54-b9dbf059a925@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: danascape@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YDYDSXKF3DSTHBQTF2CFOEN7SRXFTJ77
X-Message-ID-Hash: YDYDSXKF3DSTHBQTF2CFOEN7SRXFTJ77
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:21 +0000
CC: alsa-devel@alsa-project.org, broonie@kernel.org, danascape@gmail.com,
 daniel.baluta@nxp.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDYDSXKF3DSTHBQTF2CFOEN7SRXFTJ77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

This is my first time using the Linux Kernel Mailing List. I apologise if I commit any mistakes.

> This should not be subsystem maintainer but someone related to the
> device. It's maintainer or interested contributor. Unless that's the
> case here?

yes it is wrong, he is not the subsystem maintainer. I will send the updated patch.

I have a doubt, for the maintainers list, is it required to include all the names of the subsystem maintainer
in the yaml too? As for this codec, there are 4, shall I include the names of all of them or the one to whom the
module is authored to?

Apologies,

Saalim
