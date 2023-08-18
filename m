Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0DA7809DF
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 12:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF299DEE;
	Fri, 18 Aug 2023 12:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF299DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692353896;
	bh=GAHjwOuOiaX13sRPU1KkPGKFdKXOFoN1Kem1nI+3fzA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a2gTdAATzRfBr7j4bmT6nZcKdcJDwXtwXVG+SzxIwclViZicUEWlHJWF5/WVHREGE
	 sauJLyO7MFCpsKZRrXnQvcLPIP39K7zfyU93l1dBxjWCwpvoZlz/EqHZhyvJZ3Nhnk
	 JUsc8al/o++A4ZkFjgkOf4S+MoE7pHPVuxd4biyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26FA4F801EB; Fri, 18 Aug 2023 12:17:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B16F8F8016D;
	Fri, 18 Aug 2023 12:17:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515ABF801EB; Fri, 18 Aug 2023 12:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50E6DF800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 12:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E6DF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qvPVRoi1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q/5lgb9U
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A89FB2188D;
	Fri, 18 Aug 2023 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692353834;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYisVhjzBtNvMsNO+gyp4nsCbBBFCBxIVuhNBVxepFA=;
	b=qvPVRoi17SO7J5UkpXQ8RgQuouEciiIUqsukMef1RldO0bO2MibfciO4DKYErxhcHMsXk/
	e9aKmD1gI1BJuezYUFfz5X32Ow+sVSNscR4IE/DQd8sI+NZCwcUGSdZSo6Gt9PRDZ23c8Y
	A1tsfCT0mFKxMvoS4joAEvdluTvoM9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692353834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BYisVhjzBtNvMsNO+gyp4nsCbBBFCBxIVuhNBVxepFA=;
	b=Q/5lgb9UMgx8UuAn7KD6WztlGsSooJ9PPw7ejRguqzBAOlTnbi+UuFoxNp+TSTWR7U8dZ0
	r5SsNc3Mx8fTcSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BEFC138F0;
	Fri, 18 Aug 2023 10:17:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id z/mGESpF32R5QAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 18 Aug 2023 10:17:14 +0000
Date: Fri, 18 Aug 2023 12:17:13 +0200
Message-ID: <87pm3kk63a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <robh+dt@kernel.org>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<pierre-louis.bossart@linux.intel.com>,
	<kevin-lu@ti.com>,
	<13916275206@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<mengdong.lin@intel.com>,
	<baojun.xu@ti.com>,
	<thomas.gfeller@q-drop.com>,
	<peeyush@ti.com>,
	<navada@ti.com>,
	<broonie@kernel.org>,
	<gentuser@gmail.com>
Subject: Re: [PATCH v4 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230818085836.1442-1-shenghao-ding@ti.com>
References: <20230818085836.1442-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: V2TKZNOA5ZZR5PY4F4DLQBSYFPVSVD6Z
X-Message-ID-Hash: V2TKZNOA5ZZR5PY4F4DLQBSYFPVSVD6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2TKZNOA5ZZR5PY4F4DLQBSYFPVSVD6Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 10:58:35 +0200,
Shenghao Ding wrote:
> 
> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> laptop will be aggregated as one audio device. The code support realtek
> as the primary codec. Rename "struct cs35l41_dev_name" to
> "struct scodec_dev_name" for all other side codecs instead of the certain
> one.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Now I applied both patches to for-next branch.

The patch 2 needed some minor adjustment in Kconfig to be applied to
the latest branch, but I resolved it locally.


thanks,

Takashi
