Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C896B6FE347
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E058103D;
	Wed, 10 May 2023 19:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E058103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683739838;
	bh=XH4T4vZiKRLT3I1DGdLOd8mNk0vYzY/lXvsrEJOsIOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/deyrzmmflx4YayiGlNCitElWFps1qwoqiB8sOS+GxBPhR6FFj4U2bKydxm3nw9A
	 Ql2uTmmV0U198nkIma+cf4cu0NeBVAnHRZAU0oi9FbapglPIavxgUe/ukWD0skgOxX
	 hLM0Kfu0bY0YH8tPeyOqfqVyG+gPC7DA5SnvV/KA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D0DF805A8;
	Wed, 10 May 2023 19:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6DA0F804B1; Wed, 10 May 2023 17:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26BABF80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 17:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26BABF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=Z64/Qq+w
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ab1b79d3a7so51025415ad.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683732852; x=1686324852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGdFz0/zjmSNSCKPr7WJdZcKjw9j0mmsRhyFM3AdzZ8=;
        b=Z64/Qq+whciUuURvLPSSLNXJsMVVO9UzGc7+2vH3ndyWEL8InooBZXNkZ6SsZ8O27D
         u+mgNx4dIYVksmEe3JICSaS8GP/ZTiEJmObBBJL58PodzvlZ0WFH895OapgWd/xQTjQe
         T+FNNCtUI6XPelHwAADWkZuEotb2Th824aAsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732852; x=1686324852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGdFz0/zjmSNSCKPr7WJdZcKjw9j0mmsRhyFM3AdzZ8=;
        b=ewEe74714tq8oz9kUy8jUocOemubX/IJQvzgKRWYxxlf7dmXzIj4ToxFN92B337VVL
         TTvDsxESjCfzgNsJ6Q2sAAJ237HQnR2KPUu3/+C0mmbs14SfRdqxiwjjuq1Yn9W8nMG+
         B85yKeLli4kr0fgMbwSqESwyIY5tYa983iVNzTGN1cQG13/aIysSX7D1fd12/z3HB6AE
         YWiBnlop0NFq8aUigM3Ep7Bhp4tcAEhI/LazfhIOjbSoRmy/11gnXXCz1L5Zp8V1OMdg
         g2nLn1lGOECa/XJa20ZKP0P6AKVE6sFF+ULG5S3xhLTV7tc5hJm5o5owzzVJ2QQWRhDJ
         n2rg==
X-Gm-Message-State: AC+VfDxP7yZYBDzZvYXssJ+aVMBn4JEon80ro+oIZMVi3YO0Js2qH2XH
	ivotvkrBGj1e8l9pEPldITF/mg==
X-Google-Smtp-Source: 
 ACHHUZ42Sjj5AJhiyiK9jmDbF+eqHiaZDBDaaPbfSPKop3diRiUTiPZyrnz94h95O2PfvNk+EhZ5Ow==
X-Received: by 2002:a17:902:7e84:b0:1aa:f173:2892 with SMTP id
 z4-20020a1709027e8400b001aaf1732892mr16702837pla.57.1683732852375;
        Wed, 10 May 2023 08:34:12 -0700 (PDT)
Received: from nitro.local ([2001:4958:15a0:30:e305:5a3c:4c5a:1bc7])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a170902e54a00b001ac741dfd29sm3926896plf.295.2023.05.10.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:34:11 -0700 (PDT)
Date: Wed, 10 May 2023 11:34:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
Subject: Re: DMARC (Was: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC:
 mediatek: mt8195-afe-pcm: Simplify runtime PM during probe])
Message-ID: <20230510-robert-diane-joe-846d41@meerkat>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
 <87o7n0mtv9.wl-tiwai@suse.de>
 <87ednwmssr.wl-tiwai@suse.de>
 <87wn1jdzuq.wl-tiwai@suse.de>
 <e76c1395-5eb2-849e-120d-1b7389fc97c7@perex.cz>
 <ZFoUaNKBkIgbW0rD@finisterre.sirena.org.uk>
 <ff43dccf-ba6d-d7fa-352a-5d5a8c4b977f@perex.cz>
 <20230509-mug-private-mess-6a36d2@meerkat>
 <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31969101-c1cf-4956-6446-2243ccda0c65@perex.cz>
X-MailFrom: konstantin@linuxfoundation.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HJSVN2EBFHA7OST5ALPFBW3BQDJ3VXY4
X-Message-ID-Hash: HJSVN2EBFHA7OST5ALPFBW3BQDJ3VXY4
X-Mailman-Approved-At: Wed, 10 May 2023 17:27:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJSVN2EBFHA7OST5ALPFBW3BQDJ3VXY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 09:50:24AM +0200, Jaroslav Kysela wrote:
> > It is perfectly possible to operate a mailing list server and be
> > DMARC-compliant (at least for DKIM-signed messages) without requiring any of
> > the horrible things mailman-3 is doing:
> > 
> > https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html
> 
> I wish that it was as easy.

It is. We've been operating DMARC-compliant mailing lists for many years now
without needing to mangle any messages.

> I don't see any references to RFCs in this text,
> so we cannot verify the contents. As our mailing list does not modify the
> headers and body, the DKIM is correct for our messages, but it does not work
> practically (the mitigation was turned on recently, so I know how many
> bounces were present).

Can you please show me the message that was no longer DMARC-compliant after
passing through your mailing list server? I will point out what made them
non-DMARC-compliant, and it won't be some builtin incompatibility between
DMARC and mailing lists.

> Also, RFC7960 does not describe this:
> 
> https://datatracker.ietf.org/doc/html/rfc7960#section-4.1.3
> 
> especially:
> 
> https://datatracker.ietf.org/doc/html/rfc7960#section-3.2.3

These talk specifically about messages that were modified by the mailing list
software.

> and see note in:
> 
> https://datatracker.ietf.org/doc/html/rfc7960#section-3.2.3.1
> 
> So "keep everything unmodified" for DKIM is just only one part of the
> problem. Perhaps, there's a RFC update somewhere which adds another note.

I can demonstrate to you millions of email messages that passed through the
mailing list that are still perfectly DMARC compliant -- you seem convinced
that it's not possible. For example, here's the authentication header set by
GMail for a message that I recently received via the tools mailing list:

	Authentication-Results: mx.google.com;
		   dkim=pass header.i=@gmail.com header.s=20221208 header.b=YVg2o3VH;
		   spf=pass (google.com: domain of [omitted]@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=[omitted]@gmail.com;
		   dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com

So, I'm just going to repeat this: operating a mailing list and remaining
DMARC compliant is perfectly possible, provided:

- the original message is DKIM-signed
- all existing headers are unmodified
- the message body is unmodified

-K
