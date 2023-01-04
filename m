Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1865D588
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020F7B2B8;
	Wed,  4 Jan 2023 15:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020F7B2B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672842228;
	bh=xJZZjxx5co4FBatKU13KVwdxjznzrfEs3jWznTEO9yw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OM5wdI5alarFPmzWHKCkmGnW0pTe44BBbqq9uW4T18oaRRYUwo7BWnc/JTSmE+iDD
	 rXgSbBTw5TmLjPD2foEN2lEyrALX49HKf7roCN7S7fUcwxu7ZEcoOPzmAugu4kBiRN
	 LB6cS2Pch8FQ6UXvtiEWmE7SRD40d1ubOjNJZ6o4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A4CF800C0;
	Wed,  4 Jan 2023 15:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A01E7F8024D; Wed,  4 Jan 2023 15:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 365FDF8023B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 365FDF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=MJUY15Rx
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so15222123fac.2
 for <alsa-devel@alsa-project.org>; Wed, 04 Jan 2023 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=igjVDIkTRCW04d8b25SU65c+XSQsQWPrG7rtS4TwrAQ=;
 b=MJUY15Rx+EsI1a33RFldZmcoiu/8+EQtU2LSP9vWavJ86Y4MFwGFAGT9tN4jQf/tb0
 9miib/P7j6sQlN1S1d2j+PiwkZCdlzd3/RXY0iNKzxGvUeoDV2vLxW+92JSKNUm4mlk1
 D+cEGMStnmzJsDV1qEOPB8V14zMAx39MO5ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igjVDIkTRCW04d8b25SU65c+XSQsQWPrG7rtS4TwrAQ=;
 b=iC+RKkn4DoyUCGRIvR3frcOg0/qnXghnFesLIgNy5JVJ4QWQRRZDZORCfsS2otKTOa
 Q3uAbSKUHVZE6PBhhbXlF1rioJbBwVElowyXUZMRrY9gOdN/eoOrM+cHyKIg1kWHThVD
 zP/XuTdaYNd+V/GsD+c3bj3CbeZSifxpBB78o0K5wBCSxF4xefVZ3wVVys/GjR5PrgJu
 tpayo0qB+/QLgTVt9kxIYiZVamBw46HwGNo2+lZIn7DX3uMJ8qd9IsPIjZt/VJ0Uosk+
 m/ddYMtLy/ejCLxPywPmdWdxBULueYWLCVqVae6VnH/E4hyHiMtImIkMhc2eIFlVyLJs
 dspw==
X-Gm-Message-State: AFqh2krKRDwTBlEjbuStG6nWAZ/ZPMdHP5dw54n7Dg8I9qxqSsmiZON1
 OSNQ41sgXBQvfKtZm5DWYpEZFIF/K7hlT7Dpd+Sq/w==
X-Google-Smtp-Source: AMrXdXuV9TKAVHzukACpJCIGDdNXVbrbNUMelQFEEXb5waZ2ZQObiyPTxCJQcvWnbai7cKZAOwmSDDiq5glCGF0HS00=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr1030509oab.235.1672842169630; Wed, 04
 Jan 2023 06:22:49 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
 <87ilhmpvdt.wl-tiwai@suse.de>
In-Reply-To: <87ilhmpvdt.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Thu, 5 Jan 2023 01:22:13 +1100
Message-ID: <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 4 Jan 2023 at 19:16, Takashi Iwai <tiwai@suse.de> wrote:
>
> I believe it's time to check which commit broke things.
> Assume that the bug is USB audio core changes, the following 8 commits
> are relevant:
>

Reverting 1045f5f1ff0751423aeb65648e5e1abd7a7a8672 resulted in this
compiler error:

sound/usb/endpoint.c: In function 'snd_usb_endpoint_stop':
sound/usb/endpoint.c:1672:27: error: 'struct snd_usb_endpoint' has no
member named 'need_prepare'
1672 |                         ep->need_prepare = true;
     |                           ^~

I did git annotate on endpoint.c and found line 1672 was added by commit:
3759ae6600e40

Reverting this commit has allowed me to compile a kernel again.

3759ae6600e40
1045f5f1ff0751423aeb65648e5e1abd7a7a8672
9355b60e401d825590d37f04ea873c58efe9b7bf
a74f8d0aa902ca494676b79226e0b5a1747b81d4
9902b303b5ade208b58f0dd38a09831813582211
9a737e7f8b371e97eb649904276407cee2c9cf30

I reverted these six commits, testing each one independently, then
adding the next on top of the others, and it didn't fix the issue.
Then the next commit wouldn't revert cleanly.

CONFLICT (content): Merge conflict in sound/usb/pcm.c
error: could not revert 2be79d586454... ALSA: usb-audio: Split
endpoint setups for hw_params and prepare (take#2)

++<<<<<<< HEAD
+ again:
+      if (subs->sync_endpoint) {
+              ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+              if (ret < 0)
+                      goto unlock;
+      }
+
+      ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
++=======
+       ret = configure_endpoints(chip, subs);
++>>>>>>> parent of 2be79d586454 (ALSA: usb-audio: Split endpoint
setups for hw_params and prepare (take#2))
       if (ret < 0)
               goto unlock;
-       else if (ret > 0)
-               snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
-       ret = 0;


Again, I did a git annotate and found I needed to also revert
67fd112b4b040 to get 2be79d58645465351af5320eb14c70a94724c5ef to
revert.

This one also didn't fix the issue.

ac5e2fb425e1121ceef2b9d1b3ffccc195d55707
This final revert on top of all the others fixed the issue.

These are the reverts I made:
3759ae6600e40
1045f5f1ff0751423aeb65648e5e1abd7a7a8672
9355b60e401d825590d37f04ea873c58efe9b7bf
a74f8d0aa902ca494676b79226e0b5a1747b81d4
9902b303b5ade208b58f0dd38a09831813582211
9a737e7f8b371e97eb649904276407cee2c9cf30
67fd112b4b040
2be79d58645465351af5320eb14c70a94724c5ef
ac5e2fb425e1121ceef2b9d1b3ffccc195d55707

--
Michael
