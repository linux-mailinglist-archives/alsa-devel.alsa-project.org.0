Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF853D7266
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 11:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B29AF1EEA;
	Tue, 27 Jul 2021 11:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B29AF1EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627379791;
	bh=RRSeBzpvy0PZVDKyMaUvKDjwzO88kWaFNGgJJDjftJA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a7ynuyF9sedMqIn7AM8Q16NGtSmWkABzbM6YO1sJPBrPgrVoIFZ84w5bZKcjxj46O
	 Go22vAaLg2OpAzFznr0LWq0QY4NxJUGhJN6UFxmqHXn9DFAKreNEHuSOigfg5ywCQZ
	 kBtkCgytd+qx/j7v6eKA9D5kzESAdOJLYVbm6meA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BAA1F8020D;
	Tue, 27 Jul 2021 11:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28A0AF8026C; Tue, 27 Jul 2021 11:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heaven.argudo.org (heaven.argudo.org [195.154.250.235])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11101F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 11:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11101F80212
Received: by heaven.argudo.org (Postfix, from userid 1008)
 id 2B0FD1500C4A; Tue, 27 Jul 2021 11:54:51 +0200 (CEST)
Received: from [192.168.0.5] (82-65-216-59.subs.proxad.net [82.65.216.59])
 (Authenticated sender: jpargudo)
 by heaven.argudo.org (Postfix) with ESMTPSA id 952A51500B4C;
 Tue, 27 Jul 2021 11:54:49 +0200 (CEST)
Message-ID: <0feab0ff6f3f64f2a137676b084654df534f8d8a.camel@argudo.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add registration quirk for JBL Quantum
 600
From: Jean-Paul Argudo <jean-paul@argudo.org>
To: Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
Date: Tue, 27 Jul 2021 11:54:49 +0200
In-Reply-To: <20210727093326.1153366-1-alexander@tsoy.me>
References: <20210727093326.1153366-1-alexander@tsoy.me>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Hi Alexander, 

Le mardi 27 juillet 2021 à 12:33 +0300, Alexander Tsoy a écrit :
> Apparently JBL Quantum 600 has multiple hardware revisions. Apply
> registration quirk to another device id as well.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> ---
>  sound/usb/quirks.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index e7accd87e063..326d1b0ea5e6 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1899,6 +1899,7 @@ static const struct registration_quirk
> registration_quirks[] = {
>         REG_QUIRK_ENTRY(0x0951, 0x16ea, 2),     /* Kingston HyperX
> Cloud Flight S */
>         REG_QUIRK_ENTRY(0x0ecb, 0x1f46, 2),     /* JBL Quantum 600 */
>         REG_QUIRK_ENTRY(0x0ecb, 0x2039, 2),     /* JBL Quantum 400 */
> +       REG_QUIRK_ENTRY(0x0ecb, 0x203c, 2),     /* JBL Quantum 600 */


Thanks! 

Thank you to Takashi Iwai also, who helped me a lot!

Just wondering how you could possibly "find" all devices id for those
JBL headsets? I mean if the 600 has multiple hardware revisions, is it
possible the 400 and 800 series too? 


Thanks again,


>         REG_QUIRK_ENTRY(0x0ecb, 0x203e, 2),     /* JBL Quantum 800 */
>         { 0 }                                   /* terminator */
>  };

-- 
Jean-Paul

