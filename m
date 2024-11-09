Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F09C2DF5
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2024 15:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB3B1D6;
	Sat,  9 Nov 2024 15:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB3B1D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731164325;
	bh=jrxlXYLbSuamZOrLkU/W2eD/y8bk3qDW3IvKIPqgfiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tEZK+11b7G69UJQRboQT9ME0cfWHoZUf7BrSrfsK9YMSqxHTI2Y5oF811Gf7PWYO6
	 xvlutwa36l/EUU6XXAbueIDd44swsMZGM6b1NSIOgnoiXjWwSxaOoJCrXlQdM7D2+A
	 CoH3WEpouipdIr6wOy2bZRlbnlzvnFzat2xo+188=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7237FF805AF; Sat,  9 Nov 2024 15:58:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8926F8058C;
	Sat,  9 Nov 2024 15:58:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9006F8013D; Sat,  9 Nov 2024 15:58:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90F6CF800C8
	for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2024 15:58:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F6CF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1aSIgGwP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91FA75C058D;
	Sat,  9 Nov 2024 14:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC45C4CED5;
	Sat,  9 Nov 2024 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731164283;
	bh=jrxlXYLbSuamZOrLkU/W2eD/y8bk3qDW3IvKIPqgfiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1aSIgGwPkVQE3vsr3I9JL6uzs/MIuxyPYvPjWecjYwZQ5CRrtWy8M8HtlASMZjdb3
	 TD2mDdi0uTfOkL5rydBIjsLD+1Ca45sYWBgA7cW+PoBPPkExoGhkdjZ8q8L/166vIW
	 eI+7DM93z9A6jLV/UrGWrE9OBsDFlhvlW9+VHCKM=
Date: Sat, 9 Nov 2024 15:58:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Christoffer Sandberg <cs@tuxedo.de>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.1.y] ALSA: hda/realtek: Fix headset mic on TUXEDO
 Gemini 17 Gen3
Message-ID: <2024110938-graffiti-equity-2c07@gregkh>
References: <20241106021124.182205-1-sashal>
 <20241106094920.239972-1-wse@tuxedocomputers.com>
 <2024110606-expansion-probing-862b@gregkh>
 <b768433e-c146-46af-a077-3e2631a4c292@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b768433e-c146-46af-a077-3e2631a4c292@tuxedocomputers.com>
Message-ID-Hash: LFMWMDDB3UIFOCUOMD5HNJ7U4VG66VRY
X-Message-ID-Hash: LFMWMDDB3UIFOCUOMD5HNJ7U4VG66VRY
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFMWMDDB3UIFOCUOMD5HNJ7U4VG66VRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 06, 2024 at 11:51:16AM +0100, Werner Sembach wrote:
> Hi
> 
> Am 06.11.24 um 11:42 schrieb Greg KH:
> > On Wed, Nov 06, 2024 at 10:49:04AM +0100, Werner Sembach wrote:
> > > From: Christoffer Sandberg <cs@tuxedo.de>
> > > 
> > > Quirk is needed to enable headset microphone on missing pin 0x19.
> > > 
> > > Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Cc: <stable@vger.kernel.org>
> > > Link: https://patch.msgid.link/20241029151653.80726-1-wse@tuxedocomputers.com
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >   sound/pci/hda/patch_realtek.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > What is the git commit id of this in Linus's tree?
> 
> 0b04fbe886b4274c8e5855011233aaa69fec6e75
> 
> Is there a specific format/tag to add it to the commit? something like
> "Mainline-commit: <hash>". Didn't find anything in the documentation.

anywhere a normal 'git cherry-pick -x' would put it is good.

thanks,

greg k-h
