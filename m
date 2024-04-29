Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF978B62E0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 21:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CD49839;
	Mon, 29 Apr 2024 21:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CD49839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714420273;
	bh=eVY5B9TKSEJHZydMdH45kMqzzeNFXqTEx/rOwKxe4KM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nICjCAemePc+XIvKkW3ZRL3w9VyZGdPEyy8teQQ/rPcVnAcxaNmsUIJR3cR8gS+zA
	 yoO1d7gpjiPZj1WudwgdBq7kAWQUMt2GMI4RTGPxgSG0hHBJfEuPIZH3PBZtc4m247
	 hgYQKIlM60VrDSPmO+dNPcBhs7nr36J5VOH1Mt3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 691B7F805AA; Mon, 29 Apr 2024 21:50:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4F4EF80587;
	Mon, 29 Apr 2024 21:50:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5DCEF8028D; Mon, 29 Apr 2024 21:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E6BF800B5
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 21:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E6BF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=UPXWce0d
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1eac92f7c74so38072725ad.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2024 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714420225; x=1715025025;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t66m2yC6w51sUPxTLrw0e9BFXrR1zy7lTroSpOOOXcU=;
        b=UPXWce0dvxccc7hf8f1Xlx+9gy2OufewTBIqNIHuQxYZcu8u+Xfy1pLn40If0YMmDQ
         mnogEMzp8XvJT1CT/v+QQAcGHg4FU7K5Ch7A3YA+PEmL4AduZ6dX+IOBapf5L6atpeJF
         1s7ABd67Q4Xo+ZuGuiAYNDtp+A40qvFSipRow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714420225; x=1715025025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t66m2yC6w51sUPxTLrw0e9BFXrR1zy7lTroSpOOOXcU=;
        b=Yj33TrQUWYZYl/1VYjz01Zy8tiC4HfRlmWR2RoHJvr7TMCMBnnEW3oZvkcBKLoTdY4
         29huKhNnrkj5eNkw9yZ2Wd7rAt/oNPTAmUUv1OgLGg+VkxjI+VZjoPKLN6J3J/iX/WTN
         veMhlWT3Vl667P40S4xiyNUmT8opf8CPLBy2vIG5TDalGh/ZtCEaUneSE+yQR0i27lQ3
         7dOthzwqDihlOPZbBhe0Ny/PNuz0ID7aMj/GUjnqSe4nZlzQH5hQeapiPirQdxbHt85T
         2qtsoW0PScXwDLE/Nq/bWK5gNbnj/IX631e03ishmf2npDLUzP+PCI8z0lVkTp8pkhyK
         IknQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWECJ8Gzrg+d8EBm8s2qR6vDZqezqMtlhhQqJr9zsGuyH/tUozX8RnYDigcG3VWDfR9s/2EWo+TYAJumVSWPBBwe+87AHoB1RG6R/0=
X-Gm-Message-State: AOJu0Ywwzq0BZSTz0Azya/oBfR699iFkN4I0O0RRIH3ZIpSsWktGWoQw
	2gXO3hTe36uUHdNYxueQt574NrH8YBH0uDqU+etW3hz18RmfDP5UFXwJfUkffBm1fUw8IGpCa4Y
	=
X-Google-Smtp-Source: 
 AGHT+IE+SteDEJUNTAb7/nI8MNDpW/XVg8ijQNerSCdwLAPwwr/v5RyMt4I/w7vZ1LzWcXiblxshPA==
X-Received: by 2002:a17:902:f7d4:b0:1eb:5b59:fab9 with SMTP id
 h20-20020a170902f7d400b001eb5b59fab9mr618246plw.53.1714420225318;
        Mon, 29 Apr 2024 12:50:25 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 jj1-20020a170903048100b001e2526a5cc3sm20699547plb.307.2024.04.29.12.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 12:50:24 -0700 (PDT)
Date: Mon, 29 Apr 2024 12:50:24 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH 0/2][next] firewire: Avoid -Wflex-array-member-not-at-end
 warnings
Message-ID: <202404291250.FA94E630@keescook>
References: <cover.1709658886.git.gustavoars@kernel.org>
 <20240306011030.GA71684@workstation.local>
 <6a7854af-a183-4db2-8400-4d9eb0cc4308@embeddedor.com>
 <202404291129.F261DEA21F@keescook>
 <90ddce3b-1ad5-49be-89f9-2f3e48d73e19@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ddce3b-1ad5-49be-89f9-2f3e48d73e19@embeddedor.com>
Message-ID-Hash: 7QYIICQNM2PFS7TDABQRBDXBAN62F7NP
X-Message-ID-Hash: 7QYIICQNM2PFS7TDABQRBDXBAN62F7NP
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QYIICQNM2PFS7TDABQRBDXBAN62F7NP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 29, 2024 at 12:42:23PM -0600, Gustavo A. R. Silva wrote:
> 
> 
> On 4/29/24 12:30, Kees Cook wrote:
> > On Wed, Mar 06, 2024 at 10:18:59AM -0600, Gustavo A. R. Silva wrote:
> > > 
> > > > Thanks for the improvements, however we are mostly at the end of
> > > > development period for v6.8 kernel. Let me postpone applying the patches
> > > > until closing the next merge window (for v6.9), since we need the term to
> > > > evaluate the change. I mean that it goes to v6.10 kernel.
> > > 
> > > Sure, no problem.
> > > 
> > > Actually, I'll send a v2 with DEFINE_FLEX(), instead.
> > 
> > I was just going through the patch tracker to make sure stuff got
> > handled -- did a v2 of these ever get posted? I don't see anything in
> > the tracker nor changes here in -next.
> 
> Yes, it's in linux-next already:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1d717123bb1a7555a432e51a41709badf8545dba

Ah-ha! Thank you! :)

-- 
Kees Cook
