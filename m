Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF47EDF60
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ACB983A;
	Thu, 16 Nov 2023 12:15:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ACB983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133375;
	bh=cXOMKrOjiSRFzoFl+mEaWigDRy/fKuMyatqcPbkBPcw=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Zy0HqyQReAkA9v8zqh8W/yQmmk5GOyWxo2y7ccTAve4bmlpd5kBErnXElxh1+UFD7
	 ozOkUUjMMi9VbcRe6wvgsR4pvqs03/RnURb7o8DiQqws/5XD2KpC+xm4owN9o7COpm
	 7tk6PotfrwpPWTQW6baLVSqkYTmtE5U04UsAQ4Uw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B81A7F8022B; Thu, 16 Nov 2023 12:14:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84FF5F8016E;
	Thu, 16 Nov 2023 12:14:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B6AF8016E; Thu, 16 Nov 2023 12:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A594F800ED
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A594F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WC5+d8xw
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1cc9b626a96so5972505ad.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 03:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700133051; x=1700737851;
 darn=alsa-project.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFz7+oVHI5NX8C0fnm8IRqMzIqbCT/WXK6LRYxJxeAE=;
        b=WC5+d8xwSEZ+2/fpuDVpCuK9CCFpBU9LyNLTGTCQ3Ht8rqkUVxZRxmL0gy823LUJBf
         o9VDMt9DM6/u9/96A0G378k+GMARHVt28gxA+rxlmpbbM/nXlShUiblz6Z0lE2sQ3yYW
         1OpbbcMKlvFvQJeR3rgq5GhCnw1n2Q0v2G3XqFeFpvgdGCSPOmm1SkI5NE/SzjjC5yJD
         AGyKgpzna0H/0Lzhxh73O3MC2oiTYxngDZxD+vygn9NpAdlPtAO/hqllp/n3zVx05eTX
         kLl8UHL5Q2mABFiHtQ8w+6ssrIh07AgjOY/dpX6BkYjp+yjtd2KLCVRNszV43YST/mum
         D79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700133051; x=1700737851;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mFz7+oVHI5NX8C0fnm8IRqMzIqbCT/WXK6LRYxJxeAE=;
        b=LU6NJ1VI84fna1VeswKK/bzjoRGmOpgqyjAKVEFHAOE1EE3Qg2VAJvDTvA6wAEGJf2
         uKqnpZTd1gwmzOo8XtTNhIfWeFQrds+O6y9SJDCW6Vke0myv9ho6b5pA7k+uzTvtXw+z
         Iab+0+FjwedRYIPUGdex8wFqnqtX2y21f5Y48jtmisGSg9uXeB41n0m6gKizbx0s4Omj
         //SSTuE2fGTNidQNOHsWgtr9AbB3NObKJwc8S2G+0G3oCLNmQulW01WBHMJJ+FIJjykz
         L/CPMow64mE0rlzGZYitGe3zC1bpoll/vHPQntyrLpd2VbCHF/zrijCHp1ZH3Yq+y6sF
         aOTA==
X-Gm-Message-State: AOJu0YwPJL/u7PFE7CLw/ZDhC6p9ZrjAvoZEJG1kzNGSTRKgKqADZm4x
	9gRASUla96Ee4ijUGf620uc=
X-Google-Smtp-Source: 
 AGHT+IHdY0XUN3LIBMmFyQ/ijvMnft+nsGEUJv1hua8fnJIpPVmBnHfdyu9e06SELEggK2aJGRPBTA==
X-Received: by 2002:a17:902:70c7:b0:1cc:32b7:e5b9 with SMTP id
 l7-20020a17090270c700b001cc32b7e5b9mr7088429plt.67.1700133051430;
        Thu, 16 Nov 2023 03:10:51 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 ja5-20020a170902efc500b001cc3a6813f8sm9025422plb.154.2023.11.16.03.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:10:51 -0800 (PST)
Message-ID: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
Date: Thu, 16 Nov 2023 18:10:45 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Sound System <linux-sound@vger.kernel.org>,
 Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 ollisieber@gmail.com
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen 7 PRO
 5850U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D2JZUHCB4HRBSJHRUYWDMMEJBP5HGDLF
X-Message-ID-Hash: D2JZUHCB4HRBSJHRUYWDMMEJBP5HGDLF
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2JZUHCB4HRBSJHRUYWDMMEJBP5HGDLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> Hey,sound/soc/amd/renoir/rn-pci-acp3x.c has a hard-coded list of quirks. It seems like some product IDs may be missing. In my case, I am using a Lenovo Thinkpad t14s gen2 with an AMD Ryzen 7 PRO 5850U. 
> My audio output is fine but my internal microphone cannot be found.
> 
> Running `dmidecode` yields:
> 
> Handle 0x000F, DMI type 1, 27 bytes
> System Information
> 	Manufacturer: LENOVO
> 	Product Name: 20XGS1KT02
> 	Version: ThinkPad T14s Gen 2a
> 
> Could it be that one may have to add the product ID "20XGS1KT02" to the hard-coded list of quirks in rn-pci-acp3x.c?
> 
> 
> It seems as there have been similar problems in the past, e.g. https://bugzilla.kernel.org/show_bug.cgi?id=216270.

See Bugzilla for the full thread.

ollisieber, can you send the quirk patch?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218148

-- 
An old man doll... just what I always wanted! - Clara
