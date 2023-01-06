Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D9465FDFD
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B437141FB;
	Fri,  6 Jan 2023 10:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B437141FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672997487;
	bh=5XOoMWwkwfbXXb1eEC/iNime0W1YK/KAIhYYBiHgoTg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YclZjy34bN64ABr39V9MivYtQOpO5XGuK3E78EM9rR+815L3WkSzhLKiJODeW5C3i
	 QkB9MTkB2BWUQjNG3FZUfk1yBAV1byOJjq/w7BHkgFKxX+jVD97NsWjVG7x0R+A5KT
	 xUiF4pxzU7r0keJvZbWcio0wbp9BCApXJ4B6BRD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B751F800C0;
	Fri,  6 Jan 2023 10:30:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AFA6F8024D; Fri,  6 Jan 2023 10:30:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEC7BF80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC7BF80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ijIrjgVu
Received: by mail-wr1-x42b.google.com with SMTP id m7so732726wrn.10
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 01:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nnGDVmTsDiJKFzYr+yKe0LykHnV28T2mA0YhHi9vDhM=;
 b=ijIrjgVuDPHVy/di3bOTjx5694eE7iYPGEhrKqJJPXg36+N5lqXifzv5b17mYcaTPk
 T4U+Ar6VEdKbF9spnHdJ7RLPltPluS+x+qxF8pVUEhthro7M4oUjCGtN1DqZBsESckxU
 5g2EMkNcdb82aBwUsHQizn499x8FjgHxgasYKB5DszJ2LSpBLPWremMlJB79Y25AKhNf
 DQGb8tWiCFmxektEpAFhC0z5H7yC7G5ad/eVuGgb4A+zC+mVs4SSsr03txlsCkN+NTuf
 RsRdDtsj8maimxy1k9oRn05YbYiEoGmw4o1D9pQUio7HW4vywOsgOIPyuX24TzwO3Xws
 CFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnGDVmTsDiJKFzYr+yKe0LykHnV28T2mA0YhHi9vDhM=;
 b=QnxWNgruX465MZ5ysEnsGOaoh3FUW0xTc5zBLDUhA5OFGNLItSHZvL7XAiRW6w1VIi
 JNDff/ljGkNmuZzrCq1vzNPtLaj5PSIL8aPre+GsKaMldUwri4ZvRHumjMK1YrxCni3G
 muv+3bhXU7XgGAG/42/EI1plDvcv0q2uchjuZD1Aj+pHkuQTiU1UCwX8V69bNWfnqaM1
 m1XRg0RMUnO5crSVk9qwaB5Y/W/rEP3+yOVa8Ct16UAh6uwj4LCsPpZHGr7oBEuHnz1s
 9y5TXAk6gjV0WFT/e0AlcbGh02mnLD3pZWbGYTeHkkzCSYr1k7RTftLATCly1MrFtWC2
 BDFQ==
X-Gm-Message-State: AFqh2kp/5YJsVfHxiccNPyfb3WsLav2Lb9sGA44/dekBx9JuXVHzLRyE
 LWDyfweqBoMEt2Rrqpe9jjeMHxkgun7H7Q==
X-Google-Smtp-Source: AMrXdXuddYIgLpoJiKbIZf19xkwabuAlIe/L0/3ggS+ZHDHmFdhjD7BDyLhCXuU1wVO0t/lQyaXWzQ==
X-Received: by 2002:adf:ee06:0:b0:281:aec4:71b7 with SMTP id
 y6-20020adfee06000000b00281aec471b7mr24471667wrn.64.1672997422215; 
 Fri, 06 Jan 2023 01:30:22 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i13-20020adffdcd000000b002a91572638csm596007wrs.75.2023.01.06.01.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:30:21 -0800 (PST)
Date: Fri, 6 Jan 2023 12:30:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 14/14] Fixed the retry_cnt bug about being zero
Message-ID: <Y7fqKTurjruCKw97@kadam>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
 <20230106091543.2440-15-kiseok.jo@irondevice.com>
 <Y7fplQ18qyhKDC44@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7fplQ18qyhKDC44@kadam>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 application@irondevice.com, kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 06, 2023 at 12:27:49PM +0300, Dan Carpenter wrote:
> >  	for (index = 0; index < ARRAY_SIZE(sma1303_snd_controls); index++) {
> >  		sma1303_controls[index] = sma1303_snd_controls[index];
> >  		name[index] = devm_kzalloc(sma1303->dev,
> > -				MAX_CONTROL_NAME, GFP_KERNEL);
> > +				MAX_CONTROL_NAME*sizeof(char), GFP_KERNEL);
> 
> sizeof(char) is not required.  It's always zero.

s/zero/one/ obviously.

regards,
dan carpenter

