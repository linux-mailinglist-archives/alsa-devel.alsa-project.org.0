Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351236A339
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Apr 2021 23:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1C11769;
	Sat, 24 Apr 2021 23:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1C11769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619300695;
	bh=9QQ5tJEONFPbhxdxkEsilEfnj0AVYgvJhUPmp136bdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxGhFQuGMzu87UX1RMLffAbqvWw8CWDKhphI7YJCIAXmPCrwYG8e1705L3L1/8UNJ
	 vklfug9VbSeGfC5TpmX6oHpXcnWKrjQ1WXRH3KGqLFgqEwB1cexcZV/PGIIOHQ1wjw
	 B3W4ggimX5zq3XsmSYi7H/xSJnH0+2Je8GJ9qqPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D422F800AA;
	Sat, 24 Apr 2021 23:43:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62910F80253; Sat, 24 Apr 2021 23:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65E43F800AA
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 23:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65E43F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UAj+jOD4"
Received: by mail-ed1-x529.google.com with SMTP id s15so61379955edd.4
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAB1UxMU9cXKoBkMCcRUTUkUwd9xyzeV4Z+VVbBm0ww=;
 b=UAj+jOD4YISqVHvE8hLzTkEBSVHoznSxIs/A9CWmxfJs8GVoqg72e5P8s5enr8VCmq
 IC9l4F/wn07wl8GkIaSNw6W5cZW5TVX9dhNB7JR2lRsAcBN2XVbwOeGUk2Lp2cLOETBE
 khKZP/Q9nRlylAbk2P3BbClOf5q5yNQIUSGjcTxA/ycB7WXqzT26GiexFMVxWS2EZViB
 vATtN+uFKaMUoKYEyY7j53tMlzTbcExuwRf+xiB4mOd3q1TQMQHlf+sm9V5G8idGl0IQ
 7VlGSqfaiSX2klZN8lRN6W28M/UBR4B94aEHo5TLfi8lqeOqwqq2FVsQp7/0Cg2Gkudt
 KoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAB1UxMU9cXKoBkMCcRUTUkUwd9xyzeV4Z+VVbBm0ww=;
 b=RlQwZMUWhq08G0DyPLIydYa4C9od7pUpmp9LOuUXdq62Sfb+uxt6j/0lW/yHXd0c1K
 e0+maPgT9r4zno/7WG+JE+zM4HyiJHANLqlZnYCDqXEw1luIUl14fDgLVAr2jCjTop/t
 U3qk/XsKJ7UNAm1uJFM2u9xWEqT1zANdOR54eLSHK6GPNB3q8W+kqfnRMjkejZtd2WmD
 WXPetwdnT5G3d3BVKOXH6n9o7N3d64jXAF+ssW+kzNnHjYsRxfIySMLubOfdqsxAo035
 zy+9appZ2XxZSpVk25MUmj4u8HPrjsW2epTBHrnWbZ6yG9F0ja/UOI6cnm4UlFi/ghyb
 XAWQ==
X-Gm-Message-State: AOAM532FeeE9alPe5nWlC46bU2DC8En7y42MMUa8zHpaIDwEWUsf0S2c
 389uhKVn27jGY0zQkXFMIrvp9o3ArYd9fKER2XXd7Frb7Ig=
X-Google-Smtp-Source: ABdhPJyBySviPEFJ2u8Itl4lNcrbbarZyLoGfbtsYHluAEeyR3Yx7pmTBPYXyg0/MvHu2t0F6EX88jbkX+bYqOQjPgs=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr12114815edt.187.1619300597665; 
 Sat, 24 Apr 2021 14:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <s5h1rb173ho.wl-tiwai@suse.de>
 <CAPMdQDmd8S_SnFycxjh02hzUNG-PuNrc5jYroX0niOuyNdO_UQ@mail.gmail.com>
In-Reply-To: <CAPMdQDmd8S_SnFycxjh02hzUNG-PuNrc5jYroX0niOuyNdO_UQ@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Sat, 24 Apr 2021 16:43:06 -0500
Message-ID: <CAOsVg8r4FTXP617=ZhG3xgtGEuwSkx9k4Rg0j7+TzyyHggKtMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Keith Milner <maillist@superlative.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

The Roland SD-50 appears to have very similar endpoint properties to my
EDIROL UA-4FX and UA-25EX.  This makes me think you could try adding this
to the capture quirks table, although I'm not sure if it would override the
new automatic configuration method, Takashi left the table there for fringe
tests so it should:

        IMPLICIT_FB_FIXED_DEV(0x0582, 0x0114, 0x01, 0x01), /* Roland SD-50
*/

My guess endpoint address of 0x01 (just after the 0x0114) could be wrong,
but since the R-26, INTEGRA-7, etc. OUT endpoint address is used, that's
the one I chose for yours.  Truthfully, I had both the EDIROL UA-4FX and
UA-25EX running with the plain wrong address of 0x0d (which was meant for
other devices) and they were working perfectly.

I hope that helps,

  Lucas
