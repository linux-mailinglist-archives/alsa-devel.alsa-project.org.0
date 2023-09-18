Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBCB7A4D99
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0469A852;
	Mon, 18 Sep 2023 17:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0469A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695052473;
	bh=X3rA4Ffzqh41AVhajIFnC2lGHCxkI4fRndJYNXyebW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lmcb0RrPYV86nKLOgsocew+eWi1DrYlFeqtCD0NJbVzZKr5/4Io+hhMRHbdmezgUC
	 ywTxEAHdUhlwyQ5nPA7OC4ylPuDe1wY8398KtsUYVm2QWdD6xOwvMKD70zsM7l8Z5D
	 gAWuD1Q+P4lxy1f1uqpcF67tmp7ewCtdOf4pgMVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E1CFF80551; Mon, 18 Sep 2023 17:53:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23DA2F801F5;
	Mon, 18 Sep 2023 17:53:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75E0CF8025A; Mon, 18 Sep 2023 17:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4868BF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 17:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4868BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Gn/qofhd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iJNHd02t
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C78BA21E1F;
	Mon, 18 Sep 2023 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695052414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DK8KR3fPs8whrEH8j0R/iUaebjoMVvA4LCOE3UH58k=;
	b=Gn/qofhdRe9yFSQ9We8JjC0Btj6seP5I5QTH8OCft6OcQKHs9X2c6awtAUboy7FRm+o5gA
	SjkySP6pWw2/cVv7lUT4JPY5Fofh645YCZp+v7jF/r9fIVeLScJen8RzcxiV6rK9A8ol9f
	QQRpF3XdQpEBZbBsQeId9XgpcN5/CjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695052414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7DK8KR3fPs8whrEH8j0R/iUaebjoMVvA4LCOE3UH58k=;
	b=iJNHd02thBKEU43GpxNoLcaBjB9Wr/IDWtzDY2NTcEfG09qokv6QShSMAeZLARN3Dum8Dm
	YmlWOF31ieo2EKBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98A6913480;
	Mon, 18 Sep 2023 15:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uSweJH5yCGVmaQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 18 Sep 2023 15:53:34 +0000
Date: Mon, 18 Sep 2023 17:53:34 +0200
Message-ID: <87led3zddt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: YE Chengfeng <cyeaa@connect.ust.hk>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"yunjunlee@chromium.org" <yunjunlee@chromium.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?GB2312?B?u9i4tDo=?= [PATCH] ALSA: dummy: Fix &dpcm->lock
 deadlock issues
In-Reply-To: 
 <TYCP286MB1188D5F722F42601A08DA29D8AF4A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB1188FEE149369A32D90DCE288A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
	<87edlzwgti.wl-tiwai@suse.de>
	<TYCP286MB1188D860B56B9FF1FCAA79148A26A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
	<TYCP286MB1188D5F722F42601A08DA29D8AF4A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MKTOBNXJNQESUIJJHHQBABMOAJ7TFR6Y
X-Message-ID-Hash: MKTOBNXJNQESUIJJHHQBABMOAJ7TFR6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKTOBNXJNQESUIJJHHQBABMOAJ7TFR6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 17 Sep 2023 19:26:13 +0200,
YE Chengfeng wrote:
> 
> Hi Takashi,
> 
> Sorry for interrupt you again after such a long time. I just notice there was an old patch posted[1] from you that made pcm pointer() and trigger() callbacks could being able to be executed under non-atomic context, by using mutex instead of spin_lock_irq().
> 
> I find several similar deadlocks like this one on other places(inside pointer() and trigger() callbacks and being interrupted by hardirq), I am confusing whether they could be real deadlocks, as if these callbacks are executed under non-atomic context then they could be real problem.

It can't be a problem.  The new code path with mutex() is enabled only
when the PCM nonatomic flag is explicitly defined by the driver.
And the dummy driver doesn't, i.e. it still uses the traditional
atomic PCM ops, hence spin_lock() without the irq-save can be used
fine in the atomic ops like pointer or trigger.


Takashi

> 
> Thanks much if you are available to reply,
> Chengfeng
> 
> [1] https://patchwork.kernel.org/project/alsa-devel/patch/1409572832-32553-2-git-send-email-tiwai@suse.de/
