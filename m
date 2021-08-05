Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E93E1F5A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 01:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127C3171B;
	Fri,  6 Aug 2021 01:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127C3171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628206145;
	bh=LQ3pifn6cPBPjOMEy/I24Vz0qZNzX8o2QtGg6NuUf9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVLVo1j6XjqG3M9YMajYGTeabMd2rhIQBf7V44yEil1b3b95bH9tLoYUOToicUvog
	 FPbj+y6LdIhCqB3zroH0cEkX0kFBFBNQWSu+DMxCa8c+QLwmaIy+AZg3HH+UcK5gxL
	 Dvrn/al2B/c88Gz0ylHcPmrQn42LzGei8eXao8CY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0769CF8010A;
	Fri,  6 Aug 2021 01:27:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED570F8027C; Fri,  6 Aug 2021 01:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85467F8010A
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 01:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85467F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iG/JzkDM"
Received: by mail-qk1-x731.google.com with SMTP id o13so8071404qkk.9
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GWYhhnHXpwchfBLnnEFakexM5qTqzApt+j/4RaV2RTs=;
 b=iG/JzkDMq2iSbCrl/9t17CYZOtEZj1m5qfa1FfFufGSrqwzTtndLOuj/EyrPX8qXUs
 yH+0ajiaAJmjwRFIyu/EWpki5ZP+6y5c7dct5qCT44vIU+ILoe1ZH0qc1uMXHkhI8JIn
 tQtoo6iIHTS2bavIc9OpCHCJ4w3o+7oFJ5iiSFFXDWRg7pWjTNNxOOxY09RSHSKxbdpC
 eywbaxP6sKwlOENIl1fT2h36XmqbzDcctsnoVVsDGUz/oibQ/yAAv7fh8M4EX+mEN7K1
 1Kf4+aBx5BEWC1I6HzoEF4ejkrb88lDuCKz/XOG16+RuGWqTdujOPUDgIFreNzrr4bSY
 gEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWYhhnHXpwchfBLnnEFakexM5qTqzApt+j/4RaV2RTs=;
 b=eBkGJeHiOnCuAC78H02gzx+SBHGZ0P2oTtr0qUIVX6VYwC7Eu7+mx4cvKfbCnCc+mb
 ROxqJv/qWbUVM3lEYVX1DkYblE6oycoEbrxtKEwssA0RQPHRsU6J7ndaIOvq9hdtgHbB
 4VuzWTTOXLeiAtK9Md8L4bM3Mj0jYgb5QVg+KRjwQfXwVaOfsc0xjWsRzDXgRDYLjxUE
 CO4IG6YsdtDGGjL26evu3XJPZQOSNE8KA+YHKIP3fV7oxtGXQAniEwQDfmnSPDLOMdVz
 qKL2MrprIUmbAYixgHRsxkwT4ZAuQEvu7r14PrsRdoGsnd9eVxHI/fVzFyzfvHkeE5lQ
 9zug==
X-Gm-Message-State: AOAM531j2JTfZ8rmQn3G36HGVrNhK30Lc86ypoPsX316pueW8VZ2LqPI
 YyFLgFNzvuPzCAMfjmohNRcmJhcPzLK0ejkWrTw=
X-Google-Smtp-Source: ABdhPJwAJ/KXnbrXbhYT89NvwX3j5UXdvn3yLOkcxD5gkm8FhCeyx9C5yMcFD+X2C8ZnyNkx0uVsqhr+ctOCEdtSbNA=
X-Received: by 2002:a05:620a:1097:: with SMTP id
 g23mr7541052qkk.226.1628206046494; 
 Thu, 05 Aug 2021 16:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210805075401.21170-1-chihhao.chen@mediatek.com>
 <CAEsQvcsvbJdgvAOxkv_kbLohGi676Zrgz4XSFW2o3CWU3Q68Dg@mail.gmail.com>
In-Reply-To: <CAEsQvcsvbJdgvAOxkv_kbLohGi676Zrgz4XSFW2o3CWU3Q68Dg@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 5 Aug 2021 20:31:27 -0300
Message-ID: <CAEsQvcvJeAXoVE9FE9vsKNvXMaQYgHZBoPyKfZLT=UA-4BMe_Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Takashi Iwai <tiwai@suse.de>, damien@zamaudio.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Em Qui, 5 de ago de 2021 12:50, Geraldo Nascimento <geraldogabriel@gmail.com>
escreveu:

> > There is no noise and I think this should be a firmware bug.
>

The fact that there's no noise during the echo test itself doesn't mean
it's not a firmware bug.

It may just mean the MIC is able to support both 48KHz and 96KHz.

Because from the log we see both Clock Selectors end up selected to pin 1.

Thank you,
Geraldo Nascimento

>
