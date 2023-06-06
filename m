Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793AC7248AD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 18:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96277820;
	Tue,  6 Jun 2023 18:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96277820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686068025;
	bh=FnAvb5y9BDmkkptHiwYeJkM0SQQwJcgHh7ucUo7f4pU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SopHB31tCdHWmeB/ZTlgOm4IV1T6MYVCDXd1BJ7o4OVw9+Oce+qaqOJ4upiRBXuSN
	 Ez2TabkO5UegtxmmlklbrftntVzxv8WKWHX6wtOdxxCD2KRWZlWbzmUElisWXfkt+z
	 tUdueOPwkVUvn07fVfYXHC1uxo+KUBBIuEDGS08I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 536AEF8016C; Tue,  6 Jun 2023 18:12:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD1CF8016C;
	Tue,  6 Jun 2023 18:12:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 964DCF80199; Tue,  6 Jun 2023 18:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F243F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 18:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F243F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OptcxMpQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tvPzVWUi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E05D921998;
	Tue,  6 Jun 2023 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686067963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tDS8AHR+6l5pU0D3pqB/j9UJ3eqzXU7CXq0Fenh1CAE=;
	b=OptcxMpQcKnCWmaZR2xro+4sgXmK9PuvO1jzEY0syZscIKVRr/nLOkwliN61O8845uNXi5
	GT5dkptMzUzFqL2lXMw/QfdkFc7iFeTu+cXRsuOHegpiD36MwXwqpjseNeVsV28If0kpK3
	SPLj+lUESLCfZj5Urxzl9XWDoTlLsiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686067963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tDS8AHR+6l5pU0D3pqB/j9UJ3eqzXU7CXq0Fenh1CAE=;
	b=tvPzVWUiurx4PtC5gkrfOcMaMPl2TYleMBtyaUPenBzIeoMg4O7lBsU99ycSSRTPFw9jjx
	TePHsGARLn5i6aBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7700913519;
	Tue,  6 Jun 2023 16:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Qf0zG/taf2RtNQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 16:12:43 +0000
Date: Tue, 06 Jun 2023 18:12:43 +0200
Message-ID: <871qiofu2s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <13916275206@139.com>,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com,
	gentuser@gmail.com,
	Ryan_Chu@wistron.com,
	Sam_Wu@wistron.com
Subject: Re: [PATCH v4 5/6] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <65ef4914-dc0e-4f0f-a6f8-3016931488bd@sirena.org.uk>
References: <20230527223613.11106-1-13916275206@139.com>
	<874jnkfu98.wl-tiwai@suse.de>
	<65ef4914-dc0e-4f0f-a6f8-3016931488bd@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BNAM4KBAOPNSM7QWCHKB7ULWVU46GSPL
X-Message-ID-Hash: BNAM4KBAOPNSM7QWCHKB7ULWVU46GSPL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNAM4KBAOPNSM7QWCHKB7ULWVU46GSPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 18:10:13 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 06, 2023 at 06:08:51PM +0200, Takashi Iwai wrote:
> > Shenghao Ding wrote:
> 
> > > +	//Lenovo devices
> > > +	if ((subid == 0x387d) || (subid == 0x387e) || (subid == 0x3881)
> > > +		|| (subid == 0x3884) || (subid == 0x3886) || (subid == 0x38a7)
> > > +		|| (subid == 0x38a8) || (subid == 0x38ba) || (subid == 0x38bb)
> > > +		|| (subid == 0x38be) || (subid == 0x38bf) || (subid == 0x38c3)
> > > +		|| (subid == 0x38cb) || (subid == 0x38cd))
> > > +		tas_priv->catlog_id = LENOVO;
> > > +	else
> > > +		tas_priv->catlog_id = OTHERS;
> 
> > Hmm, I don't like checking subid here, but we can live with it for
> > now...
> 
> Might be more idiomatically/neatly written as a switch statement though.

Yes, it'll make it easier to add a new entry, too.


thanks,

Takashi
