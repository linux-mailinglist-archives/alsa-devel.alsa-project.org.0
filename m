Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF13D7382
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 12:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0811A1AE7;
	Tue, 27 Jul 2021 12:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0811A1AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627382658;
	bh=8nv8xwa0qoAOi7QQ91NaQ7pT7WgRJhLjaXw+Ofssl0Q=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfmLNFr7McKdpBpaYPw6lQUf+7KqBx+wjI9CVDoObqZz8ZWi+2lbhzwR9quFoqnCS
	 85o6eg1UxFPZOg3rbEzLJXW3s8CUq5XJqdvoe7DbLA6MTselhC/BqKe5ExPwfqj02c
	 baWfGpddmpwJFkAyayDdS0eC2GerZUI/bHNwaSx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E759F80159;
	Tue, 27 Jul 2021 12:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C68BF8026C; Tue, 27 Jul 2021 12:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0873FF80159
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 12:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0873FF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="YEq93zH9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=79IMAl65lHLejQhv6/b+f/+BeXSM6ILBN3Uaf7DlIjI=; b=YEq93zH9jbQneUCC/OXPIg/sqq
 /D3w4z8OBgN7W8h1L0/c4kRNombouCS3h+Dm+O2AlPohLvTBU+uuajMc5QDLDnYajjkFk6qQpUNop
 WVobiSbazTLVWUGz01G1zLI8fuVhZOG5wvg7DMFAZYSPor4LxzlWVnP1pTw27IQ2gue0=;
Received: from [10.8.10.223]
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1m8KXn-0000zm-J9; Tue, 27 Jul 2021 13:42:38 +0300
Message-ID: <b64108ad64550d51537c5d1ddb04249d6ea5faed.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Add registration quirk for JBL Quantum
 600
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Jul 2021 13:42:37 +0300
In-Reply-To: <0feab0ff6f3f64f2a137676b084654df534f8d8a.camel@argudo.org>
References: <20210727093326.1153366-1-alexander@tsoy.me>
 <0feab0ff6f3f64f2a137676b084654df534f8d8a.camel@argudo.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Jean-Paul Argudo <jean-paul@argudo.org>
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

В Вт, 27/07/2021 в 11:54 +0200, Jean-Paul Argudo пишет:
> Hi Alexander, 
> 
> Le mardi 27 juillet 2021 à 12:33 +0300, Alexander Tsoy a écrit :
> > Apparently JBL Quantum 600 has multiple hardware revisions. Apply
> > registration quirk to another device id as well.
> > 
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> >  sound/usb/quirks.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index e7accd87e063..326d1b0ea5e6 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -1899,6 +1899,7 @@ static const struct registration_quirk
> > registration_quirks[] = {
> >         REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),     /* Kingston HyperX
> > Cloud Flight S */
> >         REG_QUIRK_ENTRY(0x0ecb, 0x1f46, 2),     /* JBL Quantum 600 */
> >         REG_QUIRK_ENTRY(0x0ecb, 0x2039, 2),     /* JBL Quantum 400 */
> > +       REG_QUIRK_ENTRY(0x0ecb, 0x203c, 2),     /* JBL Quantum 600 */
> 
> 
> Thanks! 
> 
> Thank you to Takashi Iwai also, who helped me a lot!
> 
> Just wondering how you could possibly "find" all devices id for those
> JBL headsets? I mean if the 600 has multiple hardware revisions, is it
> possible the 400 and 800 series too? 

We can only rely on bug reports and public databases I guess. The
current list is gathered from multiple sources:
https://bugzilla.kernel.org/show_bug.cgi?id=212669
https://www.spinics.net/lists/alsa-devel/msg129070.html
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/998
https://github.com/linuxhw/LsUSB/

> 
> 
> Thanks again,
> 
> 
> >         REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),     /* JBL Quantum 800 */
> >         { 0 }                                   /* terminator */
> >  };
> 


