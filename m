Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826D3743727
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:30:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 129097F4;
	Fri, 30 Jun 2023 10:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 129097F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688113808;
	bh=L8twC1xQ5SlaB7fPp57jHEpsl+4Qe8Q0s79bb+qXOqM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jtVPHz9qFLgWwTkWkvVJyln+YbwJtQ7UABMXaraDokf4u4Hpt1LW7r8ZUlAtlV3xP
	 NAa/9QQ/kb4TrWB+NcTO/wLktJPWDwqB10TolDMBuwSmoDyf8ZFdgMGkjGYg8QjqJT
	 Y+MwwS8Y3Zh9sCyZ5fMpGWf3/JsJK16syazXPzW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF4FF8027B; Fri, 30 Jun 2023 10:29:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB17F80212;
	Fri, 30 Jun 2023 10:29:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 167C9F80246; Fri, 30 Jun 2023 10:29:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 666EFF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 10:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666EFF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=c63xGAKx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FN5pXLyn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 324551F8C8;
	Fri, 30 Jun 2023 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688113742;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPfMVz9fzdH7759AhtIu8QxDAdvl6cZkVliQlQqx7wQ=;
	b=c63xGAKxYwGoLNjDTpFklyoYtQL4u1JhWkWpKthjYxVksw28ft8ZP1Q/ASPPxRyJaYBRn7
	aL0H3IBihfZPECNSERtAnCjCAjqquseksqE7gVh/PtFkriNwanAGJNKVR5V89muB365ip2
	dBSQ11g9Kpt3zp7VlCmLloNFD0s+H34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688113742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPfMVz9fzdH7759AhtIu8QxDAdvl6cZkVliQlQqx7wQ=;
	b=FN5pXLyno/TVUz+2leczgkywXRRdb8JuW3nt6uMUhO/HjKn3yBvswOCuqgRyvWiieqqF0B
	IpR2pHlZf+J8/gDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2200138F8;
	Fri, 30 Jun 2023 08:29:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JBoTOk2SnmSITwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 30 Jun 2023 08:29:01 +0000
Date: Fri, 30 Jun 2023 10:29:01 +0200
Message-ID: <87h6qpcq0i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: tiwai@suse.com,
	perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tangmeng@uniontech.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
In-Reply-To: <20230630043106.914724-2-luke@ljones.dev>
References: <20230630043106.914724-1-luke@ljones.dev>
	<20230630043106.914724-2-luke@ljones.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LGUSGRCU7K4KVOMFOTU7LQJPDHZOAS7T
X-Message-ID-Hash: LGUSGRCU7K4KVOMFOTU7LQJPDHZOAS7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGUSGRCU7K4KVOMFOTU7LQJPDHZOAS7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 30 Jun 2023 06:31:05 +0200,
Luke D. Jones wrote:
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -5883,7 +5883,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
>  		struct alc_spec *spec = codec->spec;
>  		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
>  		alc255_set_default_jack_type(codec);
> -	} 
> +	}
>  	else
>  		alc_fixup_headset_mode(codec, fix, action);
>  }

This change looks irrelevant.  Could you drop it?
If it needs to be fixed, put in another cleanup patch.


thanks,

Takashi
