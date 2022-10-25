Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977F60CB85
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:09:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAAD416C8;
	Tue, 25 Oct 2022 14:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAAD416C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666699782;
	bh=KmeNx/YuQK06nE4d9J6l/1x675LkOaFX9FaQesFcRHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUBEXx7uTe2itxmsGc7JhSCCtI43xW1piaWqtR+ZRqt+BPCOlILwJi1aMNcutg7j1
	 MQb/kKCBbFdvyvBO73PkrmFIfroytguyYzDcpXJf7An+4On8NQWbtURoAACWiClwTJ
	 KRy7UDFAXOqwRxw0Lb47DLSdEQ1jTzkhGQpEKBNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2577EF80448;
	Tue, 25 Oct 2022 14:08:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E7A1F80431; Tue, 25 Oct 2022 14:08:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AAEAF80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AAEAF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CrVd9HRe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F597B81CF1;
 Tue, 25 Oct 2022 12:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B3AC433C1;
 Tue, 25 Oct 2022 12:08:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CrVd9HRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666699714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lDTzz8RCtiO8TmkrYzfZqplpH5tp9ZvYdKoLxqYoZgw=;
 b=CrVd9HReLy5CSqBBbmToAhk3P2sFOIwgsfi2fIs9mP4dYkJ+WufkgyZDKGUwD12i4tZOqI
 9O2TnmESRupj37Z7svdhOU26hAbpHpVOJkK+SvbYTYbi6d+nsG7bl2NnekwTTS6kHAtCSS
 7LKKuLADDA5VyJ+JapFl8+33A33n+ag=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74f0cab3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 12:08:33 +0000 (UTC)
Date: Tue, 25 Oct 2022 14:08:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: rme9652: use explicitly signed char
Message-ID: <Y1fRvWfcU4NT1HTU@zx2c4.com>
References: <202210250456.vKv5zoLb-lkp@intel.com>
 <20221025000313.546261-1-Jason@zx2c4.com>
 <87bkq0s9rw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bkq0s9rw.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

On Tue, Oct 25, 2022 at 08:21:55AM +0200, Takashi Iwai wrote:
> On Tue, 25 Oct 2022 02:03:13 +0200,
> Jason A. Donenfeld wrote:
> > 
> > With char becoming unsigned by default, and with `char` alone being
> > ambiguous and based on architecture, signed chars need to be marked
> > explicitly as such. This fixes warnings like:
> > 
> > sound/pci/rme9652/hdsp.c:3953 hdsp_channel_buffer_location() warn: 'hdsp->channel_map[channel]' is unsigned
> > sound/pci/rme9652/hdsp.c:4153 snd_hdsp_channel_info() warn: impossible condition '(hdsp->channel_map[channel] < 0) => (0-255 < 0)'
> > sound/pci/rme9652/rme9652.c:1833 rme9652_channel_buffer_location() warn: 'rme9652->channel_map[channel]' is unsigned
> > 
> > Cc: Jaroslav Kysela <perex@perex.cz>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: alsa-devel@alsa-project.org
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Applied now.  Thanks!

Thanks. For this and the other patch, applied for 6.1 or 6.2?

Jason
