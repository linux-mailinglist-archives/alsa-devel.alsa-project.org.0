Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D112F3240
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6207E1668;
	Tue, 12 Jan 2021 14:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6207E1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610459695;
	bh=J2IMBoItDuCdZfgJs9+lgg2Cj2pLKMKgW4yJclzWr/M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DX5FAJkZY+0LCr8uLK0Dz8dry88OZcs1T7B8lUyOxn4t8+yPkOsD89yiuXATnNHaU
	 ZFKjCfqyqDupR87LTbbo3p/U8PgPiBiBmir8R2XKxr+6Flba5MFS6HuzDggVl2LnYh
	 9JT7h5Pi17wzRK+xdeIB8o9WWEbGayjYDnfd8QxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEDE8F800B9;
	Tue, 12 Jan 2021 14:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80572F8025E; Tue, 12 Jan 2021 14:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20B42F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 14:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20B42F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="V3pcoxQU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pBe707M/"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 97DD85C022A;
 Tue, 12 Jan 2021 08:53:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 08:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wQHIBUX95kd7FYyqstLD3bY3Dfr
 sn25GzthoZs7X/Ac=; b=V3pcoxQUY0rNSzsaAGAOloFEq5Kotrg6LPGKrQ19BVF
 dUVtjFJpcSPZ1FwJUOohF9HssfcrtJqkAN2pH77HJJAfoxlFBA4RPhMBY5f+7u7w
 qONdTzBh3NC1dQFTuJoO4cXZhoVxIkPmR/LZsK9D9GU/sbFCHmp7T5gtgCTd3KOw
 IwDm17LPmK6Mn+ATY8HsPuT7WaDBZ+dkYH3hjWiL0E7YSC7WYwNI6X94gQ2SQWsh
 y/Wad4yjdaX0c/GXAE/Zrrcjfj7UDp/ANAft0O2YCTM2FZT84PRBTupiFop3zrJS
 pvqLUK6IoMh4JwJSWhOwHSosPHapvcEA2EnMjJgBXLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wQHIBU
 X95kd7FYyqstLD3bY3Dfrsn25GzthoZs7X/Ac=; b=pBe707M//5xjdT8ZRSsjYE
 LkvmOU+vZuy1W4idgKBGkLkBIuIrhqQRCj3UYm+Kw3oJvJsGeZy7krfjmzeQTIcE
 HNz10EnTdcO/9PwEDQjGnvFsaTyctl1UfMkgiA2slP+zVDStnB7FmnFsEGL1K7Ua
 SNDy5bUPGFknT3CwbcGPCr58gCR6rsK5hJxD+iiPXmJ5fhZo7nkZ43DyeyyJK3x3
 7mseWsmxZuAbu3Mq6TDmhEEQrqkFVoQmszejCz1XenLhTAEQm7eU2jPZ4oR4BO7I
 BNQ45yTR2P8tZER9h9b7hIU5PFEPKCYW/TfWniO3qMweYxfKPYFb54j5GoKuvnsQ
 ==
X-ME-Sender: <xms:x6n9XzvUfpg0fwn8fVLWE68C5GEpeuEBQ8rw_Cp52yQmZlYcj5nxQQ>
 <xme:x6n9X0d7B_knLaOTdUr6rbdw2WP2fZPWWKHcCrDhJ3u9ASVl91h1rUx3PySEJXWR2
 _LEh6MHztMsoG2W-9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecukfhppeduudekrddvgeefrdejkedrheeknecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:x6n9X2yfxe9W3LbFBicMNaJgOTmuRhKIJ_SAEwxXNIOekUD-ywRefw>
 <xmx:x6n9XyNV04gig9rmkPyzBMpxWJ-PFQH8Ag4RCfKOVb5KM_mrmkroiw>
 <xmx:x6n9Xz92ADNDaoWaCNBZ1LhrHR-4dWXwOkx9gnaBrI0li8H8eJcG6w>
 <xmx:yKn9X2bUhDQhG-oiwzBAh0FKL8JCFoRYbY24rCDSspXmU6qqjBt4lg>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id A60C924005D;
 Tue, 12 Jan 2021 08:53:09 -0500 (EST)
Date: Tue, 12 Jan 2021 22:53:06 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 1/2] ALSA: fireface: Fix integer overflow in
 transmit_midi_msg()
Message-ID: <20210112135306.GB44140@workstation>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20210111130251.361335-1-geert+renesas@glider.be>
 <20210111130251.361335-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111130251.361335-2-geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>
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

On Mon, Jan 11, 2021 at 02:02:50PM +0100, Geert Uytterhoeven wrote:
> As snd_ff.rx_bytes[] is unsigned int, and NSEC_PER_SEC is 1000000000L,
> the second multiplication in
> 
>     ff->rx_bytes[port] * 8 * NSEC_PER_SEC / 31250
> 
> always overflows on 32-bit platforms, truncating the result.  Fix this
> by precalculating "NSEC_PER_SEC / 31250", which is an integer constant.
> 
> Note that this assumes ff->rx_bytes[port] <= 16777.
> 
> Fixes: 19174295788de77d ("ALSA: fireface: add transaction support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> 
> I don't know the maximum transfer length of MIDI, but given it's an old
> standard, I guess it's rather small.  If it is larger than 16777, the
> constant "8" should be replaced by "8ULL", to force 64-bit arithmetic.
> ---
>  sound/firewire/fireface/ff-transaction.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The rx_bytes member has value for the length of byte messages to
process. The range of value differs depending on Fireface protocol
version. For former protocol, the value is equals to or less than
SND_FF_MAXIMIM_MIDI_QUADS (= 9). For latter protocol, the value is
equals to or less than 3. Anyway, the value should not be larger
than 16777 and the calculation can be done without ULL suffix.

Reviewd-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/fireface/ff-transaction.c b/sound/firewire/fireface/ff-transaction.c
> index 7f82762ccc8c80ba..ee7122c461d46f44 100644
> --- a/sound/firewire/fireface/ff-transaction.c
> +++ b/sound/firewire/fireface/ff-transaction.c
> @@ -88,7 +88,7 @@ static void transmit_midi_msg(struct snd_ff *ff, unsigned int port)
>  
>  	/* Set interval to next transaction. */
>  	ff->next_ktime[port] = ktime_add_ns(ktime_get(),
> -				ff->rx_bytes[port] * 8 * NSEC_PER_SEC / 31250);
> +			ff->rx_bytes[port] * 8 * (NSEC_PER_SEC / 31250));
>  
>  	if (quad_count == 1)
>  		tcode = TCODE_WRITE_QUADLET_REQUEST;
> -- 
> 2.25.1


Thanks

Takashi Sakamoto
