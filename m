Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C4977E32
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1AD5DF9;
	Fri, 13 Sep 2024 13:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1AD5DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225804;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z3ZqvdD8wx/7SiKHb1HkaTBaR5t/4rtbQLdGOFxBIqhCzuLAjSbnQpQUegbG3UmXb
	 KWhguwCu2azjd0A46wOkzvXemQVZ7CnNBGM3+GTbv8gKDNfN9EUUZOHS8vMJ2MxQ5i
	 iuyTGWm2gEKZDdZecmj7L9DXNTrNRbSnSP1mVAxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67F82F80527; Fri, 13 Sep 2024 13:09:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF26F80272;
	Fri, 13 Sep 2024 13:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2078F8016C; Fri,  6 Sep 2024 19:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D957F80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 19:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D957F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=bRUpH/Yp
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42ca580f4c8so45e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Sep 2024 10:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725644558; x=1726249358;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=bRUpH/Ypa7bUXY30z+p74b6ZmR6uUX0PInsP//FQzWWu4c+tuweGT6YU1W9/gNb37N
         fOI4tAHjqjR1s22qsgW7JPK3GGhiSHinMKLupurrs3y2w1jISYcwkpSCU3dEIMkxNdY1
         j2cpdX+1l3sAZaC+B+pNiBww+TZvdi7ki9ioPDETsUyo4ORtMOZaOhikCkt0tYyPzeOo
         seS9akoy4vRPjIDgchT334W5ZtvIBu5dN0ZbPV/gCCAkKKXoW4RLcIoBxQCRic8ybOlc
         i9C9Nl1tjHGHIZe/M3RZfUBQnKvGNYcxlluQvn9LEZHce7BAs5zOs6Yl7QNG0OXCfSaf
         UHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644558; x=1726249358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Zo7bPVX0DB2Xc3MO13Axlu9umDy1dAjLrRUg5I22F9+AcXj+9cD67H0dOqTHc3DTOT
         B+mv+wNPBiKaImPM3LOgrfhlkqg3eQ06WcyV50E0+8jXT+AHuVtO4XePIPD0TK65qA32
         bP3A94fPMye1G7g0HtHGea9nwV3kJWfYMMq0ov3rWb1Qt4firF5ya8xPr4miwHyIt9zA
         vxINNa+VNMQajarkMN5tH5HRRxLAMCWefHA9HuvSDDJ2qPQDCEVPRGdzz/yQvQ7cYkln
         cuzwc0207yWCYoKz9OvY+hKwf5hL4x+BP/pwX42oatzN2rgszr5pkDH8ravnMW8+GYCl
         SWLg==
X-Gm-Message-State: AOJu0YzMhXLoCDVKFk5wrjtSRCKBOkHFf3v+XqoF/9BeNJmVzBrBBWxa
	p6/4PSv5QXxplEk2GQF+g8oObe9z6ib1fvvTGdjSEnZT8NiOXzPlEyNNp9AxVSX+zszwSD48M9r
	is8s8jw8LWSbUiedVmMTfcUrHNfaLIiV5kkM=
X-Gm-Gg: ASbGnctsL44UydndGORRLp+mXPjakN1A4zJ1+WIf1FDsFjRA2ZT2lYf7soD7BmUgIUq
	K/wd/FxSZyVq/C/Paft83NuxY4qac+Wett2gsw5adgu8S4pectTBl5eWHBw==
X-Google-Smtp-Source: 
 AGHT+IEH8F9KXvfeSTy3MXCma8BvshsfwimjOlGzYeP7X8U16+AhVrZzULFkKBtJGzd1YVhR1Rnx25uxjWAuEaD2MKE=
X-Received: by 2002:a05:600c:22c2:b0:427:f1a9:cb12 with SMTP id
 5b1f17b1804b1-42caccee53bmr27335e9.0.1725644556631; Fri, 06 Sep 2024 10:42:36
 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: 
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:42:00 -0400
Message-ID: 
 <CAFs7P=jRhBRvR7VMSJ7Fr1KhWD+w+5aBSGs=hvM6WRw70f6npg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: joshuapius@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: B2WURYOWZYVBMKIHCXFQ2KF2R6TYHZA6
X-Message-ID-Hash: B2WURYOWZYVBMKIHCXFQ2KF2R6TYHZA6
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:09:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2WURYOWZYVBMKIHCXFQ2KF2R6TYHZA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


