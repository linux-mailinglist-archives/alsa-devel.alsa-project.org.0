Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7443A39F4C0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 13:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E843416BC;
	Tue,  8 Jun 2021 13:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E843416BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623150964;
	bh=78ccAhFO7kifF3RGq7XD9QjAw3FZnNAFHEg3c4q4Vr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mcE59XW1Ra4db109JPc8DyrcvzH52i4NziO3SmaP/0I5An3qNLkiB0UbBuZbdZCVc
	 7bjKsPVUUx3uPwvsPVMAKYbh080dAClAw9XTMId8rTeK3SlAhyZ+NYJFRYMhMeCVV1
	 GJMEYlzrAuiQzq0JEMgGa1n5RvpAMIuITWwMS3ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67740F80227;
	Tue,  8 Jun 2021 13:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F124FF80218; Tue,  8 Jun 2021 13:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 939DCF80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 13:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 939DCF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="wzcCpsPY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9C4F6128A;
 Tue,  8 Jun 2021 11:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623150863;
 bh=78ccAhFO7kifF3RGq7XD9QjAw3FZnNAFHEg3c4q4Vr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wzcCpsPYYs3ePxgglZVbi7fWGbed0RVk7QwZsstAMyYLXBTVC1cChhk94eH52A0tC
 ze7ESOEINwVdaxMBos5Yth/2jhLL9184tKTevAc7Yb2JX9Hd1sGaH6qM++6mVp513D
 TFi9xOz1YUmQ9yfVYYEu+oltKmPFR+6YoLeSGiM8=
Date: Tue, 8 Jun 2021 13:14:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: USB sound card issues
Message-ID: <YL9RDBUsk23LvHV9@kroah.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> Hi all,
> 
> I am using a USB sound card(snd-usb-audio), and it fails while doing
> the audio recording "arecord: pcm_read:2032: read error: Input/output
> error".
> 
> What could be the problem? and is there a workaround for this?
> 
> $ arecord -l
> **** List of CAPTURE Hardware Devices ****
> card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> 
> 
> $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
> Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
> arecord: pcm_read:2032: read error: Input/output error

What kernel version is this, and what other kernel messages are printed
when you plug your device in?

thanks,

greg k-h
