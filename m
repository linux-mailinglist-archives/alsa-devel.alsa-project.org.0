Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D296593D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 09:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AB67F1;
	Fri, 30 Aug 2024 09:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AB67F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725004652;
	bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qJbknJDGq8MKy3a4Ukd9noZhw4uWLYL02aqrpKXe036dRjHO6JNGy3Hs6DngBZW+1
	 OIDL8ToLlJ4jCaW+yXIuj/Wr9U+tMLgCM/0QXOs4L4H3QplAGh6diU5upJ6CAAl/z9
	 d68PSJNvk5Urby6wcC5gUer/9cJQTAkSYL5d+zD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE85F80642; Fri, 30 Aug 2024 09:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC0CF80637;
	Fri, 30 Aug 2024 09:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6A7F80518; Thu, 29 Aug 2024 19:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1DA7F800AC
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 19:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1DA7F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=oCDoMsSW
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42817d3ecfeso125e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Aug 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724951119; x=1725555919;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=oCDoMsSWy63S8QX/3Bej2UnnI6YJHrrJJZI6X1xXnzzXS8u7JRQms+ngLBLvkFYBb8
         9GIe8ogvFS1Vy52Ajk6d5yAoLz4wE0C/kHjtO5VFeh1MHZOtUiibJwEHYyQLoSAeEtzz
         luXC2mc/ewBJlHZ7WHpCwPsS72Omz4QHo7t4D4yrUcpgZD1BBsI3R7LzINam13M3+e0/
         SN8wRWpzAeOPWtlPoTYsvvL8ZnHBp2dqxLPNWAiFvZy11M+caNfRJvfo1mdl40/8OdBP
         yNIeYi35jxmCHFBcjoVNxua9PL2AH9q4Y01gNFdodOseQQlqEmLOLO2aY//gsf60lzRU
         rbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951119; x=1725555919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=hc5ZlQ3qUyjmc1BRROom0ehg2/8PJzfy268oPuFuVaLpAmHGdkR07d34e9CmKCPGsh
         agIZMv9xgPvrUVuLjX5kG2pNbpaaG8Psc/0jcOR7T8PsSGY1reWO2TvbY1gYE6Txbe2G
         ly4vWe23zjDcIx0UflAP2nCi9kMH7PPggUs6MlxhPl4YRne4duWLcgonSqZ0gUfc4PgD
         AJFtPRGaR1vNyO+TpqmyDP1vBJNo2LxSjD2l9ZxuUEntVsub8O3B9QNQp55J4hW0DoAI
         rmkYVkmlLoDRaJp4TrJjB0kgfmQ8NaxHjj/jlVlzCC7VaMchvpyIkjL/wGfZHufJkEtY
         uHKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCyPoCvOS5Ecr8towtOyrN9IazEM9Q2I9jXxCaz8CLGaXWDaIDfFiMlSVmqSdrOJbjM2M2KmauZAD2@alsa-project.org
X-Gm-Message-State: AOJu0Yx9BKRCdLQjxlK9IxLx5Ph0Wxkm4sXea8zH4ahLGmIjcBZ3qeqc
	lu+wtr61ZGSsxSLuTzH8zozqaZwpl8HrtOx5sYQuhzpcGqHpv9RDR75UtiqiZtt4VCXCenFe68w
	8rwY0XBY/50fkIhoC6EIGTN5JTiUkVXGGVp0=
X-Gm-Gg: AV9I1ZTT+ksmGsfYCujtJWuRnQauVODz3eEUONDKAHt0AQx/tmpymWz4Xdz0u2zbtQw
	Ptsx+bIY5TgFUhEtQ8cNCcfAkL0fKlYgWAzbjT69KqTO+iji6sxAziyYBUX8=
X-Google-Smtp-Source: 
 AGHT+IF8ncbv3hPX6txBwjD+mljfVJFZjCz8WD9pS5r0ChWeEb3HcbLEeUEQAMuL4Kr+bb+8RiZA/+ov4ZUA9UxFSLs=
X-Received: by 2002:a05:600c:6d12:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42bba2d4b89mr12755e9.2.1724951118768; Thu, 29 Aug 2024 10:05:18
 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
In-Reply-To: 
 <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 13:04:40 -0400
Message-ID: 
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: joshuapius@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5ZNXSUGUJ3HFGWXETE4XNWV7ICOE67KK
X-Message-ID-Hash: 5ZNXSUGUJ3HFGWXETE4XNWV7ICOE67KK
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:55:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZNXSUGUJ3HFGWXETE4XNWV7ICOE67KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


