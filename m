Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696275CA85
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 16:49:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D685B1F6;
	Fri, 21 Jul 2023 16:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D685B1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689950940;
	bh=n8QNyPaoHw389FZJpWFUeEiTOMURVq8JP4nOJQ/rf0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nDkmgawABAQwUnZxxmzRr7KUqv15F7K6o3wAVmfFCPGDbKhspsWs7tcWCd6vxLTxb
	 Gvk4Lq7R4xtcBD0iS1RrcJr9k0AgP2TuJohRntRs7fm60g3C81MnRg4vcGYLUh6F2g
	 pczx7xQiz6lmR0ggwUMH+0ic9cFP3YXtLevMYmqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12B81F8047D; Fri, 21 Jul 2023 16:48:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F14F8032D;
	Fri, 21 Jul 2023 16:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53CC7F8047D; Fri, 21 Jul 2023 16:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D9F4F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D9F4F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O+uaCvdU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=muOY/tX8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 912D1218B0;
	Fri, 21 Jul 2023 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689950878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XCEWu6HL59q80VkJsMg6EadJTzdhmuQ7wF2Q+jUwvA=;
	b=O+uaCvdUXwaYFZHzZjIG09MozEOWDn5kgItKKpRiRDqhp1RGPNNcP4eiVd12hjxvYf9gm+
	6UbEPJH32o/YDMBFdnTynFd+9BGe3YT0u7miLNEau/vW4HMPyTLh5B0C2pkTpB5po9H41h
	NBxfeCGsFkgc+bl62M+51RGha50QkBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689950878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XCEWu6HL59q80VkJsMg6EadJTzdhmuQ7wF2Q+jUwvA=;
	b=muOY/tX8ZbcgCkaIOaZ3f8ORTpo8uGTjlBUKNMzBZViF7BAHqnrGMTceA34lDSkolezOBt
	jT19sMF7q7ePd6Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B323134BA;
	Fri, 21 Jul 2023 14:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yjxQFZ6aumTDFwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 14:47:58 +0000
Date: Fri, 21 Jul 2023 16:47:57 +0200
Message-ID: <87cz0lz5gi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ALSA: hda/hdmi: Add Intel Lunar Lake support
In-Reply-To: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
References: <20230721135722.31288-1-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VRAIITXKODAAIU45W5E2VL22VX3V3FX4
X-Message-ID-Hash: VRAIITXKODAAIU45W5E2VL22VX3V3FX4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRAIITXKODAAIU45W5E2VL22VX3V3FX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 15:57:20 +0200,
Peter Ujfalusi wrote:
> 
> Hi,
> 
> after fixing the ordering, add the HDMI codec ID for LNL
> 
> Regards,
> Peter
> ---
> Kai Vehmanen (2):
>   ALSA: hda/hdmi: keep codec entries in numerical order
>   ALSA: hda: add HDMI codec ID for Intel LNL

Applied both patches now.  Thanks.


Takashi
