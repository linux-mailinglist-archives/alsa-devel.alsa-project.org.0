Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFDE1FCE06
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 15:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C88B1671;
	Wed, 17 Jun 2020 15:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C88B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592398967;
	bh=XlbwWUi3PbCe6Cd/piBT05Tehn2yAgiGqKVz204ufKk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=plviQGRV/YTAcHkQYAe+8anCsrYCaUezRxKbStZ1mrNHTzVD+rEhLe76dCLeSDoCU
	 pbsTxOex1msgdrHQtZ6udpbLyg1TPdE0fMxluTLPDa4JYh96CWpy1TenjMB5NVSaod
	 rPh/CWaxu7w+oQFO8fE5WRcwa1swBix4LZeRrZhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2270F801D9;
	Wed, 17 Jun 2020 15:01:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0EAAF80171; Wed, 17 Jun 2020 15:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtprelay07.ispgateway.de (smtprelay07.ispgateway.de
 [134.119.228.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B6BBF800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 15:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6BBF800EF
Received: from [87.123.36.99] (helo=yrla.localnet)
 by smtprelay07.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <alsa@reaktanz.de>)
 id 1jlXgP-0004AL-Eg; Wed, 17 Jun 2020 15:00:49 +0200
From: "m.eik michalke" <alsa@reaktanz.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: presonus StudioLive 24.4.2
Date: Wed, 17 Jun 2020 15:00:49 +0200
Message-ID: <5770610.t4SrzthkjT@yrla>
Organization: https://reaktanz.de
X-Face: :Fk?kfw3:=Vz)np%nh,d4^[#)-y,9IYe:y,; }P|%`fw>/.msl.f=*6j*-f$vL09$qopvp6
 Ox|(^ge<|+0iS]{&|\<0>i7r'@'k+i=eB5y8*pO$#xT+$2uq=`
In-Reply-To: <20200616121829.GA204160@workstation>
References: <1859294.RmyynjnHiM@meadow> <20200616121829.GA204160@workstation>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Df-Sender: MmRXRmFlNmlha21wWFBSNnA5Y1lAYWQuZ2VsZHVudGVyZ2FuZy5iaXo=
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

hi,

Am Dienstag, 16. Juni 2020, 14:18:29 CEST schrieb Takashi Sakamoto:
> On Tue, Jun 16, 2020 at 10:11:57AM +0200, m.eik michalke wrote:
> > i'm trying to get a presonus StudioLive 24.4.2 up and running:
> >   https://www.presonus.com/products/studiolive-24.4.2
> >=20
> > so far i'm partly successful -- looks like the board is automatically
> > detected and supported by the firewire dice module.
>=20
> Thanks for your trial to the device. For my information, would you show
> your kernel version?

$ uname -a
Linux yrla 5.3.0-59-generic #53~18.04.1-Ubuntu SMP Thu Jun 4 14:58:26 UTC 2=
020=20
x86_64 x86_64 x86_64 GNU/Linux

> > however, i'm only offered 16 of the 24 supported audio channels. in the
> > list of soundcards it is merely shown as "studiolive" without further
> > info on the model. i wasn't able to find further info on this board's
> > status with regards to alsa, so if there's documentation on this
> > somewhere, could someone please point me to it?
>=20
> I guess that Dice ASIC in your device can process two pairs of
> isochronous packet streams. In the case, the driver adds two PCM devices
> to system. I think you saw the first PCM device and it can handle 16 PCM
> channels. Another can handle the rest 8 channels.

i see.

> Would you find below procfs nodes and dump their contents?
>=20
> * /proc/asound/cardX/firewire/dice
> * /proc/asound/cardX/firewire/formation

$ cat /proc/asound/cards
[...]
 4 [StudioLive     ]: DICE - StudioLive
                      PreSonus STUDIOLIVE_2442 (serial xxxxxxx) at fw1.0, S=
400

$ cat /proc/asound/card4/firewire/dice
sections:
  global: offset 10, size 90
  tx: offset 100, size 142
  rx: offset 242, size 282
  ext_sync: offset 524, size 4
  unused2: offset 0, size 0
global:
  owner: ffc1:000100000000
  notification: 00000020
  nick name: StudioLive
  clock select: internal 44100
  enable: 0
  status: locked 44100
  ext status: 00000000
  sample rate: 44100
  version: 1.0.4.0
  clock caps: 44100 48000 arx1 arx2 internal
  clock source names: AES12\SPDIF\AES56\AES78\AES_ANY\ADAT\ADAT_AUX\Word Cl=
ock
\Unused\Unused\Unused\Unused\Internal\\
tx 0:
  iso channel: -1
  audio channels: 16
  midi ports: 0
  speed: S400
  names: Ch 1\Ch 2\Ch 3\Ch 4\Ch 5\Ch 6\Ch 7\Ch 8\Ch 9\Ch 10\Ch 11\Ch 12\Ch=
=20
13\Ch 14\Ch 15\Ch 16\\
  ac3 caps: 00000000
  ac3 enable: 00000000
tx 1:
  iso channel: -1
  audio channels: 16
  midi ports: 0
  speed: S400
  names: Ch 17\Ch 18\Ch 19\Ch 20\Ch 21\Ch 22\Ch 23\Ch 24\Auxiliary Ch=20
25\Auxiliary Ch 26\Auxiliary Ch 27\Auxiliary Ch 28\Auxiliary Ch 29\Auxiliar=
y=20
Ch 30\Auxiliary Ch 31\Auxiliary Ch 32\\
  ac3 caps: 00000000
  ac3 enable: 00000000
rx 0:
  iso channel: -1
  sequence start: 0
  audio channels: 16
  midi ports: 0
  names: Ch 1\Ch 2\Ch 3\Ch 4\Ch 5\Ch 6\Ch 7\Ch 8\Ch 9\Ch 10\Ch 11\Ch 12\Ch=
=20
13\Ch 14\Ch 15\Ch 16\\
  ac3 caps: 00000000
  ac3 enable: 00000000
rx 1:
  iso channel: -1
  sequence start: 0
  audio channels: 10
  midi ports: 0
  names: Ch 17\Ch 18\Ch 19\Ch 20\Ch 21\Ch 22\Ch 23\Ch 24\2TrackIn L\2TrackI=
n R
\\
  ac3 caps: 00000000
  ac3 enable: 00000000
ext status:
  clock source: internal
  locked: 1
  rate: 44100
  adat user data: -

$ cat /proc/asound/card4/firewire/formation
Output stream from unit:
        low     middle  high    MIDI
Tx 0:   16      0       0       0
Tx 1:   16      0       0       0
Input stream to unit:
        low     middle  high
Rx 0:   16      0       0       0
Rx 1:   10      0       0       0

> > in case that as of now the studiolive isn't officially supported or the
> > above behavior is due to the fact that so far only the 16.4.2 is known =
to
> > the module, i'm willing to help as far as i can ;) i hope that already
> > seeing 16 channels is a good point to start and that it's not too hard =
to
> > make the remaining 8 show up as well...
>=20
> Would you get output from '/proc/asound/pcm'?

$ cat /proc/asound/pcm
[...]
04-00: DICE : StudioLive : playback 1 : capture 1
04-01: DICE : StudioLive : playback 1 : capture 1


all looks to me like you were right. IIUC the board provides a total of 32=
=20
output channels and 26 for input. does this mean the device is already full=
y=20
recognized and functional? can alsa be configured to provide all channels a=
s=20
one "sound card" so they become available in, say, ardour?


thank you & best regards :: m.eik


=2D-=20
:                .       .      :   :                    .=B7=B7           =
  :
::.       ..    ..::  dipl. psych. : : m.eik michalke  ::..    ..  ..  .::
:    =B7   :        .=B7      .        : :          .            .:        =
  :
:.. .. .    .. . :  OpenPGP: F8315CCB7BDABA8E  .=B7  .    ::.:     =B7   : =
  :
:       ..:=B7=B7                       .: =B7=B7.       ..:...            =
      :
:..  https://reaktanz.de ...  https://angstalt.de ...  https://C3S.cc  ..:



