Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04221C404
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 13:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923C81660;
	Sat, 11 Jul 2020 13:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923C81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594467580;
	bh=VcOWVmJL+n+yDp6yh2VSirh5KBEa0oXMOtnlNeWRh2c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv3SbHb1/mMIEJ/UgTvTnYvsRCXLiqijBsFMAHTGaPL9IDCCu1QIkyYqd6HAGq7Ps
	 MQZoij0fMzzaf78WcJvfn/S4MozihNf9bJCUPMCYZkVSNC/yJh+RHGQPYMeeFTUaYe
	 G12Y6/9fmdYDq1EoAs1Xg1BzveLEeTzLV5vGL0vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B0AF80257;
	Sat, 11 Jul 2020 13:37:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB4C4F80216; Sat, 11 Jul 2020 13:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.bin-co.de (mail.bin-co.de [173.212.200.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9DEF80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 13:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9DEF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="G2ImmgYy"; 
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="G2ImmgYy"
Received: from localhost (localhost [127.0.0.1])
 by mail.bin-co.de (Postfix) with ESMTP id 5318C4443EC9;
 Sat, 11 Jul 2020 13:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594467469;
 bh=VcOWVmJL+n+yDp6yh2VSirh5KBEa0oXMOtnlNeWRh2c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=G2ImmgYyKehoxVjpdyfuhioq2FXwxWuwsKZYd9PBTb/+1qAcwAAHxUS1tKYbcnQKA
 I6jevvLNzKdiTFG5WEmtjZBKn/DFbisIDoeAK/Xg3dTlF6yXvA38iLvBgyd+pHwSJM
 VlR0ZoC9t6opEtuZzD8TWKMgk5Z59CWsnj1ArVEwMT10ETa8qB/H/1LtAUQ0lm8BbT
 wacvncAaANDr1Me3dz/BbD7m1LGfGv2lL5vX7jCiJeHEfoBtOttEzIQIXc92fn4q3M
 O/IJhFhUA3uoqPYoIXVlxSYPExbBrapZ+2pOlTW3TjYvD4G1dqc4qGhhnsY/KDfE4K
 aRCefhkDTnHfg==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
 by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lS-3yaXxxDLo; Sat, 11 Jul 2020 13:37:49 +0200 (CEST)
Received: from deepblue.zlan.intra (unknown [90.187.13.225])
 (Authenticated sender: zappel@retarded.farm)
 by mail.bin-co.de (Postfix) with ESMTPSA id BA7C24443EB4;
 Sat, 11 Jul 2020 13:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594467469;
 bh=VcOWVmJL+n+yDp6yh2VSirh5KBEa0oXMOtnlNeWRh2c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=G2ImmgYyKehoxVjpdyfuhioq2FXwxWuwsKZYd9PBTb/+1qAcwAAHxUS1tKYbcnQKA
 I6jevvLNzKdiTFG5WEmtjZBKn/DFbisIDoeAK/Xg3dTlF6yXvA38iLvBgyd+pHwSJM
 VlR0ZoC9t6opEtuZzD8TWKMgk5Z59CWsnj1ArVEwMT10ETa8qB/H/1LtAUQ0lm8BbT
 wacvncAaANDr1Me3dz/BbD7m1LGfGv2lL5vX7jCiJeHEfoBtOttEzIQIXc92fn4q3M
 O/IJhFhUA3uoqPYoIXVlxSYPExbBrapZ+2pOlTW3TjYvD4G1dqc4qGhhnsY/KDfE4K
 aRCefhkDTnHfg==
Message-ID: <3fedb3064427a0890c8baa40ce7c6fc15262115a.camel@retarded.farm>
Subject: Re: [PATCH v3] ALSA: hda/realtek: enable headset mic of ASUS ROG
 Zephyrus G14(G401) series with ALC289
From: Armas Spann <zappel@retarded.farm>
To: Takashi Iwai <tiwai@suse.de>
Date: Sat, 11 Jul 2020 13:37:47 +0200
In-Reply-To: <s5hft9y2sko.wl-tiwai@suse.de>
References: <20200711110557.18681-1-zappel@retarded.farm>
 <s5hft9y2sko.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com
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

Am Samstag, den 11.07.2020, 13:34 +0200 schrieb Takashi Iwai:
> On Sat, 11 Jul 2020 13:05:57 +0200,
> Armas Spann wrote:
> > Signed-off-by: Armas Spann <
> > zappel@retarded.farm
> > >
> > ---
> >  Description:
> >  This patch adds support for headset mic to the ASUS ROG Zephyrus
> > G14(GA401) 
> >  notebook series by adding the corresponding vendor/pci_device id, as well
> > as
> >  adding a new fixup for the used realtek ALC289. The fixup stets the correct
> >  pin to get the headset mic correctly recognized on audio-jack.
> 
> I applied this version with the description above moved in the
> right place now.  Also added Cc to stable as it's a simple fix.
> 
> 
> Thanks!
> 
> Takashi
> 

Many Thanks! 

Next time I'll respect all the tips you gave me. Thanks for your feedback and
support on this "simple" task.


Best Regards,
Armas Spann


