Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62796F60A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 15:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC973EDB;
	Fri,  6 Sep 2024 15:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC973EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725631000;
	bh=T55wTvnsZWK7wKLe5Azg7ktcef5YrLYi9qJ1TyKnki8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VP6OuwhcdM0GOcO4/9PmYqa/rFYmNyRjbVHL7VvCw9SyMWZOeFLiEeDx92OGUstn4
	 NKaZ2Oipxa0n0qQH2b93SVNivFHUrzR1u+Lx4bVoJUcNRMov09vZvie1R/z7LhEMbK
	 lxC5FVJJofjA+t7Cdg/1BdPd7rI9aZcVYLjpcITs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E00F8068A; Fri,  6 Sep 2024 15:55:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8692DF80673;
	Fri,  6 Sep 2024 15:55:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 230A6F80027; Thu,  5 Sep 2024 15:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E2ECF80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 15:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E2ECF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VjsMSbJx
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so6365425e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Sep 2024 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725543294; x=1726148094;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A55MoqOFsldxwQXlxzpGNFUwndW79rlievwxBfz+hvY=;
        b=VjsMSbJxakAaasL5k7RnykxB2y/VkuK6NnIGyh2Ju7V9+lhkOFZd6ZNhqtBjIv9Zb+
         XfxlEgNzA1FQRlw88HGtuKEgpVjkDEHsMsM7TyhN7948DCSLS8M151lQDX5p2u44RqHa
         kQzhzYF8pxPJGc/wtDAchnk0j8Xxdk8DHeGBNqJvWHOkaW0VRmwW/b37kUrhiZo1o8fq
         rmPwp1sI6Xo0p0MHO+/W/ofQSBNwX1BFA7rfgXv+m0tJV0X9WFZIqSfhIjAmzYp6Ffuv
         PQXdWezgyq3LMUJz+54bp9t926jlc+0OpV4jmUXV8sy+JbzbHHZ6zcGStQYK/MluV1EW
         A4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725543294; x=1726148094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A55MoqOFsldxwQXlxzpGNFUwndW79rlievwxBfz+hvY=;
        b=fwkKAyW9C0fk0e3WE6ub/R/JeXfxYP788xFCh10buiFVMBhJg4DJCzzNl/JvVjMQEF
         ZldeglTJDvKmzLD0Emqi8p3R3fOHtsjJ/qidVP2VN0bj2RMKASjluLsySaXq6plAYZa9
         upV6LL0iBxkq9V74asvB/XQsDseyP8htefnWf7SR2DdmtInZFiYQJd5zzbPBqTa+Q3Xi
         sNjAEcN97jjTiUDn7BXjoMeMTcsdMPNPP9pITJ0tH4pVgd7urGPPV7dtFpuWYBhoqQ6Y
         N/w8acF9HM0Up8EinpfluRl52ueRf3phWvm3ptvZvnr90UhMwVrLSWZGLTNWlVl/aTyQ
         cOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqH851XF682wjLnfouDZSNMCXoFp+ygcrHgOFe9qDV4vW+9qeMbxlp8VTtehAk6LwU5nGeoRu5TMNa@alsa-project.org
X-Gm-Message-State: AOJu0YxcJGTirnjb+P6kUeNsWkHTK0WWyLBV1y4dahd3tNnmlZ8UCK2B
	MsCxcI/+xBZ/2cKo9C835wpCZYc/zwHr9r02QLB4h4IDnLvn4/AR9tbMXU4l6ME=
X-Google-Smtp-Source: 
 AGHT+IHlLHcFxIGMisRnkKc2CYZtGFT0jClDM/towcNZCE2ZiiV3MyJQRjAtcBerBGUGlmpJOrdV0A==
X-Received: by 2002:a05:600c:4687:b0:426:68dd:bc92 with SMTP id
 5b1f17b1804b1-42c8de5f5demr58972415e9.5.1725543293907;
        Thu, 05 Sep 2024 06:34:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-376548acb59sm6788520f8f.58.2024.09.05.06.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:34:53 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:34:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, Hillf Danton <hdanton@sina.com>,
	alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2 4.19.y] ALSA: usb-audio: Sanity checks for each pipe
 and EP types
Message-ID: <2adfa671-cb11-4463-8840-a175caf0d210@stanley.mountain>
References: <76c0ef6b-f4bf-41f7-ad36-55f5b4b3180a@stanley.mountain>
 <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <599b79d0-0c0f-425e-b2a2-1af9f81539b8@stanley.mountain>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NLDEKEEVXRQ7FZSKOPV5LRP5LFE3BAEP
X-Message-ID-Hash: NLDEKEEVXRQ7FZSKOPV5LRP5LFE3BAEP
X-Mailman-Approved-At: Fri, 06 Sep 2024 13:54:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLDEKEEVXRQ7FZSKOPV5LRP5LFE3BAEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sorry,

I completely messed these emails up.  It has Takashi Iwai and Hillf Danton's
names instead of mine in the From header.  It still has my email address, but
just the names are wrong.

Also I should have used a From header in the body of the email.

Also the threading is messed up.

Will try again tomorrow.

regards,
dan carpenter

