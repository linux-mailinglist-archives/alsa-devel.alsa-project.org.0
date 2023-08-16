Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6BD77DA8B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 08:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010787F1;
	Wed, 16 Aug 2023 08:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010787F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692167971;
	bh=byXpUY11adZGRAoNx70vgsJHMYOvhwpgEnak7IN96Ro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jZEbc1Jr4fxKxZec8Uh/+2KKvKKLeEzlCYA3G6umtNGYswhmq1KoUpUQgFJXQkwBx
	 sg2CmCRZiXJyGM/atBZYzGj43+9n6EYZSNVPxVmlfCghqXBO0+vaRmsg2Nbnwk4ElC
	 cOzoyOAWXgV+tZ4IroSrY2/G8fK/H2jk8KZ8I0u0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DED0F80290; Wed, 16 Aug 2023 08:38:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 179AEF8016A;
	Wed, 16 Aug 2023 08:38:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBD45F8016D; Wed, 16 Aug 2023 08:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20409F80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 08:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20409F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AvzRbwbp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OkOYx8ia
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AD9441F74D;
	Wed, 16 Aug 2023 06:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692167912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1FJX1SP7UzleOrYdfmK1DdVaKRGUj7jywtXntStV1U=;
	b=AvzRbwbpJ4jT/JjRRlCuH8t+inH4VeseLd2RSJIOrNjeD3kurSA0VTRfnzTGXpjz2qNTpO
	2ooWhTYQBUJSTlG4rHk9L+HADvnQ3Us7jNgW127MLiM35rtV8UiUlvinPGOJJVjtEQH7Qi
	+oDdm4WmOGyyrUE+3WC0JObjWWedV5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692167912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1FJX1SP7UzleOrYdfmK1DdVaKRGUj7jywtXntStV1U=;
	b=OkOYx8iaGSolRcnZXO9dIe5m5pCzjoOTPYOdI3WMVd8sM1PMyeN/lpyfun44fpraVM7tZy
	uEk0D83KGxC67KDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7114D133F2;
	Wed, 16 Aug 2023 06:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YI+zGuhu3GSidgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 06:38:32 +0000
Date: Wed, 16 Aug 2023 08:38:32 +0200
Message-ID: <87zg2rwkyf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brady Norander <bradynorander@gmail.com>
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	pierre-louis.bossart@linux.intel.com,
	cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com,
	perex@perex.cz,
	cujomalainey@chromium.org
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
In-Reply-To: <ZNuDLk5hgmfKrZg6@arch>
References: <ZNuDLk5hgmfKrZg6@arch>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RYCIH4GLUGAKSCKXJYSTGQHCQ4P5CTVR
X-Message-ID-Hash: RYCIH4GLUGAKSCKXJYSTGQHCQ4P5CTVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYCIH4GLUGAKSCKXJYSTGQHCQ4P5CTVR/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 15 Aug 2023 15:52:46 +0200,
Brady Norander wrote:
> 
> AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> default. Add a quirk to use the SOF driver on these platforms, which is
> needed for functional internal audio.
> 
> Signed-off-by: Brady Norander <bradynorander@gmail.com>
> ---
> 
> v2: Removed quirk from SKUs not used in Chrome platforms

Applied now to for-next branch.  Thanks.


Takashi
