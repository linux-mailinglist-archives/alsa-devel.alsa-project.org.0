Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A766168B8F
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Feb 2020 02:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AAAF16CD;
	Sat, 22 Feb 2020 02:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AAAF16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582334828;
	bh=Fm7BxxRzXSNgV5A391EcwB7oTYB2Y40jFKrtjhHAQf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3cBV6IN7mhBNWTkpzkCzM6HWybh9Tdo7TLjrbLqkbPD/6pGz8rPYpiqLZE7GtLR0
	 N0DFZAZ+exd9P0YL9NphITkpTr1h0812Uktu0TzzJbnoLhZu+EEMNo0P6KLGzkttmr
	 TYTk4xhDYHbDkL9z5GyFs5ui5kf3yNsf8OID2uh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B433F800C5;
	Sat, 22 Feb 2020 02:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B9FF8025F; Sat, 22 Feb 2020 02:25:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6C46F800C5
 for <alsa-devel@alsa-project.org>; Sat, 22 Feb 2020 02:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C46F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HUcR9Z/F"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EETV85N1"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E60B921F3C;
 Fri, 21 Feb 2020 20:25:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 21 Feb 2020 20:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=etNejSiORDG69abi+dMzIKIEgmd
 yfOVRWWPlP+zM1pQ=; b=HUcR9Z/FPdvORp8AENi0/jEQLIe6egoluTkCUHr28yK
 TZB0FVBpdbbEgeHZaihWIVdccccyZbZXK+xt8nCXYl5AOfbEab+G/r6wFR2Ez0Nc
 EdiNoGmukyOKaeYyDpvSjBk/jMFGEr/SKwa5ANmOpsi2I9qRViPiY/g+ZehIN1vH
 cOzfxd7O0edo3LPLU+v5S+hob59GbJ014lnWsPF0PewI9zBRbSX+xeCZhO+1qs+R
 e4ppCC6uyT+YDLT4nQSgwdyIgsxFHjgJoFiho7EoouafreAxHQbHZCOn/ECkyyXG
 uS/eq66VR//qCCczNxjCgRto2y+i6fgPN1qTCM0qwqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=etNejS
 iORDG69abi+dMzIKIEgmdyfOVRWWPlP+zM1pQ=; b=EETV85N1iCI0O3MhF3b707
 aZ2zp8wbUOx27NAQ7z0Cqu2pmm6YxYydPJOYYQlHo8T5EHNqnXqhJruHRQzh8stU
 9LdgYT/UY7TMb1S51IDOTqijbAMVDoC7yk1Ch1pe48IxYiMLSd2NnrRRo21/xhkO
 9LqRARhY4IuqJzmxDfL4PDod/xaaQg3mwTQmUoGWJNBF53nL4uTZol6ac05qmPXC
 ceIfHc5eevdIaiagJtzJvFLLAOFC5hTTXQeW7d86WvSxAGOsUS+vmgpFhORSZNVP
 KTb96WvCuCCVCBNWoVaR4ab0Y++At+J0HKXQoWBjyr1YNd+YuidGaTels2WCz0Ow
 ==
X-ME-Sender: <xms:-4JQXlrAJUkdUHH49Ky0lcJ0S1luEK_UzjbfEL5kc5YRtt3KM2JpGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeehgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedvudekrddvvdehrdduhedurd
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
 thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:-4JQXoYgsmlEvok6r8Sbh0T4FgTFY7jt0WCtYZR3RXd-MC3XCTt1cA>
 <xmx:-4JQXmB8jc3GyAGXdJJIXNxlrgRKW2meuB-n3GAgHHlmtOnnq4-qrg>
 <xmx:-4JQXifjleXXQzefLAejfdlVvR8BMqacXNRtmlR_b9fdzpAx4jxSVA>
 <xmx:_IJQXqkeWZz8R2V6N6xHYxyu9_TmwElbP7pV51HNcOvq0U8UXSY5MA>
Received: from laptop (g6.218-225-151.ppp.wakwak.ne.jp [218.225.151.6])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD4E73060FE0;
 Fri, 21 Feb 2020 20:25:14 -0500 (EST)
Date: Sat, 22 Feb 2020 10:25:12 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Mathias Buhr <napcode@apparatus.de>
Subject: Re: snd_dice: Clicking artifacts with TC StudioKonnekt 48
Message-ID: <20200222012510.GA4883@laptop>
Mail-Followup-To: Mathias Buhr <napcode@apparatus.de>,
 "(alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
References: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921a3b13-b44e-3300-bb72-84cbc9e3dd88@apparatus.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "\(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

On Thu, Feb 20, 2020 at 09:34:02PM +0100, Mathias Buhr wrote:
> Hi,
> 
> thanks to this group, both of my firewire interfaces are (almost)
> working! Big thank you!
> 
> While the TC Konnekt 24D works fine (playback and recording), the
> StudioKonnekt 48 produces clicking artifacts during playback when using
> snd_dice. This interface is working flawless on Windows and on a
> Jack/FFADO combination. This artifact occurs in all use cases (alsa via
> aplay, pulseaudio and jack) and does not seem to be in recorded streams.
> After recording the playback with another device, it looks like the
> level of the artifact is scaling with the signal and its interval is
> interestingly 256ms. Is there anything I can do to further debug this
> issue? Capture firewire packets? I would love to get this device fully
> working.
> 
> I'm using kernel version 5.5.4 but this issue has been there for a long
> time.
> 
> Thanks,
> 
> Mathias

Yes. ALSA dice driver brings the issue to your unit regardless of XRUNs.
I can see this issue for recent 5 years (so long time).

At present, ALSA dice driver is designed with the expectation that the
devices performs 'clock-recovery' with timestamp in isochronous packets
transmitted by the driver. The driver transfers PCM frames with
timestamps as exactly the same number as configured sampling rate; e.g.
48,000 frames/sec or 44,096/44,104 frames/sec.

However, many devices including yours don't perform it actually. For
example, all of devices from TC Electronics don't perform it:

 - Konnekt 24D (Dice II STD ASIC)
 - Konnekt 8 (Dice II STD ASIC)
 - Konnkt Live (Dice II STD ASIC)
 - Studio Konnekt 48 (DICE II STD and DICE Mini ASICs)
 - Impact Twin (DICE II STD ASIC)
 - Desktop Konnekt 6 (DICE Mini ASIC)
 - Digital Konnekt 32 (DICE II STD)


They work with sampling clock independent of the timestamp from driver.
Thus it's not possible to synchronize multiple devices on the same
IEEE 1394 bus (this is against the 'myth' that the devices can be
synchronized for its internal sampling, but it's the fact).

Instead, the device expects the driver to perform the 'clock-recovery'
and transfer PCM frames as mostly the same as the calculated sampling
rate. Even if the device is configured to handle 48,000 PCM frames per
second, the device actually handles less or more PCM frames; e.g.
47,988, 47,992 or 48,008, 48,016. Unfortunately, current ALSA dice
driver is not designed to work for it. In device internal, it handles
surplus PCM frames or the lack of PCM frames for several seconds, then
causes noisy sound I guess.

The libffado2 is programmed for the 'clock-recovery'. On the other hand,
it includes design mistake to aggregate several types of devices and give
abstracted device to applications such as jackd. When considering the
above design of actual hardware, the design is not good since each actual
hardware works independent sampling clocks.

Anyway, if you're satisfied to libffado2, it's better to continue to use
it. ALSA IEC 61883-1/6 packet streaming engine is completely different
from the one in libffado2. It's the most convenient way to avoid
involvement in such difficult issue which developers have left for a
long time.


Regards

Takashi Sakamoto
