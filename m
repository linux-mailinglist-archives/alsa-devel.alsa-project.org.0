Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C108375B121
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 16:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDDC1F6;
	Thu, 20 Jul 2023 16:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDDC1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689862954;
	bh=arUlI582aser1u38zkRpnm7O01WCgBgVYprCcr4y4LU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+eF3hVLBkmMJ44Stu2mSu/RO20DOOnuPidBajacxn7DWhq+AxWq6Jc1usHmdqzEy
	 RcdDy9s6D6GYtxILDEMWMvE+LEtjZD7K0F8zLP/0L6vf9dZIelOD/e6A2olqCH0lBB
	 Rg4my9mOnC9h0btvWbz/Fe8nSy2pE/UJ5er4gjvo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D4CFF800D2; Thu, 20 Jul 2023 16:21:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B71F8032D;
	Thu, 20 Jul 2023 16:21:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63209F8047D; Thu, 20 Jul 2023 16:21:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DC3DCF80153
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 16:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC3DCF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=vs8NpfUP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YY5NZ9mh
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6263422C6D;
	Thu, 20 Jul 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689862895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3GQaBlG3C2XqFtdty5BDZEIOWAvouaxyDbtfsHm8S8Y=;
	b=vs8NpfUPAFAiOeU6XWCwxNJK+Wr8WjJ24qHqGnFqwJn9BGCLZAF12iYd/8siaEO21kR++E
	B37rPN2L7DTo9yEI8dp2YCwG+4YuL/5yI5h/TZFI3v3FnUr/VfYEkJVHanxL65ZTAK8X28
	JMSTRI9HG+FSYVyI92HEpeHjjzoLy9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689862895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3GQaBlG3C2XqFtdty5BDZEIOWAvouaxyDbtfsHm8S8Y=;
	b=YY5NZ9mhapfUHGJKAYR9Tqx9iUCLqR6TiFgw2XERatjTO9X2Z+H4jkmrSkS4GhL2gPGTo4
	rw6R7if9BaoKObBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32FEC138EC;
	Thu, 20 Jul 2023 14:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4QydC+9CuWQYcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 14:21:35 +0000
Date: Thu, 20 Jul 2023 16:21:34 +0200
Message-ID: <87v8eeiryp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi
 Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 10/11] ALSA: hda: cs35l41: Add device_link between HDA
 and cs35l41_hda
In-Reply-To: <20230720133147.1294337-11-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
	<20230720133147.1294337-11-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZYES4VNTOG6WBVE3IVDIQN4OD2HY3S6N
X-Message-ID-Hash: ZYES4VNTOG6WBVE3IVDIQN4OD2HY3S6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYES4VNTOG6WBVE3IVDIQN4OD2HY3S6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jul 2023 15:31:46 +0200,
Stefan Binding wrote:
> 
> To ensure consistency between the HDA core and the CS35L41 HDA
> driver, add a device_link between them. This ensures that the
> HDA core will suspend first, and resume second, meaning the
> amp driver will not miss any events from the playback hook from
> the HDA core during system suspend and resume.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/pci/hda/cs35l41_hda.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index 70aa819cfbd64..175378cdf9dfa 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -1063,6 +1063,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>  {
>  	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
>  	struct hda_component *comps = master_data;
> +	unsigned int sleep_flags;
>  	int ret = 0;
>  
>  	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
> @@ -1102,6 +1103,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
>  
>  	mutex_unlock(&cs35l41->fw_mutex);
>  
> +	sleep_flags = lock_system_sleep();
> +	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
> +		dev_warn(dev, "Unable to create device link\n");
> +	unlock_system_sleep(sleep_flags);

Is lock_system_sleep() mandatory for device_link_add()?  The function
takes its rw lock for the race, I suppose.


thanks,

Takashi
