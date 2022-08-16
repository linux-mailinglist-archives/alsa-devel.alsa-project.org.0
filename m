Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3829595F8D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 17:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BCBE1635;
	Tue, 16 Aug 2022 17:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BCBE1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660664836;
	bh=51xUujSE+6z2ivlE41mITSmgJUUBHrKwp24ra83pRNI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UqzMu1lKOy5QFwHP26mu54vJ2A8GWPZ2eOiTTH3gyi4UtN8vnU/1LYKVib8QOYi85
	 DbTR6K7y5X5BucqaIK1V+9G7LWMSgAzexE1Bv9Zg2k9d4f+Xlijwf4aa1LuJ19210l
	 hxTJpJGj4PwWK1pMsxCwm1FZTqWcrPBUUFgcTTY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3760F80424;
	Tue, 16 Aug 2022 17:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 686E2F8032D; Tue, 16 Aug 2022 17:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4EFF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 17:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4EFF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="egqDD5+F"
Received: by mail-ua1-x936.google.com with SMTP id 5so4174689uay.5
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=B10A6bA2Cz4Ec/FSZee29OXW2w8bTrFA75IouIf8nas=;
 b=egqDD5+FiPzyuyF1aNQDtHfA0yMa5DpzesQg0kLEdNTdTkHbgldl8lPLrUonM7TLuk
 DtBklKrRDEf6LjVB1VAEd8tyrkrH5RATBcABeJd4IVHI4pcT7jmHzWjgKbXwtR8oEMnF
 3M6AanqEaEumZ5k0cZWG4BDW6YurUDFewrdneAQLPLFeopbIAVE46eARX7tLTOzqYx/p
 Icb9SzkdjddITKC8G8G9aSaS+z3xSok5TWEVx6iQH5RXjku87bTgYVmbkpRnrC7NVPNi
 wB8ooeg1NHT/yDeAmkLC++AAjMnoaVIyGe5bHArAFW8xngbSMlZg8IyG8IsiL335zg9w
 R3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=B10A6bA2Cz4Ec/FSZee29OXW2w8bTrFA75IouIf8nas=;
 b=8CbX1v2BTKroONj4rkphMHa5T6abWR5BYkcDnR3vNRXBjKwgz6dyBqVffClDZMosQ/
 rxnxfWhNjkwTT6HGAmuxnY7OEbFa21Qbkk7ggU9uG0rYclJOzeW/Dn102nIb+Yoqo7O8
 XpR0yL92XBNW7BvoZtRUCyDmLe8fPWULbzz0N/fg9HpiSr/Ih7GRQYyXalUk1kXSuU3g
 OZU77rJw4uOkrrRi3JZXF0tbXcW/P3JKqnsmLzCVRG7I9X8S5fGjhLe8kKj0FrYfk/Od
 NAeivG/gncZct14FS0CoIs/ZBSoWdpaWL+X1+xT+Q1o2AFY6xaxnbaGC/R/VHH6wFf4K
 IWXw==
X-Gm-Message-State: ACgBeo0mSdouqDdsuAiS7Y5eHUwGRsRjWNH2bICfPyNbHQIWP+KG9kzJ
 htkNJZpLPKWqI0fbocGJ8M4=
X-Google-Smtp-Source: AA6agR4C0uohlIrorAWx8mwIOTXYqbpIWYoKJOJWury7Ddn5WMdD8TIYirToBb3BI5hBfQ2Wx1DMOQ==
X-Received: by 2002:ab0:1c56:0:b0:384:cbd7:4329 with SMTP id
 o22-20020ab01c56000000b00384cbd74329mr8657041uaj.9.1660664770627; 
 Tue, 16 Aug 2022 08:46:10 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9bc6:14ea:bdc5:dc66:de30])
 by smtp.gmail.com with ESMTPSA id
 r3-20020ab03243000000b0038467d003e3sm6974439uan.38.2022.08.16.08.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 08:46:10 -0700 (PDT)
Date: Tue, 16 Aug 2022 12:46:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Rockchip I2S commit possibly ignored
Message-ID: <Yvu7wFsdFs8MWcV3@geday>
References: <YvuYZE0biiAn/sxQ@geday> <YvuZbrBWzRjHYQZj@sirena.org.uk>
 <Yvudjkjxtv7M/DPL@geday> <Yvu2PRrQvsRAJSm7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yvu2PRrQvsRAJSm7@sirena.org.uk>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 ALSA-devel <alsa-devel@alsa-project.org>
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

On Tue, Aug 16, 2022 at 04:22:37PM +0100, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 10:37:18AM -0300, Geraldo Nascimento wrote:
> 
> > This isn't my patch, it's a patch by Sugar Zhang from Rockchip that was
> > supposed to have been applied one year ago, give or take 10 days. I
> > can't resend a patch that wasn't authored by me.
> 
> There's absolutely no problem with reposting someone else's patch - just
> add your Signed-off-by at the end of the signoff chain.

Cool. I'm going to wait a couple of days to see if there's any interest
from the side of Sugar Zhang of resending the patch with a proper commit
message. If not, then I'll resend like you suggested. Thank you.

> 
> > Therefore I don't see the point of your complaint about "content free pings".
> 
> In general the answer to "what's the status of this old patch?" is
> almost always going to be the same so there's a form letter for it,
> especially with such an old patch the chances of me having any
> recollection of what's going on are minimal.

I understand it.

Thank you,
Geraldo Nascimento
