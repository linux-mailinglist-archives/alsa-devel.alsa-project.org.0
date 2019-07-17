Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733516BFE6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF4616BC;
	Wed, 17 Jul 2019 18:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF4616BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563382294;
	bh=itcUz8ys+eL+b1x4nhlBv90uPWiMs0jQc2Fj/IERX3g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQTbnjqMYFIgpz16Du/Q2obD9EbKyiyN9HFzuxx3F3AXN26TqGds7+YG/2aZ3TC0w
	 Rin6cgtEs2PsL5HmWlZG2e5Tk2mz3774O/QJ/oBUu5PhCZ5d9m4cStCsaAg93JWhNF
	 LCQwtpjQ59ZJ+SoBou6Eepv1CnQgTscO4HG99sIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86DCDF803D5;
	Wed, 17 Jul 2019 18:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF58F803D0; Wed, 17 Jul 2019 18:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56F9CF800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56F9CF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cmr5qsvN"
Received: by mail-lj1-x241.google.com with SMTP id v18so24297619ljh.6
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BDlsCAAxYDTqGk6smEj2bdvvQqQCL67MYibGQ7s4YIY=;
 b=cmr5qsvNgH9jNT0/oafd9XXAwmpTCFGAjK4jbC9RTNsdmQT0/IDz14HhR1PWraPKV/
 Jyfd6UrLeWgzeC8o4hz7LUVjIihsl40hteM5daXR7lLMZImbqbSWSUpY9n90SqzXBV55
 3keJzjhMSe1TVO1kIWTYnaigdx9oKgWn952/s5A8HkrdvmK3ndk4pje+nxXTaoykDUHl
 TPeTbWkWM/8NrSjqsDdOE9bGSVPVjyPoCbQVsIdEl/tHn6Fzy36dMp2REZLMnbOOIk+g
 uHIS84R63cLEHa8V96pAqlY2DVvI/d8U+aSt873GnR3HJk9jbz77ptXbN4hd3eZlV0GV
 BEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BDlsCAAxYDTqGk6smEj2bdvvQqQCL67MYibGQ7s4YIY=;
 b=ojvm41DmyFx/dI+n7RQChTnPkQ2eSSLqewAcQPiJcZ7Ta8MS7GqWK9ZL7zepihYVyb
 s5LADPw/1YCNSnulY5VDUi//f7JtQXlo3Y2w2WXjUr1xDggqFJ1Ns1ARLgDYSqtnGI7s
 7S8eKNVDKs5YvmE0YGGAvISQx3sB8zQp9juOJjnE7dtu1xqqXme8KOMsr4YjY1TP8owb
 9lhUVTnC7WHfpSbWZ8SotZik5UmJH8vKbQ94MqYu2MLuZujXzUaD+JY3j7Zm4l1EpMp5
 dlq+8VVUQ/i/59a1yfHXD9s05YnPPhOdtVSvNCH8TmxIA9ZOMNKf/nlLk2BbvOfIS14L
 215w==
X-Gm-Message-State: APjAAAXqbkykh9h1xlsxgLT6Z60M7IBit1tYNladzoSR0D62FA4XG87z
 R/k6O7N08NNs5FJcxVJAinXl7lmHo024+xI3vDU=
X-Google-Smtp-Source: APXvYqxs9oTcqPbzk6CtmwWgc1tWfVsOPZfObW1cz1BRNfRjM0krifJEapOQopLnP9JxBbQE+0venO9BkgTifAnfxwk=
X-Received: by 2002:a2e:2c07:: with SMTP id s7mr21676419ljs.44.1563382169269; 
 Wed, 17 Jul 2019 09:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
 <20190717163014.429-5-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-5-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jul 2019 13:49:18 -0300
Message-ID: <CAOMZO5BurienB8eFMKbvbxbJ9zCDFT2nTz1ME=roL=i8vnk28g@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v4 4/6] ASoC: sgtl5000: add ADC mute control
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

On Wed, Jul 17, 2019 at 1:30 PM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
> This control mute/unmute the ADC input of SGTL5000
> using its CHIP_ANA_CTRL register.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
