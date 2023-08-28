Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7D78A5BB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 08:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43C4825;
	Mon, 28 Aug 2023 08:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43C4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693204078;
	bh=Yr/ZSrL/B2cUJqUWBeImI7750p+9FHNsRKp7yg+I7eM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMl/dMl6CLDYj2aLWKDjmwOayVpQ8MyJty9sZKFFZ2jJfJ9L3WfUBz5/im+hwhGeE
	 FEImbUEh+ZcMB8vOzv8eEYN2swTsZg5v8W+5kMrmphqNbekIWtoAnrvaOu3SLMmtWm
	 cNS4htNy8U8yKoeT6/KQw47XGeKLXqDEo42Dpiy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3DB2F80537; Mon, 28 Aug 2023 08:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A164DF80155;
	Mon, 28 Aug 2023 08:27:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B66EBF80158; Mon, 28 Aug 2023 08:24:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38966F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 08:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38966F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=npO1gIfH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hYtq/Mui
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 68F8F1F8D9;
	Mon, 28 Aug 2023 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693203857;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKEHERs7i6U7EDLAmsshFK6/5eHng7hUp10GpH4KXJM=;
	b=npO1gIfHGN9fkqUcuijpWrnZZW8TOuAE1IMkDSkMvQNIk5wYmgY/663oY1woJZyK3MIao3
	RtsdeXKM1Xd+C33GM9gR7EAk/1v/362b+UJVMZbpRszH6gI/L6HwTaciwj2XCSPJBwbwyB
	IGYvHlmZseibheA33yBxcXuwd5dNeEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693203857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NKEHERs7i6U7EDLAmsshFK6/5eHng7hUp10GpH4KXJM=;
	b=hYtq/MuiqJM23aOpoS4DVO383/Nk75hHx9H16EZxozHy4l8fnvp0/aaMaNt2unn5IoCrax
	YgPh+qPSyCcC4vCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FE5413A11;
	Mon, 28 Aug 2023 06:24:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QjLyApE97GSxbgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 06:24:17 +0000
Date: Mon, 28 Aug 2023 08:24:16 +0200
Message-ID: <87cyz71y7j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
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
Subject: Re: [PATCH v5 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <20230828022556.578-1-shenghao-ding@ti.com>
References: <20230828022556.578-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7XNJFODGMWNUQHUGJE7M4WZZWWRC6CP6
X-Message-ID-Hash: 7XNJFODGMWNUQHUGJE7M4WZZWWRC6CP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XNJFODGMWNUQHUGJE7M4WZZWWRC6CP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 04:25:55 +0200,
Shenghao Ding wrote:
> 
> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
> laptop will be aggregated as one audio device. The code support realtek
> as the primary codec.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

Shenghao, your previous patches have been already merged!
Please take the latest sound.git tree before the submission.

Make your changes on top of the latest sound.git tree in a
fine-grained incremental way, and submit those instead *ASAP*, so that
the necessary fixes can be merged for 6.6-rc1.


thanks,

Takashi
