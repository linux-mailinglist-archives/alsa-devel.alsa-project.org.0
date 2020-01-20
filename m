Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99B145A9E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jan 2020 18:07:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0892116B6;
	Wed, 22 Jan 2020 18:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0892116B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579712877;
	bh=nhRizQauLaKwDVNi9CwNr0n6zxdsdTDtvSzSxpa4c2I=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=am60E6iapGGl6mQVAFpwAFi2DFUmrEU6j0eqvqrARxbzX4arklLWxZADehxM/4JPt
	 AT6wY1c8zSCXu+RXZ2NTF+G2YrmD6nbScREoUB/zTyWVxCTaZgK1WO7J3RBQitsAX+
	 RIYCzewJGQfbi06elKWvOt/xRl7eQmOeLwugzpXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B086AF80277;
	Wed, 22 Jan 2020 18:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A6D9F8020C; Mon, 20 Jan 2020 12:42:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 819E0F800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 12:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 819E0F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Uv9fC4B4"
Received: by mail-ed1-x536.google.com with SMTP id j17so29177491edp.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PloFJQYaek4iGvgPaEPM8icRCVATJalZ4dGbzYGJ3FE=;
 b=Uv9fC4B4d8+B8/kHlhnw9HaXoZGl/CfqXFGo+uSM2nGjtAvg8obW+kLnwm9khlKiff
 w39YqJyYY+30UPFHwisKJlOfyDCdTkUwjBgLqBEsYyEk96WsN0wpruzV+ww6r3t+4YA6
 mJ/qICn+qAxOHWkr9tPwbSJKrw2+gF9Pw5AlMCvQ6cWcBBB6LUtcRMZb8qwlDR9noMLd
 vDsITXRA7CfYxI3GkP8HWEvk2y2qcp8sUCEzjz1aX/WuBV7Z6U5tnwMomH5zmykHW6m/
 HYIzQNNGFKE5jPJD/R8Atee6UBhtlLs/fi3weSUpfchEPZ/QI1M4eQTMGOTnK53A6uLf
 5uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PloFJQYaek4iGvgPaEPM8icRCVATJalZ4dGbzYGJ3FE=;
 b=GZRycaJbXGNmdVRSGtPOFzkCYMOnqQK2A5Iqc0eHz2IyLy8VVChxKJXsoD3Wnnt9Se
 dusfSYeiPjuaxqbUTe5vpcB4j0WWyoivohovaTOmdKzXb3hibo4onIXajlZtMMNqDpNl
 TS3/lOxZSCTfxmVrVolwe1LIgKGWzd1J0Qe2ocjO597OygKECACMVpwNxcjTYgVbDCKo
 ecAYi2pt53xGKDLwu984A3Z1X5lLjay2A1TPAK11q5s/h2JS1uDEO2Q9zE29B+Evxt95
 IP6V2m6j30qlpSfx9Ipea1ma8eQYTBaBZJTIxy85oov2ZtIm4vFBhQLAkuIvqW+VSXFs
 E5TQ==
X-Gm-Message-State: APjAAAW+NDler+WhrZEIpv0kWmSHtDXDl+LdYVIh7fWBbjiEaLOFb+6d
 NVfl8oVOFIe6zRan7z2GqFSpFFNSSJnJlpifcFasR3/wd48=
X-Google-Smtp-Source: APXvYqwzAlLlicA8x1gd6F3cROLeGDQ513g8VsMFi02fJCUSOfk2lxGoI+5/G6GZGczs67C4ilWaGVK/RvUdVt4vi2Y=
X-Received: by 2002:a17:906:494d:: with SMTP id
 f13mr20289957ejt.95.1579520566191; 
 Mon, 20 Jan 2020 03:42:46 -0800 (PST)
MIME-Version: 1.0
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
In-Reply-To: <20200119164335.GA11974@workstation>
From: Daniel Jozsef <daniel.jozsef@gmail.com>
Date: Mon, 20 Jan 2020 11:42:34 +0000
Message-ID: <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
To: ffado-user@lists.sourceforge.net, alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 22 Jan 2020 18:04:36 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] [FFADO-user] Toneweal / Trigaudio FW66 device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

Thanks for the quick reaction, Takashi :) I ran the command you mentioned,
and your guess was spot on:

daniel@gibbonmoon:~/opt/linux-firewire-utils-0.4/src$ ./firewire-request
/dev/fw1 read 0xffffc8020000 60
result: 000: 62 72 69 64 67 65 43 6f 03 00 00 00 00 00 00 00
bridgeCo........
result: 010: 00 27 23 00 00 00 00 02 02 00 00 00 00 00 00 00
.'#.............
result: 020: 32 30 31 30 30 35 32 35 31 32 31 35 30 34 20 20 20100525121504

result: 030: 02 00 02 00 ff ff ff 00 80 00 0c 40 7c e3 13 00
...........@|...
result: 040: 32 30 30 38 31 32 30 32 31 33 34 34 34 38 20 20 20081202134448

result: 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
................

Daniel

On Sun, Jan 19, 2020 at 4:43 PM Takashi Sakamoto <o-takashi@sakamocchi.jp>
wrote:

> Hi,
>
> I'm an author of ALSA bebob driver (snd-bebob).
>
> On Sun, Jan 19, 2020 at 03:01:00PM +0100, Daniel Jozsef wrote:
> > It's a Toneweal FW66, a 6x6 in/out 24bit 96kHz audio interface with
> MIDI. I
> > kinda like it for its build quality and the time I spent with it. :D The
> > largest chip in the device is labeled Trigaudio MNP-TA110. I searched for
> > information on this device, and found very little - it's a Taiwanese
> > company. There seems evidence that a "Trigaudio FW66" also exists, so the
> > device may have been sold under different brands in different markets.
>
> In my opinion, FW66 is an application of ArchWave BeBoB solution for
> audio and music units on IEEE 1394 bus (ArchWave is formerly known as
> BridgeCo) since I can find file structure for the solution in driver
> package shipped by the vendor. I guess that you can see large ASIC
> labelled with 'BridgeCo' (or 'ArchWave') DM1000/1100/1500 inner the
> device. If so, the device is possibly handled by implementation of FFADO.
>
> But as a quick glance to your log, the implementation of FFADO fails to
> detect it:
>
> > daniel@gibbonmoon:~$ sudo ffado-test Discover
> > ...
> > 02878614308: Warning (bebob_avdevice.cpp)[ 228] discover: Using generic
> BeBoB support for unsupported device 'ToneWeal FW66'
> > 02878620133: Debug (bebob_avdevice_subunit.cpp)[  83] discover:
> Discovering BeBoB::AudioSubunit...
> > 02878620175: Debug (avc_audiosubunit.cpp)[  56] discover: Discovering
> BeBoB::AudioSubunit...
> > 02878620196: Debug (avc_subunit.cpp)[ 108] discoverPlugs: Discovering
> plugs...
> > 02878778208: Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does
> not implement extended plug info plug type info command
> > 02878778236: Error (bebob_avplug.cpp)[ 120] discover: discover: Could
> not discover plug type (1,1,0,0,1)
> > 02878778272: Error (avc_subunit.cpp)[ 189] discoverPlugs: plug discover
> failed
> > 02878778283: Error (avc_subunit.cpp)[ 131] discoverPlugs: destination
> plug discovering failed
> > 02878778301: Error (avc_subunit.cpp)[  99] discover: plug discovery
> failed
> > 02878778312: Error (avc_unit.cpp)[ 283] enumerateSubUnits:
> enumerateSubUnits: Could not discover subunit_id =  0, subunit_type =  1
> (Audio)
> > 02878778335: Error (avc_unit.cpp)[ 177] discover: Could not enumerate
> sub units
> > 02878778347: Error (bebob_avdevice.cpp)[ 232] discover: Could not
> discover unit
> > 02878778376: Error (devicemanager.cpp)[ 628] discover: could not
> discover device
> > 02878778419: Debug (devicemanager.cpp)[ 661] discover: Discovery
> finished...
> ...
>
> The reason is the unit returns NOT_IMPLEMENTED response against vendor
> specific AV/C command (Extended Plug Information command defined by
> BridgeCo.) for Audio subunit. I guess that the device has no Audio
> subunit but the implementation performs to use it without checking
> available subunits.
>
>
> For my information, would you please clone linux-firewire-utils[1] into
> your system and build it, then run below command to dump device
> information:
>
> $ ./firewire-request /dev/fw1 read 0xffffc8020000 60
> result: 000: 62 72 69 64 67 65 43 6f 03 00 00 00 00 00 00 00
> bridgeCo........
> result: 010: 00 96 14 00 22 03 00 00 19 00 00 00 00 00 00 00
> ...."...........
> result: 020: 32 30 30 39 30 36 30 39 31 36 32 39 34 30 20 20 20090609162940
> result: 030: 00 00 00 19 07 1f 00 00 80 00 0c 40 70 35 14 00
> ...........@p5..
> result: 040: 32 30 30 39 30 36 30 39 31 36 32 32 31 39 20 20 20090609162219
> result: 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ................
>
> The above is a sample of Phonic Firefly 202. I expect the first line
> includes bytes represent 'bridgeCo'.
>
> [1] https://github.com/cladisch/linux-firewire-utils
>
>
> Regards
>
> Takashi Sakamoto
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
