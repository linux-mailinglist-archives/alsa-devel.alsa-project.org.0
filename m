Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A570F628
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7CB6D8;
	Wed, 24 May 2023 14:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7CB6D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684930951;
	bh=CdI8UptnoM5KuWydseAgUXjxjkq7j4ckxFa8GUWu6m8=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YwbP9EqGzu05+kT8BuPw0bvG6iqfVj9twWldgvsQJxqg0tJNzyzMTMp7IIJIK3WJ+
	 XR0cx46Oo3jU0W01OWJ9b8aWuB6J7nE5txH2sr88ESvKnJDWBM8uQmG7w+q6FDIElY
	 jpMlfgMGxtEJhJQ9Acl1QEEovuBv/aFx9181onhM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4983AF8016A; Wed, 24 May 2023 14:21:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DC9F8016A;
	Wed, 24 May 2023 14:21:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65725F8024E; Tue, 23 May 2023 14:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5AECF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 14:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5AECF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=L01Yxi54
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-25376483f66so3582196a91.0
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684846118; x=1687438118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+luJcpnDqm+8+ya6draBWUeu0r+QunqXQzG/ngCVWE=;
        b=L01Yxi54Oo6q+9Bjt3sEn3NMpYld/wO3CBq2BdI95nhVavzMbfrHIOmKTmh7TP5PLy
         rX4bVJB7xaLYk29lSa/XK+Hv/50UcCHKto6d3cjCRyOcY9DbtAF/3gOmiRzwMgWgS99o
         Yyqpl1jiFYyeEf5FKK6qmg85v0uUui/14PuAVZBDqupxtWYN/PinMMyqkEAcWoaxqeRg
         UcNmFEZRuOtrw/7aQ5P2AGzhGwp7HmB/S8m1x/Bsvsh5i3gIPJxDSGyZkjKmYFgy4Ep6
         NL0BXI+4s8rDbyCTPsSUdYPe/7W5hxP6e5XtqYK8G6rzuUJww0kzLF1u5+OBHKcWb9xU
         FW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684846118; x=1687438118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+luJcpnDqm+8+ya6draBWUeu0r+QunqXQzG/ngCVWE=;
        b=ZWawV4+oJOiKX5IAKXGrtbjnqEsGXlVL7dKgz+uPwzBz7QEV7DtcsDUmCPEnWmwpSs
         4ZW6FgIADqdLFyFlY1xB/WaquMKylEsEdJTjfwDW/os0HZJM3J8II2Pt3zPa9pWNEtW0
         dxobD8Fhf5dgpiq9z0fQLQKiXrsGfb0uul8T8mblbFbYxwzEG/Vn6OqsxgHzPH0pA/7T
         Dji9OLUc4fa8lONuaq3gmgJmPhRZQrxCEih33Izg0bBPdfuH9o/9Vh8241B2wafE6MPK
         uC4rQCNwkvN76krmhxbXJh33o5Z5MaLw9kYahZ9OQxToQ/nUjtS4GjSewnjGlQmbES/r
         BW9A==
X-Gm-Message-State: AC+VfDx3DjDS4kw6saSAz0+/QmuQMDYypCighKDe5JEZA40941l6h5vi
	+VPNNJlOwOtikB2M8k/kUzQ=
X-Google-Smtp-Source: 
 ACHHUZ5dFsCRzWBgAhyoG3sD+YVv98rtQyBuK1AwpbLs/ugAraGkuzXE8ahejEHSa8TTw0rWmvd49A==
X-Received: by 2002:a17:90a:5d06:b0:255:6133:f561 with SMTP id
 s6-20020a17090a5d0600b002556133f561mr6328538pji.10.1684846118045;
        Tue, 23 May 2023 05:48:38 -0700 (PDT)
Received: from yoga ([2400:1f00:13:49e0:15f7:15f4:3a2b:204c])
        by smtp.gmail.com with ESMTPSA id
 q31-20020a17090a1b2200b002508f0ac3edsm8077936pjq.53.2023.05.23.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:48:37 -0700 (PDT)
From: Anup Sharma <anupnewsmail@gmail.com>
X-Google-Original-From: Anup Sharma <AnupSharma>
Date: Tue, 23 May 2023 18:18:30 +0530
To: Mark Brown <broonie@kernel.org>
Cc: Anup Sharma <anupnewsmail@gmail.com>, lgirdwood@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, oder_chiou@realtek.com
Subject: Re: [PATCH] ASoC: dt-bindings: rt1016: Convert to dtschema
Message-ID: <ZGy2Hpo4MvmMw4v+@yoga>
References: <ZFUFAmBJXvkQAG7m@yoga>
 <ZFUFrWqOHVmzE+ut@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFUFrWqOHVmzE+ut@finisterre.sirena.org.uk>
X-MailFrom: anupnewsmail@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EBKEMTDJ3ELIEEB6SOSGL724W2KZRLLW
X-Message-ID-Hash: EBKEMTDJ3ELIEEB6SOSGL724W2KZRLLW
X-Mailman-Approved-At: Wed, 24 May 2023 12:21:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBKEMTDJ3ELIEEB6SOSGL724W2KZRLLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 05, 2023 at 10:33:33PM +0900, Mark Brown wrote:
> On Fri, May 05, 2023 at 07:00:42PM +0530, Anup Sharma wrote:
> 
> > +maintainers:
> > +  - oder_chiou@realtek.com
> 
> If you're nominating someone as the maintainer for a binding it's
> probably best to copy them on the patch so they're aware...

Hi Mark,

Do I need to send the v2 by copying oder_chiou@realtek.com into the
patch?

I saw you already added him. 

Regards, 
Anup Sharma
