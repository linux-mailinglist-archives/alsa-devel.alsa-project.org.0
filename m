Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759B20CEE2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 15:49:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5721655;
	Mon, 29 Jun 2020 15:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5721655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593438554;
	bh=qN5msTLZjXpiosEUJlbRO03qeC8R2Bb2y1rnvQPAEQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nEdyaxs7jVMLCcuO8cvUZQJuAAGc3365RaePsZxk8IQJJIvRvvz4tKd7ICuMZkQO7
	 zPswOcIWq6HIKK2BvZIJ9R5gS6BZVEUAHIt60T4Aj2fBtBGsXIRUu/y+xSsydM8tKV
	 RP6ITseCpPbsBfFBbxYIlF35/Eq0cjvCU9cGLYqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A20FF8020C;
	Mon, 29 Jun 2020 15:47:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39B6F800EA; Mon, 29 Jun 2020 15:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03146F800BA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 15:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03146F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="An2PAa54"
Received: by mail-wm1-x344.google.com with SMTP id l17so15464111wmj.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 06:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=E4Ak3r6pvhZUrtIpllZupN4QVvQI53uOEJhtR4wKlF8=;
 b=An2PAa542smzeQC5s1qO4Nea2WjdvZGybbSSawEqUVyRH19n97Oz5o+/ZjA72DumUL
 o2lW7XDD0Qj+a5xG8WlEaLKECmkGr73Nz44QEYBV+aTwoIoiy1mw+QNmv9rQx2yNu4WR
 T/CQF3f3R7g2p6q2+PnGGIHNYBc/mYQXKr3jFuzOzyz4MnwY0HlZFKRSjTmmqu4hL1uk
 iEj493atO6uVQn0bmZh6/TvR5O35DAfpQ2uo+PL2iU8mnrts0n/xjxhaRte4fBNMKjMT
 PI7xtM+KcW0Aibif7B2GJNQdaamkJ9ZQMDx6bTJ6rA2CNFbAuN6fYW5VQpgSn/W3Y5w+
 nCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4Ak3r6pvhZUrtIpllZupN4QVvQI53uOEJhtR4wKlF8=;
 b=MQUwU9UETXZMQF0iyAAciU+cIVwhRWdl5OmN4z1d3jIvl5kGP+wAsUjQz4a2KDmNka
 whmvpoiosxoj6OmFXq04QvMoJU42sP5xjgF5y3Ql2B6RhCDLd5ZmxR0bo6cHzMp/WsMD
 8pxddypXs5UsIcHUgL/OHyYXAxb9xl2nVZ3V5yHAC7+I+TpwGcQd9rmfsEkliDkQDdzi
 MZB1ln17duFl2F1TjBbCzl3Ccfi7RtjLRs4txm0t5hd4vEYLjoXf0CsvYh5dwOeNcprg
 TZ0Ys7N2JrqqJUkesdwuY0dROLkQgvgtNqILE9DjRy9yNga+JJNR50ZiDSB0WvKwhGC+
 jL6g==
X-Gm-Message-State: AOAM530ecWXNS4IT321958SJV5NdzsjYi0Ynz8Lva4sctUzzDQwkJcpZ
 1u7brfNcFtCft7xSqNb40JJa4Z2j
X-Google-Smtp-Source: ABdhPJxlXnAQwsNZXRSI5bj+JLMDwKKAFvis7yli3psgOJw2JjeIETA0UBFF/c7eVsNUs6D08UPvcQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr16678671wma.73.1593438377812; 
 Mon, 29 Jun 2020 06:46:17 -0700 (PDT)
Received: from gluon.localnet (voucher2.mis.mpg.de. [141.5.26.35])
 by smtp.gmail.com with ESMTPSA id f12sm19297870wrj.48.2020.06.29.06.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 06:46:16 -0700 (PDT)
From: Stanislav Kazmin <stas.kazmin@gmail.com>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
Date: Mon, 29 Jun 2020 15:46:15 +0200
Message-ID: <32519971.jW2LJBauvq@gluon>
In-Reply-To: <s5h366ln2vc.wl-tiwai@suse.de>
References: <CA+-1zuv3SeumhdMbqXjZU0tbmh7HB9LwTK2bfNTe5nOCmz4BgA@mail.gmail.com>
 <s5h366ln2vc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hello,

unfortunately I am still lost and do not know how to attack the problem...

But I found this bug: https://bugzilla.kernel.org/show_bug.cgi?id=207423

and I wounder if it related to the problem here?

Best,

Stanislav

On Dienstag, 23. Juni 2020 18:49:59 CEST Takashi Iwai wrote:
> On Tue, 23 Jun 2020 17:49:18 +0200,
> 
> Stanislav Kazmin wrote:
> > Hello, I have the following problem on my Acer TravelMate P614-51T-G2:
> > 
> > I have all the audio sinks correctly identified (like HDMI, DMic,
> > Headphones) but the internal speakers do not produce any sound.
> > 
> > What I have tried so far:
> > 
> > - hard/soft shutdown on Windows and reboot
> > - disable/re-enable speakers and microphone in BIOS
> > - uninstall pulseaudio and test alsa alone (so it is defeitely **not** a
> > pulseaudio issue)
> > - switch from sof-hda-dsp to snd-hda-intel driver (without Dmic support)
> > - retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through
> > hdajackretask
> > (only basic, without advanced features)
> > - removed/reconnected the headphones
> > 
> > `alsamixer` shows all needed sinks and nothing is muted.
> > 
> > I already discussed the issue at sof github
> > https://github.com/thesofproject/ sof/issues/3058 but since the same
> > issue occurs on `snd-hda-intel` legacy river, I was advised to
> > communicate with alsa-devel team.
> > 
> > The alsa-info.sh result are linked at http://alsa-project.org/db/?
> > f=252f92c7a1df3c755d16ee69353b26d2535a4d81
> > 
> > I have tested the kernel 5.8-rc1 but it does not make any difference.
> > 
> > Let me know if I can do anything else to test the issue.
> 
> It's hard to know and the only way is to some trial-and-errors.
> The first shot I'd take is to toggle GPIO pins.  You can change the
> bit via hda-verb program like
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
> 
> to turn on the bit 0 of GPIO.  The first 0x01 is the node ID and it's
> 0x01 on Realtek, and the last 0x01 the GPIO bit 0.  For toggling the
> bit 1, pass 0x02 in the last argument, and for bit 2, pass 0x04.
> 
> And try turn on EAPD on non-used pins.  This can be done via hda-verb,
> too.
> 
> If this doesn't help, you might need to try some COEF changes as done
> in various quirks in sound/pci/hda/patch_realtek.c.
> 
> 
> HTH,
> 
> Takashi



