Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD8216D50
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 14:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108EF9F6;
	Tue,  7 Jul 2020 14:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108EF9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594126733;
	bh=qO/0KNMOti6Pfl6snm0HxoLLfsx1p6edb2pFnQaVqSg=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pFr2vkW0w2iRAW3yoR1RYoGf03LE2WseAVUcbgE6xAvkr3i1IcBjm1qAKZhnBXI6w
	 HUS+4VSjF8rQ+wAoVKOjuO+EMdbEC1VQPa0pmxklLS0Y0TuzQDcvXxqK5BahGB7r5b
	 D3BZYwRW7QxZ9zNxOD44ojXlC+Lcl2Au0CDDmHIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BCDF801F9;
	Tue,  7 Jul 2020 14:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7077AF80216; Tue,  7 Jul 2020 14:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F235FF800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 14:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F235FF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="BgEa8PvI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aR057YUL"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CB6B15C0126;
 Tue,  7 Jul 2020 08:56:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 07 Jul 2020 08:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm2; bh=bxveDee3qVGxzH7SDJqotXiYemgZkLAwEILnPTei/8s=; b=BgEa8
 PvICYKU1uRjx2PAvCTLrRoHIl73Z7k2sSlyTj8PjHqSaaFzk7tw09ex9GE6x4z0s
 BN6kAyKyzoCPzVD2uV3SqDVlV0RFdEx350mxREYbGySh9kgKJY+ytcY3in+1rff3
 FNnUG4GPtD2hQ2Xg6iz0403ysNDAmll4O/gcwTxA6+Og+D/gA+GDowb/zn24v3XL
 kORo8uJ9ZCPN7n6mlAAq54Os/+ADJPYIv+9lUuYi6BAMsx9oXquOfieSAzzw3rCe
 dr3N3mqKWaYrLkSRnWyPf/vZdxK6RrpgC00RkjwEFGYwq2f0Yz7tQegmQSYQ4kpg
 p/lgLndlxQF2sx+Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=bxveDee3qVGxzH7SDJqotXiYemgZk
 LAwEILnPTei/8s=; b=aR057YULR7jcKwTrM5+q+TqgkNKufXuvXdqTU1RFmWFoc
 w5SZjaGlEguPrYRmZEfZeCLqOGaZ09WaGGL9k8tD8+ddTJQdOfwmNKSzh9rp5vcs
 GzMPDLWpd/ooMviKvUarkqJwKoVKORfb5XgxPsmAxDFqCnZHoAVACkzcBD39w4iv
 vV8RHlmHmvXhjLL+riuud0OH+xYjpgyshrqJADh0vRdfZWsb+S9b6bnRHEApl9hF
 N/UlULp5m+oB3b3FrtDdNPzL8of+U79mNiJTDbPHqobig0VTTh7FaJPHz/lnDhnX
 yn/Mpou6HS/GeC0Sr6y/FytdTMglridAHC6icsm/A==
X-ME-Sender: <xms:F3EEX667GvMzC_s9THQ0bk1JUJwez7ZSTEQom56fDa7lfvO4ykAcsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttd
 dvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhi
 sehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetteekudfhkeeute
 fgteffffdvheeftdeiueevtdffuefhtdffvefgudevffeutdenucffohhmrghinhepghhi
 thhhuhgsrdgtohhmpdhgnhhomhgvrdhorhhgpdhruhhsthdqlhgrnhhgrdhorhhgpdgrlh
 hsrgdqphhrohhjvggtthdrohhrghenucfkphepudektddrvdefhedrfedrheegnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrsh
 hhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:F3EEXz5ZXrcjo3HnWxO2nduaedv3kBOuCb7jLvLodzoTXVBqqtG7iw>
 <xmx:F3EEX5cL4tetONtZDM2EqGlu2HLcbHo9bPOObeE3Wot_SUdwoAp-3g>
 <xmx:F3EEX3IFwOelp55IQLsnH-yaBaOA5kVKmY92Bs9QN6vMFlbSzcpN0Q>
 <xmx:F3EEX9k1URT3c6G52oT9NCm8U4UNbS9B88ven9a5s6r0wBDLEojbNA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5728430600B4;
 Tue,  7 Jul 2020 08:56:54 -0400 (EDT)
Date: Tue, 7 Jul 2020 21:56:51 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: alsa-devel@alsa-project.org
Subject: [RFT] ALSA control service programs for Digidesign Digi 002/003
 family and Tascam FireWire series
Message-ID: <20200707125651.GA200100@workstation>
Mail-Followup-To: alsa-devel@alsa-project.org, sbahling@suse.com,
 ffado-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: ffado-devel@lists.sourceforge.net, sbahling@suse.com
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

This is request-for-test (RFT) to the ALSA control service programs for
Digidesign Digi 002/003 family and Tascam FireWire series. The programs
are available in 'topic/services-for-dg00x-tascam' of below repository,
and the RFT is corresponding to Pull Request #1:

* https://github.com/alsa-project/snd-firewire-ctl-services/

Background
----------

The models in above family and series are already supported by drivers in
ALSA firewire stack for their isochronous packet stream functionality.
Although the drivers allow userspace applications to process PCM frames
and MIDI messages in the packet streaming, they doesn't support the other
functionalities such as volume control since it can be achieved by any
usespace applications of Linux firewire subsystem.

The service programs added by this patchset are for the supplemental
functionality to control the models by asynchronous packet transaction or
to process a part of data transferred by the isochronous packet stream.

In detail, please read README.rst in the repository[1]. You can see some
illustrations.

How to build
-------------

The project depends on several libraries in below repositories:

* glib[2]
* alsa-gobject v0.1.0[3]
* libhinawa v2.0.0[4]

Before building it, please install them with gobject-introspection support.

The project is written by Rust programming language[5] and packaged by
cargo[6]. To build, just run below commands in the environment to connect
to internet:

```
$ git clone https://github.com/alsa-project/snd-firewire-ctl-services.git -b topic/services-for-dg00x-tascam
$ cd snd-firewire-ctl-services
$ cargo build
```

All of required crates are downloaded automatically, then start build.

Executables
-----------

The added executables are listed below:

 * snd-firewire-digi00x-ctl-service
 * snd-firewire-tascam-ctl-service

When running, the programs add and maintain control elements, then enter
event loop to dispatch events. Thes elements are visible and manipulable
for any userspace applications. The program dispatch any manipulation
event for transactions to control actual device. For console model and
FE-8 in Tascam FireWire series, the program adds and maintains port in
ALSA Sequencer.

They have command line options. For all models of Digi 002/003 family, the
executable has an option for the numerical ID of sound card.

```
Usage:
  snd-firewire-digi00x-ctl-service CARD_ID

  where:
    CARD_ID: The numerical ID of sound card.
```

For models of Tascam FireWire series except for FE-8, the executable should
run with 'snd' as its first option and the numerical ID of sound card as
second option. Tascam FE-8 is supported by the service program but not
supported by ALSA firewire stack since it doesn't handle isochronous
packet streaming. For FE-8, the executable should run with 'fw' as its
first option and the numerical ID of firewire character device.

```
Usage:
  snd-firewire-tascam-ctl-service SUBSYSTEM ID

  where:
    SUBSYSTEM: The name of subsystem; 'snd' or 'fw'
    ID: The numerical ID of sound card or fw character device
```

It's easy to run the executables by cargo, like:

```
$ cargo run --bin snd-firewire-digi00x-ctl-service 2
```

Receiving SIGTERM signal terminates the event loop, then the program
finishes.


Access permissions for relevant character devices
--------------------------------------------------

The executables manipulate below character devices to dispatch, convert, and
emit event from end to end. The '%u' is the numerical number in each
subsystem:

 * ALSA control character device (/dev/snd/controlC%u)
 * ALSA hwdep character device (/dev/snd/hwC%uD%u)
 * Linux firewire character device (/dev/fw%u)

Additionally, the service program for Tascam FireWire series manipulates ALSA
sequencer character device (/dev/snd/seq) to handle events of control
surface for console model. Users should pay enough attention to access
permission for the above character devices when running the service program.

Feedback
--------

Any feedback is welcome. For questions, please use mailing list in alsa-devel
or alsa-users[7]. For issues, please use service of github.com[8].

Issues
------

The name of control elements are not fixed yet since the convention of
name for element set is not clear yet for recording equipment.

Users may feel inconvenience to which channel corresponds to which physical
port. Furthermore, in the case that element set includes several elements,
it's unclear that which element corresponds to which physical port as well.
ALSA control core has no feature for the above issues at present.

[1] https://github.com/alsa-project/snd-firewire-ctl-services
[2] https://gitlab.gnome.org/GNOME/glib
[3] https://github.com/alsa-project/alsa-gobject/
[4] https://github.com/alsa-project/libhinawa
[5] https://www.rust-lang.org/
[6] https://doc.rust-lang.org/cargo/
[7] https://www.alsa-project.org/wiki/Mailing-lists
[8] https://github.com/alsa-project/snd-firewire-ctl-services/issues


Regards

Takashi Sakamoto
