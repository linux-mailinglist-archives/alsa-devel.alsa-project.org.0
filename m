Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E179114E63E
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 00:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E151672;
	Fri, 31 Jan 2020 00:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E151672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580428720;
	bh=8nbN/7isnAEO/qb23amRkl37gzW7Cn7GBQKc+CAvMvQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuLVbkq5WGrZwps3ApLpYt8JBRal3GumuZ9VLDmBLPJqzDFNMd8C8kT5kPImoI9uG
	 9XBezCBH7fNLl4KBMefA41Js3KpYYgl0zCjZDc5Vx30C+ScTKLQoivM7rNkGZGjUzS
	 LDJ0M+zGSZrPWVHicOWNZX3wchrTwOBRwo+7YTLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649CDF80082;
	Fri, 31 Jan 2020 00:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D15B6F80150; Fri, 31 Jan 2020 00:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B17AF800F1
 for <alsa-devel@alsa-project.org>; Fri, 31 Jan 2020 00:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B17AF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="32HdEVxb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L7ys8uRc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 46F666CC;
 Thu, 30 Jan 2020 18:56:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 30 Jan 2020 18:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hb7qhwjpIqE9X+tTLLCywpipOJm
 K8farzkMjIXsOWK4=; b=32HdEVxbgVZHFQXKb6e9rNryzU9QKSB2zJVGgpiL3yd
 j7MnKODJl/eOboFquZDP0Q1xwXQRktHwu80YMufOgJA+IO7yNetUiI/2S3HERULF
 jLs3jNyEYBBHQ5N06pk1vlEK6LWUCR1eGfZ6O/BNbAt2R2dxyWBewq7JOzlEzSpq
 NxAu8HyLDEBTc6xfeIcZmoye15nHIPS9M1oh1KsJtfKwZuL1bKjmURrRYij1LR16
 0Q9M0CU2BVTmSIv1Q7HUtmOJEZ2E6/exNQ8wooR3lC4BZuFnAOLSQvyV2W28vwBm
 /Uf4JmbJi3OoBmyAnPTK/DecurpqlDE6U9xX1z8QSXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hb7qhw
 jpIqE9X+tTLLCywpipOJmK8farzkMjIXsOWK4=; b=L7ys8uRcMke0MzDwtW4zSC
 PtqdW48PnRx4Z3LbQazBl8gOL6gjVpJcsFGfletFXMb5zsZjlIdFkmm8fl9LQlvv
 wKj3SG0zyybBmwoBUKwBl0RE8rrfFeJPHRWbvFCFqodc8lCpX5JIFmqzMzUIqrv/
 usWVlKMwXsFW+wLqfGNVC9ZpA5qSQ/6P/ewbBqEWBVfS9OuB3yo/ZBB2Et4Pzbwf
 70LYFXuS9VpMcKCjTwyFKucj1FNrO+xXpmZ2/4YBDgcHpcF8hV3GF0U95DKzM0YM
 AUESw3n/MNeWcJ/WUPi74qi/EeJLLO2DAX8AGBiHVmZ154YxnhLEoDGE8kX9Tj/A
 ==
X-ME-Sender: <xms:O20zXoIDwFHV-ll-IeVTTD8hVKtPe-dB9CCWp72t63bH0wjuT9GOeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedugedrfedrjeegrddu
 ieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepoh
 dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:O20zXr6xjm4rvdW_Ks_x4YWf8w3-NBKsAhW2sHzM9Eb_qgG-7vd3Gg>
 <xmx:O20zXodOCcCoPX-NLVEMqiwXZluPaNN0hCqHALIqwFVwRZz-VilRhQ>
 <xmx:O20zXkvQAjnw_i3GgtWkhbOlaDm3bRutwj9WCpZjss9Idi1UuYHMDQ>
 <xmx:O20zXmzxrm4JHDkxjODrzu_j055jnrOE8aoZVEIrLNm4bgQCH1j5bA>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1076B3060A88;
 Thu, 30 Jan 2020 18:56:41 -0500 (EST)
Date: Fri, 31 Jan 2020 08:56:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200130235639.GA3796@workstation>
Mail-Followup-To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, sylvain.bertrand@gmail.com,
 alsa-devel@alsa-project.org
References: <20200129232340.GA23769@freedom>
 <fffaf462-fd7a-6d09-e808-21d94f883365@linux.intel.com>
 <20200130070642.GA7741@workstation>
 <857505b9-2375-7d73-5c1a-644dff952cdd@perex.cz>
 <9cbee940-05b9-e7ea-d51f-a6ef9e0cf1bb@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cbee940-05b9-e7ea-d51f-a6ef9e0cf1bb@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, sylvain.bertrand@gmail.com
Subject: Re: [alsa-devel] no period wakeup support
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

On Thu, Jan 30, 2020 at 07:22:00AM -0600, Pierre-Louis Bossart wrote:
> On 1/30/20 1:46 AM, Jaroslav Kysela wrote:
> > Dne 30. 01. 20 v 8:06 Takashi Sakamoto napsal(a):
> > > On Wed, Jan 29, 2020 at 05:43:19PM -0600, Pierre-Louis Bossart wrote:
> > > > > Nowadays, is this reasonable to consider disabling the
> > > > > period wakeup as default
> > > > > instead of expecting period wakeup by default?
> > > > 
> > > > I'd say yes - it's been nearly 10 years since this capability
> > > > was added, and
> > > > it's quite common across HDaudio, Chrome, Android plaforms.
> > > > 
> > > > But considering this as a default doesn't mean it's available in
> > > > 100% of the
> > > > cases, you still you need to check that
> > > > 
> > > > a) the driver is capable of disabling the period wakeup
> > > > b) the driver is capable of providing a precise position outside
> > > > of period
> > > > elapsed events (usually marked with the INFO_BATCH capability).
> > > > 
> > > > alsa-lib gives you the means to query both cases.
> > > > 
> > > > Note that you also have the case where you cannot disable
> > > > interrupts but can
> > > > still use timer-based solutions (e.g. for USB audio).
> > > 
> > > I suspect this advice.
> > > 
> > > In design of ALSA PCM core, runtime of PCM substream is configured for
> > > the mode of no-period-wakeup just in a case that userspace application
> > > requests it[1].
> > > 
> > > As long as developers take enough care of compatibility for existent
> > > applications, it's better to support period wakeup for each IRQ as a
> > > default, then support no-period-wakeup mode as an option.
> > > 
> > > 
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/pcm_native.c#n715
> > > 
> > 
> > I agree. We should not break the basic part of the API.
> 
> I think you misunderstood my point. I was suggesting an approach similar to
> that of PulseAudio/CRAS/Android, where you first try and use the
> no-period-wakeup, and fallback to the traditional interrupt-based mode if
> it's not possible. The idea is that the no-period-wakeup should work now in
> a majority of the cases, so should be the primary mode recommended, not to
> deprecate or break the period-based solution.

Although I've expected your assumption on the above (of cource), I think
it is not reasonable since it misleads people toward the localized
solution with limited number of applications and purposes. It ignores
actual design of ALSA PCM core even if it just satisfies the use cases
in your and his work.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
