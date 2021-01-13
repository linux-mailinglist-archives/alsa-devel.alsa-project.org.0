Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E02F4EFB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5AD1728;
	Wed, 13 Jan 2021 16:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5AD1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610552569;
	bh=b+MkyO7FZ4pLO3LtfVRzlPPOUXbH2O9IwIT/Q9HP3x4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCQAxLVVsR001cF9IUVFPzc6fd7DnIMre6mQWXZFNciAy93l6Znyz9Ujy3RUr3nKU
	 QhgD5rbdj96kL8JVpxckA5feDWbO5Ml4ceuJfyzUny+wEmq/K29RhLqDa8aLu1O1QV
	 ib/y53MSz32N4bDvJ/UoIaNLolqTZEwR346SZR3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC4FF80254;
	Wed, 13 Jan 2021 16:41:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D3ABF801ED; Wed, 13 Jan 2021 16:41:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528DAF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528DAF80085
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net
 [82.255.60.242]) (Authenticated sender: hadess@hadess.net)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B6C8F1C0005;
 Wed, 13 Jan 2021 15:41:04 +0000 (UTC)
Message-ID: <7cdad520564986148739d4756ad1e6f35ea4295e.camel@hadess.net>
Subject: Re: USB Wireless device support
From: Bastien Nocera <hadess@hadess.net>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 13 Jan 2021 16:41:04 +0100
In-Reply-To: <s5hsg74n9x5.wl-tiwai@suse.de>
References: <e1e944b48ae44106a57c74de19dd74d6193495fe.camel@hadess.net>
 <3b322bb54a1df4b2a45586bc687fba3be5f9e3d8.camel@hadess.net>
 <s5h4kjkopsu.wl-tiwai@suse.de>
 <8adebcef15874187b18b930d5a71e79c6297ee80.camel@hadess.net>
 <s5hv9c0nabg.wl-tiwai@suse.de>
 <06de89645b182ce8367d23c2bb2dbc6e2a895da7.camel@hadess.net>
 <s5hsg74n9x5.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2021-01-13 at 16:17 +0100, Takashi Iwai wrote:
> On Wed, 13 Jan 2021 16:13:40 +0100,
> Bastien Nocera wrote:
> > 
> > On Wed, 2021-01-13 at 16:08 +0100, Takashi Iwai wrote:
> > > <snip>
> > > Nothing so far, and that's the problem.  HID is managed in a
> > > completely different layer, hence the integration needs to be
> > > done in
> > > a higher level like PA, I suppose.  In theory we might be able to
> > > extend UCM to handle the other external devices, though.
> > 
> > hid-prodikeys.c seems to do some MIDI stuff...
> 
> It creates its own sound card.  But you want to use the mixer switch
> for the existing audio interface, right?

My idea was to create my own sound card (it's a separate USB interface
after all) exporting the sidetone mixer, and figure out how to merge it
with the USB audio interface at PulseAudio's level.

Otherwise 

