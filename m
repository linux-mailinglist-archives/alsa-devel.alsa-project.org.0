Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08027812E7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 20:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CEA9ECE;
	Fri, 18 Aug 2023 20:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CEA9ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692383384;
	bh=jtZ2X/RvkdtuhYfAVtyuWSHUM2M2dqD+8L+e8EeZ6sQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pfXEhv5cY786fcXaLd2lv4xfuP58hcGj3W/P0QT4Lxqkr275Nmhs8sTAjEvIf3v9G
	 wfWGdZ89br4eySmeJ/ITHc/a/ZVE9YTPz95qeE22Cmg5eDRRTD/EIBWKJOP9+GoATZ
	 661xpU/yugV2WFP7vVtRU4bZeCfQ81kt2ntZl/04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92A8BF80272; Fri, 18 Aug 2023 20:28:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD53F8016D;
	Fri, 18 Aug 2023 20:28:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D95BF801EB; Fri, 18 Aug 2023 20:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D37A1F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 20:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D37A1F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xOXZ6EL9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=q7K5BQDS
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 184971F74B;
	Fri, 18 Aug 2023 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692383317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSIOC01SNEMHZE/GJDc/41dzaL6uTedaZsYjL6U2Nt8=;
	b=xOXZ6EL9L/KQILtgnFXrXLJ7nr3scvjXdaYoMrmfdqP8GGRz3IYuXCY/Mf0xpq97nWnV3a
	cwBQj5mFC0KJJfgMEtQHvQJoTJ53dhGwiTU1864Vwt3AYlhc560umDsrtmV1ZaXVJ3a3ZF
	UH/5J9tp4123UCzgPJhg/CvjEsTLK9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692383317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSIOC01SNEMHZE/GJDc/41dzaL6uTedaZsYjL6U2Nt8=;
	b=q7K5BQDSbkG+fmkEIz0IlVEBdBuHGd09xpgSEleIQHV2wcbZg55/ztQ4D1mYuqXbVDLLez
	YWjY9RKWy40TT7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3B0313441;
	Fri, 18 Aug 2023 18:28:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id M/PyKlS432RhMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 18:28:36 +0000
Date: Fri, 18 Aug 2023 20:28:36 +0200
Message-ID: <87o7j4gq7f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	kevin-lu@ti.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	baojun.xu@ti.com,
	thomas.gfeller@q-drop.com,
	peeyush@ti.com,
	navada@ti.com,
	broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v4 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <87r0o0gssk.wl-tiwai@suse.de>
References: <20230818085836.1442-1-shenghao-ding@ti.com>
	<87pm3kk63a.wl-tiwai@suse.de>
	<72960354-3f69-e2fa-e7b0-dc8b61ca4940@linux.intel.com>
	<87r0o0gssk.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5ITSFAE7EJZEAAW24PUWR4NUOPKVKXGB
X-Message-ID-Hash: 5ITSFAE7EJZEAAW24PUWR4NUOPKVKXGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ITSFAE7EJZEAAW24PUWR4NUOPKVKXGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 19:32:43 +0200,
Takashi Iwai wrote:
> 
> On Fri, 18 Aug 2023 18:36:16 +0200,
> Pierre-Louis Bossart wrote:
> > 
> > 
> > 
> > On 8/18/23 05:17, Takashi Iwai wrote:
> > > On Fri, 18 Aug 2023 10:58:35 +0200,
> > > Shenghao Ding wrote:
> > >>
> > >> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> > >> laptop will be aggregated as one audio device. The code support realtek
> > >> as the primary codec. Rename "struct cs35l41_dev_name" to
> > >> "struct scodec_dev_name" for all other side codecs instead of the certain
> > >> one.
> > >>
> > >> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> > > 
> > > Now I applied both patches to for-next branch.
> > > 
> > > The patch 2 needed some minor adjustment in Kconfig to be applied to
> > > the latest branch, but I resolved it locally.
> > 
> > There are a number of issues I just reported, I guess they will have to
> > be handled with a follow-up patch now?
> 
> Yes, let's fix incrementally on the top.

... and since it's already merged, it means that everyone can submit
patches for fixing issues there, and I'd happily apply fixes no matter
who submitted them, as long as the fixes are correct ;)


Takashi
