Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2C96F600
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 233B8EC0;
	Fri,  6 Sep 2024 15:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 233B8EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725630950;
	bh=gAIJ3PhajTs243EZcebvGSoGjro9qiQ/Ws0W81/D/fc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uYrOPMZ7wKlJGVSNvRhvWMa/DMY4MIHLo4ZMpPrOK1zs0y76BD0lOX436eqHX2wlE
	 FBAIYqfCulvCXUAsWi56rCgNYyJSSxo7To6EeaS8oJhR/97bC59EyN2WEirY9omJL6
	 XU0P4YOTUcY0YTELO8dEfR4wgr8lXL4RfOL1Li3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20982F80602; Fri,  6 Sep 2024 15:54:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF63F805FC;
	Fri,  6 Sep 2024 15:54:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4280AF8016C; Thu,  5 Sep 2024 14:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DAFBF80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 14:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DAFBF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HvtOU1We
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42c7a49152aso7416975e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539881; x=1726144681;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fs5UBLOJNpf28XhTrSsd4UdpoAhSIXUZY6dh5f6f8w=;
        b=HvtOU1WeNgTntvQMn4aE3wRdWZRxojh/JxkEAYg6uuxcW9Jwk1YdukSVrg9Kc5590R
         v7pILvDrK+2Dx5xi0cuNk0ps1sPzzngZDjmoJtqjbmLitLMewDyLbjmSb615DuaczcAQ
         g7sBViEkEGpI2NM9Wrf0ZwTCobFRlZSHGVdepvm6v6EN7pCSSgsDzNg9EQmer83hGaUu
         EYvBRbR1C2KToThiqzhGLv3pBGNKlcuA9VuUzFC/IeMftQIRObj42F25v7tVCSFZ9Jqw
         r+D2PFUplACjdTs2vB/n6dYWopIvhk40qIvZgKyoxXU7bNbeKkD1reVMsQvg8cptEjjS
         ZWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539881; x=1726144681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fs5UBLOJNpf28XhTrSsd4UdpoAhSIXUZY6dh5f6f8w=;
        b=aDsnTbxo0IebICqp9SGuQrfU5OEO2GG6TxNYI+oXvkWsmoKLhSOOsyqCpklhY6T8us
         Dg0rvtCIh7g5OYS3LIl2xjsg2QB0LZcbPyk7AobWyZTtHbTwhS8eJ+mkXcMhIHrTc1/O
         ZO91dNpDs8m6ezWbiknMtrOYzzr6JLPvUOzlitTf+IqzMuEPNVcW7BA6ZiNF3tTV2imm
         sA3LZsIPG6G9KgEcQqoi0tQy1xkfngfS49LHt3eWgdftk0lZJSLGz3equpgkwFgdA/qH
         rd/VBY9zYZMt0y1MvLowx+S3ctyAXi1Gprfv5UbYhHw+a/fvluwShjCJI17pbDj0Pcrw
         kWsA==
X-Gm-Message-State: AOJu0Yxpwlf9E2o7IHa1kALVbRBiXuA5iO/JAx9NvSCM1AXiBjDsc5+v
	AUv4W41j3EiEgJ2fEfftU6he7rr1SCOXlUNqBea7BXauki/wvogGfeszQBkzI1U=
X-Google-Smtp-Source: 
 AGHT+IGzhcg/wy7VI0taY5toO76pCtxvIT0nMt9rIoFCFrX0MaSFl5c96yqpLUhXxfmWrltlNd85FQ==
X-Received: by 2002:a05:600c:1994:b0:426:5269:982c with SMTP id
 5b1f17b1804b1-42c9a38b28bmr20532705e9.28.1725539881113;
        Thu, 05 Sep 2024 05:38:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c17fed40csm185938965e9.0.2024.09.05.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:38:00 -0700 (PDT)
Date: Thu, 5 Sep 2024 15:37:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Hillf Danton <hdanton@sina.com>,
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/2 4.19.y] ALSA: usb-audio: sanity checks for pipes
Message-ID: <be8708fe-fa9c-4b41-bbbf-50a75d0fb3c8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L36JT4HGRPLMVDZDVXLAG5ZSLXJSNU5S
X-Message-ID-Hash: L36JT4HGRPLMVDZDVXLAG5ZSLXJSNU5S
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:54:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L36JT4HGRPLMVDZDVXLAG5ZSLXJSNU5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Backporting the sanity checks on pipes seems like a good idea.  These
are basically the same as Takashi Iwai's patches upstream.  The
difference is that upstream added two sanity checks to code that
doesn't exist in 4.19.

I had talked about backporting fcc2cc1f3561 ("USB: move
snd_usb_pipe_sanity_check into the USB core") but that's just a
refactor and not a bug fix.

Hillf Danton (1):
  ALSA: usb-audio: Fix gpf in snd_usb_pipe_sanity_check

Takashi Iwai (1):
  ALSA: usb-audio: Sanity checks for each pipe and EP types

 sound/usb/helper.c | 17 +++++++++++++++++
 sound/usb/helper.h |  1 +
 sound/usb/quirks.c | 14 +++++++++++---
 3 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.45.2

