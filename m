Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF1722C1A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 18:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D1D828;
	Mon,  5 Jun 2023 18:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D1D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685980915;
	bh=FDNcxuJPNhT78Sz5hKWUwMBzqB/OoHm2LUX7VxToPT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kqz2uEAlqH1xBCIAhX7QDmeb9nsGPyyE3FXqOTV1ELBOwr7dM+Eh31uQVDQD5i9ux
	 Lss3cKUPmTsameOcJ4V53uZPasGqDxxbNpBOEP2grAWv+bUAcqiMGNC7SjmAI2qJ2z
	 X7T5figZHqpXpSeEP6cUjw2sricWBfo24X9aHU3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A087F80527; Mon,  5 Jun 2023 18:01:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 306E4F8016C;
	Mon,  5 Jun 2023 18:01:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 478D4F80199; Mon,  5 Jun 2023 18:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F024F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 18:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F024F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BKmWgUcv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8VuC1kdT
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5B9821B7F;
	Mon,  5 Jun 2023 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685980858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kz6sLOsH45BCwrRvdZKj8xXLLyH+JJthA2WE7AVjTTs=;
	b=BKmWgUcvERsKiBEtTcA+niVWA6C1J3EXGrQUJySrRBq//5X8R+3dB8VZ99/ndLJ1QT4cc+
	7GxfC6rMlpuLJorIRG+3tQuZ0pz/CgMy2BDxM+Rm1lmj2WgkcagJystSjr1wMt/zEtxtV5
	VSMP1lkg663hsd85L9lwXp8ZBBxFBc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685980858;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kz6sLOsH45BCwrRvdZKj8xXLLyH+JJthA2WE7AVjTTs=;
	b=8VuC1kdTGAAfxgLAZdavOpiTYTW+i4pHmz79O0KJBSciMEhFURRi459WgxK7xjVlFeUeXZ
	e4iqzULbmkp4o3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6910139C7;
	Mon,  5 Jun 2023 16:00:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JL65J7oGfmQXCAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 16:00:58 +0000
Date: Mon, 05 Jun 2023 18:00:58 +0200
Message-ID: <87pm69hpad.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 3/3] ALSA: hda/realtek: Delete cs35l41 component master
 during free
In-Reply-To: <20230605152855.448115-4-sbinding@opensource.cirrus.com>
References: <20230605152855.448115-1-sbinding@opensource.cirrus.com>
	<20230605152855.448115-4-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7BCJQIOR56WX6YIDJVG25ESKN2TFMUU2
X-Message-ID-Hash: 7BCJQIOR56WX6YIDJVG25ESKN2TFMUU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BCJQIOR56WX6YIDJVG25ESKN2TFMUU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Jun 2023 17:28:55 +0200,
Stefan Binding wrote:
> 
> This ensures that the driver is properly cleaned up when freed.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/pci/hda/patch_realtek.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 7b5f194513c7b..e3774903918fe 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6757,6 +6757,8 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
>  		else
>  			spec->gen.pcm_playback_hook = comp_generic_playback_hook;
>  		break;
> +	case HDA_FIXUP_ACT_FREE:
> +		component_master_del(dev, &comp_master_ops);
>  	}

Don't forget to add break here.


thanks,

Takashi
