Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335292C6C0E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 20:39:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46CA1880;
	Fri, 27 Nov 2020 20:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46CA1880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606505955;
	bh=T7fp2GkP0fMd7Tagg8InISwvGovZzprNtEiio0tMCe8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3VRtjaV5M7iYrx2HsOj+UwSdwu6wXMPzf3GanFqmMUxcgB8xiXETNOH/IMLaXgwp
	 B3Vs/3EZuLa2K09q6Yb6SiERQEQ+gac2q3oyvlUo6J+ZtrX7zlOxyw5C/3lMkZZuPJ
	 yENWtUaunMocY/rIXuqIeZ2423X/wyXD0FKxREK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4BAF80218;
	Fri, 27 Nov 2020 20:37:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2FA4F8019D; Fri, 27 Nov 2020 20:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7A43F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 20:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A43F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="nl6On1uj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=euM/zmZmiU7XynopsfsNk5VEQJ/eikhYtJwXlpq8tno=; b=nl6On1ujk9wd9PEKkJgg2KJ2Am
 m8AA3an/yzFOvOzfdYyYfcRQEQMV6C+rNHKxGHpqDzm49BkSsw+5EhhU0P154qkYr9MXuNpi7PREG
 fPLa8hJsj9oN6M7qgVOHMRcPTnFhMtktGs8woTspm5p63HB4LfTCBfTY+3w6jPlLDCe5rI6brlPWe
 Wzm7YdlXRMuEt8mo+EDmAHmVkjUP3io6h5+Bil+IHytP1lZ1245P0R6S0s2IchExPIzcixOwncumC
 FhBV3gK43XgwhLQNaxt5pUzXLAu2p81YKnwCaC/q+zrjSo81jdUaUUkBqIuXwnd/oQ3fdltyGRC9o
 jz4txzgg==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kijYQ-0005Xk-FY; Fri, 27 Nov 2020 19:37:14 +0000
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jens Axboe <axboe@kernel.dk>,
 Jim Paris <jim@jtan.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Leonard Goehrs <l.goehrs@pengutronix.de>
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <fdaedef8-4734-7ab3-9334-b628f8207c9e@infradead.org>
Date: Fri, 27 Nov 2020 11:37:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 netdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org
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

Hi Uwe,

On 11/26/20 8:59 AM, Uwe Kleine-König wrote:
> The remove callback is only called for devices that were probed
> successfully before. As the matching probe function cannot complete
> without error if dev->match_id != PS3_MATCH_ID_SOUND, we don't have to
> check this here.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I tested your two patches plus Leonard's patch 'ALSA: ppc: remove
redundant checks in PS3 driver probe' applied to v5.9 on the PS3,
and they seem to work fine.

Thanks for both your efforts.

Tested by: Geoff Levand <geoff@infradead.org>
