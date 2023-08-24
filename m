Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE67868F6
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F5F484C;
	Thu, 24 Aug 2023 09:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F5F484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863673;
	bh=JfaTFzdGi4SrBjJFFXs4pPLvvKRRnEwxbaDWWZtR/LM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i/vLIabnjh4vbegp+cHOZgRyANEt4MrAyzlTRcmoCdRrtvIgDGmqgkqj1XWjBfMWj
	 VJDfNqkfUpNYUPAoqpMiiMsWPHLAtthrTKdUn7WW7Z36p6BUQxuAjkMq3ZClAlHtOh
	 QBi+9PELy933JOHtWimzEfUABA6tlRAISJlUP2xU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20577F804F3; Thu, 24 Aug 2023 09:53:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9132CF800BF;
	Thu, 24 Aug 2023 09:53:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D317AF80158; Thu, 24 Aug 2023 09:53:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 48C2FF800BF
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C2FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QH0yqBhS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9Bgt+4Zg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 295C220EC3;
	Thu, 24 Aug 2023 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsmXgVlSaWxS9dHOZcwkVW+jzehRxHRlAzihi2AxMfE=;
	b=QH0yqBhSRGW/tp5eF6t899FCj8RqioFaJhSU3Wj50bYdNG5bXQlAfuGU5pLVbjhzI2r2jL
	Z4v4tMqctoIZcaLemr0u+kEm/LW5OAz79FD8t/Iaca62Ubvi8YNRUwgUSLUuVmkYSk2B8y
	hJTsvUn6AwHu4NkWry/pUkMb3aJOYwM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IsmXgVlSaWxS9dHOZcwkVW+jzehRxHRlAzihi2AxMfE=;
	b=9Bgt+4ZgeWmHEA3S7FLYNdqEaEivCpDxlEyZoUjhEVUNoBFc8zY5lDuD9AHv313u+GPQLs
	iODwM2rct3zMkNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00480139BC;
	Thu, 24 Aug 2023 07:53:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id x7nlOoAM52T4LQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:53:36 +0000
Date: Thu, 24 Aug 2023 09:53:36 +0200
Message-ID: <87h6ooc1vj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Override the _DSD for HP Zbook
 Fury 17 G9 to correct boost type
In-Reply-To: <20230823143956.755758-1-sbinding@opensource.cirrus.com>
References: <20230823143956.755758-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5A7XCKYEY7VD2B3YLNCBQTOELCTESBBU
X-Message-ID-Hash: 5A7XCKYEY7VD2B3YLNCBQTOELCTESBBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A7XCKYEY7VD2B3YLNCBQTOELCTESBBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 16:39:56 +0200,
Stefan Binding wrote:
> 
> CS35L41 HDA driver requires ACPI to contain correct _DSD properties to
> correctly configure the device. Whilst the HP Zbook Fury 17 G9 contains
> valid _DSD properties, the boost type has been configured incorrectly
> in the _DSD for this laptop. We can override these properties to fix
> the boost type.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Thanks, applied now.


Takashi
