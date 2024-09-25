Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7E898533A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 08:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DD9857;
	Wed, 25 Sep 2024 08:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DD9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727247018;
	bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RaKVH1uCcGT39bRekkaRe4PuVOdTfwoThkdLDZHLsVyuvDqzWC/1ULzGR7n+COSL+
	 tga8jknKIPj2U0jOJXB6VHVbCvmtYDyd1ZLb8O48nWXM+TNSOAW0p6HSPAuJ35jZLy
	 9fv/R6N76UUYxatnkU05//4Fu9os1QUQ3mQC72pg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16A29F805B6; Wed, 25 Sep 2024 08:49:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F9ACF805B0;
	Wed, 25 Sep 2024 08:49:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2BF0F802DB; Wed, 25 Sep 2024 08:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA4B5F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 08:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA4B5F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YUqwk3Zb
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so307742a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Sep 2024 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727246977; x=1727851777;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
        b=YUqwk3ZbcQdHoMUPcDgqYW/zGFAijEjdGsTB7wqt0HCWqPOsP4RZ90fesbz/8mQmHD
         SYA1XNZ21I6CQsqg8WjCNdBqhF7IP1nU8ibG57lliMgFAP1XPIS0KyS0gMWgUJ1UhWoz
         MEwR41o6WpyU25lCasWgDLnxorO9apcn+l9HoVCNjYb3iHWClCqVRNVpt+jtmi9TYQVO
         xo3goA4+owURoUoQaX2xO7PkprhhyQRjcTbKeCdBjLP8UYDZnCLE1AyD+oVM9eHGzg5r
         S/SGYV342gcWa4WN45IkPDloJ+uVMcVaKKncDIIxb3KsqYYHyqx/r9/AQ+P+JOlge9SY
         Uvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727246977; x=1727851777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk0Mt/+Hyj4BQOBJfxHEcKPbnwRr+BiwB73GhiBhJzc=;
        b=leConBkTMkLguwfhARgVCxajYDIIJPOVYXd9cIKFuGgRm66TW2HmX14Gvnpzd7ux5g
         atm0npfO5yWhHN+iXmvRDJhb7i8H47dFxgLPN8CWAFQiQbZa/cQPESByerL43AHmjzde
         TSCr24Ea28gO9KeZsK4jN1cJ+sOa2UYh9POrX3q+4uZ2x0NSHTB/X9p5rwWx/0x8A6oC
         x4cIDv/6xGnsN/iAb4/tilcM9ILlCBiHGd5Iw5/WgP0adtY2g8AIIg4t4M1tioLVnqjv
         7mQfEWYpuLbvtLfihsWi3pXtHbFszX7lMwCWuXd8yZON3N1AadAbBFAkgLqWBGidoK3J
         e64g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsbgUHniW9ESq/yCOBTd046zJ2WhXCpnBdwmYIZZogiqg/2pYJUoNKo8RHpIen1/4YzcVeSgIakOkX@alsa-project.org
X-Gm-Message-State: AOJu0YyjhZovmy4uqOcXg4N8CWnfB6nITxrOpTee0edr3+GUWXZyjVzV
	TmQ/Lc4H99OspCm70sOXPAOhXUMBXZRG0bvlG9bUJ1YVrCawpHxjbi3dhgIhU2EXQPUDBmqJNTA
	IgpkW/5pCsdwtO67oslyIl/IAH8Q=
X-Google-Smtp-Source: 
 AGHT+IG4EhVNx4ZXTlcmLKwxSpAi+1Cc6wEcJlS0M5tzYd1bPulq0A8B/RQMJgdldFEu+s5xV1faX8OGR4qz9F9spEc=
X-Received: by 2002:a17:907:c7d5:b0:a86:86d7:2890 with SMTP id
 a640c23a62f3a-a93a05d6507mr137992666b.50.1727246976510; Tue, 24 Sep 2024
 23:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
In-Reply-To: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 25 Sep 2024 09:50:35 +0300
Message-ID: 
 <CAEnQRZBde3AV7Dvu-jtXCTbZnBg60COdp7eheSdyfE_6mP9GQw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HONJ4YOE4UWTIMLAFAUPY7MLDDKXD7B4
X-Message-ID-Hash: HONJ4YOE4UWTIMLAFAUPY7MLDDKXD7B4
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HONJ4YOE4UWTIMLAFAUPY7MLDDKXD7B4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 24, 2024 at 4:59=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Several of the NXP drivers use regmaps with a rbtree register cache. Sinc=
e
> the maple tree cache is uisng a generally more modern data structure whic=
h
> makes implementation choices more suitable for modern systems let's conve=
rt
> these drivers to it. This should have no practical impact.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
