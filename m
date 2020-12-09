Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9032D465C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 17:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD58F1694;
	Wed,  9 Dec 2020 17:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD58F1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607530176;
	bh=jGxNNCltObIRu76mkkDLN6oqQ0Weh1xqUAMf7OPALJM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZpeU52lT6znnn+hjybc5KdRfcU65/JF7IYte1ajbfuxohBiqlTIWzsz8wdhYq3v5
	 vhROj73AdLBGJaknq0ouKc4XmopbxxfbVHn/FD8Uz+BNwH8EseHEoKuNGeUDyqrTDb
	 g2NSa89mpyxN5ePvPEieH4dx5GxlnEs242OHZKWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D94DF80217;
	Wed,  9 Dec 2020 17:08:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE87CF8020D; Wed,  9 Dec 2020 17:07:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E79F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 17:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E79F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.b="ZsVOBZtx"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id B658516005C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 17:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1607530073; bh=jGxNNCltObIRu76mkkDLN6oqQ0Weh1xqUAMf7OPALJM=;
 h=Date:From:To:Cc:Subject:From;
 b=ZsVOBZtxd/5LybnERG3JqEixKXrTdI07qN/TrXcXcSFg7HzSvebLoAprHXz70zdC4
 ooJARqt4JLk2+aTXrNd5C617UFo3s+R1LfyjjnL2iJqR+R+mfGTaQ5mcHsWsgF9yfT
 aeW8pemVLLmJhbPWSTi7va2huoB5OQq7njIrpOHLWZDVdK0z22+JkG18i/zrbySwkC
 W2tY1GjIlYBBxzDgmwiFUr8glnWXmORgzbTpgg3D+Tiy4o8ULrx58OpSgysnIp6Ujm
 J/cAZifq5sdW8ot67NJ3y99FtUj5QmtxAFDg4HKqNBVfPaqSd7qxMWHBWl7xUjeKTp
 nVlKfCFLNcyPQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Crhls0z6cz6tmN;
 Wed,  9 Dec 2020 17:07:53 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Dec 2020 17:07:53 +0100
From: Kilian <meschi@posteo.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Steinberg UR22 Crackling and Clicks
In-Reply-To: <s5hczzjtbww.wl-tiwai@suse.de>
References: <ce03244f4699ffc9574ecc2dae41a417@posteo.de>
 <s5hft4gy4ar.wl-tiwai@suse.de> <61da73624ff3855867b8e65936fc2e1c@posteo.de>
 <s5hft4gwdji.wl-tiwai@suse.de> <eb1baf202fa4cd74a502661bb0ce5279@posteo.de>
 <s5ho8j4ujwx.wl-tiwai@suse.de> <987d1956f52ba49dc3b587c33e08bfb2@posteo.de>
 <s5heek0ugtk.wl-tiwai@suse.de> <4188489e2967b44e57653193cab9d1cb@posteo.de>
 <s5ha6unv52k.wl-tiwai@suse.de> <5811c5724e831c38395d3e5b57439b4d@posteo.de>
 <s5heejztcjc.wl-tiwai@suse.de> <e516dc005a88536dba67e958c5611180@posteo.de>
 <s5hczzjtbww.wl-tiwai@suse.de>
Message-ID: <c7194dab05d5bbff24b589dfc126fd54@posteo.de>
X-Sender: meschi@posteo.de
User-Agent: Posteo Webmail
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

>> > Then try to pass implicit_fb=1 option to snd-usb-audio module.
>> > It's a new option that was added recently.
>> >
>> >
>> > Takashi
>> 
>> Nice, that did the trick. there was a small glitch on first playback
>> but I can not reproduce it now. Playback seems glitch-free now. I will
>> test it with pulseaudio in the gui if I can. It's not quite easy to
>> test, because the system locks up after a while with the new kernel
>> and gnome 3. I will also test concurrent playback and recording,
>> too. Thank you very much, that was a huge help!
> 
> Good to hear.  If the implicit_fb option works, we can add a static
> quirk table entry easily.  Just add IMPLICIT_FB_GENERIC_DEV() with the
> device ID to playback_implicit_fb_quirks[] table in
> sound/usb/implicit.c.
> 
> 
> Takashi

Still having problems with the nouveau driver, so i couldn't thest this 
with pulseaudio. Recording with arecord works parallel to playing back 
with aplay. so here is my patch for implicit.c

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 386198b36b87..c729ff634b9d 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -46,6 +46,7 @@ static const struct snd_usb_implicit_fb_match 
playback_implicit_fb_quirks[] = {
         IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2081), /* M-Audio FastTrack 
Ultra */
         IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2030), /* M-Audio Fast Track 
C400 */
         IMPLICIT_FB_GENERIC_DEV(0x0763, 0x2031), /* M-Audio Fast Track 
C600 */
+       IMPLICIT_FB_GENERIC_DEV(0x0499, 0x1509), /* Steinberg UR22 */

         /* Fixed EP */
         /* FIXME: check the availability of generic matching */
