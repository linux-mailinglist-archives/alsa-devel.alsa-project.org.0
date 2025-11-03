Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C61C47552
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9677060329;
	Mon, 10 Nov 2025 15:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9677060329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786159;
	bh=a/0/o672HILvcrBC8UMnh0+jICqHg+2hF1l++OJBTvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R8MGdvt/rYBIsnKnoZs/E6mRafhGJg4BJSE3eRJPdQpNpr4gRH3l4fl38ONEaEdLZ
	 8LMkvAzQKKabAZqhytuJZafCp1ulaN353eoS37o8MKsqsLa08+jQnKJcMwJEywZraV
	 rpzWo7HJtMPpK3Y0xsWVSrWS4M9S5DlBSoptAbNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF102F897D5; Mon, 10 Nov 2025 15:42:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C02FF897CE;
	Mon, 10 Nov 2025 15:42:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 854C4F80526; Mon,  3 Nov 2025 14:28:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NML_ADSP_CUSTOM_MED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 821BFF801F7
	for <alsa-devel@alsa-project.org>; Mon,  3 Nov 2025 14:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 821BFF801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ivGgT8WV
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-294fc62d7f4so39761395ad.2
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Nov 2025 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762176509; x=1762781309;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/0/o672HILvcrBC8UMnh0+jICqHg+2hF1l++OJBTvs=;
        b=ivGgT8WVHUFVacQlFwKLZG5rKSJMnPFtZlCLhQBMNTB/tvSZ41ZMKkQptBzIHW8/JS
         uUnA5GfVCC818HXA8C3wuH2vdU9mb5ifYnGKPOyPjqTqtU98vC9Yx5qPo04/AM2tvqlJ
         ysEH+syg8nc9ekCNIVJJwkjJB6214q28T1AtsZZNd4eLRI0o/odsGxT1/HYi4idtS5ie
         vIEOMrlwxrKM5iLJE3jAHSN0SYNQRKROSeCtJMPmVbzMR//SSdtppsQnUlw+a0i8Iwlz
         U083VxHuqmi7pOPHP5dkbBPs7EoMHGhWLnw8Uy3pjo6N41dxI19r2cgdDNcUd8cdncr4
         giuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176509; x=1762781309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/0/o672HILvcrBC8UMnh0+jICqHg+2hF1l++OJBTvs=;
        b=HYtCFH+fz9/YRL2Bp0uyGMbtWMxzX9DTmnqryqd4bKLhe6hqudo8KmL42NsvMBjSOr
         tkFz+3lT/WcoY1UBOaBfPnpcFYnl5ap2YkfUfrm/KpEPqru7WIiz2Gmr7os4g0XMdVVP
         Vpqa/YIoB50DPK2nrqg8kxDUAfD5rFwSxtAEmiKgq/Z7TUNS2SxDY1okcB1SmXqlef9s
         ad2zyvdhUX2xCr5oafat15h1pbUx2brKiwnPGtPZy3Ga6K+QgsXbDSlqa3ZRPQ2zIn3C
         rI49yV/YrHaEPhGkWHei7vo35F9fnSpSRr2FWORuEuW0xPDhe6Be0NUzKZ3NJuZ395px
         YAOw==
X-Gm-Message-State: AOJu0YzS/Mt/ojuAi8EB2AOfRc52/XKNy4W69vvHeOVg8eCU32KLoIPl
	2+WfO8HMwUlfcm/BfBtnz+rCjIUk1tjrD110zqKjNG3EbnYGGt6aHpur
X-Gm-Gg: ASbGnctP4/0sksk8aq/5fFG9A8x4rM2rLXNYNzcDPyEJKBmpj6OZ8fDMnXR/+QUteW5
	fqFS4yqi8EvR1LKYzMSXdabzO0IpiwPqMGpfGeByOCcAkjt8ehJynutzA7VOoP0GMV3IjKZtoEc
	WMSMoUvvPa3wZuVIgzb1b7qJ3wblMqZQ1Lhv+bLIzw7ITEQ5ze3hk1Gb8b4DeWh0hL71Iw6ih80
	7yB7LP9gZB96SPNWTsN/x38UXfHNE1pnH62IPrTejIGqoZ0G3x/rtZDZPy3okyW0qEy/pDRQykB
	XRcR/V0NPVitEprIegka6S0RWzm2km499lipWCMOIOfuLM20gGL4VFULVmbttU9FFIKmc6v7cOu
	74+IDxEH7OHQSgBWvpbmqC0XlMfZApPTaBnNzN7M/SwUc3FhSifkJKSo4uUPwN5AtNiNubrM030
	fQDo+lhimr+wU=
X-Google-Smtp-Source: 
 AGHT+IG3Bz413G7PruqflPWXNLKUnYycOv6TQ59T+lA4ajnSHeznVZHAUWlTBcJ7V7op9pRaVX6D/Q==
X-Received: by 2002:a17:902:c409:b0:276:d3e:6844 with SMTP id
 d9443c01a7336-2951a493552mr185358855ad.33.1762176509063;
        Mon, 03 Nov 2025 05:28:29 -0800 (PST)
Received: from server.. ([103.250.145.217])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b96078aee39sm8062786a12.1.2025.11.03.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:28:28 -0800 (PST)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: zhangchujun@cmss.chinamobile.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	reddybalavignesh9979@gmail.com
Subject: Re: [PATCH] selftest/alsa: correct grammar in conf_get_bool error
 string
Date: Mon,  3 Nov 2025 18:58:23 +0530
Message-ID: <20251103132824.126110-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103085147.2276-1-zhangchujun@cmss.chinamobile.com>
References: <20251103085147.2276-1-zhangchujun@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: reddybalavignesh9979@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X6BQSGZNN65SWEGPVZYGLXIUV6MKYV5Y
X-Message-ID-Hash: X6BQSGZNN65SWEGPVZYGLXIUV6MKYV5Y
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:40:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6BQSGZNN65SWEGPVZYGLXIUV6MKYV5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Zhang,

Patch is fine. However, I'm not a maintainer or reviewer responsible
for this part of kernel.

You can use the `scripts/get_maintainer.pl` in kernel source tree
to find the maintainers, reviewers and mailing list for your patch
and resend it to them.

Regards,
Bala Vignesh
