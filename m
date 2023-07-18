Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61E758408
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 20:01:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A9C1F6;
	Tue, 18 Jul 2023 20:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A9C1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689703308;
	bh=q4qsnJl/WI/6BHNlGkbEkvd0ht4NaVh3Z7NBypIpgZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q4ABgKWfaMi9d7sNxvCaL27vfEXOO16h/qgxni6eJxefGw1ij8qLGP6+VZ5EvE2KF
	 AUDCk6ZLyfywf5J7vgAjHWzae5g2e7vZhf/IxaCQD4nwe0y3m7+SN3ksbBqz8j+IDC
	 VkmfCqiWX/oVSQjIkjTvxNzD4PHv5FFw/7TVzgpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B1DF80520; Tue, 18 Jul 2023 20:00:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBCDDF800D2;
	Tue, 18 Jul 2023 20:00:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 797E0F8047D; Tue, 18 Jul 2023 20:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44B8FF80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 20:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44B8FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=eW5PorBT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5514616A2;
	Tue, 18 Jul 2023 18:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9726CC433C8;
	Tue, 18 Jul 2023 18:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689703214;
	bh=q4qsnJl/WI/6BHNlGkbEkvd0ht4NaVh3Z7NBypIpgZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eW5PorBTLwLwW27jxQXdtGiq/uixNOJ218mawPJaV41eAKhG5/+KZ7FaKeStZNU/C
	 Cnj6sKcVcg3YM8wwmbnLBlLtcADogEEzqqOGYs+VgMTrIfUOT5hogt/KofMmT6RzpL
	 jW9WzPFO7IMvRPkl5OoVFV1/DIrJqqcKkFlt31sg=
Date: Tue, 18 Jul 2023 20:00:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 02/11] staging: greybus: audio_helper: Use
 snd_ctl_remove_id()
Message-ID: <2023071803-plasma-oyster-3654@gregkh>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-3-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718141304.1032-3-tiwai@suse.de>
Message-ID-Hash: XEUJ66S7TB5WUZIPHBOO77CY4XPORM2F
X-Message-ID-Hash: XEUJ66S7TB5WUZIPHBOO77CY4XPORM2F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEUJ66S7TB5WUZIPHBOO77CY4XPORM2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 18, 2023 at 04:12:55PM +0200, Takashi Iwai wrote:
> Use the standard snd_ctl_remove_id() helper function instead of open
> code.  This allows us to reduce the manual card->rwsem lock in the
> caller side.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/staging/greybus/audio_helper.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
