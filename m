Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2768AFA0
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Feb 2023 12:56:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC2181CE;
	Sun,  5 Feb 2023 12:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC2181CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675598159;
	bh=JnPFHgVzmMiDfUiJ92Z3Mob1MPztODvR9dmnacBCHZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqU/POrMHIf3ZlE4TGNIVVFIoMaGGsk/qg7ZBL7N8Bq8uZZDuKRtSQfR5MmFWkyyg
	 9J8AvUURbz1kI16w74w4voxrAvJGWzmkwKA/ImGtk1zO0xkNMo8/imNnwTjp8DcrDr
	 8bMlafjZKn01tIpmz5AiqLIo3Cs6r2tTjtDu87g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA0C0F804CF;
	Sun,  5 Feb 2023 12:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE6FBF804AA; Sun,  5 Feb 2023 12:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,STOX_BOUND_090909_B,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75E04F8014B
 for <alsa-devel@alsa-project.org>; Sun,  5 Feb 2023 12:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75E04F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Pry+w96S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1675598080; bh=JnPFHgVzmMiDfUiJ92Z3Mob1MPztODvR9dmnacBCHZ8=;
 h=X-UI-Sender-Class:Date:From:To:Subject:References:In-Reply-To;
 b=Pry+w96Soc5CVQN7+lZLfN7N1ZN5WCG+mn3Es9vg3fAD0ku0xukxqj2Q5MZ3BTi04
 jP9mmdv+6u7Q37HUQeTIo+WJuThe42FVjRid2595k8K3Ome5X1bZ7KfL6l15ZOkuTY
 sxlojKCoVzlJP4hj7/Suq6F8mN8GtaLDBLic0CRY8jgwUeJFWevFKHJvk3Q1SL0Eu4
 xEmKEjB6jN1UTwtjFML40QED3s9VnVhb39/2JVi2wViroC/NGzXn3WBmR71BRTxLRk
 tpmEN9PUwCBjWGrvhWv5w8UPimd9EtiNLbzm8Nik69pbHoOb63fYsEdrXjXizc43Br
 FtoWxI4WOatGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.11] ([77.20.255.105]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1ov6bE44Nf-00lEJj; Sun, 05
 Feb 2023 12:54:40 +0100
Message-ID: <63DF98FE.2060604@gmx.de>
Date: Sun, 05 Feb 2023 12:54:38 +0100
From: Martin Armsby on GMX <m.armsby@gmx.de>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
 rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: alsa-devel@alsa-project.org, perex@perex.cz, o-takashi@sakamocchi.jp
Subject: Motu 896Mk3Hybrid dump
References: <clpqss6u2nl2-tqmbic2pqf4x-fl7n8ufasb45-1to1x7160p65-86skuflc32uf-b435ds-2dqjqzzi2x9r-n26ssw-jjzxq0-aeknhb-drcr4x44iip67z8kfz-gayyzivnj1e3-exbx9z-ayuv2umcdyh1.1675078615418@email.android.com>
 <Y9fD0Nzg+bwKsDEZ@workstation>
In-Reply-To: <Y9fD0Nzg+bwKsDEZ@workstation>
Content-Type: multipart/mixed; boundary="------------080105060007090804030609"
X-Provags-ID: V03:K1:jUj+PVcKpD149WI1EBr/DtNwJvaM27t/iKlhs4FdZcIRvTM/vlC
 v5Isyby9ASsce8IBQIpxog0TdI7iCA0LAVFu8v1euY99yi27KSrjZQvnM9hrU5CBrC6DaKr
 M4NLsiX8Q+/OKz1m8VruItedR/MbrxSyIWlkuu95U24ufh1Z0cvHDg1g8WD9VFMhrpiQ9kf
 JSc+gS5BSILyZY+6dgGAA==
UI-OutboundReport: notjunk:1;M01:P0:6PDPsQoeNmA=;wqtpDg0SEB5d3T3yQy7D7eUphx8
 oaL5OgpnNHvHliz/9BV1bPSUmD+uE4sx1+AR1ucF+i92FiTEX7xUvF/rIPho7PeRYAqSuon30
 0sOpuTERnDaNzAZdEokj7iVntW4i+LuX9XD6iCh8jGimhQ/oQNCzZLLFCXLQMiMvzDiUOzRJl
 LHXKlWDCVMAiM8QovqAxWsg+PSErJT1YFBo1jJR86yIzlatcMips7oojB34rkaG8HC2fpX748
 1jXvdGN5B7+Tp971XmYOjluzCK36KaBxlX4aDDL/zxAzDvgfNmFGNG30WIOHt+6LZnXnN8k2F
 m+P1Y/rp4242jV0tBYl5aGc08tq0uL62dxWBSsbOE/EIK+FnMLxhgYkClI9qYQJhkcEQPcLTc
 AuSYDFsFoLHNxRW+BdIzX5bwP6LsJlFveJMsNVkRdYnfsFIHa0yAaCeVshAtKTacQ7PnmSOYs
 rlEXN5a+wXmwWpuR1d/HSxv3BTSeNcYlgCt3cdwVVK7tFbLBBRvR7/Qme/U84rzQ5GHijKydy
 iS4x5+3Uoi/7ABR5ozofUyjIJ+qdz6fhX782hJeLSn+sbP27oIlkN8QEav7slgZI8xZEhMwB1
 xyA2sYgCFd3n9wGds8V4hONcGobiHsLTXcMVVBU8Fvn6Sd8IMhKH7miyg/E8MQHM2cYGq3i9O
 cKTbVtLUOTKeK0MbMpFAWYHKJ/dQE82Xh/nLcOIpcTQzCFJzxdIZO21Wnac3YMcwLeJtH/6+L
 ltUxJMqhnVIFPTRs5DMfCf23JjKtQthT1+Ixr5MC+g79BH/sfSPzlvoiKzRnUmBXwqbUJ20ds
 5RP2tUGXwQchYItS9zU1hdGI7b090MD3SN3grx6gM/GgfzZdLuhGGkfgfoYA6VnryYngLE53s
 uQv0k2Qn/3obJV6QNpgHHniWErAYpO1w8dmh2Ol8Chtfft1RJ1q8KhUv8ZiDNYt83zItK+K/p
 sazG+Q==
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a multi-part message in MIME format.
--------------080105060007090804030609
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable


On 30.01.2023 14:19, Takashi Sakamoto wrote:
> Hi,
>
> (C.C.ed to administrator of alsa-devel mailing list)
>
> On Mon, Jan 30, 2023 at 12:40:06PM +0100, M. Armsby wrote:
>>     Hi Takashi,
>>     I'm writing direct because I cannot seem to get a post on AlsaDevel
>>     list.
> I've realized your two posts, but no reaction since they have no message
> body:
>
> * Firewire ALSA Motu and Phase24
>      * https://lore.kernel.org/alsa-devel/sokos1-r6xj933yn42y-hmy3gsrfgs=
ma-mnwe9a-cahiug-3btbiljo1il7-8lhisz-trzq63b9es27-41z6o2wylkgf-tjvaeo3olqk=
z-elr571-us6u4977mlo1-p2gxkncmroem-foujcu-jg85lg-sqi612.1674640678660@emai=
l.android.com/
> * Firewire Motu ALSA (Re-post)
>      * https://lore.kernel.org/alsa-devel/v6inx6-fwmr0r-kvajcd-kfs8u9l6m=
2qn2cnogd-2odpkz-d7vadu94fw76-iv1ohfsnh0nxdhq3hl-irmx6t-3alyitjtt3oq-m2jt5=
z8uktj3-1khriq-w6pr0c-bitxl26qa5mx-sc4dcno22ycq-2x7a4f.1674740730928@email=
.android.com/
>
> Jaroslav, would I ask your opinion for the problem which perhaps dropped
> the message body from his messages?
>
>>     I need to repair my two Phase X24 (defekt caps?) and I'm having
>>     problems with Traveler and other Motu interfaces on Linux.
>>     Thanks for any hints or where I should post.
>>     Here's  a copy of my post:
>>     Hello everyone!
>>     Thank you for all the hard work on this.
>>     Especially Mr. Takashi Sakamoto.
>>     I'm an experienced studio engineer and was a Beta tester for Sampli=
tude
>>     for years.
>>     Not a programmer and have very little experience with Linux.
>>     So please excuse me blundering in on this professional programmer f=
orum
>>     but I'm hoping my experience will help somehow to find bugs. I'll
>>     provide any information I can or test following instructions.
>>     I really would love to completely change over to Linux but I need
>>     reliable drivers.
>>     How can I help?
>>     Here's my experience so far.
>>     Around November I started testing Linux for audio as I have
>>     occasionally over the last years. I was pleased to find Manjaro and
>>     Sparky would detect Traveler Mk1 and Mk3 and to run so efficiently
>>     compared to Win10.
>>     But things would freeze.
>>     Reaper has a long standing Midi bug so it was difficult at first to=
 see
>>     why my laptop would freeze on occasion.  I dissabled hardware midi =
in
>>     the software.
>>     Then I updated Sparky beginning of December and to my surprise Fire=
wire
>>     didn't work anymore. The Firewire stack must have been removed.
>>     I use:
>>     Dell Laptops 4310, 6510, M4800
>>     Tested platforms Ardour and Reaper using Pianoteq 8
>>     No JACK
>>     Manjaro Kernel from 6.0 rc4? and 6.1.1 work for a limited time.
>>     Sparky only works with special kernels Xanmod1 6.1.7-x64v2 but the
>>     audio is completely distorted.
>>     CachyOS Kernel 6.2 rc4 sounds good.
>>     Common problem is freezing or loosing audio. Ardour is less sensiti=
ve
>>     than Reaper but Reaper is far more efficient on CPU
>>     (20% compared to 90%and more with one instance of Pianoteq 7 or 8)
>>     Motu Traveler MK3 and MK1 wrong channel assignment from 1+2 (3+4 ar=
e
>>     actually 1+2) and freezing or just loosing audio.
>>     Motu 896Mk3 Hybrid not recognised in firewire or USB mode.
>>     Shame cause its the best.
>>     Motu 8pre working similarly.
>>     Phase 24 working much better but still freezes or looses audio afte=
r
>>     long period.
>>     Tested in Ardour and Reaper.
>>     I hope that's not too much at once.
>>     Martin Armsby
>>     M. Armsby
> Thanks for the report including many issues. I apologize to trouble you.
> In my opinion, the issues are not so easy since each application uses AL=
SA
> PCM device by slightly different ways. So we need to investigate the
> issue step by step to take relevant longer time than easy issues.
>
> Before discussing about the issue, I need to ask a help about MOTU
> devices. As you realized, 896 mk3 is neither supported yet, FireWire onl=
y
> nor Hybrid, in IEEE 1394 bus nor Universal Serial Bus. For example, you
> can see no entry for the device in module device table[1] in the file
> which consists of snd-firewire-motu driver.
>
> The reason is apparent; no one provides information enough to support
> it. Then I would like you to help me to integrate for it in the case in
> IEEE 1394 bus.
>
> I maintain a remote repository for my collection of configuration ROM
> image which includes identity information of each node in IEEE 1394 bus[=
2].
> The information is useful both to make the entry of module device table
> and to make hardware database[3] in systemd project.
>
> When 896 mk3 Hybrid is connected to IEEE 1394 bus and only connected to
> the bus, Linux FireWire subsystem detects it as '/dev/fw1'. Then the
> rom image is exported to an node on sysfs. You can retrieve the content
> by the command line below:
>
> $ cat /sys/bus/firewire/devices/fw1/config_rom > motu-896mk3hybrid.img
>
> If retrieved successfully, please send it to me. I don't mind to receive
> it to private message, mailing list, any upload services.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/sound/firewire/motu/motu.c#n162
> [2] https://github.com/takaswie/am-config-roms
> [3] https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit=
-function.hwdb
>
>
> Thanks
>
> Takashi Sakamoto
>
Ok, Im pleased to help with the drivers for Motu 896 Mk3 Hybrid
I followed your instruction and dumped an .img
Just for comparison I also dumped an .img for Traveler Mk1
These are both in the zip file - (or how would ou like it)
The img seems ver small - I hope it's usefull :)

BTW
Manjaro update with Kernel 6.2.Rc6 is running very well with Terratec
Phase24 and both Motu Travelers.
Not perfeclty but I was able (for the first time) to edit productions
using Reaper for over an hour with no problem!

Note:
Traveler have wrong output numbering.

Cheers,

Martin

--------------080105060007090804030609
Content-Type: application/octet-stream;
 name="Motu-img.7z"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Motu-img.7z"

N3q8ryccAAJLSbXv6wAAAAAAAAAiAAAAAAAAAHOagOUACqRh8EGrcMpLK4ZET2tC7lrZlcwZ
dfExVKsFzF357TNmy/pdoY2JRZllOHCXngzduk4XMG/dehRnxdV4m0yu4zlqYv/gHaf9n/qp
OK1ZL1zWhqDCxQG9Av//x1d4gAAAgTMHrg/Tgvy9QMCQ00PE4fnoodUi3aHPXAeTvTXdnWLL
N2CVVO12YvJw94+cfrsbO8Vf+Za/mwCpDzisdInVBMkFjHPYqBrU7jp/Ajy8BMNiPw2b8OFr
w6A9bTG/Eu8TVw+9Y+d+4y3mluiU9m0/lQr+uiq+QCb++p+LY9co5ViusEzMcu3qX4AAFwZf
AQmAjAAHCwEAASMDAQEFXQAEAAAMgKkKAazPBKoAAA==
--------------080105060007090804030609--
