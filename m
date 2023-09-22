Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE47AB3C5
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B19E79;
	Fri, 22 Sep 2023 16:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B19E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393412;
	bh=rs7MsB2Frfw/FcXL7eJXcTimQkKHfzX0RPm1WKcghqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uX+yDSfaxHbVxQMgdYR+GiBkzMLpuByz47/oXQ+cj2NJGRXQXinUhfAm5rLbtOamu
	 RtI82XY7jbw07ClFd7gqX8c0PgsJz3tqwNlNotrUgPZfV++3nmjcFc8Y3zcUp+LUGU
	 peMo6JXBfYoEqeTa0oiRST9PGLV0HQg3moX0EaUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF86F80125; Fri, 22 Sep 2023 16:35:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B78B7F80124;
	Fri, 22 Sep 2023 16:35:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 486E8F80125; Fri, 22 Sep 2023 16:35:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E642F80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E642F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=k2bw/NDz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3keSnqGF
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BAEA11FEF7;
	Fri, 22 Sep 2023 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695393345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+e8d8EPK3+d0DLp3Ownkw5Gy/YEy3/TX5WBpNFkkHhs=;
	b=k2bw/NDzRNlzjlXfoDwV3zQ+0HxJ1u6oYae0ynND2XpbnAgC+RKpNCKmqwp2fwx5VUA0vD
	+ft3uiwAY93ePcAqMe85VNN+fAzZpYat2tG95K/f1RuqpPo6FB9EE+eefBgAiHUSRbKaJF
	FreAckPgto5+pZd0FZvmdxWpuw08lSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695393345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+e8d8EPK3+d0DLp3Ownkw5Gy/YEy3/TX5WBpNFkkHhs=;
	b=3keSnqGF2eopnJ9IzKCWAO7qhD15ckTn/p1j3CKnAWbaWWeTAN7K3+AeLHkn6yPhLaqfy4
	U84SiBiWWAl/fEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DD1913478;
	Fri, 22 Sep 2023 14:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /v2GIUGmDWXlAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 14:35:45 +0000
Date: Fri, 22 Sep 2023 16:35:45 +0200
Message-ID: <87a5tecm2m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	"Takashi Iwai" <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
In-Reply-To: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QOCNEV2JYDQHNMYOVJBXWDKNC62E3VNB
X-Message-ID-Hash: QOCNEV2JYDQHNMYOVJBXWDKNC62E3VNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOCNEV2JYDQHNMYOVJBXWDKNC62E3VNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 16:28:16 +0200,
Stefan Binding wrote:
> 
> Some systems use older firmware which does not support newer commands
> which are used to enable external boost. For those systems, we can
> workaround this by writing the registers directly.
> 
> We can use the firmware version, stored inside cs_dsp, to determine
> whether or not the command is supported.
> To achieve this, it requires a cleanup in the api, to pass the cs_dsp
> struct into the function.
> 
> We can also remove the redundant boolean firmware_running from the HDA
> driver, and use the equivalent state inside cs_dsp.

So those are fixes needed for 6.6 kernel?  Or they are something new?

> This chain is based on Mark's branch, since the api change was made to
> the function in sound/soc/codecs/cs35l41-lib.c.

I'd need a PR from Mark before applying those, then.


thanks,

Takashi
