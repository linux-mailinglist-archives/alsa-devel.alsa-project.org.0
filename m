Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30357381D6A
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 10:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93CFA16AD;
	Sun, 16 May 2021 10:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93CFA16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621153959;
	bh=D/PGUDIBj0VH3qlirw7yWpktt+kq8oUh/xxaFx8wLrQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUpc8XqOBPcyp3GsABbOyqOPDYwmbwFEoHQ7uRDvCzZcnaVTFeIL2b447psiYMKfu
	 eZqWsnjv4ni2k6FC67hb8+BxpNKH/+4t8rOjzDIio1/lpjkGDXiQ+Lb7ypRupRr3H/
	 BIu2AK2qYGdatthceBz6sf0jZgDBYkbLEFwUHCHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F106DF80229;
	Sun, 16 May 2021 10:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0ECF80217; Sun, 16 May 2021 10:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA21F8016E
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 10:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA21F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iXKRG4CT"
Received: by mail-pf1-x433.google.com with SMTP id e19so2935532pfv.3
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kpe9vtoQX82iVpEE/u5ousHl/Rp3lITdfSymEOwo3JM=;
 b=iXKRG4CT+6rGBrHjnLZ8o7QPoZkvq3uqDfOfP3kWL13zRY9wSJ7uW0AIcAydYLN8sM
 gvrxHC9RuOy1OU23LGAQy+CTfugV/dIxehHZOzE5RaRf+NF44/9ja0sMkrIsQV9Ctuk3
 9c/EARrz3ayNbGDksBWs7UXpw4hXPQ6WqkzKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kpe9vtoQX82iVpEE/u5ousHl/Rp3lITdfSymEOwo3JM=;
 b=BzGhTot4kpg7oov9utHnIgEEjaMk3pVwiEe6IKCYaHAqeSgKoBq25N81ZJCqUOg4bH
 v6J9hUCOIsNm8d9ICUQ7LQYGPtjnpmOIGQEwcWSfFLH+axcPD7SGqdwnZeZUKWWtF1FV
 PUaPk6Fx7nclBdWGtP1Ox2X6Bn69HQJQC7waK1HxqbdSNhfipJnMnx29kJ/KYfXWE7to
 FtgZkJ1wdzuoKiaNZSIWQPHd9b8vLr+RKJ+aazTkTmQD+/Xxge14u+8XyKrAJ/Az8Omd
 EOOH1MJ3MLqSAMki5YNxiAjI6PPZOkBSmqIgr7FSgTO6+sOMoVxrlLbwHP8NVWu5RgDg
 8d6w==
X-Gm-Message-State: AOAM533+de3Qx6plLJ7HT/y1GfVR+qA8PvH3EDMgbVk2zlnbCDy0qcNb
 pyB52v19G8z0iCcSkTJt21yctQ==
X-Google-Smtp-Source: ABdhPJwLDDhgviSBNY7z/RfSjXkpjVVCR629Bd8qWCqCppmwG9HN35CkI6iLOCJ66JIlYATFLFGuNg==
X-Received: by 2002:a63:5456:: with SMTP id e22mr48817378pgm.15.1621153862982; 
 Sun, 16 May 2021 01:31:02 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4596:acad:c782:2f52])
 by smtp.gmail.com with ESMTPSA id x27sm7717276pfo.216.2021.05.16.01.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 01:31:02 -0700 (PDT)
Date: Sun, 16 May 2021 17:30:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YKDYQfDf7GiMfGCN@google.com>
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ5cHdv6MVmAKD3b@google.com>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
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

On (21/05/14 20:16), Sergey Senozhatsky wrote:
> > --- a/sound/pci/intel8x0.c
> > +++ b/sound/pci/intel8x0.c
> > @@ -691,6 +691,9 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
> >  	int status, civ, i, step;
> >  	int ack = 0;
> >  
> > +	if (!ichdev->substream || ichdev->suspended)
> > +		return;
> > +
> >  	spin_lock_irqsave(&chip->reg_lock, flags);
> >  	status = igetbyte(chip, port + ichdev->roff_sr);
> >  	civ = igetbyte(chip, port + ICH_REG_OFF_CIV);

This does the problem for me.
