Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD234B589
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 09:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB520167C;
	Sat, 27 Mar 2021 09:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB520167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616834527;
	bh=9LTBT84ESTseIIBqtfaRwHw+4Jt9P3ruX//CSPIKWMI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVv5t3zK2wbUTfSk/3NB7JkhkudUWjGq15PjWT5qV8Gsg5mkim96cHjJJufaNw5h4
	 FdYadwW6boGc16GfYfd914N750nKhxeoctQi74gLc0YYAmo0YpFiDfwbx3PXW9eMTd
	 l72kftSuZJGHbNw9KwF8l3eVB8G5Z+GSHrszgiYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04CEDF800B9;
	Sat, 27 Mar 2021 09:40:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 949C3F8025F; Sat, 27 Mar 2021 09:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38478F80104
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 09:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38478F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="pW3EnduQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IzonLS+T"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DAC585C010C;
 Sat, 27 Mar 2021 04:40:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 27 Mar 2021 04:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zuQs5AwvyXYaxo05rRemWxBdaDC
 7U9smdHGtzM2ClkU=; b=pW3EnduQM+iNdh6aDWrtXGImVw9uNCvQzOSIav+GCTl
 3Al/5mXpi/GEOoTPcilqtIYeXRQBoC6wzFjrLXqxVrprnlyOc78wmyIhcH9eVO40
 GSPvZrzO3cp/1t/E1t1+y+ET9+xjxR9xKFPWg+feJcJPLdLVwE3bZjerzHH9Otx2
 jo3Dv+xgJZpby8R+Y/zb5bGJuzwqwvcfSZiMnyF0dAkUsgNKuaWq3/9wWpff+N5Y
 S8xlq593+EOnaxOyAjByAw/wvtmohB3afauUDmY2djgWGkph1zdRt1njNkDveSvq
 KhIgzjRy2TdIRecyMnVBgL9u9VKi9IDBkna3QUAQodw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zuQs5A
 wvyXYaxo05rRemWxBdaDC7U9smdHGtzM2ClkU=; b=IzonLS+Tqex0xfBXrntZmg
 R3H/HgR/WD2rYx1JqFA0KC8s7wZO6aPaeZIy5pAlOXkyMHfsCt2G647oN6YscytC
 h0lxxkDPiFf91JGs60gaeyN/NcK9sztj/C2eWhxx4GKIZ9sSy/ULXATIHMVy25GR
 TsDZNj9Jr9qO5mzDADwGhKwQlxMxh2GLIids2lWjxw2ArOgeSZ4+I8vW12NZJL04
 0ui4pbnba0KgVjLzr5Q3vTJRWgCt3ayVDlT9feWoGvL+4MAXq3DzfyFp9oDTXWz8
 YKG/+8AYFgiqh8mkcXV4AGQ/rGHPfjhdcEi8kd9zl8moYI0fXUVJi8eMChFm+kKw
 ==
X-ME-Sender: <xms:fO9eYNC6Bqpu5LdzjNfjK-mOvrIA_VdMAwN0leBqtq02SvjE57Y_Mw>
 <xme:fO9eYLiGalAKkhe_9bTLsj0d-EWkDc6gT5r17ykp5cfTiJhV4yBLc3Ke5YskfzEvy
 FUb7OlK5R98jrB-W-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehfedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
 ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeetgeevhf
 ehgeevieeuvdeggfeihedvudevkeeufeehkeefffelgfejteevgeetjeenucffohhmrghi
 nhepshgrkhgrmhhotggthhhirdhjphdpphihthhhohhnrdhorhhgnecukfhppedugedrfe
 drieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:fO9eYIkEZavMe8MPTxVXpUpEoez42jKgZ2vOBuucQRa-4q67EjLiYA>
 <xmx:fO9eYHxwRf036NRU89pyq2UBLCKwYdsMmxkpN7T8kVatTMifMIIW3g>
 <xmx:fO9eYCQRNLAf-uuu6Rpc4QvpuYG9Tlbw57cERCE8Ck63067f1pPJAA>
 <xmx:fO9eYJPYw7e2L_ndcUb7SWwNiYFwsyjy5jhbnkS8TF80IPIKT5iCpA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53460240057;
 Sat, 27 Mar 2021 04:40:27 -0400 (EDT)
Date: Sat, 27 Mar 2021 17:40:24 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: paul@neyrinck.com
Subject: Re: 003 Firewire Isoch Rate Matching
Message-ID: <20210327084024.GA16753@workstation>
Mail-Followup-To: paul@neyrinck.com, alsa-devel@alsa-project.org
References: <20210320081623.GA319337@workstation>
 <1C889443-2977-4ABA-ABA5-A45D1024A50D@neyrinck.com>
 <20210321020454.GA330036@workstation>
 <1616397057.672725255@apps.rackspace.com>
 <20210323031630.GA4901@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323031630.GA4901@workstation>
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

Hi,

On Tue, Mar 23, 2021 at 12:16:30PM +0900, Takashi Sakamoto wrote:
> I use DAP Technology FireSpy 810[5] for packet analyzing (fortunately I
> found it at bargain price in used market). The libhinoko[6] can make
> your Linux box as packet analyzer and might be useful. Enough later, I'll
> send you log of packet sequence for long duration (1 min or so) for 003
> console and rack.

Now they are available under below URLs:

 * http://sakamocchi.jp/media/digi003-console.zip
 * http://sakamocchi.jp/media/digi003-rack.zip
 * http://sakamocchi.jp/media/digi002-console.zip
 * http://sakamocchi.jp/media/digi002-rack.zip

The checksums by sha256sum are:
 * 9aa7298d71941c122228af8ff46f8bded8ac1d28759ff06bffc11f0ef1d4dcf8  002/digi002-console.zip
 * 0f0be9e514479652fbae3e5a52db23922e24b508737ee875e83f166b9b7503bc  002/digi002-rack.zip
 * 6a6ec0e90c5a4e76fd35d869f55f4a62571cff9d9f16d008145dc3dadb020f41  003/digi003-console.zip
 * 31a95be9a18efb18b1eb8d2b3277a46692a0fe65edb1a2711368e19af688b199  003/digi003-rack.zip

I use Windows 7 (64bit) for the logs. Below version of drivers are used:

 * 9.0.8 for rack models
 * 9.0.6 for console models

The target device is configured to use internal source for sampling
clock. The archive includes logs for each supported sampling rate.

In the logs, three entries consists of one isochronous cycle:
 * Cycle start packet
 * isochronous packet from driver to device
   * all of audio frames are zero
 * isochronous packet from device to driver
   * some of audio frames have value

For example:

```
121.155,CycleStart,0xFFC2,0xFFFF,0xFFFFF0000200,0,retry_1,,15,,0x3DAB6034,,,,100,,
2.614,Streaming,,,,,,,,616,,1,0,0,400,,0x02130070,0x90018BBA,...
13.611,Streaming,,,,,,,,464,,1,1,0,400,,0x0113004C,0x90010000,...
```

At 30 sec 6838 cycle 52 ticks (0x3DAB6034), the driver transfers
isochronous packet at channel 0 in 400 Mbps speed. CIP header is
0x02130070 0x90018BBA. The device transfers isochronous packet at
channel 1 in 400 Mbps speed. CIP header is 0x0113004C 0x90010000.

I use csv module in Python 3 runtime implementation to parse it.
https://docs.python.org/3/library/csv.html


Cheers

Takashi Sakamoto
