Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF6141CD2
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 08:19:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B81016BB;
	Sun, 19 Jan 2020 08:18:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B81016BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579418367;
	bh=z3z4OsmbRi+RrLj1eM/malT3gpAPWSVbmcXf+B3BLcQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSnkUdG6FRQn8vlOBaz1yFIYmUiNWW+/AYbgqn5WYkIC+ixlrJ95cY89XLhubNhCV
	 QXbJXJft+7dNNr1mZZzPRw93YPBEAjCv9fM7K+0dgninZt+j/YKnrI6ISSrqUIcJ8j
	 qdKjekyHbz8SkNb+kAggLP5C0PLtR142NjA0xQpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C338F80292;
	Sun, 19 Jan 2020 08:14:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A5B1F801EB; Wed, 15 Jan 2020 18:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5122F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 18:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5122F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ojab.ru header.i=@ojab.ru
 header.b="G4E4sNN6"
Received: by mail-vk1-xa43.google.com with SMTP id s142so4942566vkd.9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 09:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o6kw58+U2mtXZICtFUKfcDE2XztIofSoUdMpa7WV9is=;
 b=G4E4sNN6MBUytB5O0tTdHgH1Wq+YIF7L9D3NoJVl+6JWAdcpVZ+RYd0EB5gtzJjCbz
 HCkovNWB3TQViJDegXYEVJLwiOO+7UXTZKADYbq2ok9r4xZDiL+IJNt9bKf/7+XpA7/s
 bAW8seXn2A17fKzTKSbrneGEBHT8JCqf/JJfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o6kw58+U2mtXZICtFUKfcDE2XztIofSoUdMpa7WV9is=;
 b=aACz04WWu2AbtSGppB8u7pCRLYchE+a15yEnXtUTC+bMF3ppQDQ/5SwdAAZ/nowfGo
 iNWiF/7gCCqkxbV4pILS57EKVwE25wjIAIrjpFPm6ew7nf8ih8ZKT3Ghkko+6UogAzoi
 xmp8fbm2LHsfhLMozf2SXSesYvUyA1vd7FDcaeIzSwXDj9F/PFhQHPJfWTuTPSz/FUTf
 Z2xf/YyxXtllsmhXvbAASCOJ2ELw1OaVDszBN85yG24dEdRjM0TQ+wGuflM/nT5oF0ep
 HDHvTMLFmtPiCrgyIU4OlSjq8l6N0nZVV6n/3zEldXx+uQrq/cvpkLd76s/kXrjBBlJy
 rYKg==
X-Gm-Message-State: APjAAAX//kGYvszpdppvixMG3UsmdYNRGKwEEyXPEaM8L4vVTHpPcAL0
 L95e/XYY1mvWMxZ7zFgQJ7PNZ3aWNqdJdf6IRsvCAg==
X-Google-Smtp-Source: APXvYqweRUi5QFggY4p+x8NvtvZCvGb8J4FWkkrMLW9KgjZfRicptQfPBQztxRDErT8PDBRw1r/RXfcSrb/xZEUnv7Y=
X-Received: by 2002:a1f:8fc3:: with SMTP id r186mr18796768vkd.87.1579110860547; 
 Wed, 15 Jan 2020 09:54:20 -0800 (PST)
MIME-Version: 1.0
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
In-Reply-To: <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
From: "ojab //" <ojab@ojab.ru>
Date: Wed, 15 Jan 2020 20:54:09 +0300
Message-ID: <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Mailman-Approved-At: Sun, 19 Jan 2020 08:13:54 +0100
Cc: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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

On Wed, Jan 15, 2020 at 6:07 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> This patch won't revert cleanly, can you try the following hack on v5.4
> to see if this improves the card registration? Thanks!


Yep, it works with the patch.

//wbr ojab
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
