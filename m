Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4BE44FE74
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 06:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27AB166A;
	Mon, 15 Nov 2021 06:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27AB166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636955417;
	bh=q1+LQP4Wtumh3G+gCTBBfqUo+Zqm1Hpj663BhWdcF/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lB6RdJSuMy7hSYAUOjJGJogtGjdpI7OWob5pbP/KqNfxLW8zUhwt8t99LNoPFhFD4
	 KQvgyYNDpcSaKjadbGBtI0V4grGZV4AlyLsUQdtLKUctT4it++lBe/k0KDG9s7Z8mx
	 m0Y7mwyzrzbwfpdPlF5RCzns9fC6C0d9SwWATgRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58857F801D5;
	Mon, 15 Nov 2021 06:49:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B855F8027D; Mon, 15 Nov 2021 06:48:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DD6F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 06:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DD6F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dc8n07Us"
Received: by mail-ed1-x529.google.com with SMTP id z10so40129644edc.11
 for <alsa-devel@alsa-project.org>; Sun, 14 Nov 2021 21:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VZHI5dFTpwzj6xvRrQtJt+8+QmoOvMkepg+hCF+mce0=;
 b=Dc8n07Uskf/twoaDy2MpyE2aJFhqnqTA7fRqCuzb0VjDyBgs6gIPm1zRdBMkj3sLf3
 8ZTtPj75QU08W58l72z0pM37xiB6M/VQiO/ldOdP1nu2e5apeuVJFrwTOPcgogN3/VEn
 eS1o9eDbNHHCc3tefV/jljfcAGv7dlCzz4JXAv14i2OVeDBoaa5KjToTc9CkPT6V7/NU
 Y0NNdH1t36wnbdwiIijr7N19WdoI/BETSEnwxMCqtZV+gTjZ1CK160f7HRyGEN5+UEqO
 VKHyfF12f3MB2FU1s6aMwE4M53E6bxj7DUIhyF78ABfG9FovzIJ7S/HvWzBYzbeYdocs
 ra7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VZHI5dFTpwzj6xvRrQtJt+8+QmoOvMkepg+hCF+mce0=;
 b=LURhpi01Wnjm77lSbC23kuYy8Qad5QbsCV6peVEbu5YM5b3OYDPJCx+pneLvcF8yNy
 W5RzmoiJldtlVZi940MCMJTRsU1RdVeuEJERH689LB+W8DO/lTgEB3K/NT/K13+V3UeL
 TUa0yxqCMxufACtNPV3ljrZV9uuvQlXXwhcEjBLoRuLHWyp9XtKGxC9FUS8lFSeQ9SOq
 XqSl9mT3e+GHK5AYSxSlsqJLzpUKNiX+XOIWd48x64Mk63ax1So5HggLXRSq76CmE8yd
 y4qsyEs13nlGfudCQn4B9A53t8Ti0bz9/DZr2HzsgJ/xV0lXSNYI0/CV9IoNn0R3nZIM
 HyCQ==
X-Gm-Message-State: AOAM530JzlyPBMqyzB6c4QA4+mTXh2gP5l3WElPOvv9nMS+4froIwnMq
 0fVD5w/N87AsMK3kaSwC2Eh3rzPQ7A3YXq/c2Lge/0u/
X-Google-Smtp-Source: ABdhPJx33goU/Ze3ljs99wvQ8i+D4oQqiBigtHV4CE5MlcO7t5WGq+gPjmNkJ7C7l7CGAcjvJd9g+WzIx4u/fXzP5dE=
X-Received: by 2002:a17:907:2da2:: with SMTP id
 gt34mr43604775ejc.372.1636955323367; 
 Sun, 14 Nov 2021 21:48:43 -0800 (PST)
MIME-Version: 1.0
References: <CAOsVg8oASKrYST0CR_C5GAd4wcBjKcZkbBSrVdV51oPBTHqqdQ@mail.gmail.com>
 <f5f068ac-42dd-a496-b496-a4359114c634@perex.cz>
In-Reply-To: <f5f068ac-42dd-a496-b496-a4359114c634@perex.cz>
From: Lucas <jaffa225man@gmail.com>
Date: Sun, 14 Nov 2021 23:48:32 -0600
Message-ID: <CAOsVg8o25hDrSTFJraA7vCoA7hCz3MNq7RM7p=-D4si=VaYEXg@mail.gmail.com>
Subject: Re: Token to create an account on the wiki
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks!  Yes I noticed.

On Sun, Nov 14, 2021 at 5:09 PM Jaroslav Kysela <perex@perex.cz> wrote:
>
> On 14. 11. 21 21:56, Lucas wrote:
> > I was hoping to add some Edirol/Roland devices to the wiki.  Signing
> > up at https://alsa-project.org/main/index.php?title=Special:UserLogin&type=signup&returnto=Matrix:Vendor-Roland+Edirol
> > says ask the mailing list for a token.
>
> I sent the token to you in a separate e-mail message.
>
>                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
