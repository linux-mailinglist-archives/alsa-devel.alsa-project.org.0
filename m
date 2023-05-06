Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E96F8DE4
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 04:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5478C2CC9;
	Sat,  6 May 2023 04:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5478C2CC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683339509;
	bh=3RFpQuLeHFXyxkLoT4wuawCKoCnS6d864p3WCt9z25o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hh4Sg/UIA0onzkHsYcMhjz+WoaGohNhn6V2nm2zOH+1ito8LouiYpZ2h8DS0QbwpF
	 pfKmLwkB1lxh6AUS+NtCy+aYp3m18KkwCDQFJ6j5ua5OOaiduBcu29X3KvC44vwwII
	 gwvEllVS5Kz+Axv98NvWAx3FTBlqWCSzBf+15RtM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A77D7F80529;
	Sat,  6 May 2023 04:17:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A649F8052D; Sat,  6 May 2023 04:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B49F80114;
	Sat,  6 May 2023 04:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B49F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=WnYB0K/R
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-192adab8f0eso2174781fac.2;
        Fri, 05 May 2023 19:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683339443; x=1685931443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFAVYlj7qY8WZhcMMAJM12ckDqP7+uOsctiYkhqPD0A=;
        b=WnYB0K/RYIM36yLnuuxz6lN/XysQDCUfJKGMh0sSm42TnuWyqSTG52oCtLHB+Am8/7
         o8lLDR6pVF4rsykrELZalweAF1I0xU9Av7Qory5tMqSiHGAACFjMNQsl30NCER5OB5/H
         0Y0KDhni+p7BwBg5V2RF/554t28pNuijL3Kv21aCJBjlN903NIeFgizveXXc0nW4QaXQ
         faVMHLKcG+g2RBk6CvoLLtDS24/VHumDvAx6+1sxXZVrTI2Ojx5cGUTxrtZufDSNS/bV
         euxzCSB0IhtLoEG+J9Xsg4/B8kMk5rf4SFrPypd4aCc/IoaUmXxWuVITjNScqHVRM0Q3
         kOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683339443; x=1685931443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFAVYlj7qY8WZhcMMAJM12ckDqP7+uOsctiYkhqPD0A=;
        b=aq15uJJwZQlXXQBjTOk8L01So9xa791EYYUeA1la/hBepP1dEhcrNLLw+jLEVSVBXw
         7gcp6Gfc3ejUvgbvW3jjjl0kLR630foFNko5l5LTkRk6wp08EeifIEq5zOJp5PAXcfLk
         UMv4t3YdmmL62N3L9HYCnjqqLpNSwGkghEpv+XsUmIy6EN93RZX0fwDMgyO9tH67qPwU
         cdUkbdDFepMESkw52Wz0tPVBbJoKYpfYnmk0K/GkoN1uuzQz3hM4X6B49s44x+dmHDOR
         HIF+cILhPD1kk1jcBebfULTXqLyMkOr1xZH/V1Rt4sbh9s/WTLUGenYKOFzEyRcz6q5h
         pmQQ==
X-Gm-Message-State: AC+VfDyQY4X9JywjmuRKOw7zNupxrcJjBTpgeXojuFmfm2hGxFCuYN+a
	prao3KolHhxZTA8ukKAhUew=
X-Google-Smtp-Source: 
 ACHHUZ4F2DOzT4Z5iHQr9icOfFq60mb19BGPrw3pXmVUqXz1YpEIvdQMPCjtZbMBKTK55/G+ObMDTw==
X-Received: by 2002:a05:6870:822b:b0:192:96ee:961f with SMTP id
 n43-20020a056870822b00b0019296ee961fmr1723338oae.14.1683339442902;
        Fri, 05 May 2023 19:17:22 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 v5-20020a056870198500b001807f020a39sm2545038oam.12.2023.05.05.19.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 19:17:22 -0700 (PDT)
Date: Fri, 5 May 2023 23:17:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFW3KpLU+VJBYQLc@geday>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <ZFVpRKM5vxpWWaI9@geday>
 <ZFWbksDaG2EQNqSK@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFWbksDaG2EQNqSK@finisterre.sirena.org.uk>
Message-ID-Hash: U5BUFI7WDTTC4OQQ4AZBYXJ45AZSYTXA
X-Message-ID-Hash: U5BUFI7WDTTC4OQQ4AZBYXJ45AZSYTXA
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: postmaster@alsa-project.org, sound-open-firmware-owner@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5BUFI7WDTTC4OQQ4AZBYXJ45AZSYTXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, May 06, 2023 at 09:13:06AM +0900, Mark Brown wrote:
> On Fri, May 05, 2023 at 05:38:28PM -0300, Geraldo Nascimento wrote:
> > On Thu, May 04, 2023 at 10:09:45AM +0900, Mark Brown wrote:
> 
> > > Here's another mail (one of several in this series) that got completely
> > > mangled by the alsa-project.org mailman to the point of unusability.  I
> > > didn't see any response to my last mail about this, is there any news on
> > > fixing mailman to not do this?  It's extremely disruptive to working
> > > with lore.
> 
> > Are you complaining about the added headers in the message? Because the
> > patch itself didn't look mangled from my side. From my understanding,
> > Jaroslav had to start mangling mail addresses due to strict DMARC rules
> > which make some servers reject the message from alsa-devel.
> 
> Not just the headers in the message, the author information for the mail
> also got rewritten.  Try applying the patches with git am...

Mark, I think Jaroslav can change the behaviour in the the added Headers in the
body of the message (the added Headers in the body have e.g. the correct From:
email information).

If the message body *starts* with the "From:", "Subject:" and "Date:" fields
I think git-am will pickup the correct information from the body instead of from
the mangled headers.

Hopefully...

Good luck,
Geraldo Nascimento
