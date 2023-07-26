Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4DF762A7E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 06:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60847203;
	Wed, 26 Jul 2023 06:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60847203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690347509;
	bh=jOeF8cppzlPBCIFSmBztXHTHPsxcIlXUKSUY753sPaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpwwajBm6CbhyaapknphKDzgdRY9Q70y2pH+wrADRkfI/jqqZ6zi8/vakMvcWkSTG
	 Z8TCCmNHYAFDUDgnBFHDPIZYDyxm27L3vCIVF7ORDKYkOoxO4AfhQ3CJ6al6d6gO7W
	 R+84616qcpNb8reE7fsZ8VxOU3w83/ivZmdAgisg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC1E3F80535; Wed, 26 Jul 2023 06:57:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A7D7F80153;
	Wed, 26 Jul 2023 06:57:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DE55F8019B; Wed, 26 Jul 2023 06:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCECEF80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 06:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCECEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cxwcE7Of
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2143961465;
	Wed, 26 Jul 2023 04:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2E3C433C7;
	Wed, 26 Jul 2023 04:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690347339;
	bh=jOeF8cppzlPBCIFSmBztXHTHPsxcIlXUKSUY753sPaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxwcE7OfXPa1gb3qMiUZj/lC1U5j/C1r691UiAJQVkcVVAudxFcwtAGx8Wu2AcBnB
	 8lw24oou0sqv8AzGPDJFOusy7EgHHBLa0o5YKEMRCYKB89vjV3tpZvC17ICy6u/8X6
	 wk9O06Fvrp3aj5VQ4wyFnph/ve5zGaqkPJNX5ABraRKfX98byGF+KGkHOPeLYldO83
	 LJguFqCyv0CZWxH63HcSnPxUnB+xQo2/ZUImevvR5gtdveNs84BRWD/GnRadRWkB03
	 xjDYrOn/ZU721oOo2Pfgdaa1cWGeddodXaPNYVMwVN/JG2S9oD+Y1Nz2p6/u6fUTNP
	 VKL7rm/ov1IpQ==
Date: Wed, 26 Jul 2023 10:25:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Robert Lee <lerobert@google.com>
Cc: Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: compress: add opus codec define
Message-ID: <ZMCnR0AooUOLbQKB@matsya>
References: <20230725093005.3499455-1-lerobert@google.com>
 <87sf9ctifg.wl-tiwai@suse.de>
 <CAOM6g_Db8qwbDmbWSSLKqUHsSMLUYxFtpqKi1cWsXsXTE9B+vA@mail.gmail.com>
 <87lef4thir.wl-tiwai@suse.de>
 <CAOM6g_DVKpEhnVStpNWmPoXyHNUuNTA+CNbdPxasObGcXtGEpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAOM6g_DVKpEhnVStpNWmPoXyHNUuNTA+CNbdPxasObGcXtGEpQ@mail.gmail.com>
Message-ID-Hash: ZGPE74PPVCFSOFVWETE773RA4WY5PGVP
X-Message-ID-Hash: ZGPE74PPVCFSOFVWETE773RA4WY5PGVP
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGPE74PPVCFSOFVWETE773RA4WY5PGVP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26-07-23, 09:47, Robert Lee wrote:

Please stop top posting!

> Yes, but we still need this change to let the sound system can use the
> codec. or do you have any suggestions?

Upstream your driver along with this change should be the way to go

> 
> Thanks,
> Robert.
> 
> Takashi Iwai <tiwai@suse.de> 於 2023年7月25日 週二 下午6:25寫道：
> >
> > On Tue, 25 Jul 2023 12:14:56 +0200,
> > Robert Lee wrote:
> > >
> > > Thanks for reply so quickly.
> > > And yes, there are other changes but it is inside our offload pcm
> > > driver to handle it.
> > > Currently we only use it to decode, and we don't need additional option for it.
> >
> > It means still a downstream-only change :)
> >
> > It's nice to upstream changes in general, but from the upstream POV,
> > only changing this gives no benefit.  Let's tie with the actual use
> > case *in the upstream*.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > >
> > > Thanks,
> > > Robert.
> > >
> > > Takashi Iwai <tiwai@suse.de> 於 2023年7月25日 週二 下午6:05寫道：
> > > >
> > > > On Tue, 25 Jul 2023 11:30:05 +0200,
> > > > Robert Lee wrote:
> > > > >
> > > > > Add to support decode Opus codec in Ogg container.
> > > > >
> > > > > Signed-off-by: Robert Lee <lerobert@google.com>
> > > >
> > > > The change makes sense only when it's really used.  So usually it's
> > > > better to put into a series that actually implements its usage.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > > ---
> > > > >  include/uapi/sound/compress_params.h | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> > > > > index ddc77322d571..bac5797bcb02 100644
> > > > > --- a/include/uapi/sound/compress_params.h
> > > > > +++ b/include/uapi/sound/compress_params.h
> > > > > @@ -43,7 +43,8 @@
> > > > >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> > > > >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> > > > >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > > > > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > > > > +#define SND_AUDIOCODEC_OPUS                  ((__u32) 0x00000011)
> > > > > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS
> > > > >
> > > > >  /*
> > > > >   * Profile and modes are listed with bit masks. This allows for a
> > > > > --
> > > > > 2.41.0.487.g6d72f3e995-goog
> > > > >
> > >

-- 
~Vinod
