Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A47A5D13
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5BDEAE9;
	Tue, 19 Sep 2023 10:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5BDEAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695113678;
	bh=vaM9XujXeErMiUJR9Emy3Wd84QrswDsnFHmrPWGnP3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpWmRogXm0yx88kd0iFeoCZ4yoIijdMLPcZPKEDVfv4ng1ZrSWBQs5X1qMl1phKmG
	 3DEBYIleynM8QU16P7ndd08i0EjJrbmh7L5gi/F0T4Bvh2rf+78DUGU4SJKl7Cqfix
	 BjrzOxMM6TY/dgxVjk7M0AS0Rp2w5dYourLZHNmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F4C5F80494; Tue, 19 Sep 2023 10:53:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9672F80125;
	Tue, 19 Sep 2023 10:53:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F19DF801F5; Tue, 19 Sep 2023 10:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E92C2F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E92C2F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=FLLd6uXl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D914614ED;
	Tue, 19 Sep 2023 08:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5274DC433C8;
	Tue, 19 Sep 2023 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695113619;
	bh=vaM9XujXeErMiUJR9Emy3Wd84QrswDsnFHmrPWGnP3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLLd6uXlkKnqZAu62F3c58mAiaRiXosNiF5hIo21358ZlBPBD4qiGGE2f3enJQr5W
	 NtCZHbIOEzvJ+KnApf4ohCucCzLHkGRITaqzQngWn+AhqPvKIYI+teqtdpJJ408jex
	 8wpPlHGBHuDksEdxhORGUvFrzjmO8NPpyjjNt6l4=
Date: Tue, 19 Sep 2023 10:53:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
	alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ALSA: Add new driver for Marian M2 sound card
Message-ID: <2023091917-zippy-alienate-3efc@gregkh>
References: <20230918181044.7257-1-ivan.orlov0322@gmail.com>
 <20230918181044.7257-2-ivan.orlov0322@gmail.com>
 <2023091955-dried-popsicle-f3d8@gregkh>
 <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56a4a085-6b1d-19c6-4160-4513c8c41e57@gmail.com>
Message-ID-Hash: ZTRBKM4SCG4UT4BUFMJZJPRXSALCDLEP
X-Message-ID-Hash: ZTRBKM4SCG4UT4BUFMJZJPRXSALCDLEP
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTRBKM4SCG4UT4BUFMJZJPRXSALCDLEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 19, 2023 at 12:46:34PM +0400, Ivan Orlov wrote:
> By the way, is there any way to detect such issues automatically? I've seen
> that the kernel test robot detects a lot of similar stuff, perhaps there is
> any tools/linters which can be set up locally?

Not that I know of, sorry, I rely on the kernel test robot for lots of
these things :)

But, the robot is running all open tests, so dig into the public repo of
it to see what it is using and perhaps run those tests locally?  Lots of
them are just different build options and running sparse.

thanks,

greg k-h
