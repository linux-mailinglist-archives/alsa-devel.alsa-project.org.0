Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 177634F3C7E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 18:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B16B17F5;
	Tue,  5 Apr 2022 18:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B16B17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649174850;
	bh=z6psD/8cpuwuBPw61RJxzUQDar2E7GB7lXoYU/LcSLs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6zNmJf9/VYmwE3PlU/RioL7vjRqCZNkYvZ0NIHgFEaq4jnr/9doJZsIfWyS98erD
	 MaRLNUarCH/VOOBevAQUp9ggqv2qnKUXZe0i2yAKT7yOo1GYsx4s5sKADoNEA4uNpU
	 fZPQj07HqDR82bHlpESRa8AVON3Dty66PWyjhZyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C68CF8014B;
	Tue,  5 Apr 2022 18:06:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E95B0F8016A; Tue,  5 Apr 2022 18:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C693F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 18:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C693F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="gegC6rwL"
Received: from zn.tnic (p2e55dff8.dip0.t-ipconnect.de [46.85.223.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 752E21EC0502;
 Tue,  5 Apr 2022 18:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649174782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=+l8x0npVHQPxXN8Jiw+gTLW632Eoh0dwy+8lcfQVWk8=;
 b=gegC6rwLvXB2k5OYbibB7lCieya+klwRoI9ayiojrjzhL5+dgOrStUCrd9Zuge5TiWA+qx
 hqxZKJiVM/6bxN5fLDL7xISUUDmvsibLMFEtFzQRUT65RwM/EvUdZwy97j0+8nhQmrqrwS
 9mOhd7Kerbl6Tv7wZS6hITMkaS4j51Y=
Date: Tue, 5 Apr 2022 18:06:19 +0200
From: Borislav Petkov <bp@alien8.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 02/11] ALSA: usb-audio: Fix undefined behavior due to
 shift overflowing the constant
Message-ID: <Ykxo+0p5IeeM7mge@zn.tnic>
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-3-bp@alien8.de>
 <s5hwng35yvz.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <s5hwng35yvz.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>
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

On Tue, Apr 05, 2022 at 05:32:48PM +0200, Takashi Iwai wrote:
> > +#define USB_ID(vendor, product) ((((unsigned int)vendor) << 16) | (product))
> 
> Parentheses are needed around vendor (as usual for a macro).
> Could you resubmit with it?

Or you can fix it up while applying. :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
