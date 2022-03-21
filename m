Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFE4E4299
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:13:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F5716D5;
	Tue, 22 Mar 2022 16:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F5716D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647962024;
	bh=+WzvTmmmxMSWTXa8WYtaSAC7k5GzNAVO9AYvjHcDIKI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RA+Amgx73mhwoLu8uzZsO1ln50NNuFnaf1gzPRatlef9YuGa6gfKGJT4X3Nc/Rma4
	 oCM/CUujAnFOhL6k6tow4b8/xBHNGAbDEweDxLu4xiZud+pNcEJY56+aH1N9s94hgV
	 OQgjM1xkGmSVXRq7mcXOJZLBkwADGl02FUHIBzlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57609F8053A;
	Tue, 22 Mar 2022 16:10:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 755B5F80109; Mon, 21 Mar 2022 23:02:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C82AF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 23:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C82AF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mail.com header.i=@mail.com
 header.b="6Yv++Tjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1647900111;
 bh=+WzvTmmmxMSWTXa8WYtaSAC7k5GzNAVO9AYvjHcDIKI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=6Yv++TjwXJxuXDMEvnTrPBFpQoYKg1200BKgJqfsKu4FK0eK9aj+bIYlFGib6/7dQ
 Md6+uFUaj8pQqErkrb79TdjKFiHtyl4ulek//8EJZDWB12rp3K595W7096mSR+FAFj
 4MMpxvvHdivQR7drXCLeaJySanAYLlnrUL/TH0lo=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [216.73.162.172] ([216.73.162.172]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Mon, 21 Mar 2022
 23:01:51 +0100
MIME-Version: 1.0
Message-ID: <trinity-0bb2f400-d9ef-4368-8ab3-5acb07a11fa3-1647900111584@3c-app-mailcom-lxa05>
From: cblondin@mail.com
To: alsa-devel@alsa-project.org
Subject: realtek ALC1220 : recording samplerate 10x too slow
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Mar 2022 23:01:51 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:tI670jIfsWX0uham26AQYaPJNJWpUjez+W48/y/54dwcuXSjUyGmPWu/4smQWxb++yXON
 Bvq4xSUC9iSDcmVxwNChpluMc4Tzn+Qy5VX3msZaodInxcD6nl5PAaJ8qYTO1rE/xccEiX6pni7D
 N9NFGuFP45GIYu+o6csJdYTUZ8l5rN8wDl2qDTHRcuJP6r7zHxkBy41WIZnlb20qMnZsTqQb9D+A
 IQNhwObQnAYAJ91Fo5tM0N1GuBAL2EhMgs1Y6A555jcDLk90IsdzHdXEixHSvnmcEBqUA9UtFLxb
 s4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:FnsLpW/7CJM=:1G8dJ6DTWTuNFG46vDFBPl
 ueIfs9QjcVq4XSnWACU13KmTjvBDiDoOflwIF2FeLJVVBSrNiOphjAiE8JZezBxjkOvFJPEQq
 ReEfa7FVq2LLNvoFpYUCMkFzu2kFvN4WLOJoKGZjHV7qwWuCuQ4FdVtwb+Uu+sEk7qvpiJ340
 2f2kEra6SIFTJLCfqa/tLG6YdAun1RIojBUiq9ForifzSdSEOyLIIWwjvxZ7LLSznkeH7c+aM
 Sj/iR4ObTSpjQ8fpR4lKpSTBuyGe+HtRNHmn45UFdhyj1+OxJwVQx5z+5GLPxlIxbehLHQapm
 0+my1eK+WSpcIhUNT6fWJm/zOOR+EVyX/pxdLq1lE2fN8/1rmbCTmfeB8x+sjDnlmunZl2gZU
 w3uIXKlQxyFs7O44PPtHPD19lawDvjiSyuRv37rOk9e+NL7++b76bjMk+M+OqXYqd1vStQnvI
 6/RyoMCCTSBA4H20/BmGelxyvedY+bLW7UtxyOVM2DOP0CAAhjE38J/qm7OSJ9znP8L1KiWWP
 HBCCPtUiSuPgU1cLHT5RnwY83OpD6+MmbzwVLyJ0Dgm9tsTJAsr48/SWUotPkZc/WuBRaLz8x
 Mo/7t0h2z/nZpH82fx2K/VO9gUkX7l+xmzJxxA4RjdV33u7th8wxqkyL3PdEYK9zVnDG3CslN
 y9aNdDEwfMBOmiWKymw2BVaGiJjQ2JlRgGHqIM+l0goXvlPfaK5Xv56Lfd93kIxEM686UPaiO
 x/rHtWQi/bznGQ5bdCkUhI3CboMuwPld3UfelzQSTdBvBwfWz6kCW/Ww0w9rkHNiPBecH6Wec
 Ou5VmfV
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:01 +0100
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

Hi,
I was redirected here by pulseaudio maintainers for an issue I thought was=
 at that layer :
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1344

After a fresh reboot, arecord / parecord work fine, and the level meters i=
n pavucontrol react normally.
If I start audacity, the card gets in a state where the level meters becom=
e sluggish, and recording either drops 90% of samples, or records approxim=
ately 10x too fast.
Playback is always ok, unaffected.

I cannot fix that state other than by a reboot. The obvious "closing audac=
ity", restarting the pulseaudio daemon, have no effect.
Tried kernels 5.15.24 and a recent 5.17; same problem.

I posted some detailed debugging info on that pulseaudio issue tracker, as=
 well as pastebinned alsa-info.sh output here:
http://alsa-project.org/db/?f=3D7ee784003379252acfef25de5fecbdfd559fe342

The problematic hardware is Card 1, Audio device [0403]: Advanced Micro De=
vices, Inc. [AMD] Family 17h (Models 00h-0fh) HD Audio Controller [1022:14=
57].

Test command :
pasuspender -- arecord -D hw:1,0 -f S16_LE -c 2 -r 44100 arec_pasusp.wav

Here's an example recording of me saying 'test' :
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/uploads/5a51081fcd55e=
cd705df258c1a0fd2b6/arec_44k.wav

I have no ~/.asoundrc or related files.

Anything I can try to narrow down the cause of this ?


Thanks!
Chris
