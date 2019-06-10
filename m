Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F53AD27
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 04:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9BB16A8;
	Mon, 10 Jun 2019 04:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9BB16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560134699;
	bh=GrEpWfkMrVh9QWTSjervQPQ9hUHWCBWVrho/k4maATs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OebrInXuVhmhn8Kp97O2tRtO5RhGu7DuEwY8hRK6zkxHCsU8SXD2S32U6wgw1EeNE
	 WgV4z66tryjvRLrc82HPb7VphsUcbIG58kQR5/A8mS9fgp4D++7npSPiDM2o+nlgK8
	 uzsnbrnfAvqVd6DzqReOX3nld4PhXe/6kZg3UadE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CF0F89728;
	Mon, 10 Jun 2019 04:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6FB3F896E0; Mon, 10 Jun 2019 04:40:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B80F8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 04:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B80F8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mruAvH1l"
Received: by mail-ot1-x344.google.com with SMTP id d17so6948366oth.5
 for <alsa-devel@alsa-project.org>; Sun, 09 Jun 2019 19:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kK5AOmUUQAc+a3K/cfpHGlxWFy5yC3EASTVQQpPse3M=;
 b=mruAvH1lXzGk8uhMFAulohCg43C1rjsvBjxD/u0FRcZei8AkjA1q9ZKxz7s8SGl7Sb
 En9SzquEaEwnhk6keLJfysSN/fSPapVCdoWa4xmMLShswwDAV3THrJeaeVpMxpB6grUw
 VaXlPf9sXvxyz3VcEXfNgSe5C+2yiZqhOlCxHBfu1uXdXgECKlzWgFLMXmzq3g5XIZvt
 zjP5dhkFm93y/1aZRlwjSWKgqAhyV8E7l+2R7r2WWYG+CMVI75i3dWD+LS/VxB87aJau
 SwCmEXMIXT6rvxouk//1RfFudhqEil7rd4Leet2hf+uw8T0HkB3vDY3vjQ3VtR5UpZoW
 ErfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kK5AOmUUQAc+a3K/cfpHGlxWFy5yC3EASTVQQpPse3M=;
 b=kEqKpAyw2/MSF+GnyqNo+luyv3+0zKyOKIcagektMtPA/Ltv0C1v0lkSQdx8cB1qqN
 54EmzNE6thgwztdds4yCoj8PmSslFstto+NK5wSgwx24f+A5ZQxaSiqgI/aglh+r+9nO
 OrtQya8zdrpBI2UmG9izTO1HIsuxRI76qWPZ6Mi/GdPfreim1YrwfEhZulK1B5UNphDP
 QeeL6+wdZP7tY7CdoJhvjvqNTg+3XfJoJ3oh6Y31xchBI3JsRUnYXFPmlx0Axz/KwQtN
 ilDgE1ubolaw9YRRcl7PV/cRPWIDE2TeVbBfTdWCkpN0wJDogVjjBH9eR9RHBiOvAtyr
 5QQg==
X-Gm-Message-State: APjAAAXOdUJpl681xSqxVnGfj6iGEYPetUtZ1Oo+07mmIbk/A99G/ORh
 wQOZb/4/6X+zJyXfr04lvuZQfZ/jIGuU7ByLS60nzw==
X-Google-Smtp-Source: APXvYqxSOslpqk9JEx6IbFPPVPuD+bbZdJ80yg6mlJv3PuYdqh1PQL0pjALOflgQmdzkR8m8oTCQXwQVe5amB8TwywM=
X-Received: by 2002:a9d:6a08:: with SMTP id g8mr2078350otn.344.1560134448569; 
 Sun, 09 Jun 2019 19:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <87ef42uzgd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef42uzgd.wl-kuninori.morimoto.gx@renesas.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 10 Jun 2019 10:40:37 +0800
Message-ID: <CA+Px+wWX3eLQuvPFA=nJ7kn=fGa6yaR5CzgGkPjac_zKT4K-dw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: don't call
	soc_cleanup_card_resources() at snd_soc_instantiate_card()
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

The same change has been made and applied to for-next in commit
0779935938b1 ("ASoC: Remove erroneous soc_cleanup_card_resources()
call").
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
