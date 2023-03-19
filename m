Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A37406C06A4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 00:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA7874C;
	Mon, 20 Mar 2023 00:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA7874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679269012;
	bh=OHFIkS02PBwwN4tDVa9bwFIXVHAnsp7dEnx4o7xqt/k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GdjvQpdA5jd9pDdct657CqciPc6XTbisNAFUKgshm8L00MdaUuNMcqvWWYin1imkM
	 ckPI1W4ci4jF5pqf5HKT9okQwuPzxUg7RlQXTWaYzzj+p/maFo9QHZOI4x7pa++LVX
	 AkuX102G8uSg7EWhTlXsJPZAzm2HLJnSSpbNdK3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76550F80254;
	Mon, 20 Mar 2023 00:35:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD93F804FE; Mon, 20 Mar 2023 00:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EE8FF80105
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 00:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EE8FF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uWS+q1/L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68BD1611C9;
	Sun, 19 Mar 2023 23:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652A6C433D2;
	Sun, 19 Mar 2023 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679268886;
	bh=OHFIkS02PBwwN4tDVa9bwFIXVHAnsp7dEnx4o7xqt/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWS+q1/L6zMGmM54AkIQYlVjdUqomwxLOUxhh5bAA1qlRYSVcSb6zn8PU6mU8PhVP
	 ZAIvUAJMkimSaOiK/gxicLqQhubfng5yZfvFzXxfg18Q/x7lDJCwdZR/cQcpHb1uvO
	 SSk3FHfWhGTeFU2vXTZRw19TeowFt2kxewwPKlOO9jJHpB5Vcy46IjUBe00d2CFS+3
	 0ZpR1G6R5SAeqoizt5d+wBItTLpPlnbccdeNT+NPaIzTS9Zs2z3TPO6WQS1QzX080m
	 fPB/FqFyXk8vxidUm7Zx7iYQlnKg69M1PDcTMrDLp2OuMfVi1f1al7/JtPqqe4V8d2
	 1ZDg7Zc2ZTxIA==
Date: Sun, 19 Mar 2023 16:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: ymfpci: remove unused snd_ymfpci_readb function
Message-ID: <20230319233444.GA12415@dev-arch.thelio-3990X>
References: <20230318132708.1684504-1-trix@redhat.com>
 <87mt49mabx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt49mabx.wl-tiwai@suse.de>
Message-ID-Hash: KFLN6JVNOF55L5QWSKFHV7HVL3HAIGJB
X-Message-ID-Hash: KFLN6JVNOF55L5QWSKFHV7HVL3HAIGJB
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Tom Rix <trix@redhat.com>, tiwai@suse.com, ndesaulniers@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFLN6JVNOF55L5QWSKFHV7HVL3HAIGJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Mar 19, 2023 at 09:09:22AM +0100, Takashi Iwai wrote:
> On Sat, 18 Mar 2023 14:27:08 +0100,
> Tom Rix wrote:
> > 
> > clang with W=1 reports
> > sound/pci/ymfpci/ymfpci_main.c:34:18: error:
> >   unused function 'snd_ymfpci_readb' [-Werror,-Wunused-function]
> > static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
> >                  ^
> > This static function is not used, so remove it.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> 
> I applied now, but still wondering why it warns at all even if it's a
> static inline function...

See commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build") for some more information. The key part
of the commit message is 'with W=1', this will not happen with a normal
clang build.

Cheers,
Nathan

> > ---
> >  sound/pci/ymfpci/ymfpci_main.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
> > index c80114c0ad7b..2858736ed20a 100644
> > --- a/sound/pci/ymfpci/ymfpci_main.c
> > +++ b/sound/pci/ymfpci/ymfpci_main.c
> > @@ -31,11 +31,6 @@
> >  
> >  static void snd_ymfpci_irq_wait(struct snd_ymfpci *chip);
> >  
> > -static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
> > -{
> > -	return readb(chip->reg_area_virt + offset);
> > -}
> > -
> >  static inline void snd_ymfpci_writeb(struct snd_ymfpci *chip, u32 offset, u8 val)
> >  {
> >  	writeb(val, chip->reg_area_virt + offset);
> > -- 
> > 2.27.0
> > 
