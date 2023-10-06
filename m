Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E007BB3D3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2399783E;
	Fri,  6 Oct 2023 11:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2399783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583238;
	bh=nv50OMRmq4mvqyaBhi3S/HFH3l6xqgb8cHXtscRuFik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=og0lMzyJ9fa3BglKUbQiIfKDu7NVa0vdFbYX0x5EhUmYmCjC1/FDYWEMbnMonq31y
	 CEQKWh+t9pxp5RA6vER4wAAT7j4+XVVTjKWKSQ1RZMqxievU2a7XY+IcNTMaHMFA7l
	 IKLmtfiZzp3cHr03eXGDYn8+sVRR118oen1/ZWhM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A648F8055A; Fri,  6 Oct 2023 11:06:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DEA0F8047D;
	Fri,  6 Oct 2023 11:06:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47BCEF80310; Fri,  6 Oct 2023 11:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B37EF80549
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B37EF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fHAUunXW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=En1gdIt9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5F42D2184F;
	Fri,  6 Oct 2023 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696583178;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WpnHH57W2rqGvjWQNsMwZCbEstkqESxFibpY09kHSig=;
	b=fHAUunXWyVaIeY20CuyxusDqAlgcOQUS5pngiLHz2p6Kvffm5JrVRiss+XIYDm0keZ4eSz
	5wGdCMQxOhCU2bhNQu/XOcy60dqDxOYA1hTnegKTcYfPgykNa6cH++HMbJ24l9d+NLfISh
	DNSiPJL/pDA9HQlwd1rfKZlqGDe63SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696583178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WpnHH57W2rqGvjWQNsMwZCbEstkqESxFibpY09kHSig=;
	b=En1gdIt9xO52znWYshL/J8MO59g1hrsnGrdGYBpmh5uUg8o1N4GLfUEcK+Mb0BbzcazTYh
	5yU+2i3ix38DCMDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F76513A2E;
	Fri,  6 Oct 2023 09:06:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +j68BgrOH2WkKwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 09:06:18 +0000
Date: Fri, 06 Oct 2023 11:06:17 +0200
Message-ID: <87mswww25y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	kernel test robot <lkp@intel.com>,
	"Dan Carpenter" <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Cleanup and fix double free in
 firmware request
In-Reply-To: <20231003142138.180108-1-sbinding@opensource.cirrus.com>
References: <20231003142138.180108-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: NPO3267M2MOLMEBJ7VIEHKR6Z7EBSVAG
X-Message-ID-Hash: NPO3267M2MOLMEBJ7VIEHKR6Z7EBSVAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPO3267M2MOLMEBJ7VIEHKR6Z7EBSVAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 16:21:38 +0200,
Stefan Binding wrote:
> 
> There is an unlikely but possible double free when loading firmware,
> and a missing free calls if a firmware is successfully requested but
> the coefficient file request fails, leading to the fallback firmware
> request occurring without clearing the previously loaded firmware.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202309291331.0JUUQnPT-lkp@intel.com/
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied now (with additional Fixes tag).
At the next time, please try to put the Fixes tag for a fix like
this.


thanks,

Takashi
