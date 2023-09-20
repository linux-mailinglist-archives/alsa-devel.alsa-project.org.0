Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071227A8966
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 18:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835E8A4D;
	Wed, 20 Sep 2023 18:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835E8A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695227245;
	bh=Kw8oLjNO5cB9v5haKJjDyc+WCifcThIwqmyNXDmoPz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMo6mw7B44+KiXAQuxhdrkNuCg+RRJ6KoxdM9r0tOIOnI0pjJiNyVABBYPaRpdH9q
	 YzZEUdSfM8ix7gaGRNeQxm7bQyz22FEdhLZ9dPI0esixaYfqKOcSqIma/cpw6PIwUQ
	 5KR9F4GM1voJA6VMyPDXPp4j/e2WzqzvmZlpXLwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B49F80551; Wed, 20 Sep 2023 18:26:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B26DF80558;
	Wed, 20 Sep 2023 18:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5829DF8055A; Wed, 20 Sep 2023 18:26:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 40817F801F5
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40817F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sVt4nV0G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=p8FsJlTC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B0705221CC;
	Wed, 20 Sep 2023 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695227164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLn8yWRXNtM1vzeh+k8IzT+RT5YudYxnSIDB4ufkXsA=;
	b=sVt4nV0GM8aBnWV5AaWOmn/g3abQZs8Fu97MDTWPbAcDOIsHeN3BeuJ7UZvdCDOHFGV3+I
	5QxdcL0y+6RH+3DmElbXvHJI8oH1KZIboR4BSjf8E6/9AFWw/gjUiGYCIrcMs6VdPNSQ5+
	N3HgmhWpBrItxa2xdXlwNaFPOWsA6L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695227164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLn8yWRXNtM1vzeh+k8IzT+RT5YudYxnSIDB4ufkXsA=;
	b=p8FsJlTCf5DaWE9S3MfPxSeY2Db97u6w7H4FXAkFhBw7uPaC3tcTWwA65QCoSSjWlVrGXq
	ldg6DUvQW3khmxDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76CC61333E;
	Wed, 20 Sep 2023 16:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xQMJHBwdC2WoZQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 16:26:04 +0000
Date: Wed, 20 Sep 2023 18:26:04 +0200
Message-ID: <87bkdwvmjn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: pcm-test: Report cards declared in config
 but missing
In-Reply-To: <20230919152702.100617-1-nfraprado@collabora.com>
References: <20230919152702.100617-1-nfraprado@collabora.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQPM3FWXMXPBDBCHCA3YL3NNJ4L3BOAC
X-Message-ID-Hash: ZQPM3FWXMXPBDBCHCA3YL3NNJ4L3BOAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQPM3FWXMXPBDBCHCA3YL3NNJ4L3BOAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 17:26:21 +0200,
Nícolas F. R. A. Prado wrote:
> 
> When parsing the configs, keep track of card configurations that match
> the current system but haven't matched any card, and report those as
> test failures as they represent that a card which was expected to be
> present on the system is missing. This allows the configuration files to
> not only be used to detect missing PCM devices (which is currently
> possible) but also that the soundcard hasn't been registered at all.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Applied now.  Thanks.


Takashi
