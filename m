Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C965B710DB8
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 15:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20EB200;
	Thu, 25 May 2023 15:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20EB200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685023088;
	bh=hIMk49WSAntmRpXZ3LWtOaRO3o9HO9ckAcwplUfZNbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S7PfOVSQxwpb7CnVTiksQO92yFtSTZd8s0wsXGWQlXw2ojyNU6RQHBLh2eSoFeuwB
	 TG0B1QaaSoRuPNE+M8Vgd/cpGiF5XAhNl+i+2qd17kOc1SyoyHtaOYvwY8C+WTp5PO
	 sm4N4qNXMX3u7m3HihSq1xgaQEJtCQLsLNRXso54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3412CF8016A; Thu, 25 May 2023 15:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE46F8016A;
	Thu, 25 May 2023 15:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C734DF80249; Thu, 25 May 2023 15:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB944F800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 15:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB944F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=TTAz3FOg
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-55db055b412so8453437b3.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685023027; x=1687615027;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XDo5JGpMh+sfqhz2XW6FMxspF0XjVpH9YEGVgGeMjUw=;
        b=TTAz3FOgo7dOFNI7aoiwX/0ljg5lz0wR0gFOezPqt9E1Ubrz1VqGe6aviRVmBjQGxY
         mXF1M4aX7QL2DpYmXW1TLEnGsA82U73NiD17Sw4DpyLEEwxDd2CN8/TSuyiebDJmdOph
         9lipSq39yElmxJTXAJncx/josTWvpCiYdKGmBZImHlwizI4ySjj7iYIFLn4+gNqcXAzs
         5TtwqWH0jseD8nGeXTCwlMNZ9CzR5pQTY1ZGIT8VvzV0c28G2BmAPDp9CEHdDsMMBy8T
         pKHknHW4hdN5A5n6z4//aTrHaniwuIvHJsTye3wn20Oy2P21nWwS90GzEUC3GRbupZ6U
         sOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685023027; x=1687615027;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDo5JGpMh+sfqhz2XW6FMxspF0XjVpH9YEGVgGeMjUw=;
        b=SKQXel+siKX2kYc3bR3O8Q/Sg6v48/zC33vieHERKb5zkK/lvhCCxRv7PAgw0RK6dJ
         k2ZHqYtNsK1hFGD4v43nbTAdte/zZtFGgZnxLRArPzlIQxzthunOt7g+5hrCO09oKef7
         XQPs9vIg1l24wXYlRhQGlsAXan8UV75wa5uELPA374eSzCx71HQg7X6bnVrK59TOukpB
         PehXa+G/FF+jC8+FbZyKJx8elB0zJmoxRC0jGgs8HpsEdxX3HzUWTpp4p8+xTApX4rG8
         izY+aJ63lKVtANm81/2+c9EShmXGPeaI9FWU3wfzi7uZ6SvRxd9AAyj8ZnjuoJknxKnz
         Mmbw==
X-Gm-Message-State: AC+VfDwg6JTtQdCvrY/OJ/DTJYGwSZSaJKJSOAwIiJRRQZMJj+lbdB4Z
	lzEY1f1+OgeOW4+5sw94UBE=
X-Google-Smtp-Source: 
 ACHHUZ5FiUL0rUUkvwykB8kqe+2IeLANHjnUXgIdMT6rP0bdidLHdnLmRMsDhL1wP2uFZ72SwMPzNw==
X-Received: by 2002:a81:4ec7:0:b0:561:987e:27a with SMTP id
 c190-20020a814ec7000000b00561987e027amr3756808ywb.10.1685023027566;
        Thu, 25 May 2023 06:57:07 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 c184-20020a0df3c1000000b00555df877a4csm371333ywf.102.2023.05.25.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 06:57:07 -0700 (PDT)
Message-ID: <646f6933.0d0a0220.e2a16.15a9@mx.google.com>
X-Google-Original-Message-ID: <ZG9pMemLwjqAuaWz@neuromancer.>
Date: Thu, 25 May 2023 08:57:05 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, zyw@rock-chips.com,
	sebastian.reichel@collabora.com, andyshrk@163.com,
	jagan@amarulasolutions.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, heiko@sntech.de,
	conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: vendor-prefixes: add Indiedroid
References: <20230523213825.120077-1-macroalpha82@gmail.com>
 <20230523213825.120077-5-macroalpha82@gmail.com>
 <20230524-extrovert-unhidden-35e289c28bc4@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524-extrovert-unhidden-35e289c28bc4@spud>
Message-ID-Hash: WZAUSFPZFQ54QJLZIHCRE42NB4LJE6DT
X-Message-ID-Hash: WZAUSFPZFQ54QJLZIHCRE42NB4LJE6DT
X-MailFrom: macroalpha82@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZAUSFPZFQ54QJLZIHCRE42NB4LJE6DT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 24, 2023 at 09:30:03PM +0100, Conor Dooley wrote:
> On Tue, May 23, 2023 at 04:38:23PM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Indiedroid is a sub-brand of Ameridroid for their line of single board
> > computers.
> > https://indiedroid.us/
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 82d39ab0231b..632662be6e65 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -655,6 +655,8 @@ patternProperties:
> >      description: Iron Device Corporation
> >    "^isee,.*":
> >      description: ISEE 2007 S.L.
> > +  "^indiedroid,.*":
> > +    description: Indiedroid
> 
> Can you add this in alphabetical order please?

D'oh. Simple mistake, sorry. I'll fix it in V2.

Thank you.

> 
> Thanks,
> Conor.
> 
> >    "^isil,.*":
> >      description: Intersil
> >    "^issi,.*":
> > -- 
> > 2.34.1
> > 


