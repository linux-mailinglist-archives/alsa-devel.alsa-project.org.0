Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBCF790CE4
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 18:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73017FA;
	Sun,  3 Sep 2023 18:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73017FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693758840;
	bh=T/UTagbmsc4cp9PRw27QtQxKtyAsx9+xPOvyM7keUN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJFYgKHoCdIuB0rra20dP8KBzTvWTX6DXHL0+6FPtiau0x1DpFG87FDpw1Ar3wWx8
	 RjEBopGwxxJJJ+szlY0YEiRN6/0/7LGKS5ldMK6gka5BGH77HbB75363iZIvVJLsyf
	 uHz5LGLkhdtcIiyk6q55QDdbcVke+dfVacFTD2wI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E30F8047D; Sun,  3 Sep 2023 18:33:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB1BF80431;
	Sun,  3 Sep 2023 18:33:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8DF5F8047D; Sun,  3 Sep 2023 18:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 696B3F800F5
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 18:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696B3F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=N9Q7PRU1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xQfye9Vj
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9F786215EF;
	Sun,  3 Sep 2023 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693758772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qc+cXtlFIHY98BK4i6pthqR7Wa7NW4bm9VGwSkDgbyY=;
	b=N9Q7PRU1ZFbG6p3fWLT84hgUKsTRnJ8MuEX+SX6cgGuD7WZ+aBuQvvpIE4kD5ZA7BiWAL6
	LkAk6HIw2Ih/geeWZ89rfoWfhkgrDg+VoMSHrSBdLnYuL5LZeONKslFwF1O2uWIuJnZFlC
	xgdjJ40lTS1alnIpP4UF5Eth6DIyVg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693758772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qc+cXtlFIHY98BK4i6pthqR7Wa7NW4bm9VGwSkDgbyY=;
	b=xQfye9VjrI8LkhRR/DbCLgd0aDvMw8863hZlSuaPHhHYyK5qmhZfoVjr9D3Orbgw8icGWS
	VGPuENc+IQpYwiAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34AA513583;
	Sun,  3 Sep 2023 16:32:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XbrNCzS19GT8HgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 03 Sep 2023 16:32:52 +0000
Date: Sun, 03 Sep 2023 18:32:51 +0200
Message-ID: <87v8crkyj0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<mengdong.lin@intel.com>,
	<baojun.xu@ti.com>,
	<thomas.gfeller@q-drop.com>,
	<peeyush@ti.com>,
	<navada@ti.com>,
	<broonie@kernel.org>,
	<gentuser@gmail.com>
Subject: Re: [PATCH v1 1/2] ALSA: hda/tas2781: Update tas2781 HDA driver
In-Reply-To: <20230903143759.92-1-shenghao-ding@ti.com>
References: <20230903143759.92-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RBVLCYQA77IC2ZJKXXNDAN4ELTUF6WJ7
X-Message-ID-Hash: RBVLCYQA77IC2ZJKXXNDAN4ELTUF6WJ7
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBVLCYQA77IC2ZJKXXNDAN4ELTUF6WJ7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 03 Sep 2023 16:37:57 +0200,
Shenghao Ding wrote:
> 
> Support ACPI_ID both TXNW2781 and TIAS2781, and revert structure
> cs35l41_dev_name.

Could you explain why you need to revert?  That's the important
piece.

And, what is found in below...

> ---
> Changes in v1:
>  - Redefine tas2781_generic_fixup, remove hid param
>  - TIAS2781 has been used by our customers, see following dstd.dsl. We
>     have discussed this with them, they requested TIAS2781 must be
>     supported for the laptops already released to market, their new
>     laptops will switch to TXNW2781
>    Name (_HID, "TIAS2781")  // _HID: Hardware ID
>    Name (_UID, Zero)  // _UID: Unique ID
>    Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
>    {
>        If ((SPID == Zero))
>        {
>           Return ("17AA3886")
>        }
> 
>        If ((SPID == One))
>        {
>            Return ("17AA3884")
>        }

... such information should be mentioned in the changelog.
It can be even commented in the code.

Last but not least, if you do two things, split to two patches --
unless the rename is closely tied with the support of both IDs.


thanks,

Takashi
