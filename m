Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49766562
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 05:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148AA166A;
	Fri, 12 Jul 2019 05:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148AA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562903677;
	bh=inFTjiKlBR24toak1aFOuukoJM5VFnThanQ7ng8jQU0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVQVB5opOitfU0hQcd4xnwbd6MA+l1zl3Eg9t/qnEyntDa8K280xlldp4rXGM2cab
	 X+Md+Gwq0ZQ2R5OhHwvjLPIKx9ZOCzv3vBF4mls/h24arnBwlMDyH8YqVOGrlU106v
	 k+6AS+FgMnCN81Kjcngnn9ChXGvRPfVR43yIzICY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE49F802A2;
	Fri, 12 Jul 2019 05:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40B4BF802A0; Fri, 12 Jul 2019 05:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB7DCF800D2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 05:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB7DCF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tId65nli"
Received: by mail-ed1-x544.google.com with SMTP id r12so7908814edo.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 20:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P3Q6cX33JeEZeR4z0+wnkhuDYyByu9jPKIafQF/Bv80=;
 b=tId65nli6ZbZrOSSIurWH63eDKaybL2rMPGTvVrKcH5FO/Pb7tnabHWtdkmJ0UQ5t/
 Ah81xW4NiL530KsJOQQb/gUCzHQdtoseJi4K96kWRABaJrlDRX55Va79dc311qfiVX2w
 YqJ84pkdatHN7TarR6ZZwYLQrBr8yMrVhKchOciIxyq89gX8iMKpgeoM/IM/Gxk40F1v
 EQ9OhkPLcQcoD33yrGbp20dfOXpOX2DP1X4ZoWoqdIi4lfduRAKR9l7SU3x+iL5VTf66
 cI0UgCHTaMYEDrrXuDVhL3ESiubl9jPPc3+9yeyczKmuGnMGzyk8+/9fS8FOexqfFRX/
 UTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P3Q6cX33JeEZeR4z0+wnkhuDYyByu9jPKIafQF/Bv80=;
 b=VEDqe6ieKk+eSvJv1SQXPERTxY749Cn1iek8HCqCLNOqFp3Njf7QRr2bSBTLM3IMtg
 btu0aJZVVpr7/bQTxCy24HNseueao0LfymGTBG5g495pLPPA8/e545eBW1iWYveimg2l
 fEkzxaO6yTy2wBRft7eUMadwM2LyALonoxEzPd6paEa+DM/r5RcAlEhF8N3dAP2pz2ws
 nMUUT9nVkUo8jKkBmZUKA4BVznt2pOC7KKhz1xYChkhR/pSfZ0pWxNRiAqtDrTzQOLxt
 ZoQyKjdDwZHZr5xWthhJf4njPdsAAoaM9T+U3kuNHNm4kqEPQdCPkfuNlFir41/H8bAD
 015g==
X-Gm-Message-State: APjAAAWTsmwOiLncp9V4bVzGGS6BcSpU07/I7Q+lRejWFKkGBpg2bNdp
 V1iUrcz75E2aliFWg3D88eUxJlM6cAtDAw==
X-Google-Smtp-Source: APXvYqzEjKEpqTBdWuCG3TIWxHn33vt0SO56sxvUtIo1lLnAof3zAVpB874ZMsIU3Ox+rWUU4SWaFQ==
X-Received: by 2002:a17:906:a481:: with SMTP id
 m1mr6078797ejz.87.1562903566598; 
 Thu, 11 Jul 2019 20:52:46 -0700 (PDT)
Received: from archlinux-epyc ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id gz5sm1532335ejb.21.2019.07.11.20.52.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 20:52:45 -0700 (PDT)
Date: Thu, 11 Jul 2019 20:52:44 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190712035244.GA67442@archlinux-epyc>
References: <20190712014357.84245-1-natechancellor@gmail.com>
 <20190712014554.62465-1-natechancellor@gmail.com>
 <87muhk53j1.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87muhk53j1.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>,
 Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: audio-graph-card: Constify reg in
 graph_get_dai_id
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 12, 2019 at 12:37:51PM +0900, Kuninori Morimoto wrote:
> 
> Hi Nathan
> 
> > clang errors:
> > 
> > sound/soc/generic/audio-graph-card.c:87:7: error: assigning to 'u32 *'
> > (aka 'unsigned int *') from 'const void *' discards qualifiers
> > [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> >                 reg = of_get_property(node, "reg", NULL);
> >                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 1 error generated.
> > 
> > Move the declaration up a bit to keep the reverse christmas tree look.
> > 
> > Fixes: c152f8491a8d ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
> > Link: https://github.com/ClangBuiltLinux/linux/issues/600
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> 
> Maybe
> 
> ec3042ad39d4e2ddbc3a3344f90bb10d8feb53bc
> ("ASoC: audio-graph-card: add missing const at graph_get_dai_id()")
> 
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto

Ugh, I even checked Mark's tree before sending this, just completely
glossed over that patch. Sorry for the noise :(

Cheers,
Nathan
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
