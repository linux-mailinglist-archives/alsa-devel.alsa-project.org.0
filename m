Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC76FD4E0
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 05:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21B3F4F;
	Wed, 10 May 2023 05:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21B3F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683691198;
	bh=uujRn4j1RtHVhR7k0wx6EUo8LiOT/vrCYC4+Kzuz6WQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GaWn95zK74XnUwWCl7aaIhHLcafKItA/TXkC1mnMKzRcMy9apKygyP3kKmjE6MXft
	 6PrVLwFCtb7grUlX+RL9YA6SZ3E246JNQznfh/weSAgYRxR4o2+8fZ4432bXYY1ySM
	 K7tE8R0mh5nJlZPYSfddloLRNOY6lZTG8xF3GvMo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAF0F8014C;
	Wed, 10 May 2023 05:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01B0F8032D; Wed, 10 May 2023 05:59:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 574FFF802E8;
	Wed, 10 May 2023 05:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574FFF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=HF2l7WQI
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1924ec320c5so5260766fac.1;
        Tue, 09 May 2023 20:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683691135; x=1686283135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNsl/pNeSnMR5DQWhsPAvAhq9kalbjCKMPhOuDJ4s0g=;
        b=HF2l7WQIlTYGpjWYRRBIGR8rOePFR65TP5KwRJGtcAAvx0AgXgKC2jmeWv10LHIbLx
         SegfaYkwgPFYrDk+e+xu7HtS0w7YMA9FZglKGYQdc443qAvAmiqHm/xmUnGVx44BH1Sq
         Gj3rCYcxUa24ITISnJ/G8aWM9XJsRsE6y/zNPsYEpVsx9g1yLzvn7xjjV8vifRrpOTeg
         ClYWp4rsz3NO9LOr1qLSvXlPkS6h5ReE1vYoMLHHYbrz8xR+BVYkPz/V/ZszGyFcFgb7
         1fe+J38jq6DNo2dTBsHnVZRVrW12dC/cekMj3I6rt9qEUsYqHcGr1TWZmiSgbPfBrhhs
         7u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683691135; x=1686283135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNsl/pNeSnMR5DQWhsPAvAhq9kalbjCKMPhOuDJ4s0g=;
        b=ImURALfeMX+tEhMpBsWDNG+GQkKMwWRbMzMn9/ADz6//Krd4h6Aa+hGO5SGiPDN6Lw
         KBAg1pwjTvbwNRdtSyCguG6G30C20vWJXQlw4k76ymWtE8U4AvFuZqdwYfaVVetCRWWc
         OrCZmN9E2rQ+pnj/ZP+YBr9BrcBzpCBVftqVim8dp05e/9V2VyCchOIbirMQatkcHbIr
         EndkhjXtXLgaGYYqvhci0y2H0P3eAIZqOjd15fuf8n49M1WnZqffbyje3yIgkrBhJlqL
         UdUcs5x1QDqtOp9fe+jZKNyHl2caa1zMLWlP67Qod20QrZvSjI6j1welWW+5+eXhUInv
         Wo4g==
X-Gm-Message-State: AC+VfDwBUVPnjBjhZFu0gfw2v5V9se+dxiGzf+oOrTvPMBOhv40MFgAt
	MMyHMm7rF2qbCZsb8uPASXk=
X-Google-Smtp-Source: 
 ACHHUZ5QwGkxKHAFYeUrK1k/LXRxYT5HlMQiIITBVatZN+1/DfxkYM1VE89egDUgyXUuAbiSQbavNA==
X-Received: by 2002:a05:6870:1842:b0:180:1faa:7c1c with SMTP id
 u2-20020a056870184200b001801faa7c1cmr9970706oaf.46.1683691135033;
        Tue, 09 May 2023 20:58:55 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 v44-20020a056870956c00b00184591ae6d0sm6689469oal.26.2023.05.09.20.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:58:54 -0700 (PDT)
Date: Wed, 10 May 2023 00:58:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <ZFsWgnAQy5Y/rwyb@geday>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <ZFpaOVRc2E/CZBHI@finisterre.sirena.org.uk>
 <10075912-5c0b-549f-58e1-1323683d250d@perex.cz>
 <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFr8B5UFx16sz7S0@finisterre.sirena.org.uk>
Message-ID-Hash: 3FQDUESRCDWWPBAHWXRDEX7KNB6E3DKW
X-Message-ID-Hash: 3FQDUESRCDWWPBAHWXRDEX7KNB6E3DKW
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FQDUESRCDWWPBAHWXRDEX7KNB6E3DKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 11:05:59AM +0900, Mark Brown wrote:
> AFAICT the only other option is munging the From without enclosing the
> message in a wrapper?  That's potentially marginally less harmful but
> it's still going to break things badly enough that I'm not sure it's a
> worthwhile improvement.

The readymade mitigations for DMARC in mailman 3 are
"munge_from" and "wrap_message". The fact "wrap_message" messes
around with signatures in mutt is definitely not a good sign,
and "munge_from" will change the author's email and name from
the perspective of git-am.

The middle way could be to patch mailman 3 to "munge_from" while adding
the correct "From:" as the first thing in the body of the message if it
doesn't contain one already. This will make git-am pickup the correct
author's details and it should be some simple logic.

If Jaroslav is brave enough to maintain this supposed patch to mailman 3
in case it doesn't get picked-up upstream by the FSF folks...

I understand the maintainers needs must come first but it will be
terrible to get the GMail bouncing behaviour again, I don't want to
press the point since Jaroslav already made the speech I think it
was needed.

Thanks,
Geraldo Nascimento
