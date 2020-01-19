Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE0141F1A
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 17:48:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3FF516A5;
	Sun, 19 Jan 2020 17:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3FF516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579452503;
	bh=yeuuyAp7LcchYySHWPCLdPfZ4+feW6T1vusOzAOwLdo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqnCPJ2q4T53BhtaVFk9nhmKnIvNnq7UbFvfPEBaZuiE25Jabl3B6mbkXUTnU3RXB
	 745oAf4Hf1ks0txtnzrY2E/3IbY9K8LWX+OaSyj+ZB1snJrM74i5xNj/j/64NNKUgW
	 jPoQZyx6rGPas9czM5aslPfGVP4aCiLRlLQu8J20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DDCF801D9;
	Sun, 19 Jan 2020 17:46:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520F0F801D9; Sun, 19 Jan 2020 17:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30656F8013E
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 17:43:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30656F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hP6/5mHI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ytpzE8mH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 672902177A;
 Sun, 19 Jan 2020 11:43:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 19 Jan 2020 11:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=CgUV5NHt5iF8EVsvBPk9dwIZk9Z
 4KFsZPjCGbr33Kpo=; b=hP6/5mHIFz9hRKd6OuYx/4Di5P0dcBHNCL7U+3HnQb2
 UuWkScOY+rTKAG4SxlShtdUyvHLXr3I+tzm64sR2aLH+mvvYGsXsekpze1TCAXMU
 l7WnQ1RM7AWqomt91bLrMnS7fXz8gFImGPfvJjb+ue6eN4MQNsQtUEK2xkEIN8VJ
 5VcdLv1yumjav0d9Lv3zxZ7uNpCS8qADRv74TZoyApjb3e5v5cxJXaPxl6/ddHnz
 EJ7ibHZMiiiwNapM0xjfnOq+zuMHs4imgip8+USQ8+kfZ0N2e6qGBZkRNEXRSiR5
 THY64fRp4jrLH5IEg2EhQHJRrKAjv5bmv8KMun1EOcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CgUV5N
 Ht5iF8EVsvBPk9dwIZk9Z4KFsZPjCGbr33Kpo=; b=ytpzE8mHWW1bUZRxbOWX9C
 3jZWZp+D1XCQYSm9whCMILkdoYAQ8q4RlKjHwlacVNDamVagBLMvCKNoz55eSV0p
 ek1y1T+r9QrL9fdmDZPV0kkOaGHcJK6M7ozCfTvcG7Lk9xbjHkSFxFlq4bDWGaQb
 6pAZcJO460B3B9yfvqT/Jx0cJFZfsWJtfPD1OW3B3Jbpz87K6LZYrbk6bqiZw0MB
 a91/CC8/NeRJztjiYndNsn0jUvDRkKfNQqoULxvQfSvZ2u5IGZufdy1Fbf9yE7m2
 b5ApaBorMAH+rybtgi5BBux6CTsjFKWgY8mNGNHjawViIs4w8RoA6wh9zgcl65zg
 ==
X-ME-Sender: <xms:O4ckXh-99g-MeV3VZdR6EM1xdAwkisCwTxIqPddd6OWuBumD_C97Cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedugedrfedrjeejrddv
 jeenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotg
 gthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:O4ckXgMISF-HxXUL8e6rFBDXGQGzjuxt-VX4laogKYVFurGUx_v3zQ>
 <xmx:O4ckXr-4x4tP-vGP09pM6VQXn8Gwys4BG29PkVHbqPq3YAQe4YOpfA>
 <xmx:O4ckXoIKhgEniUKH4RApHio7GystHsbuZftH8SIKsEkq6OIc3_6i4Q>
 <xmx:O4ckXhM8tAYx4yeFWVWj5iKqvnr0BmVajbEZ8T6XVjiy1r8_GPVg9w>
Received: from workstation (ae077027.dynamic.ppp.asahi-net.or.jp [14.3.77.27])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2D81E30607B4;
 Sun, 19 Jan 2020 11:43:38 -0500 (EST)
Date: Mon, 20 Jan 2020 01:43:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Daniel Jozsef <daniel.jozsef@gmail.com>
Message-ID: <20200119164335.GA11974@workstation>
Mail-Followup-To: Daniel Jozsef <daniel.jozsef@gmail.com>,
 ffado-user@lists.sourceforge.net, alsa-devel@alsa-project.org
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ffado-user@lists.sourceforge.net
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

Hi,

I'm an author of ALSA bebob driver (snd-bebob).

On Sun, Jan 19, 2020 at 03:01:00PM +0100, Daniel Jozsef wrote:
> It's a Toneweal FW66, a 6x6 in/out 24bit 96kHz audio interface with MIDI. I
> kinda like it for its build quality and the time I spent with it. :D The
> largest chip in the device is labeled Trigaudio MNP-TA110. I searched for
> information on this device, and found very little - it's a Taiwanese
> company. There seems evidence that a "Trigaudio FW66" also exists, so the
> device may have been sold under different brands in different markets.

In my opinion, FW66 is an application of ArchWave BeBoB solution for
audio and music units on IEEE 1394 bus (ArchWave is formerly known as
BridgeCo) since I can find file structure for the solution in driver
package shipped by the vendor. I guess that you can see large ASIC
labelled with 'BridgeCo' (or 'ArchWave') DM1000/1100/1500 inner the
device. If so, the device is possibly handled by implementation of FFADO.

But as a quick glance to your log, the implementation of FFADO fails to
detect it:

> daniel@gibbonmoon:~$ sudo ffado-test Discover
> ...
> 02878614308: Warning (bebob_avdevice.cpp)[ 228] discover: Using generic BeBoB support for unsupported device 'ToneWeal FW66'
> 02878620133: Debug (bebob_avdevice_subunit.cpp)[  83] discover: Discovering BeBoB::AudioSubunit...
> 02878620175: Debug (avc_audiosubunit.cpp)[  56] discover: Discovering BeBoB::AudioSubunit...
> 02878620196: Debug (avc_subunit.cpp)[ 108] discoverPlugs: Discovering plugs...
> 02878778208: Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does not implement extended plug info plug type info command
> 02878778236: Error (bebob_avplug.cpp)[ 120] discover: discover: Could not discover plug type (1,1,0,0,1)
> 02878778272: Error (avc_subunit.cpp)[ 189] discoverPlugs: plug discover failed
> 02878778283: Error (avc_subunit.cpp)[ 131] discoverPlugs: destination plug discovering failed
> 02878778301: Error (avc_subunit.cpp)[  99] discover: plug discovery failed
> 02878778312: Error (avc_unit.cpp)[ 283] enumerateSubUnits: enumerateSubUnits: Could not discover subunit_id =  0, subunit_type =  1 (Audio)
> 02878778335: Error (avc_unit.cpp)[ 177] discover: Could not enumerate sub units
> 02878778347: Error (bebob_avdevice.cpp)[ 232] discover: Could not discover unit
> 02878778376: Error (devicemanager.cpp)[ 628] discover: could not discover device
> 02878778419: Debug (devicemanager.cpp)[ 661] discover: Discovery finished...
...

The reason is the unit returns NOT_IMPLEMENTED response against vendor
specific AV/C command (Extended Plug Information command defined by
BridgeCo.) for Audio subunit. I guess that the device has no Audio
subunit but the implementation performs to use it without checking
available subunits.


For my information, would you please clone linux-firewire-utils[1] into
your system and build it, then run below command to dump device information:

$ ./firewire-request /dev/fw1 read 0xffffc8020000 60
result: 000: 62 72 69 64 67 65 43 6f 03 00 00 00 00 00 00 00 bridgeCo........
result: 010: 00 96 14 00 22 03 00 00 19 00 00 00 00 00 00 00 ...."...........
result: 020: 32 30 30 39 30 36 30 39 31 36 32 39 34 30 20 20 20090609162940
result: 030: 00 00 00 19 07 1f 00 00 80 00 0c 40 70 35 14 00 ...........@p5..
result: 040: 32 30 30 39 30 36 30 39 31 36 32 32 31 39 20 20 20090609162219
result: 050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................

The above is a sample of Phonic Firefly 202. I expect the first line
includes bytes represent 'bridgeCo'.

[1] https://github.com/cladisch/linux-firewire-utils


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
