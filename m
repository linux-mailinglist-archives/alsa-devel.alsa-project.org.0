Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CEA7A077B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 16:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064D7AE8;
	Thu, 14 Sep 2023 16:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064D7AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694702304;
	bh=fAk2IZTjBTq69+NcwTU5UjsqDGc2yZwNAChkm+lNvvc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPIBDdLYaT3blAUAorwrG0lxz6oFNEIpWZ/Dcls2CPdDeBVB0tm1ZgvYtFrtG6hdk
	 ed0QlbCpIBGSbOV/WFG8sf56j0KRLpiAQNRYTGNwlXU8qkWrtRmnNOvccoB0JHHgnp
	 MW8nt5bpAAnTrqgNLoXW2E0Nz8zNrkx4n8nZybVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C801AF80549; Thu, 14 Sep 2023 16:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8A4F80212;
	Thu, 14 Sep 2023 16:37:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A340F80212; Thu, 14 Sep 2023 16:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F088F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 16:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F088F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cp6fCWVm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CYblOK5z
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A1FF521842;
	Thu, 14 Sep 2023 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694702244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZRieROqbwcDhGtcftY4gNUE3C/0M9g8+nAIb/BCYK8=;
	b=cp6fCWVmRmhxGFp2vxv37JeKGKUzTZz5QvZQtfmU/3DLy+XlaKWpBJnwRWOi+CNFo16MgN
	X1g/kaJ9coBrYxaB5sQEJldmBAe9TljMQJKVXRBUoxNx1zSHWyT0ESY295aAurJwKioIrm
	gX7UsaGaoiEqnxGJUmw6aQep07MgQs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694702244;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZRieROqbwcDhGtcftY4gNUE3C/0M9g8+nAIb/BCYK8=;
	b=CYblOK5z/3NzYmTTCuwIY3/csHiYxFVfB0NXTnNAnQYhcpuWjCRZh+pMqGb91pusfgOKFr
	2zM4SARn5zIzeuAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D7DE139DB;
	Thu, 14 Sep 2023 14:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3Rd4HaQaA2WweAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 14 Sep 2023 14:37:24 +0000
Date: Thu, 14 Sep 2023 16:37:23 +0200
Message-ID: <87wmwsyg64.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Don't 'return ret' if ret is always
 zero
In-Reply-To: <20230914140852.7112-1-rf@opensource.cirrus.com>
References: <20230914140852.7112-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: CTYJ5IMCSED2W3XMVICTIAMFYDLNH2KK
X-Message-ID-Hash: CTYJ5IMCSED2W3XMVICTIAMFYDLNH2KK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTYJ5IMCSED2W3XMVICTIAMFYDLNH2KK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 14 Sep 2023 16:08:52 +0200,
Richard Fitzgerald wrote:
> 
> The final return in cs35l56_hda_posture_get() was returning the
> value of 'ret', but ret is always zero at this point. So this
> can be a simple 'return 0'.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Thanks, applied.


Takashi
