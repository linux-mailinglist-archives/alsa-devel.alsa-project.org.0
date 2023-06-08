Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F48729D4F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:50:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E39582C;
	Fri,  9 Jun 2023 16:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E39582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322257;
	bh=oPLLXqHh6cDUoQ+4Mo6q6CzulzpLWC1AODhQizquB6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TEpK/Pxu0EX5c+C+fDGc8vfT6cVUcUGdNcdWKPw7GebEESuiN601Fw2xrBMbKaNPv
	 b+n4HSjh6ba8Ym9ZY/kEUSu0K61br+gBh/kjEq49NEteh9Tnt4hphTXXPCpnvDPcsS
	 Wtc5g//BLla2VfZ+ysqRkIfLyt5dFen2msMfgkOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40FBEF805F2; Fri,  9 Jun 2023 16:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42570F805E8;
	Fri,  9 Jun 2023 16:47:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F561F80199; Thu,  8 Jun 2023 10:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C221F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C221F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gra6jAlo
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f7f6341bf9so2792195e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=gra6jAlodbU30t5m7gbdPhx1pmD3IYs4W5CF5e7hZz0ughSR54Qmhb0FbJWse1Xlm1
         XdkDYHT+hlIKFWiiLJznQwhuxbGB9YuXZh4ntt22vuiYvDYkACBpWgER6p6r72F/Rh0H
         vSqJo1zRg9aIqJRGg10zUQSMhHH4lVZmTeok6WF4OWh8Dn0ls4YORpjvQU30QHQp2hL3
         dfhtKEIW5f3FTrczaxzXv1CvHEPVLZ/97Z/FZ1tgXON9l+d8tAUWIpv758ut5jfiDuvl
         1lB3D1lkIuQ/yEhN0TUavj6iR5hTRCPAWRUBn/UTtS0tpLfPXvLV0TLHq+nstox4cO/y
         wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=avpS9Jugtxx5HIWuFrQKurzMOv0lK5QxjhsmMKSVKdt93762UFtE/GXghP1eGAuz7r
         TTvNgGliYJK/zDDTJYSx2rtdI3UVyNs8Zz68Khwjo6/E8S5iPNJ54+8n5Ba+d/4IyG6Y
         szbMpIlQSnExzrbSq9uW+VnLyDaIGCzRzu84gQg1bWuL1IsnykE+pG7N8WKX6h6E/plF
         mBrfQSqLFg65pYSu7Jc4meV4lwRiUKnyuYKeaQ0W9D9nvoBLlgP5jUG19cVTxsaysQq3
         AUMWj38Kr0QruAEHlM6q9fMCMGn+l80RxzDOwaM12th0QSe/yNYticzk/9hEnT34k92a
         Zoiw==
X-Gm-Message-State: AC+VfDxVrN9xI8G9Wros47DJjxy4YQJ5U9gV/njzG7vGQeQf3OnqlWB4
	yyI8XiYvjY4Nfe6+M+rv85d4OA==
X-Google-Smtp-Source: 
 ACHHUZ5Oj7KBjt/jU4KYcCWRyKtv4qWOgTZdAtGVt+sxedJk020uqbAfEPNcT/IfNVY3AFUKbwvv7A==
X-Received: by 2002:a05:600c:364b:b0:3f1:93c2:4df7 with SMTP id
 y11-20020a05600c364b00b003f193c24df7mr780513wmq.5.1686214672973;
        Thu, 08 Jun 2023 01:57:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c379100b003f4e3ed98ffsm1259957wmr.35.2023.06.08.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:57:50 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:57:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <72aee5eb-792e-40c0-83a5-79618fca30a3@kadam.mountain>
References: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
 <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NSTYMCAQRJ52SH32L5DVJCGBJFND7ZBZ
X-Message-ID-Hash: NSTYMCAQRJ52SH32L5DVJCGBJFND7ZBZ
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSTYMCAQRJ52SH32L5DVJCGBJFND7ZBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 08, 2023 at 04:02:07AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 17:57 +0300, Dan Carpenter wrote:
> >  This code triggers a Smatch static checker warning and does sort of
> > look like an error path.
> > 
> > sound/soc/mediatek/mt8188/mt8188-mt6359.c:597
> > mt8188_max98390_codec_init() warn: missing error code? 'ret'
> > 
> > However, returning 0 is intentional.  Make that explicit.
> 
> Hi Dan,
> 
> There are several similar instances in this file. If using 'return
> ret;' is not recommended, should we update all of them simultaneously?
> 
> For instance, the value of 'ret' at the end of this function should
> also be zero.
> 

I would prefer that, yes.  "return 0;" is always more clear than
"return ret;"

I didn't change the "return ret;" at the end of the functions because
they were obviously intentional.  I'm doing static analysis and I have
an unpublished check which complains about the return ret at the end
of the function but I'm not going to publish it because that doesn't
find bugs and I'm only focused on bugs.

When we have code like:

	ret = frob();
	if (ret)
		return ret;

	if (x == 1)
		return ret;

More often than not, that is a bug.  But if it's code like:

	ret = frob();
	if (ret)
		return ret;

	frob();
	frob();
	frob();

	return ret;

Then that's probably not a bug.

regards,
dan carpenter

