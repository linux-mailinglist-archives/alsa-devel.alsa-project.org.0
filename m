Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB12D348A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 21:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8DEC16E1;
	Tue,  8 Dec 2020 21:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8DEC16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607460899;
	bh=RbIXEMfOELzdix3fO9EJDqyZYm63k3jclOdyutIJjK0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMQQ/sFkjrXgwtgdhoSQ7UsUTyHS0HnMdsfyKvSNnC/rESH84sOrhEcF+jXn9bxjm
	 rMZi1+aYVB0RAE0JKvYRWYPtjFLdsQdNode75bTMudGKHfRJxMaR2zErQGx/kaYnym
	 QUGKmnI2TykoKKE2D1ZAuG4R7G0B9NTvLV4GBOaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB68F80218;
	Tue,  8 Dec 2020 21:53:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22AFCF8019D; Tue,  8 Dec 2020 21:53:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B82F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 21:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B82F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.b="Bg+WiNI6"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id BB01A2400FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 21:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1607460794; bh=RbIXEMfOELzdix3fO9EJDqyZYm63k3jclOdyutIJjK0=;
 h=Date:From:To:Cc:Subject:From;
 b=Bg+WiNI69FL5MmY6hXd2weh+iwp5IuTSkWk0TkMaNw6BL2k/LGcdzg45od7xHXN9l
 yYye8sQvA4IE89jBQD39UAM9r+VfjtCcsCh6335Klsyw+1uBKMvZIAbdc6tJF0N3Fn
 dfXk05DlCCBjVT4wk8QvqgMbOf9fustrFRTOzzXM/FdVrFo6eOIuHusMnbTaPPgGLg
 M009EieCRWmgEgYRF9de3LhRN+EuRQ9F7IGnFYw5hdOx/QRIiKEKes7udrKo629N2z
 VlRWZLGtstDd7fMd/g723t5T6eRs7L3c61RL/zvZPv88TkornVSxFd9eYveHJv3lfS
 l+FtI/n2PRNag==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4CrC7Z2MGWz9rxN;
 Tue,  8 Dec 2020 21:53:14 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 08 Dec 2020 21:53:14 +0100
From: meschi@posteo.de
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Steinberg UR22 Crackling and Clicks
In-Reply-To: <s5ho8j4ujwx.wl-tiwai@suse.de>
References: <ce03244f4699ffc9574ecc2dae41a417@posteo.de>
 <s5hft4gy4ar.wl-tiwai@suse.de> <61da73624ff3855867b8e65936fc2e1c@posteo.de>
 <s5hft4gwdji.wl-tiwai@suse.de> <eb1baf202fa4cd74a502661bb0ce5279@posteo.de>
 <s5ho8j4ujwx.wl-tiwai@suse.de>
Message-ID: <987d1956f52ba49dc3b587c33e08bfb2@posteo.de>
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



Am 08.12.2020 21:23 schrieb Takashi Iwai:
> On Tue, 08 Dec 2020 20:41:33 +0100,
> meschi@posteo.de wrote:
>> 
>> 
>> 
>> Am 08.12.2020 15:57 schrieb Takashi Iwai:
>> > On Tue, 08 Dec 2020 15:50:28 +0100,
>> > meschi@posteo.de wrote:
>> >>
>> >> > It's likely the issues with the implicit feedback.
>> >> >
>> >> > The latest development tree (either linux-next tree or
>> >> > topic/usb-audio-refactoring branch of my sound.git tree) contains the
>> >> > improvements of the implicit feedback mode.
>> >> >
>> >> >
>> >> > Takashi
>> When I try to play a file now this happens:
>> $ aplay -D plughw:CARD=UR22 ./file.wav
>> Playing WAVE './file.wav' : Signed 16 bit Little Endian, Rate 44100
>> Hz, Stereo
>> aplay: set_params:1407: Unable to install hw params:
> 
> It's a known side-effect of the implicit feedback mode, and the latest
> patchset I mentioned earlier addresses the issue.
> 
> 
> Takashi

I'm already running the kernel built from the linux-next tree...
I built next-20201208 from 
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Is there another patch set that I'm missing?
